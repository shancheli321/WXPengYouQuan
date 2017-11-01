//
//  BaseViewController.swift
//  PlasticSurgery
//
//  Created by RongXing on 2017/9/20.
//  Copyright © 2017年 RongXing. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var mainTableView = UITableView()
    //    数据源
    var mainTableArr = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSubViews()
        self.navigationController?.navigationBar.isTranslucent = false
        self.view.backgroundColor = kSetRGBColor(r: 239, g: 239, b: 244)
        configNavigationBarMainColor()
    }

    //    每个导航控制器的第一个子控制器的导航栏都是 红色的
    func configNavigationBarMainColor() {
        self.navigationController?.navigationBar.setBackgroundImage(getNavigationIMG(64, fromColor: kSetRGBColor(r: 253, g: 100, b: 104), toColor: kSetRGBColor(r: 235, g: 133, b: 142)), for: .default)
        self.navigationItem.leftBarButtonItem?.tintColor = kSetRGBColor(r: 255, g: 255, b: 255)
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    
    func configSubViews() -> Void {

        
    }
    
//    ******************代理 ： UITableViewDataSource,UITableViewDelegate  ************
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
