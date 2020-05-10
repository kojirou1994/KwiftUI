extension CGImageSourceStatus: CustomStringConvertible {
  public var description: String {
    switch self {
    case .statusUnexpectedEOF: return "UnexpectedEOF"
    case .statusInvalidData: return "InvalidData"
    case .statusUnknownType: return "UnknownType"
    case .statusReadingHeader: return "ReadingHeader"
    case .statusIncomplete: return "Incomplete"
    case .statusComplete: return "Complete"
    @unknown default: return "Unknonwn(\(rawValue))"
    }
  }
}
