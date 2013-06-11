//
//  SnippetViewController.h
//  Wikipedia
//
//  Created by Brian Lewis on 5/16/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnippetViewController : UIViewController

@property(strong, nonatomic) NSDictionary *articleDictionary;
- (IBAction)goToArticle:(id)sender;

@end
