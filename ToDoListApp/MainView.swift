//
//  ContentView.swift
//  ToDoListApp
//
//  Created by MacBook Pro on 03/08/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
       
        if viewModel.isSignedIn , !viewModel.currentUserId.isEmpty{
         
          accountView
        }else{
            LoginView()
        }
       
     
    }
    @ViewBuilder
    var accountView: some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("الرئيسية",systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("انا",systemImage: "person.circle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
