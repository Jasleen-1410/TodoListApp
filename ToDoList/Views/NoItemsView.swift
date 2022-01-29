//
//  NoItemsView.swift
//  ToDoList
//
//  Created by Apple on 28/01/22.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    var SecondaryAccentColor: Color = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10 ){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a Productive Person? I think you should click the add button and add a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink(
                    destination: AddView(),
                    label: {
                        Text("Add Something 🥳")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(width: 150)
                            .frame(maxWidth: .infinity)
                            .background(animate ? SecondaryAccentColor : Color.accentColor)
                            .cornerRadius(10)
                    })
                    .padding()
                    .padding(.horizontal, animate ? 30 : 50)
                    .shadow(
                        color: animate ? SecondaryAccentColor.opacity(0.4) : Color.accentColor.opacity(0.4),
                        radius: animate ? 10 : 5,
                        x: 0,
                        y: animate ? 30 : 10)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? -7 : 0)
                 
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2)
                .repeatForever()
            ){
                animate.toggle()
            }
        }
         
        
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
