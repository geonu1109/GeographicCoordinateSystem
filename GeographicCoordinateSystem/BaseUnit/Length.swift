//
//  Length.swift
//  GeographicCoordinateSystem
//
//  Created by Geonu Jeon on 2021/05/06.
//

import Foundation

public struct Length {
    public var metre: Double
    
    public var millimetre: Double {
        get {
            return self.metre * 1000
        }
        set(millimetre) {
            self.metre = millimetre / 1000
        }
    }
    
    public var centimetre: Double {
        get {
            return self.metre * 100
        }
        set(centimetre) {
            self.metre = centimetre / 100
        }
    }
    
    public var kilometre: Double {
        get {
            return self.metre / 1000
        }
        set(kilometer) {
            self.metre = kilometer * 1000
        }
    }
    
    public init(metre: Double) {
        self.metre = metre
    }
    
    public init(millimetre: Double) {
        self.metre = millimetre / 1000
    }
    
    public init(centimetre: Double) {
        self.metre = centimetre / 100
    }
    
    public init(kilometre: Double) {
        self.metre = kilometre * 1000
    }
}

extension Length: Codable {}

extension Length: Hashable {}

extension Length: Equatable {}

extension Length: Comparable {
    public static func < (lhs: Length, rhs: Length) -> Bool {
        return lhs.metre < rhs.metre
    }
}

extension Length: CustomStringConvertible {
    public var description: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let integerPart = formatter.string(from: .init(value: Int(self.metre))) ?? Int(self.metre).description
        let fractionalPart = String(format: "%03d", (Int(self.metre * 1000) - Int(self.metre) * 1000) / 1000)
        return "\(integerPart).\(fractionalPart) m"
    }
}

extension Length: CustomDebugStringConvertible {
    public var debugDescription: String {
        return """
{
    meter: \(self.metre.debugDescription)
}
"""
    }
}
