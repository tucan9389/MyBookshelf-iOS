//
//  NewBookTableViewCell.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 24/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "NewBookTableViewCell.h"
#import "BookModel.h"
#import "UIImageView+Cache.h"

@implementation NewBookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBook: (id<BookModelProtocol>)book {
    self.titleLabel.text = book.title;
    self.subtitleLabel.text = book.subtitle;
    self.isbn13Label.text = [NSString stringWithFormat:@"%@", book.isbn13];
    self.priceLabel.text = book.price;
    self.urlLabel.text = book.url;
    // self.image = book.image
    NSURL *imageURL = [NSURL URLWithString:book.imageURL];
    if (imageURL) {
        [self.leftImageView loadImageWithURL:imageURL];
    }
}

@end
