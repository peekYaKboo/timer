//
//  ViewController.swift
//  timer
//
//  Created by 川田有紀 on 2019/04/07.
//  Copyright © 2019 jp.techacademy.yuki.kawata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    
    //タイマー
    var timer: Timer!
    //タイマー用の時間のための変数
    var timer_sec: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
        
        // selector: #selector(updatetimer(_:))で指定された関数
        // timeInterval: 0.1, repeats: trrueで指定された通り、0.1秒ごとに呼び出され続ける
        @objc func updateTimer(_ timer: Timer){
            self.timer_sec += 0.1
            self.timerLabel.text = String(format: "%.1f",timer_sec)
        }
    //再生ボタン IBAction
    @IBAction func startTimer(_ sender: Any) {
    //動作中のタイマーを一つに保つために、timerが存在しない場合だけ、タイマーを生成して動作させる
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
    }
    //一時停止ボタン IBAction
    @IBAction func pauseTimer(_ sender: Any) {
        if self.timer != nil{
            self.timer.invalidate()
        } //タイマーを停止する
        self.timer = nil
        // startTimer() の timer == nil で判断するために、timer = nil としておく
    }
    //リセットボタン IBAction
    @IBAction func resetTimer(_ sender: Any) {
        //リセットボタンを押すと、タイマーの時間を0に
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%.1f", self.timer_sec)
        
        if self.timer != nil{
            self.timer.invalidate() //タイマーを停止する
            self.timer = nil
            // startTimerr() の timer == nil で判断するために、 timer = nil としておく
        }
    }
    
}

