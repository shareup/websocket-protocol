import Combine
import Foundation

public enum WebSocketMessage: Equatable {
    case data(Data)
    case string(String)
    case open
}

public protocol WebSocketProtocol: Publisher where Failure == Error, Output == Result<WebSocketMessage, Error> {
    init(url: URL) throws

    func send(_ data: Data, completionHandler: @escaping (Error?) -> Void) throws
    func send(_ string: String, completionHandler: @escaping (Error?) -> Void) throws

    func close()
}
