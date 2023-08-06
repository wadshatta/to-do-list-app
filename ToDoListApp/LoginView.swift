//
//  LoginView.swift
//  ToDoListApp
//
//  Created by MacBook Pro on 04/08/2023.
//

import SwiftUI

struct LoginView: View {
   
    @StateObject var viewModel = LoginViewViewModel()
    var body: some View {
        NavigationView{
            VStack{
                //header
                HeaderView(title: "انجز",
                           subtitle: "لكي لا تنسي",
                           angle: 15, background: .pink)
                //login form

                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("البريد",text:$viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    SecureField("كلمة المرور",text:$viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    TLButton(title: "دخول", background: .blue){
                        //actions
                        viewModel.Login()
                    }
                    .padding()
                }
                .offset(y:-50)
                
                //create account
                VStack{
                    Text("انت جديد ؟")
                    
                    NavigationLink("سجل من هنا",destination: RegisterView())
                }
                .padding(.bottom,50)
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
