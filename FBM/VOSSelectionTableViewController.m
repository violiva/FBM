//
//  VOSSelectionTableViewController.m
//  FBM
//
//  Created by Vicente Oliva de la Serna on 27/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSSelectionTableViewController.h"
#import "VOSSelectionModel.h"

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
    return [[self.model groups] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self.model selectionsAtIndex:section] count];
}


-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    // Mostramos cabecera de la sección del grupo
    return [self.model groupAtIndex:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"Cell";
 
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
 
    if ( cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
 
    // Configure the cell...
    cell.textLabel.text = [self.model selectionAtIndex:indexPath.row inGroupAtIndex:indexPath.section];
 
 return cell;
}

@end
