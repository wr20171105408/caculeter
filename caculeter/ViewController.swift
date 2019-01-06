//
//  ViewController.swift
//  caculeter
//
//  Created by s20171105408 on 2018/10/27.
//  Copyright © 2018年 s20171105408. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var result: UITextField!
    var re = 0//判别输入符号之前是否存在数
    var b = 0 //用来判别小数点是否已出现
    var opera = 1//运算符是否按过了
    var num:Double?//数
    var op:Int?//现在运算符
    var temp:Int? //后一个运算符
    public struct Stack<T> {//堆栈
        fileprivate var array = [T]()
        public var isEmpty: Bool {
            return array.isEmpty
        }
        public var count: Int {
            return array.count
        }
        public mutating func push(_ element: T) {
            array.append(element)
        }
        public mutating func pop() -> T? {
            return array.popLast()
        }
        public var top: T? {
            return array.last
        }
    }
    var numstack = Stack<Double>()//存储数字的堆栈
    var opstack = Stack<Int>()//存储操作数的堆栈
    var tnumstack = Stack<Double>()//计算数字的堆栈
    var topstack = Stack<Int>()//计算操作符的堆栈
    
    
    @IBAction func number0(_ sender: Any) {
        if re == 1 {
            result.text = "0"
            opera = 0
        }else{
            result.text = result.text! + "0"
            opera = 0
        }
    }
    
    @IBAction func number1(_ sender: Any) {
        if re == 1 {
            result.text = "1"
            opera = 0
        }else{
            result.text = result.text! + "1"
            opera = 0
        }
    }
    
    @IBAction func number2(_ sender: Any) {
        if re == 1 {
            result.text = "2"
            opera = 0
        }else{
            result.text = result.text! + "2"
            opera = 0
        }
    }
    
    @IBAction func number3(_ sender: Any) {
        if re == 1 {
            result.text = "3"
            opera = 0
        }else{
            result.text = result.text! + "3"
            opera = 0
        }
    }
    
    @IBAction func number4(_ sender: Any) {
        if re == 1 {
            result.text = "4"
            opera = 0
        }else{
            result.text = result.text! + "4"
            opera = 0
        }
    }
    @IBAction func number5(_ sender: Any) {
        if re == 1{
            result.text = "5"
            opera = 0
        }else{
            result.text = result.text! + "5"
            opera = 0
        }
    }
    
    @IBAction func number6(_ sender: Any) {
        if re == 1 {
            result.text = "6"
            opera = 0
        }else{
            result.text = result.text! + "6"
            opera = 0
        }
    }
    
    @IBAction func number7(_ sender: Any) {
        if re == 1 {
            result.text = "7"
            opera = 0
        }else{
            result.text = result.text! + "7"
            opera = 0
        }
    }
    
    @IBAction func number8(_ sender: Any) {
        if re == 1 {
            result.text = "8"
            opera = 0
        }else{
            result.text = result.text! + "8"
            opera = 0
        }
    }
    
    @IBAction func number9(_ sender: Any) {
        if re == 1 {
            result.text = "9"
            opera = 0
        }else{
            result.text = result.text! + "9"
            opera = 0
        }
    }
    
    @IBAction func point(_ sender: Any) {
        if result.text! != "" && b == 0{
            result.text = result.text! + "."
            b = 1
        }
        if b == 1 && result.text! != ""{
            result.text = result.text! + ""
        }
    }
    
    @IBAction func sign(_ sender: Any) {
        if result.text! != ""{
            result.text = "\(-Double(result.text!)!)"
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        result.text = ""
        num = 0
        re = 0
        opera = 1
        b = 0
        while opstack.isEmpty == false {
            var a = opstack.pop()!
        }
        while numstack.isEmpty == false {
            var b = numstack.pop()!
            
        }
    }
    
    
    @IBAction func add(_ sender: Any) {//加
        if opera == 0{
            opstack.push(1)
            numstack.push(Double(result.text!)!)
            result.text = ""
            opera = 1
            b = 0
        }
    }
    
    @IBAction func subtract(_ sender: Any) {//减
        if opera == 0 {
            opstack.push(2)
            numstack.push(Double(result.text!)!)
            result.text = ""
            opera = 1
            b = 0
        }
    }
    
    @IBAction func multiply(_ sender: Any) {//乘\
        if opera == 0 {
            opstack.push(3)
            numstack.push(Double(result.text!)!)
            result.text = ""
            opera = 1
            b = 0
        }
    }
    
    @IBAction func divide(_ sender: Any) {//除
        if opera == 0{
            opstack.push(4)
            numstack.push(Double(result.text!)!)
            result.text = ""
            opera = 1
            b = 0
        }
    }
    @IBAction func result(_ sender: Any) {
        if result.text! == "" {
            result.text = "\(numstack.pop()!)"
            while opstack.isEmpty == false{
                _ = opstack.pop()!
            }
        }else if numstack.isEmpty == true && result.text! != ""{
             result.text = ""
            while opstack.isEmpty == false{
                _ = opstack.pop()!
            }
        }else{
            numstack.push(Double(result.text!)!)
            while numstack.isEmpty == false {
                tnumstack.push(numstack.pop()!)
            }
            while opstack.isEmpty == false {
                 topstack.push(opstack.pop()!)
            }
            while topstack.isEmpty == false {
                op = topstack.pop()
                if op == 1
                {
                    if topstack.isEmpty == false//计算优先级
                    {
                        temp = topstack.pop()!
                        topstack.push(temp!)
                    }else{
                        temp = 0
                    }
                    
                    if temp == 3 || temp == 4
                    {
                        if temp == 3{
                            //1 + 2 * 3
                            numstack.push(tnumstack.pop()!)
                            numstack.push(tnumstack.pop()!)
                            numstack.push(tnumstack.pop()!)
                            num = numstack.pop()!
                            num = numstack.pop()! * num!
                            
                            tnumstack.push(num!)
                            tnumstack.push(numstack.pop()!)
                            _ = topstack.pop()!//出已算符号
                            topstack.push(op!)
                        }else if temp == 4{
                            numstack.push(tnumstack.pop()!)
                            numstack.push(tnumstack.pop()!)
                            numstack.push(tnumstack.pop()!)
                            num = numstack.pop()!
                            num = numstack.pop()! / num!
                            
                            tnumstack.push(num!)
                            tnumstack.push(numstack.pop()!)
                            _ = topstack.pop()!//出已算符号
                            topstack.push(op!)
                        }
                        
                    }else{
                        num = tnumstack.pop()!
                        num = num! + tnumstack.pop()!
                        tnumstack.push(num!)
                    }
                }else if op == 2
                {
                    if topstack.isEmpty == false//计算优先级
                    {
                        temp = topstack.pop()!
                        topstack.push(temp!)
                    }else{
                        temp = 0
                    }
                    
                    if temp == 3 || temp == 4
                    {
                        if temp == 3{
                            //1 + 2 * 3
                            numstack.push(tnumstack.pop()!)
                            numstack.push(tnumstack.pop()!)
                            numstack.push(tnumstack.pop()!)
                            num = numstack.pop()!
                            num = numstack.pop()! * num!
                            
                            tnumstack.push(num!)
                            tnumstack.push(numstack.pop()!)
                            _ = topstack.pop()!//出已算符号
                            topstack.push(op!)
                        }else if temp == 4{
                            numstack.push(tnumstack.pop()!)
                            numstack.push(tnumstack.pop()!)
                            numstack.push(tnumstack.pop()!)
                            num = numstack.pop()!
                            num = numstack.pop()! / num!
                            
                            tnumstack.push(num!)
                            tnumstack.push(numstack.pop()!)
                            _ = topstack.pop()!//出已算符号
                            topstack.push(op!)
                        }
                        
                    }else{
                        num = tnumstack.pop()!
                        num = num!-tnumstack.pop()!
                        tnumstack.push(num!)
                    }
                }else if op == 3
                {
                    num = tnumstack.pop()!
                    num = num!*tnumstack.pop()!
                    tnumstack.push(num!)
                }else if op == 4
                {
                    num = tnumstack.pop()!
                    num = num!/tnumstack.pop()!
                    tnumstack.push(num!)
                }
            }
            result.text = "\(tnumstack.pop()!)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

