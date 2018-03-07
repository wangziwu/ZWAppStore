# ZWAppStore
[![Version](https://img.shields.io/cocoapods/v/ZWAppStore.svg?style=flat)](http://cocoadocs.org/docsets/ZWAppStore)
[![License](https://img.shields.io/cocoapods/l/ZWAppStore.svg?style=flat)](http://cocoadocs.org/docsets/ZWAppStore)
[![Platform](https://img.shields.io/cocoapods/p/ZWAppStore.svg?style=flat)](http://cocoadocs.org/docsets/ZWAppStore)
![Language](https://img.shields.io/badge/Language-%20Objective%20C%20-blue.svg)

### 简介
iOS 应用APP检测更新、提醒应用评价、前往App Store给予好评功能封装。

### 详细介绍参考我的[简书](https://www.jianshu.com/p/6cacfb4d9191)
[iOS版本自动检测更新、应用评论功能封装](https://www.jianshu.com/p/6cacfb4d9191)

### 框架整体介绍
* 检测APP应用最新版本、获取应用更新内容、提示用户版本更新。
* 请求评论视图，限制每日最多出现次数、限制每次出现概率、限制最大出现次数避免用户反感。
* 前往App Store评价应用，给以星级评论。
* 系统级APP中应用星级评价。

### 效果展示

![效果图](http://upload-images.jianshu.io/upload_images/3237547-6ab41990c0f7b136.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 框架使用方法
- 直接把ZWAppStore文件夹拖入到您的工程中.
  
  ```objc
  #import "ZWAppStore.h"
  ``` 
  
- Cocoapods安装
  
  ```objc
  pod search ZWAppStore
  pod 'ZWAppStore',		'~> 0.0.5'
  ```
  
  ```objc
  #import <ZWAppStore/ZWAppStore.h>
  ```
  
  如果发现pod search ZWAppStore不是最新版本,请执行pod repo update --verbose命令更新本地spec缓存（可能需要几分钟），然后再搜索就可以了.
  
#####【V0.0.5】版本更新记录

- 【修改】: 修改版本对比逻辑、适应版本号位数不一致导致检测更新失败问题。

#####【V0.0.2】版本更新记录

- 【修改】: 应用检测更新视图图片偏移bug。

#####【V0.0.1】版本更新记录

- 【新增】: 封装APP应用与App Store交互相关逻辑。