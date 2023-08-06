//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by MacBook Pro on 04/08/2023.
//
import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){}
    func Login(){
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
        //print("called")
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter valid email."
            return false
        }
        return true
    }
}
