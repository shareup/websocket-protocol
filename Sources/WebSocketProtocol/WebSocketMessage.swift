import Foundation

/// An enumeration of the types of messages that can be sent and received.
public enum WebSocketMessage: Hashable {
    case open
    case binary(Data)
    case text(String)
}
