import SwiftUI

public struct BottomRoundedRectangle: Shape {
  public var curveOffset: CGFloat

  public func path(in rect: CGRect) -> Path {
    .init { path in
      path.move(to: CGPoint(x: rect.width, y: 0))
      path.addLine(to: CGPoint(x: rect.width, y: rect.height))
      path.addQuadCurve(to: CGPoint(x: 0, y: rect.height),
                        control: CGPoint(x: rect.width/2, y: rect.height + curveOffset))
      path.addLine(to: CGPoint(x: 0, y: 0))
    }
  }

  public var animatableData: CGFloat {
    get {
      curveOffset
    }
    set {
      curveOffset = newValue
    }
  }
}
