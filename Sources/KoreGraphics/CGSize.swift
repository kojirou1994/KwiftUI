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
  public var bestRadius: CGFloat {
    min(width, height) / 2
  }

  @inlinable
  public func aspectFitting(in rect: CGSize, upscale: Bool = true) -> CGSize {
    let widthRatio = rect.width / width
    let heightRatio = rect.height / height

    let minRatio = min(widthRatio, heightRatio)

    if upscale || minRatio < 1 {
      return CGSize(width: width * minRatio, height: height * minRatio)
    } else {
      return self
    }
  }
}
