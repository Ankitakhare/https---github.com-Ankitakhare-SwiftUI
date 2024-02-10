//
//  HomeView.swift
//  SwiftUIMyTask1
//
//  Created by ankita khare on 09/02/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var taskViewModel :TaskViewModel = TaskViewModel()
    @State private var  pickerFilters:[String] = ["Active","Completed"]
    @State private var defaultPickerSeletedItem : String = "Active"
    @State private var showAddTaskView : Bool = false
    @State private var showTaskDetailView : Bool = false
    @State private var selectedTask : Task = Task(id: 0, name: "", description: "", isCompleted: false, finishDate: Date())
    
    var body: some View {
        NavigationStack{
            Picker("Picker filter", selection: $defaultPickerSeletedItem){
                ForEach(pickerFilters, id:\.self){
                    Text($0)
                }
                
            }.pickerStyle(.segmented)
                .onChange(of: defaultPickerSeletedItem) { newValue in
                            taskViewModel.getTask(isActive: defaultPickerSeletedItem == "Active")
                        }
            List(taskViewModel.tasks,id: \.id){ task in
                VStack(alignment:.leading){
                    Text(task.name).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    HStack{
                        Text(task.description).font(.subheadline).lineLimit(2)
                        Spacer()
                        Text(task.finishDate.toString()).font(.subheadline).lineLimit(2)
                    }
                }.onTapGesture {
                    selectedTask = task
                    showTaskDetailView.toggle()
                }
            }.onAppear(){
                taskViewModel.getTask(isActive: true)
            }.listStyle(.plain)
                .navigationTitle("Home")
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            showAddTaskView = true
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showAddTaskView){
                    AddTaskView(taskViewModel: taskViewModel,showAddTaskView: $showAddTaskView)
                }
                .sheet(isPresented: $showTaskDetailView){
                    TaskDetailView(taskViewModel: taskViewModel,showTaskDetailView: $showTaskDetailView,selectedTaskData: $selectedTask)
                }
            
        }
    }
}

#Preview {
    HomeView()
}
