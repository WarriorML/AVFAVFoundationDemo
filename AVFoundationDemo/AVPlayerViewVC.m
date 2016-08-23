//
//  AVPlayerViewVC.m
//  AVFoundationDemo
//
//  Created by MengLong Wu on 16/8/23.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "AVPlayerViewVC.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>
@interface AVPlayerViewVC ()
@property (nonatomic,strong)AVPlayerViewController *playerVC;
@end

@implementation AVPlayerViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //以modal的样式弹出来,只能全屏显示
    [self presentViewController:self.playerVC animated:YES completion:nil];
}

-(AVPlayerViewController *)playerVC{
    if (_playerVC == nil) {
        //视频源
        NSURL *url = [NSURL URLWithString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"];
        //
        AVPlayerItem *platerItem = [AVPlayerItem playerItemWithURL:url];
        //
        AVPlayer *player = [[AVPlayer alloc]initWithPlayerItem:platerItem];
        //创建一个视频播放的控制器
        //这个类实在AVKit框架下的
        _playerVC = [[AVPlayerViewController alloc]init];
        //设置player
        _playerVC.player = player;
    }
    return _playerVC;
}

@end
