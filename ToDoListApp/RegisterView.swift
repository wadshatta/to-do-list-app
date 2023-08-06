//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by MacBook Pro on 04/08/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack{
            HeaderView(title: "تسجيل",
                       subtitle: "ابداء في الان",
                       angle: -15, background: .orange)
            Form{
                TextField("الاسم كامل", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                TextField("البريد الالكتروني", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("كلمة المرور", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())

                
                TLButton(title: "تسجيل", background: .orange) {
                    //action
                    viewModel.register()
                }
                .padding()
            }
            .offset(y:-50)
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
