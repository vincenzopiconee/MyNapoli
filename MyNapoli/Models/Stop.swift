//
//  Stop.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 10/12/24.
//

import SwiftData
import Foundation

@Model
class Stop {
    @Attribute(.unique) var stopID: String
    var stopName: String
    var stopLat: Double
    var stopLon: Double
    var locationType: Int
    var parentStation: String?
    var wheelchairBoarding: Int?
    
    init(
        stopID: String,
        stopName: String,
        stopLat: Double,
        stopLon: Double,
        locationType: Int,
        parentStation: String? = nil,
        wheelchairBoarding: Int? = nil
    ) {
        self.stopID = stopID
        self.stopName = stopName
        self.stopLat = stopLat
        self.stopLon = stopLon
        self.locationType = locationType
        self.parentStation = parentStation
        self.wheelchairBoarding = wheelchairBoarding
    }
}


