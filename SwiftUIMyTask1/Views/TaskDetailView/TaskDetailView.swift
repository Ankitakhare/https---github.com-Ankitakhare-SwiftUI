//
//  TaskDetailView.swift
//  SwiftUIMyTask1
//
//  Created by ankita khare on 10/02/24.
//

import SwiftUI

struct TaskDetailView: View {
    
    @ObservedObject var taskViewModel : TaskViewModel
    @Binding var showTaskDetailView :Bool
    @Binding var selectedTaskData :Task
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Task Detail")){
                    TextField("Task name", text: $selectedTaskData.name)
                    TextEditor(text: $selectedTaskData.description)
                    Toggle("Mark Completed", isOn: $selectedTaskData.isCompleted)
                }
                Section(header: Text("Task date/time")){
                    DatePicker("Task date", selection: $selectedTaskData.finishDate)
                }
                Section{
                    Button{
                        print("Delete Task")
                    }label :{
                        Text("Delete")
                            .fontWeight(.bold)
                            .foregroundColor(.red)
                            .frame(maxWidth:.infinity,alignment: .center)
                    }
                }
                
            }.navigationTitle("Task Detail")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        Button{
                            showTaskDetailView.toggle()
                            print("cancel Button Tpped")
                        }label :{
                            Text("Cancel")
                        }}
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            print("Update Button Tpped")
                        }label :{
                            Text("Update")
                  }
                }
            }
        }
    }
    
}

#Preview {
    TaskDetailView(taskViewModel: TaskViewModel(), showTaskDetailView: .constant(false), selectedTaskData: .constant(Task.createMockTask().first!))
}
