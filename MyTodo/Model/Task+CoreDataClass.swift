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
        
        return taskNumber.isEmpty
            && Int16(taskNumber) != nil
            && Int16(taskNumber)! > 0
            && taskNumber == "^[０-９]+"
            && taskNumber == "^[A-Z]+"
            && taskNumber == "^(0x)?([0-9a-f]{2,})"
            && taskNumber.isAppleColorEmoji
    }
    
}

fileprivate var appleColorEmojiFont = CTFontCreateWithName("AppleColorEmoji" as CFString, 20, nil)

extension String {
    var isAppleColorEmoji: Bool {
        let chars = Array(self.utf16)
        if chars.count == 1 && chars[0] <= 57 { 
            return false
        }
        var glyphs = [CGGlyph](repeating: 0, count: chars.count)
        return CTFontGetGlyphsForCharacters(appleColorEmojiFont, chars, &glyphs, glyphs.count)
    }
}
