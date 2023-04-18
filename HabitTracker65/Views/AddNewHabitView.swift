//
//  AddNewHabitView.swift
//  HabitTracker65
//
//  Created by Adelaida Gomez Vieco on 8/03/23.
//

import SwiftUI

struct OutlinedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .stroke(Color.primaryColor1, lineWidth: 1)
            }
    }
}



struct AddNewHabitView: View {
    @ObservedObject var habits = Habits()
    @Environment(\.dismiss) var dismiss
    
    @State private var habitName = ""
    @State private var frequency = ""
    @State private var weekDay = [""]
    @State private var aditionalNotes = ""
    
    let frequencys = ["Diario", "Mensual", "Semanal"]
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
        ZStack{
            Color.backgroundColor1
            VStack(spacing: 35){
                Text("Habito Nuevo")
                    .font(.largeTitle.bold())
                    .foregroundColor(.black)
                Text("Nombre de tu habito")
                    .foregroundColor(.black)
                TextField("", text: $habitName)
                    .textFieldStyle(OutlinedTextFieldStyle())
                    .padding(.horizontal)
                    .foregroundColor(.black)
                Text("Frecuencia de tu Habito")
                    .font(.headline)
                    .foregroundColor(.black)
                HStack(spacing: 15){
                    Button {
                        frequency = frequencys[0]
                        diario.toggle()
                    }label: {
                        Text("Diario")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .controlSize(.large)
                    .background(diario ? Color.primaryColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    Button {
                        frequency = frequencys[1]
                        semanal.toggle()
                    }label: {
                        Text("Semanal")
                    }.buttonStyle(.bordered)
                        .foregroundColor(.black)
                        .controlSize(.large)
                        .background(semanal ? Color.primaryColor1 : Color.greyColor1)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    Button {
                        frequency = frequencys[2]
                        mensual.toggle()
                    }label: {
                        Text("Mensual")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .controlSize(.large)
                    .background(mensual ? Color.primaryColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }//HStack
                Text("Que dias Quieres hacer este habito")
                    .font(.headline)
                    .foregroundColor(.black)
                HStack(spacing: 15){
                    Button {
                        weekDay.append(weekDays[0])
                        l.toggle()
                    }label: {
                        Text("L")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .background(l ? Color.primaryColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    Button {
                        weekDay.append(weekDays[1])
                        m.toggle()
                    }label: {
                        Text("M")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .background(m ? Color.primaryColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    Button {
                        weekDay.append(weekDays[2])
                        w.toggle()
                    }label: {
                        Text("W")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .background(w ? Color.primaryColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    Button {
                        weekDay.append(weekDays[3])
                        j.toggle()
                    }label: {
                        Text("J")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .background(j ? Color.primaryColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    Button {
                        weekDay.append(weekDays[4])
                        v.toggle()
                    }label: {
                        Text("V")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .background(v ? Color.primaryColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    Button {
                        weekDay.append(weekDays[5])
                        s.toggle()
                    }label: {
                        Text("S")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .background(s ? Color.primaryColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    Button {
                        weekDay.append(weekDays[6])
                        d.toggle()
                    }label: {
                        Text("D")
                    }
                    .buttonStyle(.bordered)
                    .foregroundColor(.black)
                    .background(d ? Color.primaryColor1 : Color.greyColor1)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                }//HStack2
                Text("Notas Adicionales")
                    .foregroundColor(.black)
                TextField("", text: $aditionalNotes)
                    .textFieldStyle(OutlinedTextFieldStyle())
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                Button {
                    let item = HabitItem(habitName: habitName, frequency: frequency, weekDay: weekDay, aditionalNotes: aditionalNotes)
                    habits.items.append(item)
                    dismiss()
                }label: {
                    Text("Agregar Item Nuevo")
                }
                .frame(width: 200, height: 50)
                .background(Color.primaryColor1)
                .cornerRadius(10)
                .foregroundColor(.black)
            }//VStack
        }
    }
}

struct AddNewHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewHabitView(habits: Habits())
    }
}
