//
//  Article.h
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

NS_ASSUME_NONNULL_BEGIN

@interface Article : NSObject

@property (nonatomic, strong) NSString* title;
@property (nonatomic, strong) NSString* url;
@property (nonatomic, strong) NSString* urlToImage;
@property (nonatomic, strong) NSDate* publishedAt;
@property (nonatomic, strong) UIImage *downloadedImage;

- (instancetype) initWithDictionary:(NSDictionary *)dictionary;
- (instancetype)initWith:(NSString *)name andPublishedAt:(NSString *)publishedAt;

@end

NS_ASSUME_NONNULL_END
