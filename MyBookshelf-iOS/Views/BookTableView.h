//
//  BookTableView.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 27/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookModel.h"

NS_ASSUME_NONNULL_BEGIN

@protocol DetailBookDelegate;
@interface BookTableView : UITableView <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak, nullable) id <DetailBookDelegate> detailBookDelegate;
@property (atomic, strong) NSArray *books;

@end

NS_ASSUME_NONNULL_END

@protocol DetailBookDelegate <NSObject>
-(void)segueWithBook: (id<BookModelProtocol> _Nullable)book;
@end
