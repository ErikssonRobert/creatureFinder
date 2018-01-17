//
//  ViewController.m
//  AnimalDetector
//
//  Created by lösen är 0000 on 2018-01-13.
//  Copyright © 2018 Robert Eriksson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//Labels
@property (weak, nonatomic) IBOutlet UILabel *resultCreature;
@property (weak, nonatomic) IBOutlet UILabel *playerPoints;

//Switches
@property (weak, nonatomic) IBOutlet UISwitch *switchTwoLegs;
@property (weak, nonatomic) IBOutlet UISwitch *switchWings;
@property (weak, nonatomic) IBOutlet UISwitch *switchCanFly;
@property (weak, nonatomic) IBOutlet UISwitch *switchLarge;
@property (weak, nonatomic) IBOutlet UISwitch *switchCanSwim;
@property (weak, nonatomic) IBOutlet UISwitch *switchCanSpeak;
@property (weak, nonatomic) IBOutlet UISwitch *switchFourLegs;
@property (weak, nonatomic) IBOutlet UISwitch *switchSmall;

//Variables
@property int twoLegs;
@property int wings;
@property int fly;
@property int large;
@property int swim;
@property int speak;
@property int fourLegs;
@property int small;

@property NSMutableArray *creaturesFound;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Initiating variables and refreshes the result label
    self.creaturesFound =
    [NSMutableArray arrayWithObjects:@1, @2, @3, @4, @5,
     @6, @7, @8, @9, @10, @11, @12, @13,
     @14, @15, nil];
    
    for (int i = 0; i < self.creaturesFound.count; i++) {
        NSNumber *zero = @0;
        self.creaturesFound[i] = zero;
    }
    
    self.twoLegs = 10000000;
    self.wings = 1000000;
    self.fly = 100000;
    self.large = 10000;
    self.swim = 1000;
    self.speak = 100;
    self.fourLegs = 10;
    self.small = 1;
    [self refresh];
}

//Method for refreshing the result and points label
- (void)refresh{
    self.resultCreature.text = [self getCreature];
    self.playerPoints.text = [NSString stringWithFormat:@"%i", [self countPoints]];
}

//Method that returns a combination of 1/0's based on switches flipped
- (int)decideCreature{
    int sum = 0;
    
    if (self.switchTwoLegs.isOn){
        sum += self.twoLegs;
    }
    if (self.switchWings.isOn){
        sum += self.wings;
    }
    if (self.switchCanFly.isOn){
        sum += self.fly;
    }
    if (self.switchLarge.isOn){
        sum += self.large;
    }
    if (self.switchCanSwim.isOn){
        sum += self.swim;
    }
    if (self.switchCanSpeak.isOn){
        sum += self.speak;
    }
    if (self.switchFourLegs.isOn){
        sum += self.fourLegs;
    }
    if (self.switchSmall.isOn){
        sum += self.small;
    }
    
    return sum;
}

//Method that returns a string based on the combination of 1/0's
- (NSString*)getCreature{
    switch ([self decideCreature]) {
        case 11100100:
            [self addCreatureFound:0];
            return @"Parrot";
            break;
        case 10101100:
            [self addCreatureFound:1];
            return @"Kryptonian";
            break;
        case 11000:
            [self addCreatureFound:2];
            return @"Whale";
            break;
        case 11001000:
            [self addCreatureFound:3];
            return @"Penguin";
            break;
        case 10001100:
            [self addCreatureFound:4];
            return @"Human";
            break;
        case 11100000:
            [self addCreatureFound:5];
            return @"Bird";
            break;
        case 1011:
            [self addCreatureFound:6];
            return @"Frog";
            break;
        case 1000:
            [self addCreatureFound:7];
            return @"Fish";
            break;
        case 1010:
            [self addCreatureFound:8];
            return @"Dog";
            break;
        case 110:
            [self addCreatureFound:9];
            return @"Centaur";
            break;
        case 1100010:
            [self addCreatureFound:10];
            return @"Pegasus";
            break;
        case 11010:
            [self addCreatureFound:11];
            return @"Elephant";
            break;
        case 1110010:
            [self addCreatureFound:12];
            return @"Dragon";
            break;
        case 11:
            [self addCreatureFound:13];
            return @"Mouse";
            break;
        case 1100001:
            [self addCreatureFound:14];
            return @"Fly";
            break;
    }
    return @" ";
}

//Method that sets a point value in array when creature is found
- (void)addCreatureFound:(int) i{
    NSNumber *point = @1;
    self.creaturesFound[i] = point;
}

//Method that loops through an array to see how many points the player has
- (int)countPoints{
    int points = 0;
    for (int i = 0; i < self.creaturesFound.count; i++) {
        if ([self.creaturesFound[i] intValue] == 1) {
            points++;
        }
    }
    return points;
}

//Method that calls refresh method when a switch is flipped
- (IBAction)switchFlipped:(id)sender {
    [self refresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
