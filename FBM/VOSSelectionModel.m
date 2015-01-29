//
//  VOSSelectionModel.m
//  FBM
//
//  Created by Vicente Oliva de la Serna on 27/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSSelectionModel.h"

@implementation VOSSelectionModel

#pragma mark - Init
-(id)init{
    if( self = [super init]){
        
        NSURL * urlToFile = [[NSBundle mainBundle] URLForResource:@"categoriasfbm"
                                                    withExtension:@"txt"];
        
        self.selections = [NSDictionary dictionaryWithContentsOfURL:urlToFile];

    }
    return self;
}

#pragma mark - Utils
-(NSArray *) categories{
    return [[self.selections allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
}

-(NSString *) categoryAtIndex: (NSInteger) anIndex{
    return [[self categories ] objectAtIndex:anIndex];
}

-(NSArray *) groupsAtIndex: (NSInteger) aCategoryIndex{
    NSDictionary * groupsDict = [[self selections] objectForKey:[self categoryAtIndex:aCategoryIndex]];
    NSArray * groupsArray = [[groupsDict allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
    return groupsArray;
    
}

// return the name of the group in aCategoryIndex and aGroupIndex
-(NSString *) groupAtIndex: (NSInteger) aGroupIndex inCategoryAtIndex: (NSInteger) aCategoryIndex{
    return [[self groupsAtIndex:aCategoryIndex] objectAtIndex:aGroupIndex];
}

-(NSDictionary *) teamsInAGroup: (NSInteger) groupIndex aCategoryIndex: (NSInteger) aCategoryIndex{
    
    NSString * catGroup = [self categoryAtIndex:aCategoryIndex];
    NSString * titleNewTable = [self groupAtIndex:groupIndex inCategoryAtIndex:aCategoryIndex];
    NSDictionary * groupsDict = [[self selections] objectForKey:catGroup];
    NSDictionary * teamsDictionary = @{ titleNewTable : [groupsDict objectForKey:[self groupAtIndex:groupIndex inCategoryAtIndex:aCategoryIndex]]  };
    
    return teamsDictionary;
}

@end
