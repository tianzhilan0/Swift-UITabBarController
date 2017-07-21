//
//  MainViewController.swift
//  SwiftStudy
//
//  Created by LC on 2017/7/20.
//  Copyright © 2017年 LC. All rights reserved.
//

import UIKit


class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor.yellow //tabbar 字体颜色
        tabBar.barTintColor = UIColor.white //tabbar 背景颜色
        
        self.addChildVC(childVC: FirstViewController(), childTitle: "First", imageName: "tabbar_1", selectedImageName: "tabbar_selected_1")
        self.addChildVC(childVC: SecondViewController(), childTitle: "Second", imageName: "tabbar_2", selectedImageName: "tabbar_selected_2")
        self.addChildVC(childVC: SecondViewController(), childTitle: "", imageName: "", selectedImageName: "")
        self.addChildVC(childVC: ThirdViewController(), childTitle: "Third", imageName: "tabbar_3", selectedImageName: "tabbar_selected_3")
        self.addChildVC(childVC: FourthViewController(), childTitle: "Fourth", imageName: "tabbar_4", selectedImageName: "tabbar_selected_4")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 此时 tabBarButton 都已经创建
        print(tabBar.subviews)
        // 初始化加号按钮
        setAddButton()
    }
    
    /// 添加子控制器
    private func addChildVC(childVC: UIViewController, childTitle: String, imageName: String, selectedImageName:String)
    {
        let navigation = UINavigationController(rootViewController: childVC)
        navigation.navigationBar.tintColor = UIColor.white //item 字体颜色
        navigation.navigationBar.barTintColor = UIColor.yellow //背景颜色
        let dict:NSDictionary = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)]
        //标题颜色
        navigation.navigationBar.titleTextAttributes = dict as? [String : AnyObject]
        childVC.title = childTitle
        childVC.tabBarItem.tag = 1
        childVC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        self.addChildViewController(navigation)
    }
    
    private  lazy  var addButton:UIButton = {
        // 1.创建按钮
        let button = UIButton()
        // 2.设置背景颜色
        button.backgroundColor = UIColor.yellow
        // 3.设置图片
        button.setImage(UIImage(named: "tabbar_add"), for:.normal)

        // 4.添加监听
        button.addTarget(self, action: #selector(addButtonClick), for: .touchUpInside)

        return button
    }()
    
    private func setAddButton(){
        
        // 1.添加到tabBar上
        tabBar.addSubview(addButton)
        
        // 2.计算按钮宽度
        let width = tabBar.bounds.width / CGFloat(viewControllers!.count)
        // 3.创建按钮frame
        let rect = CGRect(x: 0, y: 0, width: width, height: tabBar.bounds.height)
        // 4.设置按钮frame和偏移位
        addButton.frame = rect.offsetBy(dx: width * 2, dy: 0)
    }
    
    @objc private func addButtonClick(){
        let navigation = UINavigationController(rootViewController: AddViewController())
        navigation.navigationBar.tintColor = UIColor.white //item 字体颜色
        navigation.navigationBar.barTintColor = UIColor.yellow //背景颜色
        let dict:NSDictionary = [NSForegroundColorAttributeName: UIColor.white,NSFontAttributeName : UIFont.boldSystemFont(ofSize: 18)]
        //标题颜色
        navigation.navigationBar.titleTextAttributes = dict as? [String : AnyObject]
        self.present(navigation, animated: true, completion: nil)
        print("111111")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

