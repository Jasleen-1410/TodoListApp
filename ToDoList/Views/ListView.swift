//
//  ListView.swift
//  ToDoList
//
//  Created by Apple on 27/01/22.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
//    @State var items: [ItemModel] = [
//    ItemModel(title: "This is first item!", isCompleted: false),
//    ItemModel(title: "This is second", isCompleted: true)
//    ]
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty{
                NoItemsView()
                    .transition(AnyTransition.opacity
                                    .animation(.easeIn))
            }
            else{
                List{
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading: EditButton()
                .disabled(listViewModel.items.isEmpty),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
                .environmentObject(ListViewModel())
        }
    }
}

