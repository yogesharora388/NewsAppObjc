//
//  MockNewsReader.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "Article.h"
#import "Article+Additional.h"
#import "MockNewsReader.h"

@implementation MockNewsReader

- (void) getNews:(void (^)(NSArray * _Nonnull))completionBlock {
    NSArray *elements = [[NSArray alloc] initWithObjects: [Article mockWith: @"News1" andPublishedAt: @"2024-01-10T22:41:25Z"],
                         [Article mockWith: @"News2" andPublishedAt: @"2024-01-11T22:41:25Z"], nil];
    completionBlock(elements);
}

@end
