//
//  JsonReader.h
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JsonReader : NSObject

- (NSData*) getJsonData:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
