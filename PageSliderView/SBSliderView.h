//
//  SBSliderView.h
//  ABC360
//
//  Created by LIXIAOJING on 2/17/16.
//  Copyright © 2016 abc360.com. All rights reserved.
//

#import <UIKit/UIKit.h>



@protocol SBSliderViewDelegate <NSObject>

-(void)sliderViewEndAtIndex:(NSInteger)_index;

@end

@interface SBSliderView : UIScrollView

@property (weak,nonatomic) id<SBSliderViewDelegate> sliderViewDelegate;

-(id)initWithFrame:(CGRect)frame;
-(void)initCells;

@end
