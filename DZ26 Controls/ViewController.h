//
//  ViewController.h
//  DZ26 Controls
//
//  Created by Vasilii on 01.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)rotationControl:(UISwitch *)sender;
- (IBAction)scaleControl:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UISwitch *translationControl;
- (IBAction)speedSlider:(UISlider *)sender;
- (IBAction)selectAnotherControl:(UISegmentedControl *)sender;

@property (weak, nonatomic) IBOutlet UISegmentedControl *imageControl;


@end

