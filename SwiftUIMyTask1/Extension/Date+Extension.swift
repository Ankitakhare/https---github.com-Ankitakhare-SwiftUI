//
//  Date+Extension.swift
//  SwiftUIMyTask1
//
//  Created by ankita khare on 09/02/24.
//

import Foundation

extension Date {
    
    func toString()-> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        let result = dateFormatter.string(from: self)
        return result
    }
    
}
