import XCTest
import Combine
@testable import WebSocketProtocol

final class WebSocketProtocolTests: XCTestCase {
    func testCustomTypeConformsToWebSocketProtocol() throws {
        let url = URL(string: "https://shareup.app")!
        let ws = try WS(url: url)

        try assertConformsToWebSocketProtocol(ws)

        XCTAssertEqual("connect()", ws.calledFunctions.removeFirst())
        XCTAssertEqual("send(_:completionHandler:)", ws.calledFunctions.removeFirst())
        XCTAssertEqual("send(_:completionHandler:)", ws.calledFunctions.removeFirst())
        XCTAssertEqual("close(_:)", ws.calledFunctions.removeFirst())
        XCTAssertEqual("receive(subscriber:)", ws.calledFunctions.removeFirst())
    }

    static var allTests = [
        ("testCustomTypeConformsToWebSocketProtocol", testCustomTypeConformsToWebSocketProtocol),
    ]
}

private extension WebSocketProtocolTests {
    func assertConformsToWebSocketProtocol<T: WebSocketProtocol>(_ ws: T) throws {
        ws.connect()

        let dataCompletionEx = self.expectation(description: "Should have called completion")
        try ws.send("test".data(using: .utf8)!, completionHandler: { _ in dataCompletionEx.fulfill() })

        let stringCompletionEx = self.expectation(description: "Should have called completion")
        try ws.send("test", completionHandler: { _ in stringCompletionEx.fulfill() })

        ws.close()

        let receiveValueEx = self.expectation(description: "Should have called receiveValue")
        let completionEx = self.expectation(description: "Should have called completion")
        let receiveValue: (Result<WebSocketMessage, Error>) -> Void = { _ in receiveValueEx.fulfill() }
        let completion: (Subscribers.Completion<Swift.Error>) -> Void = { _ in completionEx.fulfill() }
        let cancellable = ws.sink(receiveCompletion: completion, receiveValue: receiveValue)
        defer { cancellable.cancel() }

        waitForExpectations(timeout: 2)
    }
}

private class WS: WebSocketProtocol {
    let url: URL
    var calledFunctions: Array<String> = []

    private let subject = PassthroughSubject<Result<WebSocketMessage, Swift.Error>, Error>()

    required init(url: URL) throws { self.url = url }

    func connect() {
        calledFunctions.append(#function)
    }

    func send(_ data: Data, completionHandler: @escaping (Error?) -> Void) throws {
        calledFunctions.append(#function)
        completionHandler(nil)
    }

    func send(_ text: String, completionHandler: @escaping (Error?) -> Void) throws {
        calledFunctions.append(#function)
        completionHandler(nil)
    }

    func close(_ closeCode: WebSocketCloseCode) { calledFunctions.append(#function) }

    func receive<S: Subscriber>(subscriber: S) where WS.Failure == S.Failure, WS.Output == S.Input {
        calledFunctions.append(#function)
        subject.receive(subscriber: subscriber)
        subject.send(Result.success(WebSocketMessage.text("test")))
        subject.send(completion: .finished)
    }
}
