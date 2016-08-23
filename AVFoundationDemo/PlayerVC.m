//
//  PlayerVC.m
//  AVFoundationDemo
//
//  Created by MengLong Wu on 16/8/23.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "PlayerVC.h"
#import <AVFoundation/AVFoundation.h>
@interface PlayerVC ()
@property (nonatomic,strong)AVPlayer *player;
@end

@implementation PlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //播放音乐
    [self.player play];
}

#pragma mark - 懒加载
-(AVPlayer *)player{
    if (_player == nil) {
        
        //想要播放远程音乐，只要把url换成网络音乐就可以了
        NSURL *url = [NSURL URLWithString:@"http://cc.stream.qqmusic.qq.com/C100003j8IiV1X8Oaw.m4a?fromtag=52"];
        
        //1.本地的音乐资源
//        NSURL *url = [[NSBundle mainBundle]URLForResource:@"天空之城.mp3" withExtension:nil];
        
        //2.这种方法设置的url不可以动态的切换
        _player = [AVPlayer playerWithURL:url];
        
        //2.0创建一个playerItem，可以通过改变playerItem来进行切歌
        //AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
        //2.1这种方法可以动态的换掉url
        //_player = [AVPlayer playerWithPlayerItem:playerItem];
        
        //AVPlayerItem *nextItem = [AVPlayerItem playerItemWithURL:nil];
        //通过replaceCurrentItemWithPlayerItem：方法来换掉url，进行切歌
        //[self.player replaceCurrentItemWithPlayerItem:nextItem];
        
    }
    return _player;
}
@end
