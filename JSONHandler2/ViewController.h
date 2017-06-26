//
//  ViewController.h
//  JSONHandler2
//
//  Created by Caio Sanchez Christino on 26/06/17.
//  Copyright © 2017 Caio Sanchez Christino. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) NSMutableArray *data;
@property (weak, nonatomic) IBOutlet UITableView *tableResult;

@end

