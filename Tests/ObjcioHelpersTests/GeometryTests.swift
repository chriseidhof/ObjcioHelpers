import XCTest
import ObjcioHelpers

final class GeometryTests: XCTestCase {
    func testVectors() throws {
        let x = CGSize(fst: 50, snd: 100)
        XCTAssertEqual(x * 0.5, .init(width: 25, height: 50))
        XCTAssertEqual(x + .init(fst: 10, snd: 20), .init(width: 60, height: 120))
    }

    func testUnitPointSubscript() throws {
        let rect = CGRect(x: 10, y: 20, width: 100, height: 50)

        XCTAssertEqual(rect[.topLeading], CGPoint(x: 10, y: 20))
        XCTAssertEqual(rect[.topTrailing], CGPoint(x: 110, y: 20))
        XCTAssertEqual(rect[.bottomLeading], CGPoint(x: 10, y: 70))
        XCTAssertEqual(rect[.bottomTrailing], CGPoint(x: 110, y: 70))
        XCTAssertEqual(rect[.center], CGPoint(x: 60, y: 45))
    }

}
