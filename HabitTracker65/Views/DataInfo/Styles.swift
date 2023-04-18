//
//  Styles.swift
//  HabitTracker65
//
//  Created by Adelaida Gomez Vieco on 8/03/23.
//

import Foundation
import SwiftUI

extension Color {
    
    public static var backgroundColor1: Color {
        Color(red: 0.973, green: 0.973, blue: 0.973)
    }
    
    public static var primaryColor1: Color {
        Color(red: 0.537, green: 0.8, blue: 0.773)
    }
    
    public static var secondaryColor1: Color {
        Color(red: 0.843, green: 0.922, blue: 0.914)
    }
    
    public static var blackColor1: Color {
        Color(red: 0.537, green: 0.8, blue: 0.773)
    }
    
    public static var redColor1: Color {
        Color(red: 0.886, green: 0.584, blue: 0.549)
    }
    
    public static var greyColor1: Color {
        Color(red: 0.855, green: 0.871, blue: 0.875)
    }
}

struct BottonStyles: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(Color(red:215, green: 235, blue: 233))
            .foregroundColor(.black)
            .buttonStyle(.bordered)
            .controlSize(.regular)
    }
}
