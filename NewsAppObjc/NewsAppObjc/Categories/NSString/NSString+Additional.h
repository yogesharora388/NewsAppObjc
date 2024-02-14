//
//  NSString+Additional.h
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Additional)

- (NSDate*) convertToDate;
- (NSInteger) getOccurencesOf:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
