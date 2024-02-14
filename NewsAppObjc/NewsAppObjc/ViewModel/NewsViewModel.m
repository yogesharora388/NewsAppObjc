//
//  NewsViewModel.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "Article.h"
#import "DataReader.h"
#import "NewsViewModel.h"
#import "NSString+Additional.h"

@implementation NewsViewModel

@synthesize reader;
@synthesize contents;
@synthesize delegate;

- (instancetype)initWithReader:(DataReader *)reader {
    self = [super init];
    if (self) {
        self.reader = reader;
    }
    
    return self;
}

- (void)loadNews {
    originalContents = nil;
    
    if (self.reader != nil) {
        [reader getNews:^(NSArray *results) {
            NSArray *sortedArray = [results sortedArrayUsingComparator:^NSComparisonResult(Article *obj1, Article *obj2) {
                return [obj2.publishedAt compare: obj1.publishedAt];
            }];
            
            self.contents = sortedArray;
            
            if (self.delegate != nil) {
                [self.delegate didFinishLoading];
            }
        }];
    }
}

- (void)filterContentsBy:(NSString *)searchText {
    if (originalContents == nil) {
        originalContents = [self.contents copy];
    }
    
    NSString *trimmedText = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].lowercaseString;
    if ([trimmedText length] > 0) {
        NSPredicate *ofType = [NSPredicate predicateWithFormat:@"title contains[c] %@", trimmedText];
        
        self.contents  = [[originalContents filteredArrayUsingPredicate:ofType] sortedArrayUsingComparator:^NSComparisonResult(Article *obj1, Article *obj2) {
            return [obj2.title.lowercaseString getOccurencesOf: trimmedText] > [obj1.title.lowercaseString getOccurencesOf: trimmedText];
        }];
        
        if (self.delegate != nil) {
            [self.delegate didFinishFiltering];
        }
    } else {
        [self loadNews];
    }
}

@end
