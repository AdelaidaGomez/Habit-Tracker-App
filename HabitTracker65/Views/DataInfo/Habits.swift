//
//  Habits.swift
//  HabitTracker65
//
//  Created by Adelaida Gomez Vieco on 8/03/23.
//

import Foundation

class Habits: ObservableObject {
    @Published var items = [HabitItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let saveditems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try?
                JSONDecoder().decode([HabitItem].self, from: saveditems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}


