//
//  OBDDataPoint.swift
//  OBD2Loxone
//
//  Created by Dennis Lysenko on 3/26/24.
//

import Foundation

struct OBDDataPoint: Codable {
    let latitude: Double?
    let longitude: Double?
    let elevation: Double?
    let time: Date?
    
    let rpm: Int?
//    let distanceReading: Double? // km
    let fuelRate: Double? // L/h
    let waterTemp: Int? // oC
    let fuelLevel: Double? // %, but as 0-100
    let engineLoad: Double?
    
//    let baseDistance: Double? // km, set by user
    let tankCapacity: Double? // L, set by user
    
    let odometerReading: Double? // km, calculated value
    let fuelInTank: Double? // L, calculated value
    
    init?(
        latitude: Double?,
        longitude: Double?,
        elevation: Double?,
        time: Date?,
        
        rpm: Int?,
//        distanceReading: Double?,
        fuelRate: Double?,
        waterTemp: Int?,
        fuelLevel: Double?,
        engineLoad: Double?,
        odometerReading: Double?,
//        baseDistance: Double?,
        tankCapacity: Double?
    ) {
        self.latitude = latitude
        self.longitude = longitude
        self.elevation = elevation
        self.time = time
        
        self.rpm = rpm
//        self.distanceReading = distanceReading
        self.fuelRate = fuelRate
        self.waterTemp = waterTemp
        self.fuelLevel = fuelLevel
        self.engineLoad = engineLoad
        self.odometerReading = odometerReading
//        self.baseDistance = baseDistance
        self.tankCapacity = tankCapacity
        
        if let tankCapacity, let fuelLevel {
            self.fuelInTank = Double(tankCapacity) * fuelLevel / 100
        } else {
            self.fuelInTank = nil
        }
        
//        if let baseDistance, let distanceReading {
//            self.odometerReading = baseDistance + distanceReading
//        } else {
//            self.odometerReading = nil
//        }
    }
}
