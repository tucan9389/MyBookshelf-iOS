//
//  NewBookTableViewCell.m
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 24/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import "NewBookTableViewCell.h"
#import "BookModel.h"

@implementation NewBookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setBook: (BookModel *)book {
    self.titleLabel.text = book.title;
    self.subtitleLabel.text = book.subtitle;
    self.priceLabel.text = book.price;
    // self.image = book.image
}

@end
