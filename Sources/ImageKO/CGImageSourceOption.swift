public enum CGImageSourceOption {
  ///The best guess of the uniform type identifier (UTI) for the format of the image source file. If specified, the value of this key must be a CFString object. This key can be provided in the options dictionary when you create a CGImageSource object.
  case typeIdentifierHint(CFString)

  /// Whether the image should be returned as a CGImage object that uses floating-point values, if supported by the file format. CGImage objects that use extended-range floating-point values may require additional processing to render in a pleasing manner. The value of this key must be a CFBoolean value. The default value is kCFBooleanFalse.
  case allowFloat(Bool)

  /// Whether the image should be cached in a decoded form. The value of this key must be a CFBoolean value. The default value is kCFBooleanFalse in 32-bit, kCFBooleanTrue in 64-bit. This key can be provided in the options dictionary that you can pass to the functions CGImageSourceCopyPropertiesAtIndex(_:_:_:) and CGImageSourceCreateImageAtIndex(_:_:_:).
  case shouldCache(Bool)

  /* Specifies whether image decoding and caching should happen at image creation time.
   * The value of this key must be a CFBooleanRef. The default value is kCFBooleanFalse (image decoding will
   * happen at rendering time).
   */
  case shouldCacheImmediately(Bool)

  /// Whether a thumbnail should be automatically created for an image if a thumbnail isn't present in the image source file. The thumbnail is created from the full image, subject to the limit specified by kCGImageSourceThumbnailMaxPixelSize. If a maximum pixel size isn't specified, then the thumbnail is the size of the full image, which in most cases is not desirable. This key must be a CFBoolean value. The default value is kCFBooleanFalse. This key can be provided in the options dictionary that you pass to the function CGImageSourceCreateThumbnailAtIndex(_:_:_:).
  case createFromImageIfAbsent(Bool)

  /// Whether a thumbnail should be created from the full image even if a thumbnail is present in the image source file. The thumbnail is created from the full image, subject to the limit specified by kCGImageSourceThumbnailMaxPixelSize. If a maximum pixel size isn't specified, then the thumbnail is the size of the full image, which probably isn't what you want. This key must be a CFBoolean value. The default value is kCFBooleanFalse. This key can be provided in the options dictionary that you can pass to the function CGImageSourceCreateThumbnailAtIndex(_:_:_:).
  case createFromImageAlways(Bool)

  /// Whether the thumbnail should be rotated and scaled according to the orientation and pixel aspect ratio of the full image. The value of this key must be a CFBoolean value. The default value is kCFBooleanFalse.
  case withTransform(Bool)

  /// The maximum width and height in pixels of a thumbnail. If this key is not specified, the width and height of a thumbnail is not limited and thumbnails may be as big as the image itself. If present, this key must be a CFNumber value. This key can be provided in the options dictionary that you pass to the function CGImageSourceCreateThumbnailAtIndex(_:_:_:).
  case maxPixelSize(CFNumber)
}

extension Collection where Element == CGImageSourceOption {
  @usableFromInline
  func toOptions() -> CFDictionary {
    var options = [CFString: Any]()
    forEach { option in
      switch option {
      case .typeIdentifierHint(let value):
        options[kCGImageSourceTypeIdentifierHint] = value
      case .allowFloat(let value):
        options[kCGImageSourceShouldAllowFloat] = value
      case .shouldCache(let value):
        options[kCGImageSourceShouldCache] = value
      case .shouldCacheImmediately(let value):
        options[kCGImageSourceShouldCacheImmediately] = value
      case .createFromImageIfAbsent(let value):
        options[kCGImageSourceCreateThumbnailFromImageIfAbsent] = value
      case .createFromImageAlways(let value):
        options[kCGImageSourceCreateThumbnailFromImageAlways] = value
      case .withTransform(let value):
        options[kCGImageSourceCreateThumbnailWithTransform] = value
      case .maxPixelSize(let value):
        options[kCGImageSourceThumbnailMaxPixelSize] = value
      }
    }
    return options as CFDictionary
  }
}
