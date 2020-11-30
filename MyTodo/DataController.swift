//
//  DataController.swift
//  MyTodo
//
//  Created by Laflora on 2020/11/12.
//

import UIKit
import CoreData

//contextのクラス？みたいなイメージ
class DataController: NSObject {
    //DataControllerのインスタンスをシングルトン（DataControllerのインスタンスはこれだけだよ！の保証）に代入
    static let shared = DataController()
    let container: NSPersistentContainer
    lazy var context: NSManagedObjectContext = {
        return DataController.shared.container.viewContext
    }()
    
    private override init() {
        self.container = NSPersistentContainer(name: "TaskStore")
        let description = NSPersistentStoreDescription()
        description.shouldMigrateStoreAutomatically = true
        description.shouldInferMappingModelAutomatically = true
        self.container.persistentStoreDescriptions = [description]
        self.container.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
    func fetch<T>(_ request: NSFetchRequest<T>) throws -> [T] {
        return try self.context.fetch(request)
    }
    
    func create(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: self.context)!
    }
    
    func insert(_ entity: NSManagedObject) {
        self.context.insert(entity)
    }
    
    func delete(_ entity: NSManagedObject) {
        self.context.delete(entity)
    }
    
    func rollbackContext() {
        if self.context.hasChanges {
            self.context.rollback()
        }
    }
    
    func saveContext() -> Bool {
        if self.context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
                self.context.rollback()
                return false
            }
        }
        return true
    }
    
    // fetchRequest（生成されたManagaed objectの読み込み）はproperties.swiftの方で自動生成されている。

}
