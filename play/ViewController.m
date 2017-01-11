//
//  ViewController.m
//  play
//
//  Created by 张晗 on 2016/12/26.
//  Copyright © 2016年 张晗. All rights reserved.
//

#import "ViewController.h"
#import "PlayViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *urlTableView;
@property (nonatomic, strong) NSMutableArray *urlArray;
@property (nonatomic, strong) UIBarButtonItem *rightBarButtonItem;
@property (nonatomic, strong) UIButton *addUrlBtn;
@property (nonatomic, strong) UITextView *urlTextView;
@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UIButton *cancelBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.urlTableView];
    self.navigationItem.title = @"七牛测试Demo";
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
    [self configUrlData];
    [self.urlTableView reloadData];
}

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section {
    return self.urlArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
    cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 50)];
    cell.textLabel.text = [self.urlArray objectAtIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayViewController *plVC = [[PlayViewController alloc] init];
    plVC.urlStr = [self.urlArray objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:plVC animated:YES];
}

- (BOOL)tableView:(UITableView *)tableView
    canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return true;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
        editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
    forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle ==UITableViewCellEditingStyleDelete) {//如果编辑样式为删除样式
        if (indexPath.row<[self.urlArray count]) {
            [self.urlArray removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                                    withRowAnimation:UITableViewRowAnimationLeft];
        }
    }
}

- (void)addUrl {
    [self.view addSubview:self.urlTextView];
    [self.view addSubview:self.confirmBtn];
    [self.view addSubview:self.cancelBtn];
}

- (void)addUrlAction {
    [self.urlArray addObject:self.urlTextView.text];
    [self.urlTableView reloadData];
    self.urlTextView.text = @"";
    [self.urlTextView removeFromSuperview];
    [self.confirmBtn removeFromSuperview];
    [self.cancelBtn removeFromSuperview];
}

- (void)cancelAddUrlAction {
    self.urlTextView.text = @"";
    [self.urlTextView removeFromSuperview];
    [self.confirmBtn removeFromSuperview];
    [self.cancelBtn removeFromSuperview];
}

- (void)configUrlData {
    [self.urlArray addObject:@"转码测试"];
    
    [self.urlArray addObject:@"默认"];
    [self.urlArray addObject:@"rtmp://pili-live-rtmp.wscn.wallstcn.com/wscn/chat_231_1227044410_rebirth_wallstcn_com"];
    
    [self.urlArray addObject:@"480p高清"];
    [self.urlArray addObject:@"rtmp://pili-live-rtmp.wscn.wallstcn.com/wscn/chat_231_1227044410_rebirth_wallstcn_com@480p"];
    
    [self.urlArray addObject:@"720p超清"];
    [self.urlArray addObject:@"rtmp://pili-live-rtmp.wscn.wallstcn.com/wscn/chat_231_1227044410_rebirth_wallstcn_com@720p"];
    
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];
    
    [self.urlArray addObject:@"转码测试"];
    
    [self.urlArray addObject:@"默认"];
    [self.urlArray addObject:@"http://pili-live-hls.wscn.wallstcn.com/wscn/chat_231_1227044410_rebirth_wallstcn_com.m3u8"];
    
    [self.urlArray addObject:@"480p高清"];
    [self.urlArray addObject:@"http://pili-live-hls.wscn.wallstcn.com/wscn/chat_231_1227044410_rebirth_wallstcn_com.m3u8@480p"];
    
    [self.urlArray addObject:@"720p超清"];
    [self.urlArray addObject:@"http://pili-live-hls.wscn.wallstcn.com/wscn/chat_231_1227044410_rebirth_wallstcn_com.m3u8@720p"];
    
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];
    
    [self.urlArray addObject:@"转码测试"];
    
    [self.urlArray addObject:@"默认"];
    [self.urlArray addObject:@"http://pili-live-hdl.wscn.wallstcn.com/wscn/chat_231_1227044410_rebirth_wallstcn_com.flv"];
    
    [self.urlArray addObject:@"480p高清"];
    [self.urlArray addObject:@"http://pili-live-hdl.wscn.wallstcn.com/wscn/chat_231_1227044410_rebirth_wallstcn_com.flv@480p"];
    
    [self.urlArray addObject:@"720p超清"];
    [self.urlArray addObject:@"http://pili-live-hdl.wscn.wallstcn.com/wscn/chat_231_1227044410_rebirth_wallstcn_com.flv@720p"];
    
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];
    
    
    
    [self.urlArray addObject:@"mp4"];
    [self.urlArray addObject:@"http://7xo7ez.com1.z1.glb.clouddn.com/1216_dcyt.mp4"];
    [self.urlArray addObject:@"http://wdl.wallstreetcn.com/gtax.mp4"];
    [self.urlArray addObject:@"https://wdl.wallstreetcn.com/h2641215cmp.mp4"];
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];

    [self.urlArray addObject:@"hls"];
    [self.urlArray addObject:@"hls - playback"];
    [self.urlArray addObject:@"http://pili-playback.wscn.wallstcn.com/wscn/chat_88_1108085201_wallstreetcn_com.m3u8?start=0&end=0"];
    [self.urlArray addObject:@"http://pili-playback.wscn.wallstcn.com/wscn/chat_99_1214061139_wallstreetcn_com.m3u8?start=0&end=0"];
    [self.urlArray addObject:@"hls - live"];
    [self.urlArray addObject:@"http://pili-live-hls.wscn.wallstcn.com/wscn/chat_216_1215072925_rebirth_wallstcn_com.m3u8"];
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];

    [self.urlArray addObject:@"rtmp"];
    [self.urlArray addObject:@"rtmp - playback"];
    [self.urlArray addObject:@"rtmp://pili-publish.wscn.wallstcn.com/wscn/chat_216_1215072925_rebirth_wallstcn_com"];
    [self.urlArray addObject:@"rtmp - live"];
    [self.urlArray addObject:@"rtmp://pili-live-rtmp.wscn.wallstcn.com/wscn/chat_99_1214061139_wallstreetcn_com"];
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];

    [self.urlArray addObject:@"mov"];
    [self.urlArray addObject:@"mov - playback"];
    [self.urlArray addObject:@"http://wdl.wallstreetcn.com/%E7%8E%89%E7%B1%B3%E5%B8%82%E5%9C%BA%E6%8A%95%E8%B5%84.mov"];
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];

    [self.urlArray addObject:@"avi"];
    [self.urlArray addObject:@"avi - playback"];
    [self.urlArray addObject:@"https://wdl.wallstreetcn.com/22_02_%E5%9F%BA%E4%BA%8Eopenssl%E7%9A%84https%E6%9C%8D%E5%8A%A1%E9%85%8D%E7%BD%AE.avi"];
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];


    [self.urlArray addObject:@"douyu"];
    [self.urlArray addObject:@"douyu - live"];
    [self.urlArray addObject:@"http://hls3.douyucdn.cn/live/461944ry9llGuJXY/playlist.m3u8?wsSecret=47d9dc3fbee6626ee3ce8131e57ab8f4&wsTime=1482741325"];
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];

    [self.urlArray addObject:@"flv"];
    [self.urlArray addObject:@"http://wdl.wallstreetcn.com/%E6%B5%8B%E8%AF%95_flv_%E6%A0%BC%E5%BC%8F2016-07-12%2015-40-34.flv"];
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];
    [self.urlArray addObject:@"------------------------------------------------------------------------------------"];

    [self.urlArray addObject:@"自定义Url"];

}

