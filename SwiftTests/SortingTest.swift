//
//  BinarySearchTest.swift
//  SwiftStructures
//
//  Created by Wayne Bishop on 9/23/14.
//  Copyright (c) 2014 Arbutus Software Inc. All rights reserved.
//

import UIKit
import XCTest

@testable import SwiftStructures


class SortingTest: XCTestCase {

    
    /*
    
    TODO:
    Only have 3 collection examples. Text, numbers and an empty set. He's also missed consistently using the same method calls 
    for each sorting example. Each of these should be reviewed carefully. Consider refactoring the isSorted method to something more
    readable.
    
    */
    
    private var numberList: Array<Int>!
    private var triviaNumberList: Array<Int>!
    private var emptyNumberList: Array<Int>!
    private var textList: Array<String>!
    private var triviaTextList: Array<String>!
    private var emptyTextList: Array<String>!
    private var sortTest: Sorting!

    
    override func setUp() {
        super.setUp()
        
        numberList = [8, 2, 10, 9, 7, 5]
        triviaNumberList = [1] // Should have just one element
        emptyNumberList = []
        textList = ["Dog", "Cat", "Dinasour", "Lion", "Cheetah", "Gazelle", "Elephant", "Aardvark"]
        triviaTextList = ["Dog"]
        emptyTextList = []
        sortTest = Sorting()
    }
    
    
    
    //MARK: - Binary Search Algorithms
    

    func testBinarySearch() {
        
        var searchList: Array<Int> = Array<Int>()
        let key: Int = 235

        
        //populate collection..
        for number in 0...500 {
            searchList.append(number)
        }
        
        //perform theoretical search
        XCTAssertTrue(sortTest.binarySearch(searchList, key: key), "binary key value \(key) not found..")
        
    }

    
    func testBinaryTestNotFound() {
        
        let searchList: Array<Int> = [0,4,7,9,13,16,34]
        let key: Int = 8
        
        
        //test for false positive
        XCTAssertFalse(sortTest.binarySearch(searchList, key: key), "binary key value \(key) found..")
        
    }
    
    
    
	
    //MARK: General Sorting Algorithms
    
    func testInsertionSort() {
        
        let resultList: Array<Int> = sortTest.insertionSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(triviaNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        let sequence = sortTest.insertionSortG(textList)
        let triviaSequence = sortTest.insertionSortG(triviaTextList)
        let emptySequence = sortTest.insertionSortG(emptyTextList)
        
        //evaluate results
        XCTAssertTrue(self.isSorted(resultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(emptyResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(sequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(triviaSequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(emptySequence), "item sequence not in sorted order..")
        
    }
    
    
    
    func testBubbleSort() {
        
        let resultsList: Array<Int> = sortTest.bubbleSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(triviaNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        let sequence = sortTest.bubbleSortG(textList)
        let triviaSequence = sortTest.insertionSortG(triviaTextList)
        let emptySequence = sortTest.insertionSortG(emptyTextList)
        
        //evaluate results
        XCTAssertTrue(self.isSorted(resultsList), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(emptyResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(sequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(triviaSequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(emptySequence), "item sequence not in sorted order..")
    }

    
    
    func testSelectionSort() {
        
        let resultList: Array<Int> = sortTest.selectionSort(numberList)
        let triviaResultList: Array<Int> = sortTest.insertionSort(triviaNumberList)
        let emptyResultList: Array<Int> = sortTest.insertionSort(emptyNumberList)
        let sequence = sortTest.insertionSortG(textList)
        let triviaSequence = sortTest.insertionSortG(triviaTextList)
        let emptySequence = sortTest.insertionSortG(emptyTextList)
      
        
        //evaulate results
        XCTAssertTrue(self.isSorted(resultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(triviaResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(emptyResultList), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(sequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(triviaSequence), "item sequence not in sorted order..")
        XCTAssertTrue(self.isSorted(emptySequence), "item sequence not in sorted order..")
        
    }
    
    
    //MARK: Helper Function
   
    
    //TODO: Test this helper method. Once complete move into protocol extension so functionality can be shared with other classes
    
    
    func isSorted<T: Comparable>(_ sequence: Array<T>) -> Bool {
        
        //check trivial case
        guard sequence.count != 0 else {
            return false
        }
        
        var index = sequence.startIndex

        
        //compare sequence values
        while index < sequence.endIndex {
            if sequence[index] > sequence[sequence.index(after: index)] {
                return false
            }
            index = sequence.index(after: index)
        }
        
        return true
        
    }
    
    
    /*
    //generic method to determine sorted order
    func isSorted<T: Comparable>(_ sequence: [T]) -> Bool {
        
        guard sequence.count > 1 else { return true } // immediately return true for trivial cases
        
        // after the guard check we are guaranteed that sequence has at least two elements
        
        let rangeFromSecondElement = sequence.startIndex.successor()..<sequence.endIndex
        
        return !rangeFromSecondElement.contains { index in
            
            sequence[index.predecessor()] > sequence[index]
            
        }
        
    }
 
   */
    
    
    
}
