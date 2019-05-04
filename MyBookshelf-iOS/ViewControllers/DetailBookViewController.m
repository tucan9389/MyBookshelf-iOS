//
//  DetailBookViewController.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 26/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "DetailBookViewController.h"
#import <SafariServices/SafariServices.h>
#import "BookStoreClient.h"
#import "BookmarkManager.h"
#import "HistoryManager.h"
#import "BookDetailModel.h"

@interface DetailBookViewController ()

@property (nonatomic, strong) UIBarButtonItem *bookmarkItem;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *isbn13Label;
@property (weak, nonatomic) IBOutlet UILabel *pagesLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *linkButton;

@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *publisherLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *languageLabel;
@property (weak, nonatomic) IBOutlet UILabel *isbn10Label;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end

@implementation DetailBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    if (!self.bookDetail) {
        [self reloadBook];
        
        [self reloadDetailBookAPIWithISBN13:self.book.isbn13];
        
        [[HistoryManager shared] readWithDetailModel:self.book];
    } else {
        [self reloadDetailBook];
    }
}

-(void)setupUI {
    self.bookmarkItem = [[UIBarButtonItem alloc] initWithTitle:@"Bookmark" style:UIBarButtonItemStylePlain target:self action:@selector(tapBookmark:)];
    [self.navigationItem setRightBarButtonItem:self.bookmarkItem animated:NO];
    
    [self updateBookmarkTitle];
}

-(void)tapBookmark:(id)sender {
    if (![[BookmarkManager shared] contains:self.book]) {
        [[BookmarkManager shared] bookmarkWithDetailModel:self.book];
    } else {
        [[BookmarkManager shared] unbookmarkWithDetailModel:self.book];
    }
    [self updateBookmarkTitle];
}

-(void)updateBookmarkTitle {
    if ([[BookmarkManager shared] contains:self.book]) {
        [self.bookmarkItem setTitle:@"Bookmarked"];
    } else {
        [self.bookmarkItem setTitle:@"Bookmark"];
    }
}

-(void)reloadDetailBookAPIWithISBN13: (NSNumber *)isbn13 {
    // start of network
    [[BookStoreClient shared] requestDetailBookAPIWithQuery:isbn13 completion:^(BookDetailModel * _Nonnull result) {
        self.bookDetail = result;
        dispatch_async(dispatch_get_main_queue(), ^{
            // on main thread
            [self reloadDetailBook];
        });
    }];
}

-(void)reloadBook {
    self.titleLabel.text = self.book.title;
    self.subtitleLabel.text = self.book.subtitle;
    
    self.priceLabel.text = self.book.price;
    self.isbn13Label.text = [NSString stringWithFormat:@"%@", self.book.isbn13];
    self.pagesLabel.text = @"loading...";
    
    self.descriptionLabel.text = @"loading...";
    [self.linkButton setTitle:@"loading..." forState:UIControlStateNormal];
    
    self.yearLabel.text = @"loading...";
    self.publisherLabel.text = @"loading...";
    self.authorsLabel.text = @"loading...";
    self.languageLabel.text = @"loading...";
    self.isbn10Label.text = @"loading...";
    self.ratingLabel.text = @"loading...";
}

-(void)reloadDetailBook {
    if (!self.bookDetail) return;
    
    self.titleLabel.text = self.bookDetail.title;
    self.subtitleLabel.text = self.bookDetail.subtitle;
    
    self.priceLabel.text = self.bookDetail.price;
    self.isbn13Label.text = self.bookDetail.isbn13;
    self.pagesLabel.text = self.bookDetail.pages;
    
    self.descriptionLabel.text = self.bookDetail.desc;
    [self.linkButton setTitle:self.bookDetail.url forState:UIControlStateNormal];
    
    self.yearLabel.text = self.bookDetail.year;
    self.publisherLabel.text = self.bookDetail.publisher;
    self.authorsLabel.text = self.bookDetail.authors;
    self.languageLabel.text = self.bookDetail.language;
    self.isbn10Label.text = self.bookDetail.isbn10;
    self.ratingLabel.text = self.bookDetail.rating;
}

- (IBAction)tapLink:(id)sender {
    // self.bookDetail.url
    NSURL *url = [NSURL URLWithString:self.bookDetail.url];
    SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url configuration:NO];
    // safariVC.delegate = self;
    [self.navigationController presentViewController:safariVC animated:YES completion:nil];
}

@end
