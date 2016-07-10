//
//  ThirdViewController.m
//  PassDataWithUnwindSegue
//
//  Created by Michael Hoffman on 7/9/16.
//  Copyright © 2016 Strong Atomic. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@property (weak, nonatomic) IBOutlet UILabel *stringLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property NSArray *clothes;
@property NSInteger randomClothes;

- (IBAction)randomTapped:(id)sender;
- (IBAction)backTapped:(id)sender;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.clothes = @[@"tee", @"jeans", @"skirt", @"shorts", @"dress", @"jacket", @"underwear", @"socks", @"shirt", @"sweater"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray *)labelArray
{
    NSArray *labels = @[self.stringLabel, self.numberLabel];
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

-(NSString *)addStringToViewController
{
    NSString *string = self.clothing;
    return string;
}

-(NSInteger)addNumberTGoViewController
{
    NSInteger number = self.randomNumber;
    return number;
}

- (IBAction)randomTapped:(id)sender
{
    self.randomNumber = arc4random_uniform(300);
    self.numberLabel.text = [NSString stringWithFormat:@"%ld", (long)self.randomNumber];
    
    self.randomClothes = arc4random_uniform(9);
    self.clothing = [self.clothes objectAtIndex:self.randomClothes];
    self.stringLabel.text = self.clothing;
    
}

- (IBAction)backTapped:(id)sender
{
    [self performSegueWithIdentifier:@"unwindVC3Segue" sender:self];
}











@end
