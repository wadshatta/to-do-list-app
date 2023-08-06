//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by MacBook Pro on 04/08/2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class ToDoListItemViewViewModel: ObservableObject{
    init(){}
    func toggleIsDone(item:ToDoListItem){
        var ItemCopy = item
        ItemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(ItemCopy.id)
            .setData(ItemCopy.asDictionary())
    }
}
