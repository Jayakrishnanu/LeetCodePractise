//
//  ArrayAndStringTest.swift
//  LeetCodePractiseTests
//
//  Created by Jayakrishnan u on 9/6/24.
//

import XCTest
import LeetCodePractise


final class ArrayAndStringTest: XCTestCase {
    
    let arrayAndString = ArrayAndString()
    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRotateArray() throws {
        var nums = [1,2,3,4,5,6,7]
        arrayAndString.rotate(&nums, 3)
        XCTAssertEqual(nums, [5,6,7,1,2,3,4])
    }
    
    func testMaxProfit() throws {
        let prices = [7,1,5,3,6,4]
        XCTAssertEqual(arrayAndString.maxProfit(prices), 5)
        XCTAssertEqual(arrayAndString.maxProfits(prices), 7)
    }
    
    func testJump() throws {
        XCTAssertEqual(arrayAndString.jump([0]), 0)
    }
    
    
    
}
