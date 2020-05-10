import SwiftUI

public struct Lightning: Shape {

  let topPointScaleX: CGFloat
  let leftPointScaleY: CGFloat
  let midPointScaleX: CGFloat
  let midPointScaleY: CGFloat?

  public init(topPointScaleX: CGFloat = 0.75,
              leftPointScaleY: CGFloat = 0.55,
              midPointScaleX: CGFloat = 0.6,
              midPointScaleY: CGFloat? = nil) {
    self.topPointScaleX = topPointScaleX
    self.leftPointScaleY = leftPointScaleY
    self.midPointScaleX = midPointScaleX
    self.midPointScaleY = midPointScaleY
  }

  public func path(in rect: CGRect) -> Path {
    Path { path in

      let leftPointY = rect.height * leftPointScaleY
      let topPointX = rect.width * topPointScaleX

      let midLeftX = rect.width * midPointScaleX
      let midLeftY = midPointScaleY.map {rect.height * $0} ?? leftPointY
      let midRightX = rect.width - midLeftX
      let midRightY = rect.height - midLeftY

      path.addLines([
        // top
        .init(x: topPointX, y: 0),
        // left
        .init(x: 0, y: leftPointY),
        // leftmid
        .init(x: midLeftX, y: midLeftY),
        // bottom
        .init(x: rect.width - topPointX, y: rect.height),
        // right
        .init(x: rect.width, y: rect.height - leftPointY),
        // rightmid
        .init(x: midRightX, y: midRightY)
        // end
      ])
    }
  }
}

struct Lightning_Previews: PreviewProvider {
    static var previews: some View {
        Lightning()
      .frame(width: 100, height: 250)
    }
}
