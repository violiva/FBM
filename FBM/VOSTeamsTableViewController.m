//
//  VOSTeamsTableViewController.m
//  FBM
//
//  Created by Vicente Oliva de la Serna on 27/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSTeamsTableViewController.h"

@implementation VOSTeamsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = [[[self teams] allKeys] lastObject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    NSArray * aTeams = [[self teams] objectForKey:[[[self teams] allKeys] lastObject]];

    return [aTeams count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"TeamCell";
    
    UITableViewCell * TeamCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    if ( TeamCell == nil){
        TeamCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    // Configure the cell...
    TeamCell.textLabel.text = [self teamAtIndex:indexPath.row];
    
    return TeamCell;
}

#pragma mark - Utils
-(id)teamAtIndex:(NSInteger) row{
    NSString * group = [[[self teams] allKeys] lastObject];
    NSArray * listOfTeam = [[[self teams] objectForKey:group] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    return [listOfTeam objectAtIndex:row];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
