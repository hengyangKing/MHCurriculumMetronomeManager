//
//  MHCurriculumMetronomeModel.m
//  MHCurriculumMetronomeManager
//
//  Created by J on 2017/6/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHCurriculumMetronomeModel.h"
//default
static int MetronomeBPMMinValue   = 60;
static int MetronomeBPMMaxValue   = 400;
static int MetronomeBPMDefaultValue   = 80;
@interface MHCurriculumMetronomeModel()


@end
@implementation MHCurriculumMetronomeModel

+(MHCurriculumMetronomeModel *)defaultModel
{
    MHCurriculumMetronomeModel *model=[[MHCurriculumMetronomeModel alloc]init];
    model.metronomeMetre([MHCurriculumMetronomeMetreModel defaultMetre]).metronomeBPM(MetronomeBPMDefaultValue);
    return model;
}

-(MHCurriculumMetronomeModel *(^)(NSInteger))metronomeBPM
{
    return ^(NSInteger bpm){
        if (bpm>=MetronomeBPMMaxValue) {
            self.bpm=MetronomeBPMMaxValue;
        }else if (bpm<=MetronomeBPMMinValue){
            self.bpm=MetronomeBPMMinValue;
        }else if (bpm<MetronomeBPMMaxValue&&bpm>MetronomeBPMMinValue){
            self.bpm=bpm;
        }
        return self;
    };
}

-(MHCurriculumMetronomeModel *(^)(MHCurriculumMetronomeMetreModel *))metronomeMetre
{
    return ^(MHCurriculumMetronomeMetreModel *metre) {
        self.metre=metre;
        return self;
    };
}

-(void)setBpm:(NSInteger)bpm
{
    _bpm=bpm;
}
-(void)setMetre:(MHCurriculumMetronomeMetreModel *)metre
{
    _metre=metre;
}
@end
