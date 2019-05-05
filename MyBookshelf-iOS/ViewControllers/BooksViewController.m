//
//  ViewController.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 22/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "BooksViewController.h"
#import "DetailBookViewController.h"
#import "BookmarkManager.h"

#import "BookTableView.h"
#import "BookModel.h"
#import "NewBookTableViewCell.h"

#import "BookStoreClient.h"

#import "AutoLoadControl.h"

@interface BooksViewController () <DetailBookDelegate>

@property (weak, nonatomic) IBOutlet BookTableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshItem;
@property (nonatomic, strong) AutoLoadControl *autoLoadControl;

@end

@implementation BooksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainTableView.detailBookDelegate = self;
    
    self.autoLoadControl = [[AutoLoadControl alloc] init];
    
    [self refresh:nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSIndexPath *indexPathForSelectedRow = self.mainTableView.indexPathForSelectedRow;
    if (indexPathForSelectedRow) {
        [self.mainTableView deselectRowAtIndexPath:indexPathForSelectedRow animated:YES];
    }
}

- (IBAction)refresh:(UIBarButtonItem *)sender {
    if (self.query) {
        [self reloadSearchAPIWithQuery:self.query];
    } else {
        [self reloadNewAPI];
    }
}

-(void)reloadNewAPI {
    [self updateUIForStartRequest];
    // start of network
    [[BookStoreClient shared] requestNewAPIWithCompletion:^(NSArray * _Nonnull books) {
        self.mainTableView.books = books;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // on main thread
            [self updateUIForEndRequest];
            
            [self.mainTableView reloadData];
        });
    }];
}

-(void)reloadSearchAPIWithQuery:(NSString *)query {
    if (!query) { return; }
    
    [self updateUIForStartRequest];
    // start of network
    [[BookStoreClient shared] requestSearchAPIWithQuery:query page:@(1) completion:^(NSArray * _Nonnull books) {
        self.mainTableView.books = books;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // on main thread
            [self updateUIForEndRequest];
            
            [self.mainTableView reloadData];
        });
    }];
}

-(void)updateUIForStartRequest {
    [self.refreshItem setTitle:@"Loading..."];
    [self.refreshItem setEnabled:NO];
}

-(void)updateUIForEndRequest {
    self.refreshItem.title = @"Refresh";
    [self.refreshItem setEnabled:YES];
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
