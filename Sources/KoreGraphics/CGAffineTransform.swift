import CoreGraphics

extension CGAffineTransform {
  @inlinable
  public init(scale: CGFloat) {
    self.init(scaleX: scale, y: scale)
  }
}
