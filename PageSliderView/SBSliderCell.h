//
//  SBSliderCell.h
//  SliderCell
//
//  Created by LIXIAOJING on 2/16/16.
//  Copyright © 2016 dog_47. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SBSliderCell : UIView

@property (readonly,nonatomic) CGFloat cellHeight;

+(SBSliderCell *)createCellWithTag:(NSInteger)_index;

-(void)cellSetTitle:(NSString *)_str;
-(void)cellSetOrigin:(CGPoint)_point;

@end
