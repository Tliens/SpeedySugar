//
//  ViewController.swift
//  TestBlock
//
//  Created by Quinn_F on 2017/10/10.
//  Copyright © 2017年 Quinn_F. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    typealias defFirstBlock = (_ a:Int ,_ b:Int) ->(Int)
    var firstBlock:defFirstBlock! = { a,b in
        
        return a+b
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        doSomthing { (a, b) -> (Int) in
            
            return a+b
        }
        doSomthing2 { (a, b) -> (Int) in
            
            return a+b
        }
        print("file",#file,"line",#line,firstBlock!(3,5))
        
        self.perform(#selector(self.toOcView), with: nil, afterDelay: 3)
    }
    func doSomthing(funcFirstBlock:(_ a:Int,_ b:Int)->(Int)) {
        
        let result = funcFirstBlock(3, 5)
        print("file",#file,"line",#line,result)
    }
    func doSomthing2(funcFirstBlock:defFirstBlock) {
        
        let result = funcFirstBlock(3, 5)
        print("file",#file,"line",#line,result)
    }
    
    @objc func toOcView() {
        let vc = OCViewController()
        self.present(vc, animated: true) {
            
        }
    }
}


