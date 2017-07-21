# Swift-UITabBarController
UITabBarController + UINavigationController实现微博框架
本篇文章的主要知识点是：
使用Swift搭建主流框架
![屏幕快照 2017-07-21 下午2.59.13.png](http://upload-images.jianshu.io/upload_images/1243891-397004b634f858d3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
###第一步
创建MainViewController（```UITabBarController```）、FirstViewController、SecondViewController、ThirdViewController、FourthViewController、AddViewController六个类
其中MainViewController继承于UITabBarController，AddViewController可以是ViewController也可以是个View。

![屏幕快照 2017-07-21 下午3.01.02.png](http://upload-images.jianshu.io/upload_images/1243891-cd97c076ca6fcea9.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


###第二步
创建添加子控制器方法
```
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
```

###第三步
将自控制器添加到MainViewController
```
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
```

显示效果：

![屏幕快照 2017-07-21 下午3.09.44.png](http://upload-images.jianshu.io/upload_images/1243891-81ed93c424b1c0e3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

###第四步
添加一个加号
```
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

@objc private func addButtonClick(){
print("你点击了+号")
}
```
###第五步
将加号放到tabBar上
```
// 1.添加到tabBar上
tabBar.addSubview(addButton)

// 2.计算按钮宽度
let width = tabBar.bounds.width / CGFloat(viewControllers!.count)
// 3.创建按钮frame
let rect = CGRect(x: 0, y: 0, width: width, height: tabBar.bounds.height)
// 4.设置按钮frame和偏移位
addButton.frame = rect.offsetBy(dx: width * 2, dy: 0)
```

以上五步就可以实现微博的基础框架了

[github demo https://github.com/tianzhilan0/Swift-UITabBarController](https://github.com/tianzhilan0/Swift-UITabBarController)
