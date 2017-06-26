//
//  ViewController.m
//  JSONHandler2
//
//  Created by Caio Sanchez Christino on 26/06/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

#import "ViewController.h"
@import AFNetworking;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://jsonplaceholder.typicode.com/posts" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        if ([responseObject isKindOfClass:[NSArray class]]) {
            /* do something with NSArray */
            self.data = responseObject;
            [self.tableResult reloadData];
        }
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.data count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    Post *post = [Post withNSDictionary:[self.data objectAtIndex:indexPath.row]];
    if(post){
        cell.textLabel.text = post.title;
    }
    return cell;
}
@end
