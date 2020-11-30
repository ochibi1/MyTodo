//
//  Task+CoreDataClass.swift
//  
//
//  Created by Laflora on 2020/11/11.
//
//

import Foundation
import CoreData
import UIKit

public class Task: NSManagedObject, BaseModelProtocol {
    
    func isNumberValid(taskNumber: String?) -> Bool {
        guard let taskNumber = taskNumber,
              let regex = try? NSRegularExpression(pattern: "[^0-9]"),
              regex.numberOfMatches(in: taskNumber, options: [], range: NSRange(location: 0, length: taskNumber.count)) <= 0 else {
            return false
        }
        return true
    }
}
