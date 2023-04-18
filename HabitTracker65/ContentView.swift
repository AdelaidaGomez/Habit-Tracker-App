//
//  ContentView.swift
//  HabitTracker65
//
//  Created by Adelaida Gomez Vieco on 8/03/23.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = ""
}


struct ContentView: View {
    @StateObject var user = User()
    
    var body: some View {
        NavigationView{
            ZStack{
                Color.backgroundColor1
                    .ignoresSafeArea()
                VStack(alignment: .center) {
                    Image("check-mark")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(.horizontal)
                    
                    Text("DONE IT!")
                        .font(.largeTitle)
                        .foregroundColor(.black)
                    
                    Text("La aplicacion que te ayudara a crear y seguir el proceso de tus habitos diarios")
                        .foregroundColor(.black)
                        .padding(.horizontal)
                        .padding(.horizontal)
                        .padding()
                    
                    Text("Ingresa tu nombre")
                        .foregroundColor(.black)
                        .padding()
                    TextField("", text: $user.firstName)
                        .textFieldStyle(OutlinedTextFieldStyle())
                        .foregroundColor(.black)
                        .padding()
                    
                    NavigationLink {
                        ListView(user: user)
                    }label: {
                        Text("Comencemos Ahora")
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .foregroundColor(.white)
                    .background(Color.primaryColor1)
                    .cornerRadius(8)
                    .padding(50)
                }//Vstack
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