#pragma mark - 懒加载

- (UITableView *)urlTableView {
    if (!_urlTableView) {
        _urlTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
        _urlTableView.delegate = self;
        _urlTableView.dataSource = self;
    }
    return _urlTableView;
}

- (NSMutableArray *)urlArray {
    if (!_urlArray) {
        _urlArray = [NSMutableArray arrayWithCapacity:10];
    }
    return _urlArray;
}

- (UIButton *)addUrlBtn {
    if (!_addUrlBtn) {
        _addUrlBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addUrlBtn.frame = CGRectMake(0, 0, 50, 50);
        [_addUrlBtn setTitle:@"Add" forState:UIControlStateNormal];
        [_addUrlBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_addUrlBtn setTitleColor:[UIColor clearColor] forState:UIControlStateHighlighted];
        [_addUrlBtn addTarget:self
                               action:@selector(addUrl)
                 forControlEvents:UIControlEventTouchUpInside];
    }
    return _addUrlBtn;
}

- (UIBarButtonItem *)rightBarButtonItem {
    if (!_rightBarButtonItem) {
        _rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.addUrlBtn];
    }
    return _rightBarButtonItem;
}

- (UITextView *)urlTextView {
    if (!_urlTextView) {
        _urlTextView = [[UITextView alloc] initWithFrame:CGRectMake(50, self.view.bounds.size.height / 2 - 100, self.view.bounds.size.width - 100, 100)];
        _urlTextView.backgroundColor = [UIColor cyanColor];
    }
    return _urlTextView;
}

- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmBtn.frame = CGRectMake(50, self.view.bounds.size.height / 2 , self.urlTextView.bounds.size.width / 2, 50);
        _confirmBtn.backgroundColor = [UIColor redColor];
        [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        [_confirmBtn addTarget:self
                                action:@selector(addUrlAction)
                  forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(self.urlTextView.bounds.size.width / 2 + 50, self.view.bounds.size.height / 2 , self.urlTextView.bounds.size.width / 2, 50);
        _cancelBtn.backgroundColor = [UIColor orangeColor];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn addTarget:self
                       action:@selector(cancelAddUrlAction)
             forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}

@end
