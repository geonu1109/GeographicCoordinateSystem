//
//  GeographicPointTests.swift
//  GeographicCoordinateSystemTests
//
//  Created by Geonu Jeon on 2021/05/06.
//

import XCTest
@testable import GeographicCoordinateSystem

class GeographicPointTests: XCTestCase {
    func testSexagesimalDescription() {
        XCTAssertEqual(GeographicPoint(latitude: .init(degree: 40.76), longitude: .init(degree: 73.984), altitude: .init(metre: 10)).description, "40°45′36.000″N 73°59′02.400″E 10.000m")
        XCTAssertEqual(GeographicPoint(latitude: .init(degree: -40.76), longitude: .init(degree: -73.984), altitude: .init(metre: 0)).description, "40°45′36.000″S 73°59′02.400″W 0.000m")
        XCTAssertEqual(GeographicPoint(latitude: .init(degree: -40.76), longitude: .init(degree: -73.984), altitude: nil).description, "40°45′36.000″S 73°59′02.400″W")
        XCTAssertEqual(GeographicPoint(latitude: .init(degree: 40.76), longitude: .init(degree: 73.984), altitude: .init(metre: -10)).description, "40°45′36.000″N 73°59′02.400″E -10.000m")
    }
}
