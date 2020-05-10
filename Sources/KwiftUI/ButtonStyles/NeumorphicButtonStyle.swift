import SwiftUI
/*
 Source: https://sarunw.com/posts/swiftui-buttonstyle/
 */
public struct NeumorphicButtonStyle: ButtonStyle {
  public init(shadowRadius: CGFloat = 10, minShadowRadius: CGFloat = 7,
              padding: CGFloat = 20, backgroundColor: Color, offset: CGPoint, buttomOffset: CGPoint) {
    self.radius = shadowRadius
    self.minRadius = minShadowRadius
    self.padding = padding
    self.bgColor = backgroundColor
    self.offset = offset
    self.buttomOffset = buttomOffset
  }

  let radius: CGFloat
  let minRadius: CGFloat
  let padding: CGFloat
  let bgColor: Color
  let offset: CGPoint
  let buttomOffset: CGPoint

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .padding(padding)
      .background(
        ZStack {
          //                    RoundedRectangle(cornerRadius: 10, style: .continuous)
          Circle()
            .shadow(
              color: .white, radius: configuration.isPressed ? minRadius : radius,
              x: configuration.isPressed ? -buttomOffset.x : -offset.x, y: configuration.isPressed ? -buttomOffset.y : -offset.y
          )
            .shadow(
              color: .black, radius: configuration.isPressed ? minRadius : radius,
              x: configuration.isPressed ? buttomOffset.x : offset.x, y: configuration.isPressed ? buttomOffset.y : offset.y
          )
            .blendMode(.overlay)
          //                    RoundedRectangle(cornerRadius: 10, style: .continuous)
          Circle()
            .fill(bgColor)
        }
    )
      .scaleEffect(configuration.isPressed ? 0.95 : 1)
//      .foregroundColor(.primary)
      .animation(.spring())
  }
}
