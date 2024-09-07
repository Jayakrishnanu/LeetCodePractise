//
//  LinkedListsTest.swift
//  LeetCodePractiseTests
//
//  Created by Jayakrishnan u on 9/6/24.
//

import XCTest
import LeetCodePractise

final class LinkedListsTest: XCTestCase {

    var linkedTest = LinkedListQuestions()
    var listNode: Node<Int>?
    
    override func setUpWithError() throws {
        var list = LinkedList<Int>()
        listNode = list.arrayToLinkedList([1,2,3,4,5])
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLinkedList() throws {
        print(listNode!)
    }
    
    func testReverse() throws {
        let reverse = linkedTest.reverseList(listNode)
        print(reverse!)
    }
    
    func testIsPaliandrome() throws {
        var nodes = LinkedList<Int>()
        listNode = nodes.arrayToLinkedList([1, 2, 2, 1])
        XCTAssertTrue(linkedTest.isPaliandrome(listNode))
        listNode = nodes.arrayToLinkedList([1, 2])
        XCTAssertFalse(linkedTest.isPaliandrome(listNode))
    }
    
    func testRemoveElements() throws {
        var nodes = LinkedList<Int>()
        listNode = nodes.arrayToLinkedList([1, 2, 6, 3, 4, 5, 6])
        print(linkedTest.removeElements(listNode, 6)!)
    }

    
}
