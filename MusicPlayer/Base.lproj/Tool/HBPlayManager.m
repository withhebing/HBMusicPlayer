//
//  HBMusicManager.m
//  MusicPlayer
//
//  Created by Beans on 16/7/19.
//  Copyright © 2016年 iceWorks. All rights reserved.
//

#import "HBPlayManager.h"

@interface HBPlayManager ()<AVAudioPlayerDelegate>

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;
@property (nonatomic, copy) NSString *fileName;
// block属性
@property (nonatomic, copy) void(^completed)();

@end

@implementation HBPlayManager

static HBPlayManager *_playManager;
+ (instancetype)sharedPlayManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _playManager = [[self alloc] init];
    });
    return _playManager;
}

- (void)playMusicWithFileName:(NSString *)fileName completed:(void (^)())completed {

    if (![self.fileName isEqualToString:fileName]) {    // 解决暂停后播放从头开始的bug
        // 创建播放器
        NSURL *fileURL = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
        self.audioPlayer.delegate = self;
        [self.audioPlayer prepareToPlay];

        self.fileName = fileName;
        self.completed = completed;
    }
    // 播放
    [self.audioPlayer play];
}

- (void)pause {
    [self.audioPlayer pause];
}

#pragma mark - AVAudioPlayerDelegate

// This method is NOT called if the player is stopped due to an interruption.
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    if (flag) {
        self.completed();       // 或[self completed](), 推荐self.completed(), 因为方括号的容易写错
    }
}

#pragma mark - setter & getter

- (NSTimeInterval)currentTime {
    return self.audioPlayer.currentTime;
}

// 手动拖进度条后赋值给AVAudioPlayer的currentTime属性
- (void)setCurrentTime:(NSTimeInterval)currentTime {
    self.audioPlayer.currentTime = currentTime;       // 用@property声明的成员属性,相当于自动生成了setter和getter方法. 重写了set和get方法,与@property声明的成员属性就不是一个成员属性了,是另外一个实例变量,而这个实例变量(_currentTime)需要手动声明. // 此处为重新声明_currentTime, 写为self.audioPlayer.currentTime
}

- (NSTimeInterval)duration {
    return self.audioPlayer.duration;
}

@end
