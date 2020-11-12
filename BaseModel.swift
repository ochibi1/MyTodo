//
//  BaseModel.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/12.
//

import UIKit
import CoreData

class BaseModel: NSManagedObject {
    static func create() -> Self {
        let entityDescription = DataController.shared.create(entityName: String(describing: type(of: self)))
        return NSManagedObject(entity: entityDescription, insertInto: nil) as! Self
    }
    
    func insert() {
        DataController.shared.insert(self)
    }
    
    func delete() {
        DataController.shared.delete(self)
    }
    
    func save() {
        DataController.shared.saveContext()
    }

    func rollback() {
        DataController.shared.rollbackContext()
    }
}
