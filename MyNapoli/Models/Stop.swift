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

func loadStops(fromFile fileName: String) -> [Stop] {
    var stops: [Stop] = []
    
    // Ottieni il percorso del file CSV
    guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "txt") else {
        print("File non trovato")
        return stops
    }
    
    do {
        // Leggi il contenuto del file
        let content = try String(contentsOf: fileURL, encoding: .utf8)
        
        // Dividi in righe
        let rows = content.components(separatedBy: .newlines)
        
        // Salta l'intestazione (prima riga)
        for row in rows.dropFirst() where !row.isEmpty {
            // Dividi la riga in colonne
            let columns = row.split(separator: ",", omittingEmptySubsequences: false).map { $0.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "\"", with: "") }
            
            // Assicurati che ci siano abbastanza colonne
            guard columns.count >= 7 else { continue }
            
            // Crea un'istanza di Stop
            if let stopLat = Double(columns[2]),
               let stopLon = Double(columns[3]),
               let locationType = Int(columns[4]) {
                let stop = Stop(
                    stopID: columns[0],
                    stopName: columns[1],
                    stopLat: stopLat,
                    stopLon: stopLon,
                    locationType: locationType,
                    parentStation: columns[5].isEmpty ? nil : columns[5],
                    wheelchairBoarding: Int(columns[6])
                )
                stops.append(stop)
            }
        }
    } catch {
        print("Errore nella lettura del file: \(error)")
    }
    
    return stops
}



