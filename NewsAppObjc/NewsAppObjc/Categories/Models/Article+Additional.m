//
//  Article+Additional.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "Article+Additional.h"
#import "NSDate+Additional.h"

@implementation Article (Additional)

- (NSString *) displayPublishedValue {
    return self.publishedAt.convertToString;
}

+ (Article *) mockWith:(NSString *)name andPublishedAt:(NSString *)publishedAt {
    return [[Article alloc] initWith: name andPublishedAt: publishedAt];
}

@end
