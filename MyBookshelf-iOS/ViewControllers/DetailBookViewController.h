//
//  DetailBookViewController.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 26/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"

NS_ASSUME_NONNULL_BEGIN

@class BookDetailModel;
@interface DetailBookViewController : UIViewController

@property (nonatomic, strong) BookModel *book;
@property (nonatomic, strong) BookDetailModel *bookDetail;

@end

NS_ASSUME_NONNULL_END
