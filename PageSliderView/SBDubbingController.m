//
//  SBDubbingController.m
//  ABC360
//
//  Created by LIXIAOJING on 2/16/16.
//  Copyright © 2016 abc360.com. All rights reserved.
//


#define K_StatusBar_height [UIApplication sharedApplication].statusBarFrame.size.height
#define K_Screen_Height [UIScreen mainScreen].bounds.size.height
#define K_VideoView_Height 220
#define K_CELL_OFFSET 20
#define K_CELL_FIRSTOFFSET 15

#import "SBDubbingController.h"
#import "SBSliderCell.h"
#import "SBSliderView.h"

@interface SBDubbingController ()<UIScrollViewDelegate,SBSliderViewDelegate>

@property (strong,nonatomic) UIView *videoView;
@property (strong,nonatomic) UIView *contentView;
@property (strong,nonatomic) SBSliderView *sliderView;

@end

@implementation SBDubbingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor blackColor];

    
    [self initVideoView];
    [self initContentView];
}


#pragma mark initVideoView
-(void)initVideoView{
    _videoView=[[UIView alloc]initWithFrame:CGRectMake(0, K_StatusBar_height, self.view.frame.size.width, K_VideoView_Height)];
    _videoView.backgroundColor=[UIColor blackColor];
    [self.view addSubview:_videoView];
    

}



#pragma mark initContentView
-(void)initContentView{
    _contentView=[[UIView alloc]initWithFrame:CGRectMake(0, _videoView.frame.origin.y+_videoView.frame.size.height, self.view.frame.size.width, K_Screen_Height -K_StatusBar_height-K_VideoView_Height)];
    _contentView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:_contentView];
    
    _sliderView=[[SBSliderView alloc]initWithFrame:_contentView.bounds];
    _sliderView.backgroundColor=[UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1.0f];
    _sliderView.sliderViewDelegate=self;
    _sliderView.decelerationRate=0.01f;
    [_contentView addSubview:_sliderView];
    [_sliderView initCells];
    
}

-(void)sliderViewEndAtIndex:(NSInteger)_index{
    NSLog(@"滑动停止在%ld",_index);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
