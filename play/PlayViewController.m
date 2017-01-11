//
//  PlayViewController.m
//  play
//
//  Created by 刘明远 on 17/1/11.
//  Copyright © 2017年 张晗. All rights reserved.
//

#import "PlayViewController.h"
#import <PLPlayer.h>

@interface PlayViewController ()

<PLPlayerDelegate>
{
    PLPlayer *plPlayer;
    CMTime time;
    PLPlayerOption *option;
}

@end

@implementation PlayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
    [self setplayone:self.urlStr];
    
    [self setUI];
    
    NSLog(@"main --->  %@ \n,",[NSThread currentThread]);
}

-(void)setplayone:(NSString *)urlStr {
    option = [PLPlayerOption defaultOption];
    
    // 更改需要修改的 option 属性键所对应的值
    [option setOptionValue:@15 forKey:PLPlayerOptionKeyTimeoutIntervalForMediaPackets];
    [option setOptionValue:@2000 forKey:PLPlayerOptionKeyMaxL1BufferDuration];
    [option setOptionValue:@1000 forKey:PLPlayerOptionKeyMaxL2BufferDuration];
    //YES 表示使用 ffmpeg ，NO 表示使用 AVPlayer。默认为 NO。
    [option setOptionValue:@(YES) forKey:PLPlayerOptionKeyVODFFmpegEnable];
    
    //ffplay 硬解 avplay 软解 ，seek 在硬解的模式下有效（已经测试）
    //backgound 软解有效 点击home 会 pause
    [option setOptionValue:@(YES) forKey:PLPlayerOptionKeyVideoToolbox];
    [option setOptionValue:@(kPLLogNone) forKey:PLPlayerOptionKeyLogLevel];
    //http://hls3.douyucdn.cn/live/461944ry9llGuJXY/playlist.m3u8?wsSecret=47d9dc3fbee6626ee3ce8131e57ab8f4&wsTime=1482741325
    //http://hls3.douyucdn.cn/live/461410rwwVGPWTdh/playlist.m3u8?wsSecret=d8182bf2c4773678597dca989fa90a2a&wsTime=1484117128
    //http://hls3.douyucdn.cn/live/461410rGsk0oWZpV/playlist.m3u8?wsSecret=98c04156d23905f5d746f907b8870045&wsTime=1484115926
    //http://hls3a.douyucdn.cn/live/461944raWxYmgdvY/playlist.m3u8?wsSecret=0ce4db32e5f6346bfdafe8bbe8bb5b0f&wsTime=1484117429&ct=cpn-wallstreetcn
    NSURL *url = [NSURL URLWithString:urlStr];
    
//    plPlayer.playerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width * 9 /16);
    plPlayer = [PLPlayer playerWithURL:url option:option];
    plPlayer.delegate = self;
    
    plPlayer.playerView.contentMode = UIViewContentModeScaleAspectFit;
    
}

-(void)player:(PLPlayer *)player statusDidChange:(PLPlayerStatus)state{
    if (state == PLPlayerStatusPlaying) {
        
        NSLog(@"playing \n");
        
    }else if (state == PLPlayerStatusCaching){
        
        NSLog(@"caching \n");
        CMTimeShow(player.currentTime);
    }else if (state == PLPlayerStatusPaused){
        time = player.currentTime;
        NSLog(@"Paused \n");
        CMTimeShow(player.currentTime);
    }else if (state == PLPlayerStatusStopped){
        time = player.currentTime;
        NSLog(@"stopped \n");
        CMTimeShow(player.currentTime);
    }else{
        NSLog(@"other \n");
        CMTimeShow(player.currentTime);
    }
    
}

-(void)setUI {
    UIButton *playBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.bounds.size.width - 120 -100) /2, self.view.bounds.size.width * 9 /16 +100, 80, 60)];
    [playBtn setTitle:@"start" forState:UIControlStateNormal];
    playBtn.backgroundColor = [UIColor orangeColor];
    [playBtn addTarget:self
                     action:@selector(playBtnAction)
      forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *stopBtn = [[UIButton alloc]initWithFrame:CGRectMake((self.view.bounds.size.width - 120 -100) /2 + 60 +100 , self.view.bounds.size.width * 9 /16 + 100 , 80, 60)];
    [stopBtn setTitle:@"stop"
              forState:UIControlStateNormal];
    stopBtn.backgroundColor = [UIColor orangeColor];
    [stopBtn addTarget:self
                      action:@selector(stopBtnAction)
        forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:playBtn];
    [self.view addSubview:stopBtn];
    
}
-(void)playBtnAction {
    [plPlayer.playerView setFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.width * 9 /16)];
    [self.view addSubview:plPlayer.playerView];
    [plPlayer play];
    
}
-(void)stopBtnAction {
    [plPlayer.playerView removeFromSuperview];
    [plPlayer stop];
}

- (void)viewDidDisappear:(BOOL)animated {
    [plPlayer stop];
}

@end
