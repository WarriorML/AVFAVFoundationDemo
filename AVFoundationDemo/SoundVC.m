//
//  SoundVC.m
//  AVFoundationDemo
//
//  Created by MengLong Wu on 16/8/23.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "SoundVC.h"
#import <AVFoundation/AVFoundation.h>
@interface SoundVC ()
@property (nonatomic,assign)SystemSoundID soundID;
@end

@implementation SoundVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(SystemSoundID)soundID{
    if (_soundID == 0) {
        //生成soundID
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle]URLForResource:@"2.wav" withExtension:nil];
        AudioServicesCreateSystemSoundID(url, &_soundID);
    }
    return _soundID;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //播放音效
    AudioServicesPlaySystemSound(self.soundID);//不带震动效果
    //AudioServicesPlayAlertSound(<#SystemSoundID inSystemSoundID#>)//带震动效果
}

@end
