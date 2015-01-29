//
//  VOSSelectionModel.h
//  FBM
//
//  Created by Vicente Oliva de la Serna on 27/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import Foundation;

@interface VOSSelectionModel : NSObject

@property (strong) NSDictionary * selections;

-(NSArray *) categories;
-(NSString *) categoryAtIndex: (NSInteger) anIndex;
-(NSArray *) groupsAtIndex: (NSInteger) aCategoryIndex;
-(NSString *) groupAtIndex: (NSInteger) aGroupIndex inCategoryAtIndex: (NSInteger) aCategoryIndex;
-(NSDictionary *) teamsInAGroup: (NSInteger) groupIndex aCategoryIndex: (NSInteger) aCategoryIndex;

@end
