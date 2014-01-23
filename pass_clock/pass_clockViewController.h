//
//  pass_clockViewController.h
//  pass_clock
//
//  Created by 八幡　尚明 on 13/12/19.
//  Copyright (c) 2013年 Univercity of kitakyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface pass_clockViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timelabel;
@property (weak, nonatomic) IBOutlet UILabel *daylabel;

- (IBAction)music:(id)sender;

@end
