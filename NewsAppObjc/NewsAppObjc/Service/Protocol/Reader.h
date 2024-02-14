//
//  Reader.h
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol Reader <NSObject>

@required
- (void)getNews:(void (^)(NSArray*))completionBlock;

@end

NS_ASSUME_NONNULL_END
