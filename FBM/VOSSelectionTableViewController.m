//
//  VOSSelectionTableViewController.m
//  FBM
//
//  Created by Vicente Oliva de la Serna on 27/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSSelectionTableViewController.h"
#import "VOSSelectionModel.h"
#import "VOSTeamsTableViewController.h"

@interface VOSSelectionTableViewController ()

@property (strong, nonatomic) VOSSelectionModel * model;

@end

@implementation VOSSelectionTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.model = [[VOSSelectionModel alloc ] init];
    self.title = @"Categories";
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [[self.model categories] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self.model groupsAtIndex:section] count];
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // Mostramos cabecera de la sección del grupo
    return [self.model categoryAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellId = @"Cell";
 
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
 
    if ( cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
 
    // Configure the cell...
    cell.textLabel.text = [self.model groupAtIndex:indexPath.row inCategoryAtIndex:indexPath.section];
 
 return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if ( [segue.identifier isEqualToString:@"showTeams"]){
        
        NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary * teams = [self.model teamsInAGroup:indexPath.row aCategoryIndex:indexPath.section];

        // identificamos el ViewControler al que se realizará la transición
        VOSTeamsTableViewController * teamsTabVC = segue.destinationViewController;
        
        // asignamos valores a destino
        teamsTabVC = [teamsTabVC initWithModel:teams style:UITableViewStylePlain];

    }
    
}


@end
