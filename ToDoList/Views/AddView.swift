//
//  AddView.swift
//  ToDoList
//
//  Created by Apple on 27/01/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    
    
    @State var alertTitle: String = ""
    @State var alertMsg: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: saveButtonPressed,
                       label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline).bold()
                        .frame(height: 55)
                        .frame(maxWidth: 400)
//                        .frame(maxWidth: UIScreen.main.bounds.width - 300)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
        }
        .navigationTitle("Add an Item ✍🏻")
        .alert(isPresented: $showAlert, content: {
            getAlert()
        })
        .padding()
    }
    
    
    // Save button
    func saveButtonPressed(){
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    // Check text
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3{
            alertTitle = "Try again"
            alertMsg = "Your new todo item nust have 3 characters long!! 😰😱"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    // Alert
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle), message: Text(alertMsg))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .preferredColorScheme(.light)
        .environmentObject(ListViewModel())
    }
}
