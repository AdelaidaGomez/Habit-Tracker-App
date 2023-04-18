//
//  HabitItem.swift
//  HabitTracker65
//
//  Created by Adelaida Gomez Vieco on 8/03/23.
//

import Foundation

struct HabitItem: Identifiable, Codable {
    var id = UUID()
    var habitName: String
    var frequency: String
    var weekDay: [String]
    var aditionalNotes: String
}
