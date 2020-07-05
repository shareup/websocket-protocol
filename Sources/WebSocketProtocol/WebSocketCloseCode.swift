import Foundation

/// A code indicating why a WebSocket connection closed.
///
/// Mirrors [URLSessionWebSocketTask](https://developer.apple.com/documentation/foundation/urlsessionwebsockettask/closecode).
public enum WebSocketCloseCode: Int {
    case invalid = 0
    case normalClosure = 1000
    case goingAway = 1001
    case protocolError = 1002
    case unsupportedData = 1003
    case noStatusReceived = 1005
    case abnormalClosure = 1006
    case invalidFramePayloadData = 1007
    case policyViolation = 1008
    case messageTooBig = 1009
    case mandatoryExtensionMissing = 1010
    case internalServerError = 1011
    case tlsHandshakeFailure = 1015
}
