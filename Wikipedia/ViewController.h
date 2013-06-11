//
//  ViewController.h
//  Wikipedia
//
//  Created by Brian Lewis on 5/16/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) IBOutlet UITextField *textField;
@property(strong, nonatomic) IBOutlet UITableView *resultsTableView;


- (IBAction)performSearch:(id)sender;

@end
