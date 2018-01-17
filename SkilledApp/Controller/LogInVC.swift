//
//  LogInVC.swift
//  SkilledApp
//
//  Created by MacOS on 15/01/2018.
//  Copyright © 2018 amberApps. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LogInVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        let emailBorderStyle = BorderStyle()
        emailBorderStyle.changeBorderStyle(textField: emailText)
        let passwordBorderStyle  = BorderStyle()
        passwordBorderStyle.changeBorderStyle(textField: passwordText)
        emailText.delegate = self
        passwordText.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func logInPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        guard emailText.text != "", passwordText.text != "" else {
            let alert = UIAlertController(title: "Missing information", message: "Please type in missing information", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Success")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "ShowMainViewFromSignIn", sender: self)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    



}
