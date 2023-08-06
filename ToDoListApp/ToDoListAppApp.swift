//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by MacBook Pro on 03/08/2023.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
