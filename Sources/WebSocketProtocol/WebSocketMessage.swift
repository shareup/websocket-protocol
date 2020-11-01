import Foundation

/// An enumeration of the types of messages that can be sent and received.
public enum WebSocketMessage: CustomStringConvertible, Hashable {
    case open
    case binary(Data)
    case text(String)

    public var description: String {
        switch self {
        case .open: return "open"
        case let .binary(data): return String(data: data, encoding: .utf8) ?? ""
        case let .text(text): return text
        }
    }
}
