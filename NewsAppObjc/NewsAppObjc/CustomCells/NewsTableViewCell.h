//
//  NewsTableViewCell.h
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *publishedLabel;

- (void) refreshLayout;

@end

NS_ASSUME_NONNULL_END
