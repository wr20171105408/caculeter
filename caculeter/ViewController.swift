//
//  ViewController.swift
//  caculeter
//
//  Created by s20171105408 on 2018/10/27.
//  Copyright © 2018年 s20171105408. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var temp : Double? //存储变量
    @IBOutlet weak var result: UITextField!
    
    var fuhao : String?//判定符号
    var jiannum : Int = 1
    var num = 0
    var type : Double?
    
    @IBAction func button0(_ sender: Any) {
        result.text = result.text! + "0"
    }
    
    @IBAction func boutton1(_ sender: Any) {
        result.text = result.text! + "1"
    }
    
    @IBAction func boutton2(_ sender: Any) {
        result.text = result.text! + "2"
    }
    
    @IBAction func boutton3(_ sender: Any) {
        result.text = result.text! + "3"
    }
    
    @IBAction func boutton4(_ sender: Any) {
        result.text = result.text! + "4"
    }
    
    @IBAction func boutton5(_ sender: Any) {
        result.text = result.text! + "5"
    }
    
    @IBAction func boutton6(_ sender: Any) {
        result.text = result.text! + "6"
    }

    @IBAction func boutton7(_ sender: Any) {
        result.text = result.text! + "7"
    }
    
    @IBAction func boutton8(_ sender: Any) {
        result.text = result.text! + "8"
    }
    
    @IBAction func boutton9(_ sender: Any) {
        result.text = result.text! + "9"
    }
    
    @IBAction func bouttondian(_ sender: Any) {
        result.text = result.text! + "."
    }
    
    @IBAction func bouttonadd(_ sender: Any) {
        jiannum = 1
        temp = Double (result.text!)!
        result.text = ""
        num = 1
    }
    
    @IBAction func bouttonjian(_ sender: Any) {//当jiannum是1的时候“-”代表负号，jiannum是2的时候“-”代表减法
        if jiannum == 1
        {
            result.text = result.text! + "-"
            jiannum = 2
        }else if jiannum == 2
        {
            temp = Double (result.text!)!
            result.text = ""
            num = 2
            jiannum = 1
        }
    }
    
    @IBAction func bouttoncheng(_ sender: Any) {
        jiannum = 1
        temp = Double (result.text!)!
        result.text = ""
        num = 3
    }
    
    @IBAction func bouttonchu(_ sender: Any) {
        jiannum = 1
        temp = Double (result.text!)!
        result.text = ""
        num = 4
    }
    
    @IBAction func bouttonresult(_ sender: Any) {
        
        type = Double(result.text!)!
        switch num {
        case 1:
            result.text = "\(temp! + type!)"
            jiannum = 2
        case 2:
            result.text = "\(temp! - type!)"
            jiannum = 2
        case 3:
            result.text = "\(temp! * type!)"
            jiannum = 2
        case 4:
            result.text = "\(temp! / type!)"
            jiannum = 2
        default:
            result.text = "0"
        }
        //"\(!)"类型转换为字符串
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

