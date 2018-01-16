//
//  RegisterVC.swift
//  SkilledApp
//
//  Created by MacOS on 11/01/2018.
//  Copyright © 2018 amberApps. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterVC: UIViewController, UITextFieldDelegate  {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var secondNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var reenteredPasswordTextField: UITextField!
    
    var textFields = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        textFields.append(firstNameTextField)
        textFields.append(secondNameTextField)
        textFields.append(emailTextField)
        textFields.append(passwordTextField)
        textFields.append(reenteredPasswordTextField)
        
        for textField in textFields {
            textField.delegate = self
            let currentBorderStyle = BorderStyle()
            currentBorderStyle.changeBorderStyle(textField: textField)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func pressedSignUp(_ sender: UIButton) {
        SVProgressHUD.show()
        guard firstNameTextField.text != "", secondNameTextField.text != "", emailTextField.text != "", passwordTextField.text != "", reenteredPasswordTextField.text != "" else {
            let alert = UIAlertController(title: "Missing information", message: "Please type in missing information", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard passwordTextField.text == reenteredPasswordTextField.text else {
            let alert = UIAlertController(title: "Check password", message: "Reentered password does not match your password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

            return
        }
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("Success")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "ShowMainViewFromRegister", sender: self)
            }
        }
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
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
