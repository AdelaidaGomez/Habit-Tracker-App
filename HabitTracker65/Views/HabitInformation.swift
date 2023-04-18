//
//  HabitInformation.swift
//  HabitTracker65
//
//  Created by Adelaida Gomez Vieco on 8/03/23.
//

import SwiftUI

struct HabitInformation: View {
    @State var size = UIScreen.main.bounds.width - 160
    @State var progress: CGFloat = 0
    @State var angle: Double = 0
    
    
    @ObservedObject var habits = Habits()
    @Environment(\.dismiss) var dismiss
    
    @State  var element: HabitItem
    @State  var index: Int
    
    @State private var habitName = ""
    @State private var frequency = ""
    @State private var weekDay = [""]
    @State private var aditionalNotes = ""

    let frequencys = ["Diario", "Semanal", "Mensual"]
    let weekDays = ["L","M","W","J","V","S","D"]
    
    @State  var diario = false
    @State  var semanal = false
    @State  var mensual = false
    
    @State  var l = false
    @State  var m = false
    @State  var w = false
    @State  var j = false
    @State  var v = false
    @State  var s = false
    @State  var d = false
    
    var body: some View {
        ZStack {
            Color.primaryColor1
                .ignoresSafeArea()
            VStack(alignment: .center) {
                TextField("\(element.habitName)", text: $element.habitName)
                    .font(.largeTitle.bold())
                    .padding(.horizontal, 100)
                
                TextField("\(element.aditionalNotes)", text: $element.aditionalNotes)
                    .foregroundColor(.black)
                    .padding(.horizontal)
                    .padding(30)
                HStack(spacing: 20){
                    Button {
                        element.frequency = frequencys[0]
                        diario.toggle()
                    }label: {
                        Text("Diario")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .controlSize(.large)
                    .background(diario ? Color.redColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    Button {
                        element.frequency = frequencys[1]
                        semanal.toggle()
                    }label: {
                        Text("Semanal")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .controlSize(.large)
                    .background(semanal ? Color.redColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    Button {
                        element.frequency = frequencys[2]
                        mensual.toggle()
                    }label: {
                        Text("Mensual")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .controlSize(.large)
                    .background(mensual ? Color.redColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }//HStack
            }
            .padding(.bottom, 550)
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.secondaryColor1)
                    .frame(width: 500, height: 600)
                    .position(x: 197, y: 500)
                    .padding(.top, 100)
                
                VStack(spacing: 46){
                    Text("Progreso de tu Habito")
                        .font(.headline)
                        .foregroundColor(.black)
                        .padding(.top, 300)
                    ZStack {
                        Circle()
                            .stroke(Color.primaryColor1, style: StrokeStyle(lineWidth: 55, lineCap: .butt, lineJoin: .round))
                            .frame(width: size, height: size)
                        //Progress
                        Circle()
                            .trim(from: 0, to: progress)
                            .stroke(Color.redColor1, style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                            .frame(width: size, height: size)
                            .rotationEffect(.init(degrees: -90))
                        //Inner finish Curve
                        Circle()
                            .fill(Color.white)
                            .frame(width: 55, height: 55)
                            .offset(x: size / 2)
                            .rotationEffect(.init(degrees: -90))
                        // Drag Circle
                        Circle()
                            .fill(Color.white)
                            .frame(width: 55, height: 55)
                            .offset(x: size / 2)
                            .rotationEffect(.init(degrees: angle))
                        //Ading Gesture
                            .gesture(DragGesture().onChanged(onDrag(value:)))
                            .rotationEffect(.init(degrees: -90))
                        
                        Text("Dia " + String(format: "%.0f", progress * 7))
                            .font(.largeTitle.bold())
                    }
                    
                    Button {
                        let item = HabitItem(habitName: element.habitName, frequency: element.frequency, weekDay: element.weekDay, aditionalNotes: element.aditionalNotes)
                        habits.items[index] = item
                        dismiss()
                    }label: {
                        Text("Guardar Cambios")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .controlSize(.large)
                    .background(Color.redColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }//VStack
    }
    func onDrag(value: DragGesture.Value){
        
        //Calculating radiants
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        
        let radians = atan2(vector.dy - 27.5, vector.dx - 27.5)
        
        //Convierte angulos
        var angle = radians * 180 / .pi
        
        if angle < 0 {angle = 360 + angle}
        
        withAnimation(Animation.linear(duration: 0.15)) {
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
        
    }
}



struct HabitInformation_Previews: PreviewProvider {
    static var previews: some View {
        HabitInformation(element: HabitItem(habitName: "Jugar", frequency: "Diario", weekDay: ["L"], aditionalNotes: "Me gusta jugar"), index: 0)
    }
}
