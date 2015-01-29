//
//  VOSTeamsTableViewController.h
//  FBM
//
//  Created by Vicente Oliva de la Serna on 27/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import UIKit;

@interface VOSTeamsTableViewController : UITableViewController

@property (strong, nonatomic) NSDictionary * teams;

-(id)initWithModel:(NSDictionary *) aTeams
             style:(UITableViewStyle) style;

@end
