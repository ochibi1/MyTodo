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
        XCTAssertTrue(validate(taskNumber: 1234))
    }
    func testTaskNumberIsNill() {
        XCTAssertFalse(validate(taskNumber: ""))
    }
    
    func testTaskNumberIsInt() {
        XCTAssertTrue(validate(taskNumber: 5))
    }
    func testTaskNumberIsNotInt() {
        XCTAssertFalse(validate(taskNumber: "5"))
    }
    
    func testTaskNumberIsMinus() {
        XCTAssertFalse(validate(taskNumber: -123))
    }
    
    func testTaskNumberIsNotMinus() {
        XCTAssertTrue(validate(taskNumber: 123))
    }
    
    func testTaskNumberIsString() {
        XCTAssertFalse(validate(taskNumber: "something"))
    }
    
    func testTaskNumberIsNotString() {
        XCTAssertTrue(validate(taskNumber: 67))
    }
    
    func testTaskNumberIsEmoji() {
        XCTAssertFalse(validate(taskNumber: ✌️))
    }
    
    func testTaskNumberIsNotEmoji() {
        XCTAssertTrue(validate(taskNumber: 89))
    }
    
    func testTaskNumberIsHexadecimal() {
        XCTAssertFalse(validate(taskNumber: 0x11))
    }
    
    func testTaskNumberIsNotHexadecimal() {
        XCTAssertTrue(validate(taskNumber: 01111))
    }
    

}
