//
//  ViewController.m
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import "Article.h"
#import "Article+Additional.h"
#import "NewsReader.h"
#import "NewsTableViewCell.h"
#import "NewsViewModel.h"
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    NewsViewModel *viewModel;
    NSCache *imageCache;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    imageCache = [[NSCache alloc] init];
    viewModel = [[NewsViewModel alloc] initWithReader:[[NewsReader alloc] init]];
    viewModel.delegate = self;
    [viewModel loadNews];
}

#pragma Mark - UITableViewDataSource
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (viewModel != nil) ? viewModel.contents.count : 0;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"NewsCell" forIndexPath: indexPath];
    
    if (cell == nil) {
        cell = [[NewsTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"NewsCell"];
        
    }
    
    Article *article = (Article*)[viewModel.contents objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = [article title];
    cell.publishedLabel.text = [article displayPublishedValue];
    UIImage *image = [imageCache objectForKey: article.urlToImage];
    
    if (image != nil) {
        cell.imageView.image = image;
    } else if (article.urlToImage.length > 0) {
        NSString *urlString = article.urlToImage;
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
            NSURL *url = [NSURL URLWithString: urlString];
            NSData *data = [NSData dataWithContentsOfURL: url];
            UIImage *image = [[UIImage alloc] initWithData:data];
            
            dispatch_sync(dispatch_get_main_queue(), ^{
                [cell.imageView setImage: image];
                [self->imageCache setObject: image forKey: urlString];
            });
        });
    }
    
    return cell;
}


#pragma Mark - NewsViewModel Delegate
- (void)didFinishLoading {
    [self.tableView reloadData];
}

- (void)didFinishFiltering {
    [self.tableView reloadData];
}

#pragma Mark - UISearchBarDelegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (viewModel != nil) {
        [viewModel filterContentsBy: searchText];
    }
}

@end
