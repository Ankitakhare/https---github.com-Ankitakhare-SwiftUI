//
//  AddTaskView.swift
//  SwiftUIMyTask1
//
//  Created by ankita khare on 09/02/24.
//

import SwiftUI

struct AddTaskView: View {
    
    @ObservedObject var taskViewModel : TaskViewModel
    @State private var taskToAdd :Task = Task(id: 0, name: "", description: "", isCompleted:  false, finishDate: Date())
    @Binding var showAddTaskView :Bool
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Task Detail")){
                    TextField("Task name", text: $taskToAdd.name)
                    TextEditor(text: $taskToAdd.description)
                }
                Section(header: Text("Task date/time")){
                    DatePicker("Task date", selection: $taskToAdd.finishDate)
                    }
            }.navigationTitle("Add Task")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button{
                            showAddTaskView = false
                            print("cancel Button Tpped")
                        }label :{
                            Text("Cancel")
                        }}
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            print("Add Button Tpped")
                        }label :{
                            Text("Add")
                  }
                }
            }
        }
    }
}

#Preview {
    AddTaskView(taskViewModel: TaskViewModel(), showAddTaskView: .constant(false))
}
