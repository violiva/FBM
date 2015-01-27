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
-(NSArray *) groups{
    return [[self.selections allKeys] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    
}

-(NSString *) groupAtIndex: (NSInteger) aGroupIndex{
    return [[self groups ] objectAtIndex:aGroupIndex];
}

-(NSString *) selectionAtIndex:(NSInteger) aSelectionIndex inGroupAtIndex:(NSInteger) aGroupIndex{

    NSArray * selections = [[self selectionsAtIndex:aGroupIndex] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];

    return [selections objectAtIndex:aSelectionIndex];
}

-(NSArray *) selectionsAtIndex:(NSInteger) aGroupIndex{
    NSString * group = [[self groups ] objectAtIndex:aGroupIndex];
    return [[self.selections objectForKey:group] sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
}


@end
