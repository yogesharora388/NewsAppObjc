//
//  NewsReader.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "Article.h"
#import "NewsReader.h"
#import "JsonReader.h"

@implementation NewsReader

#pragma Mark: - Reader
- (void)getNews:(void (^)(NSArray * _Nonnull))completionBlock {
    JsonReader *reader = [[JsonReader alloc] init];
    
    NSData *data = [reader getJsonData:@"news"];
    if (data != nil) {
        NSError *error = nil;
        id object = [NSJSONSerialization JSONObjectWithData: data options:0 error: &error];
        
        if (error != nil) {
            completionBlock(@[]);
            return;
        }
        
        NSMutableArray *results = [NSMutableArray array];
        if ([object isKindOfClass:[NSDictionary class]]) {
            NSArray *elements = [object objectForKey:@"articles"];
            
            for (NSDictionary *dataDictionary in elements) {
                Article *item = [[Article alloc] initWithDictionary: dataDictionary];
                [results addObject: item];
            }
        }
        
        completionBlock(results);
        return;
    }
    
    completionBlock(@[]);
}

@end
