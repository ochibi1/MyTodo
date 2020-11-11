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

@objc(Task)
public class Task: NSManagedObject {

}

class DataController: NSObject {
    var container: NSPersistentContainer!

    init(completionClosure: @escaping () -> ()) {
        container = NSPersistentContainer(name: "TaskStore")
        container.loadPersistentStores() { (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
         return container
        }
        
    //Managed objectの生成？
    func createTask() -> TaskMO {
        let context = container.viewContext
        let task = NSEntityDescription.insertNewObject(forEntityName: "Task", into: context) as! TaskMO
        return task
    }
     
    //Context(データを扱う生成・取得・保存時に使われるスペース)を保存。
    func saveContext() {
        let context = container.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    // fetch（生成されたManagaed objectの読み込み）はproperties.swiftの方で自動生成されている。
}
