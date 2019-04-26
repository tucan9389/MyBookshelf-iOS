//
//  NewBookTableViewCell.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 24/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class BookModel;
@interface NewBookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

- (void)setBook: (BookModel *)book;

@end

NS_ASSUME_NONNULL_END
