//
//  MHCurriculumMetronomeMetreModel.m
//  MHCurriculumMetronomeManager
//
//  Created by J on 2017/6/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import "MHCurriculumMetronomeMetreModel.h"
@interface MHCurriculumMetronomeMetreModel()
@property(nonatomic,assign)MHNoteKind noteKind;

@property(nonatomic,assign)NSInteger beat;
@end
@implementation MHCurriculumMetronomeMetreModel


+(MHCurriculumMetronomeMetreModel *)defaultMetre
{
    return  [MHCurriculumMetronomeMetreModel createMetreWithNoteKind:quarterNote andBeat:quarterNote];
}

+(MHCurriculumMetronomeMetreModel *)createMetreWithNoteKind:(MHNoteKind )noteKind andBeat:(NSInteger)beat
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

-(void)setBeat:(NSInteger)beat
{
    if (beat) {
        _beat=(beat>_noteKind)?_noteKind:beat;
    }else{
        _beat=wholeNote;
    }
}
-(MHNoteKind)NoteKind
{
    return self.noteKind;
}

-(NSInteger)Beat
{
    return self.beat;
}

@end
