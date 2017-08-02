//
//  ViewController.m
//  MHCurriculumMetronomeManager
//
//  Created by J on 2017/6/12.
//  Copyright © 2017年 J. All rights reserved.
//

#import "ViewController.h"
#import "MHCurriculumMetronomeManager.h"

@interface ViewController ()
@property(nonatomic,strong)MHCurriculumMetronomeManager *manager;

@end

@implementation ViewController

-(MHCurriculumMetronomeManager *)manager
{
    if (!_manager) {
        NSURL *accentUrl = [NSURL fileURLWithPath:[[NSBundle bundleForClass:[self class]]pathForResource:@"accent" ofType:@"caf"]];
        NSURL *lightUrl = [NSURL fileURLWithPath:[[NSBundle bundleForClass:[self class]]pathForResource:@"light" ofType:@"caf"]];
        _manager=[MHCurriculumMetronomeManager createCurriculumMetronomeManagerWithAccentUrl:accentUrl andLightUrl:lightUrl];
    }
    return _manager;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.manager setMetronomeModel:^MHCurriculumMetronomeModel *(MHCurriculumMetronomeModel *model) {
        
       model.metronomeMetre([MHCurriculumMetronomeMetreModel createMetreWithBeat:4 andNoteKind:(quarterNote)]).metronomeBPM(80);
       return model;
    }];
}

- (IBAction)start:(id)sender {
    
    [self.manager start];
    
}
- (IBAction)stop:(id)sender {

    [self.manager stop];
}
- (IBAction)pause:(UIButton *)sender {
    [self.manager pause];
}

@end
