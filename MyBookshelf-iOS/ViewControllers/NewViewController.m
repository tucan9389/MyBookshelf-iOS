//
//  ViewController.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 22/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "NewViewController.h"
#import "DetailBookViewController.h"
#import "NewBookTableViewCell.h"
#import "BookModel.h"
#import "BookStoreAPIClient.h"

@interface NewViewController ()

@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *refreshItem;
@property (atomic, strong) NSArray *books;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self refresh: nil];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSIndexPath *indexPathForSelectedRow = self.mainTableView.indexPathForSelectedRow;
    if (indexPathForSelectedRow) {
        [self.mainTableView deselectRowAtIndexPath:indexPathForSelectedRow animated:true];
    }
}

- (IBAction)refresh:(UIBarButtonItem *)sender {
    [self.refreshItem setTitle:@"Loading..."];
    [self.refreshItem setEnabled:false];
    // start of network
    [[BookStoreAPIClient shared] requestNewWithCompletion:^(NSArray * _Nonnull bookInfos) {
        if (bookInfos) {
            NSMutableArray *books = [[NSMutableArray alloc] init];
            for (int i=0; i<bookInfos.count; i++) {
                NSDictionary *bookInfo = bookInfos[i];
                BookModel *book = [[BookModel alloc] initWithInfo: bookInfo];
                [books addObject:book];
            }
            self.books = books;
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // on main thread
            self.refreshItem.title = @"Refresh";
            [self.refreshItem setEnabled:true];
            
            [self.mainTableView reloadData];
        });
    }];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"gotoDetailBook"]) {
        NSString *isbn13 = sender;
        DetailBookViewController *vc = (DetailBookViewController *)segue.destinationViewController;
        vc.isbn13 = isbn13;
    }
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NewBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewBookTableViewCell"];
    if (cell) {
        [cell setBook:self.books[[indexPath row]]];
        return cell;
    } else {
        return [[UITableViewCell alloc] init];
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.books ? self.books.count : 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"select - %ld", indexPath.row);
    id isbn13 = ((BookModel *)self.books[indexPath.row]).isbn13;
    [self performSegueWithIdentifier:@"gotoDetailBook" sender:isbn13];
}

@end
