import XCTest
@testable import EastAsianWidth

class EastAsianWidthTests: XCTestCase {
    func testEastAsianLength() {
        XCTAssertEqual("\n".eastAsianLength(), 1)		//\n: Neutral
        XCTAssertEqual("\u{FF5B}".eastAsianLength(), 2)	//｛: F(Fullwidth)
        XCTAssertEqual("\u{FF76}".eastAsianLength(), 1)	//ｶ : H(Halfwidth)
        XCTAssertEqual("\u{6771}".eastAsianLength(), 2)	//東: W(Wide)
        XCTAssertEqual("\u{A2}".eastAsianLength(), 1)	//¢ : Na(Narrow)
        XCTAssertEqual("\u{A1}".eastAsianLength(), 2)	//¡ : A(Ambiguous)
        XCTAssertEqual("\n\u{FF5B}\u{FF76}\u{6771}\u{A2}\u{A1}".eastAsianLength(), 9)

		//If you want to calculate ambiguous char as narrow width, pass 1 to ambiguousWidth. (Default: 2)
        XCTAssertEqual("\n\u{FF5B}\u{FF76}\u{6771}\u{A2}\u{A1}".eastAsianLength(ambiguousWidth: 1), 8)
    }

    static var allTests : [(String, (EastAsianWidthTests) -> () throws -> Void)] {
        return [
            ("testEastAsianLength", testEastAsianLength),
        ]
    }
}
