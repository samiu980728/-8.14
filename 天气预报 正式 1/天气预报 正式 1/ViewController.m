//
//  ViewController.m
//  天气预报 正式 1
//
//  Created by 萨缪 on 2018/8/13.
//  Copyright © 2018年 萨缪. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
#import "searchViewController.h"
#import "FirstCellWeatherViewController.h"

@interface ViewController ()<giveCityNameControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,self.view.frame.size.width,self.view.frame.size.height) style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    _tableView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:_tableView];
    
    //初始化
    timeArray = [[NSMutableArray alloc] init];
    cityNameArray = [[NSMutableArray alloc] init];
    tempArray = [[NSMutableArray alloc] init];
    
    
    //上传网络接口
    
    NSLog(@"_cityString22222 = %@",_cityString);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"_cityString2122122 = %@",_cityString);
    UITableViewCell * cell3 = nil;
    UITableViewCell * cell4 = nil;
    UITableViewCell * cell1 = nil;
    UITableViewCell * cell2 = nil;
    
    if ( indexPath.row == 0 ){
    cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if ( cell1 == nil ){
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        }
        //判断第一个单元格是否是北京？
        //先判断是否存在
        
        //NSLog(@"cityNameArrayTableView = %@",cityNameArray);
        NSLog(@"timeArray = %@",timeArray);
        
        if ( [cityNameArray isKindOfClass:[NSArray class]] && cityNameArray.count > 0 ){
        //if ( [cityNameArray[0] isEqualToString:@"beijing"] ){
            NSLog(@"匹配成功");
            UILabel * timeLabel = [[UILabel alloc] init];
            timeLabel.text = [timeArray objectAtIndex:indexPath.row];
            timeLabel.frame = CGRectMake(10, 40, 200, 25);
            
            UILabel * cityLabel = [[UILabel alloc] init];
            cityLabel.text = [cityNameArray objectAtIndex:indexPath.row];
            cityLabel.frame = CGRectMake(10, 70, 200, 50);
            
            UILabel * tmpLabel = [[UILabel alloc] init];
            tmpLabel.text = [tempArray objectAtIndex:indexPath.row];
            tmpLabel.frame = CGRectMake(300, 40, 100, 90);
            
            [cell1.contentView addSubview:tmpLabel];
            [cell1.contentView addSubview:cityLabel];
            [cell1.contentView addSubview:timeLabel];
      //  }
        }
        
        cell1.backgroundColor = [UIColor clearColor];
        return  cell1;
    
    }
    else if ( indexPath.row == 1 ){
        cell2 = [_tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if ( cell2 == nil ){
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        cell2.backgroundColor = [UIColor clearColor];
        return  cell2;
    }
    else if ( indexPath.row == 2 ){
        cell3 = [_tableView dequeueReusableCellWithIdentifier:@"cell3"];
        if ( cell3 == nil ){
            cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
        }
        cell3.backgroundColor = [UIColor clearColor];
        return cell3;
    }
    else{
    //if ( indexPath.row == 3 ){
        cell4 = [_tableView dequeueReusableCellWithIdentifier:@"cell4"];
        if ( cell4 == nil ){
            cell4 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell4"];
        plusButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        plusButton.frame = CGRectMake(350, 5, 30, 30);
        [plusButton setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
            [plusButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [plusButton addTarget:self action:@selector(pressPlusButton:) forControlEvents:UIControlEventTouchUpInside];
            [cell4.contentView addSubview:plusButton];
            
        }
    }
    cell4.backgroundColor = [UIColor clearColor];
    return cell4;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    FirstCellWeatherViewController * firstWeatherViewController = [[FirstCellWeatherViewController alloc] init];
    MainViewController * mainController = [[MainViewController alloc] init];
    if ( indexPath.row == 0 ){
        
//        firstWeatherViewController.pushFirstNameStr = _cityString;
//
//        [firstWeatherViewController.livesListTable reloadData];
        [self presentViewController:mainController animated:YES completion:nil];
    }
    
    
    
}

- (void)pressPlusButton:(UIButton *)btn
{
    searchViewController * seaViewController = [[searchViewController alloc] init];
    seaViewController.delegate = self;
    //NSLog(@"调用协议");
    
    [self presentViewController:seaViewController animated:YES completion:nil];
    //[self.navigationController pushViewController:seaViewController animated:YES];
}

- (void)giveCityName:(NSString *)nameOfCityStr
{
    _cityString = [NSString stringWithFormat:@"%@",nameOfCityStr];
    
    NSLog(@"_cityString = %@",_cityString);
    [_tableView reloadData];
}

//导航栏

//- (void)viewDidAppear:(BOOL)animated
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ( [_cityString isEqualToString:@"beijing"] ){
        [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:@"https://free-api.heweather.com/s6/weather/now?location=beijing&key=70c5ee7d3a214fefaee2fc9ca8eeb52f"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            
            //判断是否能够
            //先判断是否存在
            
            //先遍历数组 看数组中是否有和 现在的城市有相似的 有相似的城市 就不要在往数组中加了
          //  if ( ([cityNameArray isKindOfClass:[NSArray class]] && cityNameArray.count == 0)  ){
            NSInteger flag = 0;
            for ( NSInteger i = 0; i < [cityNameArray count]; i++ ){
                if ( [dict[@"HeWeather6"][0][@"basic"][@"parent_city"] isEqualToString:[NSString stringWithFormat:@"%@",[cityNameArray objectAtIndex:i]]] ){
                    flag = 1;
                    break;
                }
            }
            
            NSLog(@"flag = %li",flag);
            if ( flag == 0 ){
            [cityNameArray addObject:dict[@"HeWeather6"][0][@"basic"][@"parent_city"]];
            
            [timeArray addObject:dict[@"HeWeather6"][0][@"update"][@"loc"]];
            
            [tempArray addObject:dict[@"HeWeather6"][0][@"now"][@"tmp"]];
            }
            //}
            
//            NSLog(@"timeArray = %@",timeArray);
//
        //NSLog(@"城市  :%@",[NSString stringWithFormat:@"%@",cityNameArray]);
//
            NSLog(@"parent_city = %@",cityNameArray);
//
//            NSLog(@"tmp = %@",tempArray);
            
            //把UI的更新加到主线程中
            dispatch_sync(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
            });
//
        }] resume];
    }
}

- (void)pressJiaHao:(UIButton *)btn
{
    
}


//弄三个城市吧
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 2){
        return 40;
    }
    return 150;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
