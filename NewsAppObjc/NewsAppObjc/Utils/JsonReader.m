//
//  JsonReader.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "JsonReader.h"

@implementation JsonReader

// Method reading the json file from the resource bundle and returns the data
- (NSData*) getJsonData:(NSString *)fileName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
    if ([fileName length] == 0) {
        return nil;
    }
    
    return [NSData dataWithContentsOfFile:filePath];
}

@end
