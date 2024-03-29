//
//  HBMusicModel.h
//  MusicPlayer
//
//  Created by Beans on 16/7/18.
//  Copyright © 2016年 iceWorks. All rights reserved.
//

#import <Foundation/Foundation.h>

// 歌曲类型
typedef enum {
    HBMusicTypeLocal,
    HBMusicTypeRemote
}HBMusicType;

@interface HBMusicModel : NSObject

/// 歌手图片
@property (nonatomic, copy) NSString *image;
/// 歌词
@property (nonatomic, copy) NSString *lrc;
/// 歌曲名.mp3
@property (nonatomic, copy) NSString *mp3;
/// 歌曲名
@property (nonatomic, copy) NSString *name;
/// 歌手名
@property (nonatomic, copy) NSString *singer;
/// 专辑名称
@property (nonatomic, copy) NSString *album;

@end
