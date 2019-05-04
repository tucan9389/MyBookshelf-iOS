//
//  BookTableView.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 27/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "BookTableView.h"
#import "NewBookTableViewCell.h"
#import "BookModel.h"

@interface BookTableView ()

@end


@implementation BookTableView

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
    }
    return self;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewBookTableViewCell"];
    if (cell) {
        NewBookTableViewCell *bookCell = (NewBookTableViewCell *)cell;
        [bookCell setBook:self.books[[indexPath row]]];
    } else {
        cell = [[UITableViewCell alloc] init];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.books ? self.books.count : 0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"select - %ld", indexPath.row);
    if (self.detailBookDelegate) {
        [self.detailBookDelegate segueWithBook:self.books[indexPath.row]];
    }
}

@end
