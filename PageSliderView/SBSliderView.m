//
//  SBSliderView.m
//  ABC360
//
//  Created by LIXIAOJING on 2/17/16.
//  Copyright © 2016 abc360.com. All rights reserved.
//


#define K_VideoView_Height 220
#define K_CELL_OFFSET 20
#define K_CELL_FIRSTOFFSET 15


#import "SBSliderView.h"
#import "SBSliderCell.h"


@interface SBSliderView ()<UIScrollViewDelegate>
@property (assign,nonatomic) NSInteger numOfCells;
@property (readonly,assign,nonatomic) NSInteger cellHeight;
@end

@implementation SBSliderView


-(id)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        [self initSettings];
    }
    return self;
}


-(void)initSettings{
    self.delegate=self;
    self.decelerationRate=0.01f;
}


#pragma initCells
-(void)initCells{
    _numOfCells=24;
    for (NSInteger i=0; i<_numOfCells; i++) {
        SBSliderCell *cell=[SBSliderCell createCellWithTag:i];
        [self addSubview:cell];
        [cell cellSetTitle:[NSString stringWithFormat:@"%ld/%ld",(long)i+1,(long)_numOfCells]];
        
        [cell cellSetOrigin:CGPointMake(0, K_CELL_FIRSTOFFSET+i*(cell.cellHeight+K_CELL_OFFSET))];
        cell.center=CGPointMake(self.frame.size.width/2.0f, cell.center.y);
        if (i==_numOfCells-1) {
            _cellHeight=cell.cellHeight;
            [self setContentSize:CGSizeMake(self.frame.size.width, cell.cellHeight+cell.frame.origin.y+K_CELL_FIRSTOFFSET)];
        }
    }
}


#pragma mark scrollviewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (!decelerate) {
        CGPoint offset = scrollView.contentOffset;
        CGFloat theY=offset.y-K_CELL_FIRSTOFFSET;
        CGFloat tmpValue=theY/(_cellHeight+K_CELL_OFFSET);
        CGFloat desY=floorf(theY/(_cellHeight+K_CELL_OFFSET));
        if (tmpValue-floorf(tmpValue)>0.5f ) {
            desY=desY+1;
        }
        NSLog(@"DidEndDragging %@  tmp:%f desY:%f",NSStringFromCGPoint(offset),tmpValue,desY);
        [self setContentOffset:CGPointMake(0, desY*(_cellHeight+K_CELL_OFFSET)) animated:YES];
        if ([_sliderViewDelegate respondsToSelector:@selector(sliderViewEndAtIndex:)]) {
            [_sliderViewDelegate sliderViewEndAtIndex:(NSInteger)(desY+1)];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    CGFloat theY=offset.y-K_CELL_FIRSTOFFSET;
    CGFloat tmpValue=theY/(_cellHeight+K_CELL_OFFSET);
    CGFloat desY=floorf(theY/(_cellHeight+K_CELL_OFFSET));
    if (tmpValue-floorf(tmpValue)>0.5f ) {
        desY=desY+1;
    }
    NSLog(@"DidEndDecelerating %@  tmp:%f desY:%f",NSStringFromCGPoint(offset),tmpValue,desY);
    [self setContentOffset:CGPointMake(0, desY*(_cellHeight+K_CELL_OFFSET)) animated:YES];
    if ([_sliderViewDelegate respondsToSelector:@selector(sliderViewEndAtIndex:)]) {
        [_sliderViewDelegate sliderViewEndAtIndex:(NSInteger)(desY+1)];
    }
}

@end
