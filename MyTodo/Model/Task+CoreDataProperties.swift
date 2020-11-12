//
//  Task+CoreDataProperties.swift
//  
//
//  Created by Laflora on 2020/11/11.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var taskName: String?

}
