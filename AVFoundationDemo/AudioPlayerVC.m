//
//  AudioPlayerVC.m
//  AVFoundationDemo
//
//  Created by MengLong Wu on 16/8/23.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "AudioPlayerVC.h"
#import <AVFoundation/AVFoundation.h>
@interface AudioPlayerVC ()

@property (nonatomic,strong)AVAudioPlayer *player;
@end

@implementation AudioPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(AVAudioPlayer *)player{
    if (_player == nil) {
        //1.音乐资源
        NSURL *url = [[NSBundle mainBundle]URLForResource:@"天空之城.mp3" withExtension:nil];
        //2.创建AVAudioPlayer对象
        _player = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:nil];
        //3.准备播放（缓冲，提高播放的流畅性）
        [_player prepareToPlay];
    }
    return _player;
}
//播放（异步播放）
- (IBAction)play {
    [self.player play];
}
//暂停音乐，暂停后再开始从暂停的地方开始
- (IBAction)pause {
    [self.player pause];
}
//停止音乐，停止后再开始从头开始
- (IBAction)stop {
    [self.player stop];
    //这里要置空
    self.player = nil;
}
@end
