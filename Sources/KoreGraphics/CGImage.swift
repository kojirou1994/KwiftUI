import CoreGraphics

extension CGImage {
  @inlinable
  public var size: CGSize {
    .init(width: width, height: height)
  }

  @inlinable
  public var maxLength: Int {
    max(width, height)
  }

  @inlinable
  public var minLength: Int {
    min(width, height)
  }
}
