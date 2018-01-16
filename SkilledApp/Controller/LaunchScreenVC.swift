//
//  LaunchScreenVC.swift
//  SkilledApp
//
//  Created by MacOS on 10/01/2018.
//  Copyright © 2018 amberApps. All rights reserved.
//

import UIKit

class LaunchScreenVC: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(showNavigationController), with: nil, afterDelay: 3)
    }
    
    @objc func showNavigationController() {
        performSegue(withIdentifier: "LaunchScreenSegue", sender: self)
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
