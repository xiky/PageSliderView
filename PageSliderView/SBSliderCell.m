//
//  SBSliderCell.m
//  SliderCell
//
//  Created by LIXIAOJING on 2/16/16.
//  Copyright © 2016 dog_47. All rights reserved.
//


#define K_CELL_WIDTH  [UIScreen mainScreen].bounds.size.width-40
#define K_CELL_HEIGHT 180

#import "SBSliderCell.h"



@interface SBSliderCell ()

@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) UILabel *labelEN;
@property (strong,nonatomic) UILabel *labelCN;

@end


@implementation SBSliderCell



+(SBSliderCell *)createCellWithTag:(NSInteger)_index{
    id obj=[[self alloc]initWithFrame:CGRectMake(0, 0, K_CELL_WIDTH, K_CELL_HEIGHT) andTat:_index];
    return obj;
}

-(id)initWithFrame:(CGRect)frame andTat:(NSInteger)_index{
    if (self=[super initWithFrame:frame]) {
        [self initSettings];
    }
    return self;
}


#pragma mark initSettings
-(void)initSettings{
    _cellHeight=K_CELL_HEIGHT;
    self.backgroundColor=[UIColor whiteColor];
    self.clipsToBounds=YES;
    self.layer.cornerRadius=5;
}



#pragma mark setUp
-(void)cellSetTitle:(NSString *)_str{
    if (_titleLabel==nil) {
        _titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 70, 20)];
        _titleLabel.center=CGPointMake(self.frame.size.width/2.0f, 30);
        _titleLabel.font= [UIFont systemFontOfSize:13];
        _titleLabel.backgroundColor=[UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1.0f];
        _titleLabel.layer.masksToBounds=YES;
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        [_titleLabel setText:_str];
        [self addSubview:_titleLabel];
    }else{
        [_titleLabel setText:_str];
    }
}

-(void)cellSetOrigin:(CGPoint)_point{
    self.frame=CGRectMake(_point.x, _point.y, self.frame.size.width, self.frame.size.height);
}


@end
