//
//  TaskViewModel.swift
//  SwiftUIMyTask1
//
//  Created by ankita khare on 09/02/24.
//

import Foundation

class TaskViewModel : ObservableObject {
    
    @Published var tasks:[Task] = []
    
    func getTask(isActive :Bool){
        tasks = Task.createMockTask().filter({ $0.isCompleted == !isActive})
        
        
    }
     
    
    
    
    
    
}
