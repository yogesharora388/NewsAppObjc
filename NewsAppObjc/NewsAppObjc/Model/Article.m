//
//  Article.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "Article.h"
#import "NSString+Additional.h"

@implementation Article

@synthesize title;
@synthesize url;
@synthesize urlToImage;
@synthesize publishedAt;
@synthesize downloadedImage;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.title = [dictionary objectForKey:@"title"];
        self.url = [dictionary objectForKey:@"url"];
        self.urlToImage = [dictionary objectForKey:@"urlToImage"];
        self.publishedAt = [[dictionary objectForKey:@"publishedAt"] convertToDate];
    }
    
    return self;
}

- (instancetype)initWith:(NSString *)name andPublishedAt:(NSString *)publishedAt {
    self = [super init];
    if (self) {
        self.title = name;
        self.url = @"";
        self.urlToImage = @"";
        self.publishedAt = [publishedAt convertToDate];
    }
    
    return self;
}

@end
