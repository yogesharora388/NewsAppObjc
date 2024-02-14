//
//  NewsViewModel.h
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import <Foundation/Foundation.h>

@class DataReader;

@protocol NewsViewModelDelegate <NSObject>

- (void) didFinishLoading;
- (void) didFinishFiltering;

@end

NS_ASSUME_NONNULL_BEGIN

@interface NewsViewModel : NSObject
{
    NSArray *originalContents;
}

@property (nonatomic, strong) DataReader *reader;
@property (nonatomic, strong) NSArray *contents;
@property (nonatomic, weak) id delegate;

- (instancetype) initWithReader:(DataReader *)reader;
- (void)loadNews;
- (void)filterContentsBy:(NSString *)searchText;

@end

NS_ASSUME_NONNULL_END
