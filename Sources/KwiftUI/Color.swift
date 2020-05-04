import SwiftUI

extension Color: ExpressibleByStringLiteral {

  @inlinable
  public init(stringLiteral value: String) {
    self.init(value)
  }

}

extension Color: ExpressibleByIntegerLiteral {

  @inlinable
  public init(integerLiteral value: Int) {
    let red = Double((value >> 16) & 0xff) / 255
    let green = Double((value >> 8) & 0xff) / 255
    let blue = Double(value & 0xff) / 255
    self.init(.displayP3, red: red, green: green, blue: blue)
  }

}
