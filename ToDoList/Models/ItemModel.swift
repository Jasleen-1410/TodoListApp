//
//  ItemModel.swift
//  ToDoList
//
//  Created by Apple on 28/01/22.
//

import Foundation

// Immuatable struct and let constant
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool){
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() ->ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}


