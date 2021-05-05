//
//  PlaneAngleTests.swift
//  GeographicCoordinateSystemTests
//
//  Created by Geonu Jeon on 2021/05/06.
//

import XCTest
@testable import GeographicCoordinateSystem

class PlaneAngleTests: XCTestCase {
    func testSexagesimalDescription() {
        XCTAssertEqual(PlaneAngle(degree: 40.76).sexagesimalDescription, "40° 45′ 36.000″")
        XCTAssertEqual(PlaneAngle(degree: 73.984).sexagesimalDescription, "73° 59′ 02.400″")
    }
}
