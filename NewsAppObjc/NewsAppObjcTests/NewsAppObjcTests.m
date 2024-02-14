//
//  NewsAppObjcTests.m
//  NewsAppObjcTests
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "Article.h"
#import "NewsViewModel.h"
#import "MockNewsReader.h"
#import <XCTest/XCTest.h>


@interface NewsAppObjcTests : XCTestCase

@end

@implementation NewsAppObjcTests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void) testNewsViewModelIsEmpty {
    NewsViewModel *viewModel = [[NewsViewModel alloc] initWithReader: [[MockNewsReader alloc] init]];
    
    XCTAssertTrue((viewModel.contents.count == 0), @"Expected initial value to be empty, but got \(viewModel.news).");
}

- (void) testNewsViewModelHavingData {
    NewsViewModel *viewModel = [[NewsViewModel alloc] initWithReader: [[MockNewsReader alloc] init]];
    [viewModel loadNews];
    XCTAssertEqual(viewModel.contents.count, 2, "Found News");
}

- (void) testSortByDate {
    NewsViewModel *viewModel = [[NewsViewModel alloc] initWithReader: [[MockNewsReader alloc] init]];
    
    [viewModel loadNews];
    XCTAssertEqual(viewModel.contents.count, 2, "Found News");
    XCTAssertEqual(((Article *)viewModel.contents.firstObject).title, @"News2", @"Match Fount");
}

- (void) testSearchByText {
    NewsViewModel *viewModel = [[NewsViewModel alloc] initWithReader: [[MockNewsReader alloc] init]];
    [viewModel loadNews];
    [viewModel filterContentsBy: @"News1"];
    XCTAssertEqual(viewModel.contents.count, 1, "Found News");
}

@end
