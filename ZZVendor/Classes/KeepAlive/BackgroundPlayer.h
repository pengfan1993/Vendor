//
//  BackgroundPlayer.h
//  BLEMi
//
//  Created by zack on 2020/2/2.
//  Copyright © 2020 www.techshino.com. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface BackgroundPlayer : NSObject <AVAudioPlayerDelegate>
{
    AVAudioPlayer* _player;
}
- (void)startPlayer;

- (void)stopPlayer;
@end

 
