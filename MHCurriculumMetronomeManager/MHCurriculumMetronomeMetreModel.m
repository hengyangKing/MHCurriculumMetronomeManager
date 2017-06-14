//
//  MHCurriculumMetronomeMetreModel.m
//  MHCurriculumMetronomeManager
//
//  Created by J on 2017/6/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHCurriculumMetronomeMetreModel.h"

@implementation MHCurriculumMetronomeMetreModel


+(MHCurriculumMetronomeMetreModel *)defaultMetre
{
    return [MHCurriculumMetronomeMetreModel createMetreWithBeat:quarterNote andNoteKind:quarterNote];
}

+(MHCurriculumMetronomeMetreModel *)createMetreWithBeat:(NSInteger)beat andNoteKind:(MHNoteKind )noteKind
{
    MHCurriculumMetronomeMetreModel *model=[[MHCurriculumMetronomeMetreModel alloc]init];
    
    model.noteKind=noteKind;
    model.beat=beat;
    return model;
}

-(void)setNoteKind:(MHNoteKind)noteKind
{
    if (noteKind>sixteenthNotes) {
        _noteKind=sixteenthNotes;
    }else if (noteKind<wholeNote)
    {
        _noteKind=wholeNote;
    }else{
        _noteKind=noteKind;
    }
}
#pragma mark achieve setfun by self
-(void)setBeat:(NSInteger)beat
{
    if (beat) {
        _beat=(beat>_noteKind)?_noteKind:beat;
    }else{
        _beat=wholeNote;
    }
}


@end
