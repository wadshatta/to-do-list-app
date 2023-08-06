//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by MacBook Pro on 04/08/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    var body: some View {
        NavigationView {
            VStack{
                if let user = viewModel.user{
               
                    Profile(user: user)
                }
                else{
                    Text("Loading Profile ...")
                }
            }
            .navigationTitle("الملف الشخصي")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
    @ViewBuilder
    func Profile(user:User) -> some View{
        //Avater
        Image(systemName:"person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125,height: 125)
            .padding()
        //info:name,email,Member since
        VStack{
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack{
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joinde).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()
        //sgin out
        Button("Log out"){
            viewModel.logout()
        }
        .tint(.red)
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
