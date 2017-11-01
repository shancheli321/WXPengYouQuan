//
//  DiaryViewController.swift
//  Swift Test
//
//  Created by RongXing on 2017/9/18.
//  Copyright © 2017年 付耀辉. All rights reserved.
//

import UIKit

class DiaryViewController: BaseViewController ,HJImageBrowserDelegate{
    
    let identyfierTable1 = "TableViewCell"
    
    var theImage = UIImage()
    var theIndex = 1000

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:日记界面首页
    override func configSubViews() {
        
//        重写titleView
        let titleView = UIButton.init(frame: CGRect(x: 0, y: 0, width: 70, height: 30))
        titleView.setTitle("全部", for: .normal)
        titleView.setImage(UIImage.init(named: "xiala"), for: .normal)
        titleView.addTarget(self, action: #selector(chooseAction(sender:)), for: .touchUpInside)
        titleView.titleEdgeInsets = UIEdgeInsetsMake(0, -35, 0, 0)
        titleView.imageEdgeInsets = UIEdgeInsetsMake(0, 47, 0, 0)
        self.navigationItem.titleView = titleView
        
        mainTableView = UITableView.init(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: kSCREEN_HEIGHT - 64 ), style: .plain)
        mainTableView.dataSource = self;
        mainTableView.delegate = self;
        mainTableView.estimatedRowHeight = 143 * kSCREEN_SCALE;
        mainTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: identyfierTable1)
        self.view.addSubview(mainTableView)
    }
    
    //MARK: 点击顶部按钮“全部“
    @objc func chooseAction(sender:UIButton) {
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : TableViewCell = tableView.dequeueReusableCell(withIdentifier: identyfierTable1, for: indexPath) as! TableViewCell
        cell.selectionStyle = .default
        
        var num = Int(arc4random_uniform(6))+1
        if num == 0 {
            num = 7
        }
        
        if indexPath.row == 0 {
            num = 8
        }
        
        
        cell.assignToViews(num: num)

        cell.showImageAction = {
            
            self.theImage = $2
            self.theIndex = $0
            
            let bview = HJImageBrowser()
            
            bview.delegate = self
            
//            bottomView 这个一定要填写你点击的imageView的直接父视图
//            cell.viewWithTag(10086) 这个就是cell类里面的那个images（UIView）我在Xib里面设置的
            bview.bottomView = cell.viewWithTag(10086)
            
//            当前点击的图片在该数组中的位置。
            bview.indexImage = $0
            
            bview.defaultImage = $2
            
            bview.arrayImage = $1 as! [String]
            
            bview.show()
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        

    }
    
    //    #MARK:HJImageBrowserDelegate
    func getTheThumbnailImage(_ indexRow: Int) -> UIImage {
        
//        点击图片之后，放大过程中显示的那张图片
        return theImage
    }
    
}
