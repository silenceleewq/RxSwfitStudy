//
//  ViewController.swift
//  Created by lirenqiang on 2016/12/9.
//  RxSwiftStudy
//
//  Copyright © 2016年 Ninja. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController  {

    override func viewDidLoad() {

        super.viewDidLoad()
        
        addInt(first: 3, second: 3) { (result) -> (String) in
            
            return result+"aaaa"
        }
        
        
        
    }
    
    func addInt (first: Int, second: Int, completion:(_ result: String)->(String)){
        
        let result = completion("asd")
        print(result)
    }
}

/*
 
 在解释 observeOn()和subscribeOn() 时, 
 第4点说: 如果我们之前没有调用observeOn，那么这边会在OtherScheduler发生，但是我们前面调用了OtherScheduler，所以这个动作还是会在主线程中调用。
 是不是应该为: 如果我们之前没有调用observeOn，那么这边会在OtherScheduler发生，但是我们前面调用了observeOn，所以这个动作还是会在主线程中调用。
 */

