//
//  NSDate+Additional.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "NSDate+Additional.h"

@implementation NSDate (Additional)

- (NSString *) convertToString {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return [dateFormat stringFromDate: self];
}

@end
