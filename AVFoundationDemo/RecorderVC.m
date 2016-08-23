//
//  RecorderVC.m
//  AVFoundationDemo
//
//  Created by MengLong Wu on 16/8/23.
//  Copyright © 2016年 MengLong Wu. All rights reserved.
//

#import "RecorderVC.h"
#import <AVFoundation/AVFoundation.h>
@interface RecorderVC ()
@property (nonatomic,strong) AVAudioRecorder *recorder;
@end

@implementation RecorderVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

//懒加载
-(AVAudioRecorder *)recorder{
    if (_recorder == nil) {
        //1.创建沙盒路径
        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        //2.拼接音频文件
        NSString *filePath = [path stringByAppendingPathComponent:@"123.caf"];
        //3.转换成url  file://
        NSURL *url = [NSURL fileURLWithPath:filePath];
        //4.设置录音的参数
        NSDictionary *settings = @{
                                   /**录音的质量，一般给LOW就可以了
                                    typedef NS_ENUM(NSInteger, AVAudioQuality) {
                                    AVAudioQualityMin    = 0,
                                    AVAudioQualityLow    = 0x20,
                                    AVAudioQualityMedium = 0x40,
                                    AVAudioQualityHigh   = 0x60,
                                    AVAudioQualityMax    = 0x7F
                                    };*/
                                   AVEncoderAudioQualityKey : [NSNumber numberWithInteger:AVAudioQualityLow],
                                   AVEncoderBitRateKey : [NSNumber numberWithInteger:16],
                                   AVSampleRateKey : [NSNumber numberWithFloat:8000],
                                   AVNumberOfChannelsKey : [NSNumber numberWithInteger:2]
                                   };
        NSLog(@"%@",url);
        //第一个参数就是你要把录音保存到哪的url
        //第二个参数是一些录音的参数
        //第三个参数是错误信息
        self.recorder = [[AVAudioRecorder alloc]initWithURL:url settings:settings error:nil];
    }
    return _recorder;
}
//开始录音
- (IBAction)start:(id)sender {
    [self.recorder record];
}
//停止录音
- (IBAction)stop:(id)sender {
    [self.recorder stop];
}
@end
