//
//  Task.swift
//  SwiftUIMyTask1
//
//  Created by ankita khare on 09/02/24.
//

import Foundation


struct Task {
    let id : Int
    var name : String
    var description : String
    var isCompleted: Bool
    var finishDate: Date
    
    static func createMockTask() -> [Task] {
        return[
        Task(id: 1, name: "Go To Gym", description: "Leg Workout", isCompleted: false, finishDate: Date()),
        Task(id: 2, name: " Car Wash", description: "Auckland Downtown Car Wash Center", isCompleted: false, finishDate: Date()),
        Task(id: 3, name: "Office Work", description: "Finish MVVM Architechure", isCompleted: true, finishDate: Date())
        ]
        
        
    }
    
    
    
}
