import Foundation

/// An enumeration of the types of messages that can be sent and received.
public enum WebSocketMessage: Hashable {
    case open
    case data(Data)
    case text(String)
}
