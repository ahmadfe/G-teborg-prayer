//
//  SecondViewController.swift
//  Göteborg Tid
//
//  Created by Ahamd Al-Said Ahamd on 2017-07-10.
//  Copyright © 2017 Ahamd Al-Said Ahamd. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var dismissButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissButton.layer.cornerRadius = dismissButton.frame.size.width / 2
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissSecondVC(_ sender: AnyObject) {
        
        self.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
