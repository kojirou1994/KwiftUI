import SwiftUI

extension View {

  @inlinable @inline(__always)
  public func toAnyView() -> AnyView {
    AnyView(self)
  }

}
