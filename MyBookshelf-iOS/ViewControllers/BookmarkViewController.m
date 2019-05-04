//
//  BookmarkViewController.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 23/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "BookmarkViewController.h"
#import "BookTableView.h"
#import "BookmarkManager.h"
#import "DetailBookViewController.h"
#import "BookDetailModel.h"

@interface BookmarkViewController () <DetailBookDelegate>

@property (weak, nonatomic) IBOutlet BookTableView *mainTableView;

@end

@implementation BookmarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainTableView.detailBookDelegate = self;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self reloadBookmarkedBooks];
}

-(void)reloadBookmarkedBooks {
    self.mainTableView.books = [[BookmarkManager shared] bookmarks];
    
    [self.mainTableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"gotoDetailBook"]) {
        BookModel *book = sender;
        DetailBookViewController *vc = (DetailBookViewController *)segue.destinationViewController;
        vc.book = book;
    }
}

-(void)segueWithBook:(id<BookModelProtocol>)book {
    [self performSegueWithIdentifier:@"gotoDetailBook" sender:book];
}

@end
