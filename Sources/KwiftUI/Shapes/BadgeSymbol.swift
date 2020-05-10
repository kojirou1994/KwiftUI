import SwiftUI
/*
 Source: Apple
 */
public struct BadgeSymbol: Shape {
  let spacingScale: CGFloat
  let topScale: CGFloat
  let bottomScale: CGFloat

  public init(spacingScale: CGFloat = 0.030, topScale: CGFloat = 0.226, bottomScale: CGFloat = 0.488) {
    self.spacingScale = spacingScale
    self.topScale = topScale
    self.bottomScale = bottomScale
  }

  public func path(in rect: CGRect) -> Path {
    Path { path in
      let spacing = rect.width * spacingScale
      let middle = rect.width / 2
      let topWidth = topScale * rect.width
      let topHeight = bottomScale * rect.height

      path.addLines([
        CGPoint(x: middle, y: 0),
        CGPoint(x: middle - topWidth, y: topHeight - spacing),
        CGPoint(x: middle, y: topHeight / 2 + spacing),
        CGPoint(x: middle + topWidth, y: topHeight - spacing)
      ])

      path.move(to: CGPoint(x: middle, y: topHeight / 2 + spacing * 3))
      path.addLines([
        CGPoint(x: middle - topWidth, y: topHeight + spacing),
        CGPoint(x: spacing, y: rect.height),
        CGPoint(x: rect.width - spacing, y: rect.height),
        CGPoint(x: middle + topWidth, y: topHeight + spacing),
        CGPoint(x: middle, y: topHeight / 2 + spacing * 3)
      ])
    }
  }
}
