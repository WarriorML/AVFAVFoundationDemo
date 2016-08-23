//
//  VideoPlayerVC.m
//  AVFoundationDemo
//
//  Created by MengLong Wu on 16/8/23.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "VideoPlayerVC.h"
#import <AVFoundation/AVFoundation.h>
@interface VideoPlayerVC ()
@property(nonatomic,strong)AVPlayer *player;
@end

@implementation VideoPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //播放视频
    [self.player play];
}
-(AVPlayer *)player{
    if (_player == nil) {
        
        //播放远程视频
        NSURL *url = [NSURL URLWithString:@"http://v1.mukewang.com/a45016f4-08d6-4277-abe6-bcfd5244c201/L.mp4"];
        //加载本地视频源
        //NSURL *url = [[NSBundle mainBundle]URLForResource:@"xiaohuangren.mp4" withExtension:nil];
        
        //创建播放器
        AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
        _player = [AVPlayer playerWithPlayerItem:playerItem];
        
        //显示视频的层AVPlayerLayer
        AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
        //视频的宽高比例一般为16 : 9
        playerLayer.frame = CGRectMake(0,64, self.view.bounds.size.width, self.view.bounds.size.width * 9 / 16);
        //把playerLayer添加到控制器的层上
        [self.view.layer addSublayer:playerLayer];
    }
    return _player;
}


@end
