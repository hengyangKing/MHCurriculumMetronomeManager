//
//  MHCurriculumMetronomeManager.m
//  MHCurriculumMetronomeManager
//
//  Created by J on 2017/6/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHCurriculumMetronomeManager.h"

#import <AVFoundation/AVFoundation.h>
@interface MHCurriculumMetronomeManager ()
{
    NSTimer *_metronomeTimer;
    NSInteger _count;
}
@property(nonatomic,assign,getter=isMetronomeOn)BOOL metronomeOn;
@property(nonatomic,strong)MHCurriculumMetronomeModel *model;
@property (strong, nonatomic) AVAudioPlayer *accentPlayer;
@property (strong, nonatomic) AVAudioPlayer *soundPlayer;
@property(nonatomic,strong)NSURL *accentURL;
@property(nonatomic,strong)NSURL *lightURL;
@end
@implementation MHCurriculumMetronomeManager
dispatch_source_t _timer ;
- (void)dealloc {
    [self stop];
    _accentPlayer = nil;
    _soundPlayer = nil;
    _metronomeTimer=nil;
}
+(MHCurriculumMetronomeManager *)createCurriculumMetronomeManagerWithAccentUrl:(NSURL *)accentUrl andLightUrl:(NSURL *)lightUrl
{
    MHCurriculumMetronomeManager *manager=[[MHCurriculumMetronomeManager alloc]init];
    manager.lightURL=lightUrl;
    manager.accentURL=accentUrl?accentUrl:lightUrl;
    [manager.accentPlayer prepareToPlay];
    [manager.soundPlayer prepareToPlay];
    manager.metronomeOn=NO;
    return manager;
}

-(void)setMetronomeModel:(MHCurriculumMetronomeModel *(^)(MHCurriculumMetronomeModel *model))metronomeModel
{
    if (metronomeModel) {
        metronomeModel(self.model);
    }
}
-(void)start
{
    self.metronomeOn = true;
    NSTimeInterval metronomeTimeInterval=((240.0/(double)self.model.NoteKind))/(double)self.model.BPM;
    _metronomeTimer = [NSTimer scheduledTimerWithTimeInterval:metronomeTimeInterval target:self selector:@selector(playMetronomeSound) userInfo:nil repeats:true];
    [_metronomeTimer fire];
}
-(void)playMetronomeSound
{
    
    _count += 1;
    if (_count == 1) {
        [self.accentPlayer play];
        if (self.metronomeBlock) {
            self.metronomeBlock(YES);
        }
        
    } else {
        [self.soundPlayer play];
        if (self.metronomeBlock) {
            self.metronomeBlock(NO);
        }
        if (_count == self.model.Beat) {
            _count = 0;
        }
    }
}
- (void)stop {
    self.metronomeOn = false;
    [_metronomeTimer invalidate];
    [self.accentPlayer stop];
    [self.soundPlayer stop];
    _count=0;
}
-(void)pause
{
    [self.accentPlayer pause];
    [self.soundPlayer pause];
}

-(void)soundOff
{
    self.accentPlayer.volume=0;
    self.soundPlayer.volume=0;
}
-(void)soundOn
{
    self.accentPlayer.volume=1.0;
    self.soundPlayer.volume=1.0;
}
#pragma mark setter getter
-(MHCurriculumMetronomeModel *)model
{
    if (!_model) {
        _model=[MHCurriculumMetronomeModel defaultModel];
    }
    return _model;
}
-(AVAudioPlayer *)accentPlayer
{
    if (!_accentPlayer) {
        _accentPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.accentURL error:nil];
    }
    return _accentPlayer;
}

-(AVAudioPlayer *)soundPlayer
{
    if (!_soundPlayer) {
        _soundPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.lightURL error:nil];
    }
    return _soundPlayer;
}

@end
