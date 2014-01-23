//
//  pass_clockViewController.m
//  pass_clock
//
//  Created by 八幡　尚明 on 13/12/19.
//  Copyright (c) 2013年 Univercity of kitakyu. All rights reserved.
//

#import "pass_clockViewController.h"



@interface pass_clockViewController (){
    int hourtime,minutestime,secondtime;
@public AVAudioPlayer *audio;
}
@end

@implementation pass_clockViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDate *now = [NSDate date];
    NSDateFormatter *timeformatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *dayformatter = [[NSDateFormatter alloc] init];
    [timeformatter setDateFormat:@"HH:mm:ss"];
    [dayformatter setDateFormat:@"yyyy/MM/dd"];
    NSString *nowtimes = [timeformatter stringFromDate:now];
    NSString *nowdays = [dayformatter stringFromDate:now];
    self.timelabel.text = nowtimes;
    self.daylabel.text= nowdays;

    
    [NSTimer scheduledTimerWithTimeInterval:1.0
                                     target:self selector:@selector(driveClock:) userInfo:nil repeats:YES];
	// Do any additional setup after loading the view, typically from a nib.
    }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)driveClock:(NSTimer *)timer{
    NSDate *now = [NSDate date];
    NSCalendar *today = [NSCalendar currentCalendar];
    unsigned flags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit|NSSecondCalendarUnit;
    NSDateComponents *nowComponents = [today components:flags fromDate:now];
    int hour = [nowComponents hour];
    int min = [nowComponents minute];
    int sec = [nowComponents second];
    int year = [nowComponents year];
    int day = [nowComponents day];
    int month = [nowComponents month];
    
    self.timelabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d",hour,min,sec];
    self.daylabel.text = [NSString stringWithFormat:@"%02d/%02d/%02d",year,month,day];
    if (hour==9) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"bom" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:path];
        audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        audio.volume = 0.1;
        audio.numberOfLoops = 1;
        [audio prepareToPlay];
        [audio play];
    }
    if (hour==12) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"morning" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:path];
        audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        audio.volume = 0.1;
        audio.numberOfLoops = 1;
        [audio prepareToPlay];
        [audio play];
    }
    if (hour==19) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"afternoon" ofType:@"mp3"];
        NSURL *url = [NSURL fileURLWithPath:path];
        audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
        audio.volume = 0.1;
        audio.numberOfLoops = 1;
        [audio prepareToPlay];
        [audio play];
    }}


- (IBAction)music:(id)sender {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"se_piano1_g_chord" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:path];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    audio.volume = 0.1;
    audio.numberOfLoops = 1;
    [audio prepareToPlay];
    [audio play];
}
@end










