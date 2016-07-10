//
//  FirstViewController.m
//  PassDataWithUnwindSegue
//
//  Created by Michael Hoffman on 7/9/16.
//  Copyright © 2016 Strong Atomic. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UILabel *vc2StringLabel;
@property (weak, nonatomic) IBOutlet UILabel *vc2NumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *vc3StringLabel;
@property (weak, nonatomic) IBOutlet UILabel *vc3NumberLabel;

@property SecondViewController *secondVC;
@property ThirdViewController *thirdVC;

- (IBAction)vc2Tapped:(id)sender;
- (IBAction)vc3Tapped:(id)sender;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)labelArray
{
    NSArray *labels = @[self.vc2StringLabel, self.vc3StringLabel, self.vc2NumberLabel, self.vc3NumberLabel];
    return labels;
}

-(void)labelFormat
{
    for (UILabel *label in [self labelArray])
    {
        label.layer.borderColor = [UIColor blackColor].CGColor;
        label.layer.borderWidth = 2.0;
    }
}

/*
 To Unwind Segue:
 There must be an IBAction created PRIOR to attempting to create an unwind segue via Storyboard.
 The IBAction MUST contain the type "UIStoryboardSegue *" with a variable name: e.g. (UIStoryboardSegue *)unwindSegue.
 If the unwind is to occur without data exchange, no additional coding is required.
 If passing back data from the unwind sourceViewController, the code is very similar to the prepareForSegue method.
 Therefore, the properties being passed from the unwind sourceViewController MUST be in the .h file.
*/
-(IBAction)returnToMainVC:(UIStoryboardSegue *)unwindSegue
{
    if ([unwindSegue.identifier isEqualToString:@"unwindVC2Segue"])
    {
        self.secondVC = unwindSegue.sourceViewController;
        self.vc2StringLabel.text = self.secondVC.fruit;
        self.vc2NumberLabel.text = [NSString stringWithFormat:@"%ld", (long)self.secondVC.randomNumber];
    }
    else if ([unwindSegue.identifier isEqualToString:@"unwindVC3Segue"])
    {
        self.thirdVC = unwindSegue.sourceViewController;
        self.vc3StringLabel.text = self.thirdVC.clothing;
        self.vc3NumberLabel.text = [NSString stringWithFormat:@"%ld", (long)self.thirdVC.randomNumber];
    }
}

- (IBAction)vc2Tapped:(id)sender
{
    [self performSegueWithIdentifier:@"vc2Segue" sender:self];
}

- (IBAction)vc3Tapped:(id)sender
{
    [self performSegueWithIdentifier:@"vc3Segue" sender:self];
}











@end
