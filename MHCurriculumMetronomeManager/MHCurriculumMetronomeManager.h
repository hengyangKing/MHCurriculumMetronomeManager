//
//  MHCurriculumMetronomeManager.h
//  MHCurriculumMetronomeManager
//
//  Created by J on 2017/6/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHCurriculumMetronomeModel.h"


@interface MHCurriculumMetronomeManager : NSObject

+(MHCurriculumMetronomeManager *)createCurriculumMetronomeManagerWithAccentUrl:(NSURL *)accentUrl andLightUrl:(NSURL *)lightUrl;


-(void)setMetronomeModel:(MHCurriculumMetronomeModel *(^)(MHCurriculumMetronomeModel *model))metronomeModel;

@property(nonatomic,assign,getter=isMetronomeOn)BOOL metronomeOn;
-(void)start;
-(void)stop;
@end
