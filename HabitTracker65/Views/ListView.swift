//
//  ListView.swift
//  HabitTracker65
//
//  Created by Adelaida Gomez Vieco on 8/03/23.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var user: User
    @ObservedObject var habits = Habits()
    @State private var showAddNewHabitView = false
    
    var body: some View {
//        NavigationView {
            List {
                ForEach(Array(zip(habits.items.indices, habits.items)), id: \.0){
                    index, element in
                    NavigationLink{
                        HabitInformation(habits: habits, element: element, index: index)
                    }label: {
                        HStack(spacing: 20){
                            Image(systemName: "checkmark.circle")
                                .resizable()
                                .frame(width: 20, height: 20)
                            VStack(alignment: .leading, spacing: 7){
                                Text(element.habitName)
                                    .font(.title3.bold())
                                    .foregroundColor(.black)
                                Text(element.aditionalNotes)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                    .lineLimit(2)
                            }
                            Spacer()
                            VStack(alignment: .center, spacing: 7){
                                Text(element.frequency)
                                    .font(.headline)
                                HStack{
                                    ForEach(element.weekDay, id: \.self) {
                                        Text($0)
                                    }
                                    .font(.headline)
                                    .foregroundColor(.white)
                                }
                            }//VStack2
                        }//Hstack
                    }
                    .listRowBackground(Color.primaryColor1)
                }
                .onDelete(perform: removeItems)
                
            }//List
//            .navigationTitle("Bienvenido \(user.firstName)")
            .navigationBarTitle("Bienvenido \(user.firstName)", displayMode: .large)
            .toolbar {
                Button {
                    showAddNewHabitView = true
                }label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showAddNewHabitView) {
                    AddNewHabitView(habits: habits)
                }
            }
            
//        }//Navi
    }
    
    func removeItems(at offSets: IndexSet){
        habits.items.remove(atOffsets: offSets)
    }
}

struct ListView_Previews: PreviewProvider {
    static var user = User()
    static var previews: some View {
        ListView(user: user, habits: Habits())
    }
}
