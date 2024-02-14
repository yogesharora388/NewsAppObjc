//
//  NSString+Additional.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "NSString+Additional.h"

@implementation NSString (Additional)

- (NSDate*) convertToDate {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *date = [dateFormat dateFromString: self];
    return date;
}

- (NSInteger) getOccurencesOf:(NSString *)text {
    NSArray *components = [self componentsSeparatedByString: text];
    return components.count - 1;
}

@end
