//
//  ToDoListItem.swift
//  ToDoListApp
//
//  Created by MacBook Pro on 04/08/2023.
//

import Foundation


struct ToDoListItem: Codable,Identifiable{
    let id : String
    let title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state : Bool){
        isDone = state
    }
    
}
