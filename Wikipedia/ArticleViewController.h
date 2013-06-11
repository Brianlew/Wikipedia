//
//  ArticleViewController.h
//  Wikipedia
//
//  Created by Brian Lewis on 5/16/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArticleViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property(strong, nonatomic) NSDictionary *articleDictionary;

@end
