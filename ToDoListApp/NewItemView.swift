//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by MacBook Pro on 04/08/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented : Bool
    
    var body: some View {
        VStack{
            Text("اضافة")
                .font(.system(size: 20))
                .bold()
                .padding(.top,30)
            Form{
                //title
                TextField("المهمه", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //due Date
                DatePicker("التاريخ", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //Button
                TLButton(title: "حفظ", background: .pink) {
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }else
                    {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),message:Text( "الرجاء عدم ترك الحقول فارغه"))
            }
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewItemView( newItemPresented: Binding(get: {
            return true
        }, set: { _   in
           
        }))
    }
}
