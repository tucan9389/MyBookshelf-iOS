//
//  ViewController.h
//  MyBookshelf-iOS
//
//  Created by Doyoung Gwak on 22/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailBookDelegate;

@interface BooksViewController : UIViewController

@property (nonatomic, strong) NSString *query;

@end

