import Foundation

public enum CGImageDestinationError: Error {
  case create
  case finalize
}

extension CGImageDestination {

  @inlinable
  public static func create(withData data: NSMutableData, type: CFString, count: Int) throws -> CGImageDestination {
    guard let d = CGImageDestinationCreateWithData(data, type, count, nil) else {
      throw CGImageDestinationError.create
    }
    return d
  }

  @inlinable
  public static func create(withURL url: URL, type: CFString, count: Int) throws -> CGImageDestination {
    guard let d = CGImageDestinationCreateWithURL(url as CFURL, type, count, nil) else {
      throw CGImageDestinationError.create
    }
    return d
  }

  @inlinable
  public func add(_ image: CGImage, lossyCompressionQuality: Double) {
    CGImageDestinationAddImage(self, image, [kCGImageDestinationLossyCompressionQuality: lossyCompressionQuality] as CFDictionary)
  }

  @inlinable
  public func add(_ image: CGImage, options: CFDictionary? = nil) {
    CGImageDestinationAddImage(self, image, options)
  }

  @inlinable
  public func add(imageFrom source: CGImageSource, at index: Int, lossyCompressionQuality: Double) {
    CGImageDestinationAddImageFromSource(self, source, index, [kCGImageDestinationLossyCompressionQuality: lossyCompressionQuality] as CFDictionary)
  }

  @inlinable
  public func add(imageFrom source: CGImageSource, at index: Int, options: CFDictionary? = nil) {
    CGImageDestinationAddImageFromSource(self, source, index, options)
  }

  @inlinable
  public func set(properties: CFDictionary) {
    CGImageDestinationSetProperties(self, properties)
  }

  @inlinable
  public func finalize() throws {
    if !CGImageDestinationFinalize(self) {
      throw CGImageDestinationError.finalize
    }
  }

}
