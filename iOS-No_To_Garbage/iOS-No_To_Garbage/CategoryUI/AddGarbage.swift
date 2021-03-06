//
//  AddGarbage.swift
//  iOS-No_To_Garbage
//
//  Created by Admin on 19.11.2020.
//

import SwiftUI
import FirebaseAuth
struct AddGarbage: View {
    let category:[String] = ["Батарейки", "Бумага", "Техника", "Бутылки", "Одежда в плохом состоянии", "Одежда в хорошем состоянии", "Стеклянные банки", "Контейнеры", "Коробки"]
    @State private var selected = 0
    @State private var sum = 1
    @State var showAlert = false
    @State var showGoodAlert = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        
        ScrollView(.vertical){
            VStack(alignment:.leading){
                Text("Сколько выкинул?").font(.title).padding(.top, -40).padding(.leading, 10)
                
                
                
                Picker(selection: $selected, label: Text("")) {
                    ForEach(0 ..< category.count) {
                        Text(self.category[$0])
                    }
                }.padding(.top, -30)
                
                
                
                
                
                HStack{
                    
                    Label("Количество       ", systemImage: "plus")
                    
                    Text(String(sum))
                    Stepper("", value: $sum, in: 1...20)
                }.padding()
                
                
                
                
                
                Button(action: {
                    let date = Date()
                    let text = "insert into no2garbage (uuid, date, category, amount)\n VALUES ('\(currUser()!.uid)', date('\(date.get(.month))/\(date.get(.day))/\(date.get(.year))'), '\(category[selected])', \(sum));"
                    
                    AddGarbageToBase().add(text: text) { (isTrue) in
                        showGoodAlert = isTrue
                        self.showAlert.toggle()
                    }
                    
                }) {
                    HStack {
                        Spacer()
                        Text("Выкинуть")
                            .padding()
                            .accentColor(.white)
                        Spacer()
                    }
                }
                .background(Color.blue)
                .cornerRadius(16.0)
                .padding()
                .alert(isPresented: $showAlert) { () -> Alert in
                    
                    if (showGoodAlert){
                        let button = Alert.Button.default(Text("OK")) {
                            print("Вы успешно выкинули!")
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        return Alert(title: Text("Поздравляем!"), message: Text("Вы успешно выкинули мусор!"), dismissButton: button)
                    }else{
                        
                        let primaryButton = Alert.Button.cancel(Text("Конечно!")) {
                            print("primary button pressed")
                            
                        }
                        let secondaryButton = Alert.Button.destructive(Text("в следующий раз")) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        return Alert(title: Text("Произошла ошибка("), message: Text("Повторим еще раз?"), primaryButton: primaryButton, secondaryButton: secondaryButton)
                    }
                }
                
                
                
                
                
                
            }
        }
    }
    func currUser() -> User? {
        let user = Auth.auth().currentUser
        return user
    }
    
}



struct AddGarbage_Previews: PreviewProvider {
    static var previews: some View {
        AddGarbage()
    }
}
