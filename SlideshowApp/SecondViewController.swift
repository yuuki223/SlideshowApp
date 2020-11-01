//
//  SecondViewController.swift
//  SlideshowApp
//
//  Created by 高橋有輝 on 2020/11/01.
//  Copyright © 2020 yuuki.takahashi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var bigImage: UIImageView!
    
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bigImage.image = self.image
    }
    
    @IBAction func backbutton(_ sender: Any) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
