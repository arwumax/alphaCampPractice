//
//  LoginViewController.swift
//  alphaCampApp
//
//  Created by WuKwok Ho on 1/4/2016.
//  Copyright © 2016 Wu Kwok Ho. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.becomeFirstResponder()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    

    @IBAction func loginButton(sender: AnyObject) {
        let email = emailTextField.text
        let password = passwordTextField.text
        let loginURL = "https://dojo.alphacamp.co/api/v1/login"
        let APIKey = "120bf6fd011d63cb681d466c1092e27cff0e314d"
        
        Alamofire.request(.POST, loginURL, parameters: ["email":email!, "password": password!, "api_key": APIKey]).responseJSON { response in
            
            if JSON(response.result.value!)["message"].stringValue == "Ok" {
                let auth_token = JSON(response.result.value!)["auth_token"].stringValue
                let userDefault = NSUserDefaults.standardUserDefaults()
                userDefault.setObject(auth_token, forKey: "auth_token")
                userDefault.synchronize()
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            
            if JSON(response.result.value!)["message"].stringValue == "Failed" {
                self.warningAlert("Invalid email or password")
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
            }
        }
    }
    func warningAlert (message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)

    }}