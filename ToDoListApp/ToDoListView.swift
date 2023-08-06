//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by MacBook Pro on 04/08/2023.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel : ToDoListViewViewModel
   // private let userId: String
    @FirestoreQuery var items:[ToDoListItem]
    
    
    init(userId: String){
        self._items = FirestoreQuery(
        collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue:ToDoListViewViewModel(userId:userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List(items){item in
                 ToDoListItemView(item: item)
                        .swipeActions {
                            Button("مسح"){
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                        .padding(.top,5)
                }
            }
            .navigationTitle("المهام")
            .toolbar {
                Button{
                    viewModel.showingNewItemView = true
                    
                }label: {
                    Image(systemName:"plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "EzDqMa4gPThp3qyXsNctB00L7x53")
    }
}
