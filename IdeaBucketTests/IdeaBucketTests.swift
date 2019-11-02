//
//  IdeaBucketTests.swift
//  IdeaBucketTests
//
//  Created by Shane Lee on 19/10/2019.
//  Copyright © 2019 Shane Lee. All rights reserved.
//

import XCTest
@testable import IdeaBucket

class IdeaBucketTests: XCTestCase {

    func testIdeaWithCategoryInitSuceeds() {
        let ideaWithCategory = Idea.init(idea: "TestIdea", category: "TestCategory")
        XCTAssertNotNil(ideaWithCategory)
    }
    
    func testIdeaWithoutIdeaInitFails() {
        let ideaWithCategory = Idea.init(idea: "", category: "TestCategory")
        XCTAssertNil(ideaWithCategory)
    }

}
