//
//  ViewController.h
//  NewsAppObjc
//
//  Created by Yogesh Arora on 14/02/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, NewsViewModelDelegate, UISearchBarDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

