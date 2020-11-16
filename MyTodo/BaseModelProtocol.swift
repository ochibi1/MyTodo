//
//  BaseModel.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/12.
//

import UIKit
import CoreData

protocol BaseModelProtocol
{
    
}

extension BaseModelProtocol where Self: NSManagedObject {
    
    static func fetchAll() -> [Self] {
        do {
            let request = NSFetchRequest<Self>(entityName: String(describing: self))
            return try DataController.shared.fetch(request)
        } catch {
            fatalError()
        }
    }
    
    static func fetch(offset: Int, limit: Int) -> [Self] {
        do {
            let request = NSFetchRequest<Self>(entityName: String(describing: self))
            request.fetchOffset = offset
            request.fetchLimit = limit
            return try DataController.shared.fetch(request)
        } catch {
            fatalError()
        }
    }
    
    static func create() -> Self {
        let entityDescription = DataController.shared.create(entityName: String(describing: self))
        return Self(entity: entityDescription, insertInto: nil)
    }
    
    func insert() {
        DataController.shared.insert(self)
    }
    
    func delete() {
        DataController.shared.delete(self)
    }
    
    func save() -> Bool {
        DataController.shared.saveContext()
    }

    func rollback() {
        DataController.shared.rollbackContext()
    }
}
