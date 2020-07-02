# WebSocketProtocol

## _(macOS, iOS, iPadOS, tvOS, and watchOS)_

A package declaring a simple protocol for WebSocket clients to adhere to. This protocol is intended to be able to be used to abstract away [`URLSessionWebSocketTask`](https://developer.apple.com/documentation/foundation/urlsessionwebsockettask) and [Starscream](https://github.com/daltoniam/Starscream), but it could be easily used for other WebSocket clients.

## Tests

### Using Xcode

1. In your Terminal, navigate to the `WebSocketProtocol` directory
2. Open the `WebSocketProtocol` Swift package using Xcode
3. Make sure the build target is macOS
4. Product -> Test

### Using `swift test`

1. In your Terminal, navigate to the `WebSocketProtocol` directory
2. Open the `WebSocketProtocol` directory in another Terminal window
3. Run the tests using `swift test`

