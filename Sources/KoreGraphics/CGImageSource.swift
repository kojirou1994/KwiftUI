import ImageIO
import Foundation

public enum CGImageSourceError: Error {
  case createSource
  case createImage

  case createThumbnail
}

extension CGImageSource {

  @inlinable
  public static func create(withData data: Data) throws -> CGImageSource {
    guard let s = CGImageSourceCreateWithData(data as CFData, nil) else {
      throw CGImageSourceError.createSource
    }
    return s
  }

  @inlinable
  public static func create<C>(withData data: Data, options: C) throws -> CGImageSource
    where C: Collection, C.Element == CGImageSourceOption {
      guard let s = CGImageSourceCreateWithData(data as CFData, options.toOptions()) else {
        throw CGImageSourceError.createSource
      }
      return s
  }

  @inlinable
  public static func create(withURL url: URL) throws -> CGImageSource {
    guard let s = CGImageSourceCreateWithURL(url as CFURL, nil) else {
      throw CGImageSourceError.createSource
    }
    return s
  }

  @inlinable
  public static func create<C>(withURL url: URL, options: C) throws -> CGImageSource
    where C: Collection, C.Element == CGImageSourceOption {
      guard let s = CGImageSourceCreateWithURL(url as CFURL, options.toOptions()) else {
        throw CGImageSourceError.createSource
      }
      return s
  }

  @inlinable
  public func createImage(at index: Int) throws -> CGImage {
    guard let image = CGImageSourceCreateImageAtIndex(self, index, nil) else {
      throw CGImageSourceError.createImage
    }
    return image
  }

  @inlinable
  public func createImage<C>(at index: Int, options: C) throws -> CGImage
    where C: Collection, C.Element == CGImageSourceOption {
    guard let image = CGImageSourceCreateImageAtIndex(self, index, options.toOptions() as CFDictionary) else {
      throw CGImageSourceError.createImage
    }
    return image
  }

  @inlinable
  public func createThumbnail<C>(at index: Int, options: C) throws -> CGImage where C: Collection, C.Element == CGImageSourceOption {
    guard let image = CGImageSourceCreateThumbnailAtIndex(self, index, options.toOptions()) else {
      throw CGImageSourceError.createThumbnail
    }
    return image
  }

  @inlinable
  public var type: String? {
    CGImageSourceGetType(self) as String?
  }

  /// Return the number of images (not including thumbnails) in the image source `isrc'.
  @inlinable
  public var count: Int {
    CGImageSourceGetCount(self)
  }

  @inlinable
  public var properties: [CFString: Any] {
    CGImageSourceCopyProperties(self, nil) as! [CFString : Any]
  }

  @inlinable
  public func properties(at index: Int) -> [CFString: Any] {
    CGImageSourceCopyPropertiesAtIndex(self, index, nil) as! [CFString : Any]
  }
  
  @inlinable
  public var status: CGImageSourceStatus {
    CGImageSourceGetStatus(self)
  }

  @inlinable
  public func status(at index: Int) -> CGImageSourceStatus {
    CGImageSourceGetStatusAtIndex(self, index)
  }
}
