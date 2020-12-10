//
//  MyTodoTests.swift
//  MyTodoTests
//
//  Created by Laflora on 2020/10/28.
//

import XCTest
@testable import MyTodo

class MyTodoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTaskNumberIsNotNill() {
        XCTAssertTrue(Task.isNumberValid(taskNumber: "123"))
    }
    func testTaskNumberIsNill() {
        XCTAssertFalse(Task.isNumberValid(taskNumber: nil))
    }
    
    func testCastedTaskNumberIsInt() {
        let castedTaskNumber = Int16(ItemAddViewController().numberField.text!)
        XCTAssertTrue((castedTaskNumber != nil))
    }
    func testCastedTaskNumberIsNotInt() {
        let notCastedTaskNumber = ItemAddViewController().numberField.text!
        XCTAssertFalse(notCastedTaskNumber)
    }
    
    func testTaskNumberIsEmoji() {
        XCTAssertFalse(✌️)
    }
    
    func testTaskNumberIsHexadecimal() {
        XCTAssertFalse((0x11 != 0))
    }
    
    func testTaskNumberIsNotHexadecimal() {
        XCTAssertTrue((01111 != 0))
    }
    

}
