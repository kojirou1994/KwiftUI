import XCTest
import SwiftUI
@testable import KwiftUI
@testable import KoreGraphics

final class KwiftUITests: XCTestCase {
    func testCGSizeFitting() {
      let container = CGSize(width: 50, height: 50)

      let size1 = CGSize(width: 100, height: 200)
      XCTAssertEqual(size1.aspectFitting(in: container), CGSize(width: 25, height: 50))
      let size2 = CGSize(width: 200, height: 100)
      XCTAssertEqual(size2.aspectFitting(in: container), CGSize(width: 50, height: 25))
      let size3 = CGSize(width: 100, height: 100)
      XCTAssertEqual(size3.aspectFitting(in: container), CGSize(width: 50, height: 50))

      let smallSize = CGSize(width: 25, height: 25)
      XCTAssertEqual(smallSize.aspectFitting(in: container, upscale: true), CGSize(width: 50, height: 50))
      XCTAssertEqual(smallSize.aspectFitting(in: container, upscale: false), smallSize)

      let sameSize = container
      XCTAssertEqual(sameSize.aspectFitting(in: container, upscale: true), sameSize)
      XCTAssertEqual(sameSize.aspectFitting(in: container, upscale: false), sameSize)
    }

    static var allTests = [
        ("testCGSizeFitting", testCGSizeFitting),
    ]
}
