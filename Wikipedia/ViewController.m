//
//  ViewController.m
//  Wikipedia
//
//  Created by Brian Lewis on 5/16/13.
//  Copyright (c) 2013 Brian Lewis. All rights reserved.
//

#import "ViewController.h"
#import "SnippetViewController.h"

@interface ViewController ()
{
    
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
    
    NSArray *searchArray;
    NSDictionary *itemDictionary;
}
@end

@implementation ViewController

@synthesize textField, resultsTableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    activityIndicator.hidesWhenStopped = YES;
    self.title = @"Wikipedia";
    [textField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self performSearch:self.textField];
    return YES;
}

- (IBAction)performSearch:(id)sender {
    
    [textField resignFirstResponder];
    [activityIndicator startAnimating];
    
    NSString *text =  textField.text;
    NSString *encodedText = [text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    NSString *urlString = [NSString stringWithFormat:@"https://en.wikipedia.org/w/api.php?action=query&list=search&srsearch=%@&srprop=snippet&format=json", encodedText];
        
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:urlRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *urlResponse, NSData *data, NSError *error) {
                               
                               NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                               
                               NSDictionary *query = [responseDictionary objectForKey:@"query"];
                               searchArray = [query objectForKey:@"search"];
                               
                               [activityIndicator stopAnimating];
                               [resultsTableView reloadData];
                           }];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return searchArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    itemDictionary = searchArray[indexPath.row];
    
    cell.textLabel.text = [itemDictionary objectForKey:@"title"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{    
    [self performSegueWithIdentifier:@"snippetSegue" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(NSDictionary*)sender
{
    NSIndexPath *indexPath = [resultsTableView indexPathForSelectedRow];
    NSDictionary *selectedItem = searchArray[indexPath.row];
    
    ((SnippetViewController*)segue.destinationViewController).articleDictionary = selectedItem;
}



@end
