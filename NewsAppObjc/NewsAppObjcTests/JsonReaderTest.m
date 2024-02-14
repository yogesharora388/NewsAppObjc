//
//  JsonReaderTest.m
//  NewsAppObjcTests
//
//  Created by Yogesh Arora on 14/02/24.
//

#import <XCTest/XCTest.h>
#import "JsonReader.h"

@interface JsonReaderTest : XCTestCase

@end

@implementation JsonReaderTest

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testJsonReading {
    JsonReader *jsonReader = [[JsonReader alloc] init];
    NSData *data = [jsonReader getJsonData: @"news"];
    XCTAssertTrue(data != nil);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
