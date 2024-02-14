//
//  NewsTableViewCell.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "NewsTableViewCell.h"

@implementation NewsTableViewCell

@synthesize imageView;
@synthesize titleLabel;
@synthesize publishedLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) refreshLayout {
    [self.contentView layoutIfNeeded];
    [self.contentView setNeedsDisplay];
}

@end
