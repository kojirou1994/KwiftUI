import CoreGraphics

extension CGSize {
  /// max value of width and height
  @inlinable
  public var maxLength: CGFloat {
    max(width, height)
  }

  /// min value of width and height
  @inlinable
  public var minLength: CGFloat {
    min(width, height)
  }

  @inlinable
  public func aspectFitting(in rect: CGSize, upscale: Bool = true) -> CGSize {
    let widthRatio = rect.width / width
    let heightRatio = rect.height / height

    let minRatio = min(widthRatio, heightRatio)

    let bestSize = CGSize(width: width * minRatio, height: height * minRatio)
    if upscale || bestSize.width <= self.width {
      return bestSize
    } else {
      return self
    }
  }
}
