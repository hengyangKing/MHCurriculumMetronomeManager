//
//  MHCurriculumMetronomeManager.h
//  MHCurriculumMetronomeManager
//
//  Created by J on 2017/6/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHCurriculumMetronomeModel.h"
typedef void(^MHCurriculumMetronomeManagerBlock)(BOOL isAccent);

@interface MHCurriculumMetronomeManager : NSObject

+(MHCurriculumMetronomeManager *)createCurriculumMetronomeManagerWithAccentUrl:(NSURL *)accentUrl andLightUrl:(NSURL *)lightUrl;


-(void)setMetronomeModel:(MHCurriculumMetronomeModel *(^)(MHCurriculumMetronomeModel *model))metronomeModel;

@property(nonatomic,copy)MHCurriculumMetronomeManagerBlock metronomeBlock;

-(void)start;

-(void)stop;

-(void)pause;

-(void)soundOff;

-(void)soundOn;

@end
