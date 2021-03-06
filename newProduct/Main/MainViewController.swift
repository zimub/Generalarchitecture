//
//  MainViewController.swift
//  new product
//
//  Created by pgw on 2018/3/14.
//  Copyright © 2018年 pgw. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
//        self.tabBar.alpha = 0.4
        setUpChildControllers()

    }
  func setUpChildControllers(){
    let array = [
        ["clsName":"HomePageViewController","title":"刷新","imageName":"home"],
        ["clsName":"HomePageViewController","title":"视频","imageName":"message_center"],
        ["clsName":"ExploreViewController","title":"任务","imageName":"discover"],
        ["clsName":"MineViewController","title":"我的","imageName":"profile"],
        ]
    
    var arrayM = [UIViewController]()
    
    for dict in array{
        arrayM.append(controller(dict: dict))
    }
    viewControllers = arrayM
    
    }
    private func controller(dict : [String : String])->UIViewController{
        guard let clsName = dict["clsName"],
            let imageName = dict["imageName"],
            let title = dict["title"],
            let cls = NSClassFromString(Bundle.main.nameSpace + "." + clsName )as?UIViewController.Type//TODO:反射
  else {
            return UIViewController()
        }
        //创建视图控制器
        let vc = cls.init()
        vc.title = title
        self.tabBar.tintColor = UIColor.orange
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor : UIColor.orange], for: .selected)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.font : UIFont.systemFont(ofSize: 24)], for: .selected)//默认是12号
        vc.tabBarItem.image = UIImage(named: "tabbar_"+imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar"+imageName + "_highlighted")?.withRenderingMode(.alwaysOriginal)
        let nav = BaseNavigationController.init(rootViewController: vc)
        return nav
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
