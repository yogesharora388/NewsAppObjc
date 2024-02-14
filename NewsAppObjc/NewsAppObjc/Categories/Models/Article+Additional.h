//
//  Article+Additional.h
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "Article.h"

NS_ASSUME_NONNULL_BEGIN

@interface Article (Additional)

- (NSString *) displayPublishedValue;
+ (Article *) mockWith:(NSString *)name andPublishedAt:(NSString *)publishedAt;

@end

NS_ASSUME_NONNULL_END
