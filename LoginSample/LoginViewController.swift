//
//  LoginViewController.swift
//  LoginSample
//
//  Created by Eli Broadfoot on 6/3/19.
//  Copyright © 2019 Broadfoot. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //  Customizes the title.
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SnellRoundhand", size: 40)!, NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1, green: 0.7843137255, blue: 0, alpha: 1)]

    }
    
    //  Makes title visible on navigation bar.
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Bananas"
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        //  Logs in user with email and password.
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            
            //  If there is no error, go to home page.
            
            if error == nil {
                self.performSegue(withIdentifier: "loginToHome", sender: self)
            }
            else {
                
                //  If error occurs, show an alert with error.
                
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
    }
    
}
