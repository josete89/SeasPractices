//
//  SmilerFace.h
//  SecondUnit
//
//  Created by Jose Luis Alcala Ramos on 09/07/14.
//  Copyright (c) 2014 Seas. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum SmileType:NSInteger{
    HappyFace = 1 ,
    SeriousFace = 0,
    SadFace = -1
} SmileType;
@interface SmilerFace : UIView

@property float smile;

@end
