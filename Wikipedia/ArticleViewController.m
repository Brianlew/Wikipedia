//
//  ArticleViewController.m
//  Wikipedia
//
//  Created by Brian Lewis on 5/16/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import "ArticleViewController.h"

@interface ArticleViewController ()
{
    
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
}
@end

@implementation ArticleViewController

@synthesize webView, articleDictionary;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    activityIndicator.hidesWhenStopped = YES;
    NSString *title =  [articleDictionary objectForKey:@"title"];
    NSString *encodedTitle = [title stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    
    NSString *urlString = [NSString stringWithFormat:@"http://en.wikipedia.org/wiki/%@", encodedTitle];
    
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [activityIndicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [activityIndicator stopAnimating];
}

@end
