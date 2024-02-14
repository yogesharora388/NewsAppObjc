//
//  DataReader.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "DataReader.h"

@implementation DataReader

- (void)getNews:(nonnull void (^)(NSArray * _Nonnull))completionBlock {
    completionBlock(@[]);
}

@end
