//
//  MHCurriculumMetronomeMetreModel.h
//  MHCurriculumMetronomeManager
//
//  Created by J on 2017/6/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum : NSUInteger {
    wholeNote = 1,
    halfNote = 2,
    quarterNote = 4,
    eighthNote = 8,
    sixteenthNotes = 16,
} MHNoteKind;

@interface MHCurriculumMetronomeMetreModel : NSObject

+(MHCurriculumMetronomeMetreModel *)defaultMetre;

+(MHCurriculumMetronomeMetreModel *)createMetreWithNoteKind:(MHNoteKind )noteKind andBeat:(NSInteger)beat;

-(MHNoteKind)NoteKind;
-(NSInteger)Beat;

@end
