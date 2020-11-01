//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 高橋有輝 on 2020/10/29.
//  Copyright © 2020 yuuki.takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var slideshow: UIImageView!
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var nextbutton: UIButton!
    
    @IBOutlet weak var backbutton: UIButton!
    
    var image1 = UIImage(named : "E958FC15-2E56-4B5D-8695-42560342A035_1_105_c.jpeg")
    var image2 = UIImage(named : "D3421460-8510-4571-975C-7F47CE73CDB4_1_105_c.jpeg")
    var image3 = UIImage(named : "5FC51C5E-B295-44F3-92F2-46C3AB79DDE9_1_105_c.jpeg")
    var timer : Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
            slideshow.image = image1
    }
    
    @IBAction func next(_ sender: Any) {
        if self.timer == nil {
            if slideshow.image == image1{
                    slideshow.image = image2
            }
            else if slideshow.image == image2{
                slideshow.image = image3
            }
            else if slideshow.image == image3{
                slideshow.image = image1
            }
        }
    }
    @IBAction func back(_ sender: Any) {
        if self.timer == nil {
            if slideshow.image == image3{
                    slideshow.image = image2
            }
            else if slideshow.image == image2{
                slideshow.image = image1
            }
            else if slideshow.image == image1{
                slideshow.image = image3
            }
        }
    }
    @IBAction func startstop(_ sender: Any) {
        
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImg), userInfo: nil, repeats: true)
            button.setTitle ("停止",for:.normal)
            backbutton.isEnabled = false
            nextbutton.isEnabled = false
        }else{
            self.timer.invalidate()
                self.timer = nil
                button.setTitle("再生", for:.normal)
            backbutton.isEnabled = true
            nextbutton.isEnabled = true
        }
               
    }
    @objc func changeImg (){
           if slideshow.image == image1{
                   slideshow.image = image2
           }
           else if slideshow.image == image2{
               slideshow.image = image3
           }
           else if slideshow.image == image3{
               slideshow.image = image1
           }
       }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let secondViewController:SecondViewController = segue.destination as! SecondViewController
        if self.timer != nil{
                   self.timer.invalidate()
                   self.timer = nil
                   button.setTitle("再生", for:.normal)
               }
        
        if slideshow.image == image1 {
             secondViewController.image = image1
        }
        else if slideshow.image == image2 {
            secondViewController.image = image2
        }
        else if slideshow.image == image3 {
            secondViewController.image = image3
        }
       
       
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        if nextbutton.isEnabled == false{
            nextbutton.isEnabled = true
        }
        if backbutton.isEnabled == false{
                   backbutton.isEnabled = true
               }
    }
    
    
}

