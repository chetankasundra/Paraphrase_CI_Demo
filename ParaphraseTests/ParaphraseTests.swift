//
//  ParaphraseTests.swift
//  ParaphraseTests
//
//  Created by Chetan Kasundra on 2020/10/22.
//  Copyright © 2020 Hacking with Swift. All rights reserved.
//

import XCTest
@testable import Paraphrase

class ParaphraseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadingInitialQuotes() {
        let model = QuotesModel(testing: true)
        XCTAssertTrue(model.count == 12)
    }

    func testRandomQuote() {
        let model = QuotesModel(testing: true)
        
        guard let quote = model.random() else {
            XCTFail()
            return
        }
        XCTAssert(quote.author == "Eliot")
    }
    
    func testFormatting() {
        let model = QuotesModel(testing: true)
        let quote = model.quote(at: 0)
        
        let testString = "\"\(quote.text)\"\n   — \(quote.author)"
        XCTAssert(quote.multiline == testString)
    }
    
    func testAddingQuote() {
        var model = QuotesModel(testing: true)
        let quoteCount = model.count
        
        let newQuote = Quote(author: "Test Chetan", text: "Test chetan")
        
        model.add(newQuote)
        XCTAssert(model.count == quoteCount + 1)
    }
    
    func testRemovingQuote() {
        var model = QuotesModel(testing: true)
        let quoteCount = model.count

        model.remove(at: 0)
        XCTAssert(model.count == quoteCount - 1)
    }
    
    func testReplacingQuote() {
        var model = QuotesModel(testing: true)
        
        let newQuote = Quote(author: "Ted Logan", text: "All we are is dust in the wind, dude.")
        model.replace(index:0, with: newQuote)
        
        let testQuote = model.quote(at: 0)
        XCTAssert(testQuote.author == "Ted Logan")
    }
    
    func testReplacingEmptyQuote() {
        var model = QuotesModel(testing: true)
        let previousCount = model.count
        
        let newQuote = Quote(author: "", text: "")
        model.replace(index:0, with: newQuote)
        XCTAssert(model.count == previousCount - 1)
    }
}
