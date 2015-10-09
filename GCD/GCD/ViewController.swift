//
//  ViewController.swift
//  GCD
//
//  Created by Joanna on 15/3/19.
//  Copyright (c) 2015年 Joanna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        
//        groupDemo()
//    }
    
//    MARK:调度组
    func groupDemo() {
        let g = dispatch_group_create()
        let q = dispatch_get_global_queue(0, 0)
        
        dispatch_group_enter(g)
        dispatch_async(q) {
            
            print("A====\(NSThread.currentThread())")
            dispatch_group_leave(g)
        }
        
        dispatch_group_enter(g)
        dispatch_async(q) {
            
            print("B====\(NSThread.currentThread())")
            dispatch_group_leave(g)
        }
        
        dispatch_group_enter(g)
        dispatch_async(q) {
            
            print("C====\(NSThread.currentThread())")
            dispatch_group_leave(g)
        }

        dispatch_group_notify(g, dispatch_get_main_queue()) { () -> Void in
            print("OK====\(NSThread.currentThread())")
        }
    }
    
    
//  MARK: 同步执行的作用
    func demo7() {
        let q =  dispatch_queue_create("并发", DISPATCH_QUEUE_CONCURRENT)
        
        dispatch_sync(q) {
            print("A---\(NSThread.currentThread())");
            }
        
        dispatch_async(q) {
            print("B---\(NSThread.currentThread())");
            }
        
        dispatch_async(q){
            print("C---\(NSThread.currentThread())");
            }
        
        NSThread.sleepForTimeInterval(0.5)
        print("come here")
    }

    
    // MARK: 主队列，异步执行
    func demo6() {
        
        print("come here")
        
        let  q = dispatch_get_main_queue()
        
        for i in 0..<10 {
            dispatch_async(q) {
                print("\(NSThread .currentThread())----\(i)")
            }
        }
        print("come here?")
    }

    
    // MARK: 主队列，同步执行
    func demo5() {
        
        print("come here")
        
        let  q = dispatch_get_main_queue()
        
        for i in 0..<10 {
            dispatch_sync(q) {
                print("\(NSThread .currentThread())----\(i)")
            }
        }
        print("come here?")
    }
    
    // MARK: 并发队列，异步执行
    func demo4() {
        let q = dispatch_queue_create("并发", DISPATCH_QUEUE_CONCURRENT)
        
        for i in 0..<10 {
            dispatch_async(q) {
                print("\(NSThread .currentThread())----\(i)")
            }
        }
        print("come here")
    }

    
    // MARK: 串行队列，异步执行
    func demo3() {
        
        let q = dispatch_queue_create("串行", DISPATCH_QUEUE_SERIAL)
        
        for i in 0..<10 {
            dispatch_async(q) {
                print("\(NSThread .currentThread())----\(i)")
            }
        }
        print("come here")

    }
    
    // MARK: 并发队列，同步执行
    func demo2() {
        let q = dispatch_queue_create("并发", DISPATCH_QUEUE_CONCURRENT)
        
        for i in 0..<10 {
            dispatch_sync(q) {
                print("\(NSThread .currentThread())----\(i)")
            }
        }
        print("come here")
    }
    
    
    // MARK: 串行队列，同步执行
    func demo1() {
        let  q = dispatch_queue_create("串行", DISPATCH_QUEUE_SERIAL)
        
        for i in 0..<10 {
            dispatch_sync(q) {
                print("\(NSThread .currentThread())----\(i)")
            }
        }
        print("come here")
    }


}

