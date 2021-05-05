//
//  PlaneAngle.swift
//  GeographicCoordinateSystem
//
//  Created by Geonu Jeon on 2021/05/06.
//

import Foundation

public struct PlaneAngle {
    public var radian: Double
    
    public var degree: Double {
        get {
            return self.radian * 180 / .pi
        }
        set(degree) {
            self.radian = degree * .pi / 180
        }
    }
    
    public var sexagesimalDescription: String {
        let multiplied = abs(self.degree * 3600)
        let degree = Int(multiplied) / 3600
        let minute = Int(multiplied) % 3600 / 60
        let second = multiplied - Double(degree) * 3600 - Double(minute) * 60
        return String(format: "%@%d° %02d′ %06.3f″", self.degree < 0 ? "-" : "", degree, minute, second)
    }
    
    public init(radian: Double) {
        self.radian = radian
    }
    
    public init(degree: Double) {
        self.radian = degree * .pi / 180
    }
}

extension PlaneAngle: Codable {}

extension PlaneAngle: Hashable {}

extension PlaneAngle: Equatable {}

extension PlaneAngle: Comparable {
    public static func < (lhs: PlaneAngle, rhs: PlaneAngle) -> Bool {
        return lhs.radian < rhs.radian
    }
}

extension PlaneAngle: CustomStringConvertible {
    public var description: String {
        return "\(self.radian) rad"
    }
}

extension PlaneAngle: CustomDebugStringConvertible {
    public var debugDescription: String {
        return """
{
    radian: \(self.radian.debugDescription)
}
"""
    }
}
