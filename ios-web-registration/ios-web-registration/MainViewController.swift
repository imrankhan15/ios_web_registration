//
//  ViewController.swift
//  ios-web-registration
//
//  Created by Muhammad Faisal Imran Khan on 6/2/19.
//  Copyright © 2019 MI Apps. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {

    let URL_USER_REGISTER = "http://restaurantsbooker.de/register.php";
    @IBOutlet weak var textFieldUser: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldEmail: UITextField!
    
    @IBOutlet weak var textFieldName: UITextField!
    
    @IBOutlet weak var textFieldPhone: UITextField!
    
    @IBOutlet weak var lblMessage: UILabel!
    @IBAction func buttonRegister(_ sender: UIButton) {
        
        //creating parameters for the post request
        let parameters: Parameters=[
            "username":textFieldUser.text!,
            "password":textFieldPassword.text!,
            "name":textFieldName.text!,
            "email":textFieldEmail.text!,
            "phone":textFieldPhone.text!
        ]
        
        //Sending http post request
        AF.request(URL_USER_REGISTER, method: .post, parameters: parameters).responseJSON
            {
                response in
                //printing response
                print(response)
                
                //getting the json value from the server
                if let result = response.result.value {
                    
                    //converting it as NSDictionary
                    let jsonData = result as! NSDictionary
                    
                    //displaying the message in label
                    self.lblMessage.text = jsonData.value(forKey: "message") as! String?
                }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

