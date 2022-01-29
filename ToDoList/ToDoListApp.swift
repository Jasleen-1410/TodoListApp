//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Apple on 27/01/22.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point, data logic
 View - UI
 View Model - manages Models for view
 
 MVC Architecture
 
 Model - database or repository of data
 View - UI
 Controller - give orders to the model and take responses from it
 and as well as to view, business logic
 */


@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            // Explicitly setting the list view as a navigation view 
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle()) // so that in ipad also it works good
            .environmentObject(listViewModel)
        }
    }
}
