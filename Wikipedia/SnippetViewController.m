//
//  SnippetViewController.m
//  Wikipedia
//
//  Created by Brian Lewis on 5/16/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import "SnippetViewController.h"
#import "ArticleViewController.h"

@interface SnippetViewController ()
{
    __weak IBOutlet UIWebView *snippetWebView;    
}
@end

@implementation SnippetViewController

@synthesize articleDictionary;

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
    
    self.title = [articleDictionary objectForKey:@"title"];
    
    [snippetWebView loadHTMLString:[articleDictionary objectForKey:@"snippet"] baseURL:nil];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToArticle:(id)sender {
    
    [self performSegueWithIdentifier:@"articleSegue" sender:sender];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    ((ArticleViewController*)segue.destinationViewController).articleDictionary = articleDictionary;    
}
@end
