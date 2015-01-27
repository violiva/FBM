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

-(NSArray *) groups;
-(NSString *) groupAtIndex: (NSInteger) aGroupIndex;
-(NSString *) selectionAtIndex:(NSInteger) aSelectionIndex inGroupAtIndex:(NSInteger) aGroupIndex;
-(NSArray *) selectionsAtIndex:(NSInteger) aGroupIndex;

@end
