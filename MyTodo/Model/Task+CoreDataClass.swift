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
    
    func isNumberValid(_ taskNumber: String) -> Bool {
        
        return !taskNumber.isEmpty
            && Int16(taskNumber) != nil
            && Int16(taskNumber)! > 0
            && taskNumber == "^[０-９]+"
            && taskNumber == "^[A-Z]+"
        
        //顔文字のような記号が含まれていないか
        //16進数の文字列ではないか（これについては、どうやって正規表現とか使うのかイメージ湧いていない）

    }
    
}
