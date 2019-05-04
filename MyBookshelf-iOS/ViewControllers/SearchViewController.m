//
//  SearchViewController.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 23/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "SearchViewController.h"
#import "BooksViewController.h"

@interface SearchViewController () <UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *topSearchBar;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topSearchBar.delegate = self;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    NSLog(@"%@", searchBar.text);
    [self performSegueWithIdentifier:@"gotoBooks" sender:searchBar.text];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)query {
    if ([segue.identifier isEqualToString:@"gotoBooks"]) {
        BooksViewController *vc = (BooksViewController *)segue.destinationViewController;
        vc.query = query;
    }
}

@end
