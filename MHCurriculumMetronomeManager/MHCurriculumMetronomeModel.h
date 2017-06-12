//
//  MHCurriculumMetronomeModel.h
//  MHCurriculumMetronomeManager
//
//  Created by J on 2017/6/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MHCurriculumMetronomeMetreModel.h"

@interface MHCurriculumMetronomeModel : NSObject

+(MHCurriculumMetronomeModel *)defaultModel;

@property(nonatomic,copy,readonly)MHCurriculumMetronomeModel *(^metronomeMetre)(MHCurriculumMetronomeMetreModel *metre);

//bpm
@property(nonatomic,copy,readonly)MHCurriculumMetronomeModel *(^metronomeBPM)(NSInteger bpm);

-(NSInteger)BPM;
-(NSInteger)NoteKind;
-(NSInteger)Beat;

@end
