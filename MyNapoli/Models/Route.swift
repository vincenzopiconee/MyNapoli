//
//  Route.swift
//  MyNapoli
//
//  Created by Vincenzo Picone on 11/12/24.
//

import Foundation
import SwiftData

@Model
class Route {
    @Attribute(.unique) var routeID: String // Identificativo univoco del percorso
    var agencyID: String                    // Identificativo dell'agenzia
    var routeShortName: String              // Nome breve del percorso
    var routeLongName: String?              // Nome lungo del percorso (opzionale)
    var routeType: Int                      // Tipo di percorso (numero intero)
    var routeURL: String?                   // URL associato al percorso (opzionale)
    var routeColor: String?                 // Colore del percorso (opzionale)
    var routeTextColor: String?             // Colore del testo del percorso (opzionale)

    init(
        routeID: String,
        agencyID: String,
        routeShortName: String,
        routeLongName: String? = nil,
        routeType: Int,
        routeURL: String? = nil,
        routeColor: String? = nil,
        routeTextColor: String? = nil
    ) {
        self.routeID = routeID
        self.agencyID = agencyID
        self.routeShortName = routeShortName
        self.routeLongName = routeLongName
        self.routeType = routeType
        self.routeURL = routeURL
        self.routeColor = routeColor
        self.routeTextColor = routeTextColor
    }
}

func loadRoutes(fromFile fileName: String) -> [Route] {
    
    var routes: [Route] = []
    
    // Carica il contenuto del file
    guard let fileURL = Bundle.main.url(forResource: fileName, withExtension: "txt") else {
        print("File not found")
        return routes
    }
    
    do {
        let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
        
        // Dividi il contenuto del file in righe
        let rows = fileContents.components(separatedBy: .newlines)
        
        // Itera sulle righe (escludendo la prima riga se è l'intestazione)
        for row in rows.dropFirst() where !row.isEmpty {
            
            let columns = row.split(separator: ",", omittingEmptySubsequences: false).map { $0.trimmingCharacters(in: .whitespacesAndNewlines).replacingOccurrences(of: "\"", with: "") }
            
            // Crea un oggetto Route per ogni riga
            let routeID = String(columns[0])
            let agencyID = String(columns[1])
            let routeShortName = String(columns[2])
            let routeLongName = columns.count > 3 ? String(columns[3]) : nil
            let routeType = Int(columns[4]) ?? 0
            let routeURL = columns.count > 5 ? String(columns[5]) : nil
            let routeColor = columns.count > 6 ? String(columns[6]) : nil
            let routeTextColor = columns.count > 7 ? String(columns[7]) : nil
            
            // Crea l'oggetto Route e aggiungilo all'array
            let route = Route(
                routeID: routeID,
                agencyID: agencyID,
                routeShortName: routeShortName,
                routeLongName: routeLongName,
                routeType: routeType,
                routeURL: routeURL,
                routeColor: routeColor,
                routeTextColor: routeTextColor
            )
            routes.append(route)
        }
    } catch {
        print("Error reading the file: \(error.localizedDescription)")
    }
    
    return routes
}
