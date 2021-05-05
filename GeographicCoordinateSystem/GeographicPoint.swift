//
//  GeographicPoint.swift
//  GeographicCoordinateSystem
//
//  Created by Geonu Jeon on 2021/05/06.
//

import Foundation

public struct GeographicPoint {
    public var latitude: PlaneAngle
    public var longitude: PlaneAngle
    public var altitude: Length?
    
    public init(latitude: PlaneAngle, longitude: PlaneAngle, altitude: Length? = nil) {
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
    }
}

extension GeographicPoint: Codable {}

extension GeographicPoint: Hashable {}

extension GeographicPoint: Equatable {}

extension GeographicPoint: CustomStringConvertible {
    /// ISO 6709
    public var description: String {
        let latitudeDescription: String = {
            let sexagesimalDescription = self.latitude.sexagesimalDescription
            if sexagesimalDescription.starts(with: "-") {
                return sexagesimalDescription.dropFirst() + "S"
            } else {
                return sexagesimalDescription + "N"
            }
        }()
        let longitudeDescription: String = {
            let sexagesimalDescription = self.longitude.sexagesimalDescription
            if sexagesimalDescription.starts(with: "-") {
                return sexagesimalDescription.dropFirst() + "W"
            } else {
                return sexagesimalDescription + "E"
            }
        }()
        return [latitudeDescription, longitudeDescription, self.altitude?.description].compactMap { $0?.replacingOccurrences(of: " ", with: "") }.joined(separator: " ")
    }
}

extension GeographicPoint: CustomDebugStringConvertible {
    public var debugDescription: String {
        return """
{
    latitude: \(self.latitude.debugDescription.replacingOccurrences(of: "\n", with: "\n    ")),
    longitude: \(self.longitude.debugDescription.replacingOccurrences(of: "\n", with: "\n    ")),
    altitude: \(self.altitude?.debugDescription.replacingOccurrences(of: "\n", with: "\n    ") ?? "null")
}
"""
    }
}
