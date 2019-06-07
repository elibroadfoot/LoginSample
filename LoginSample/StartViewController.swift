//
//  StartViewController.swift
//  LoginSample
//
//  Created by Eli Broadfoot on 6/3/19.
//  Copyright © 2019 Broadfoot. All rights reserved.
//

import UIKit
import Firebase

class StartViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //  Customizes the title.
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SnellRoundhand", size: 40)!, NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1, green: 0.7843137255, blue: 0, alpha: 1)]
    }
    
    //  If the current user is already signed in, go straight to home page.
    
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            self.performSegue(withIdentifier: "goToHome", sender: nil)
        }
    }
    
    
    //  When login button is pressed, send to login page.
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToLogin", sender: self)
        
    }
    
    //  When signup button is pressed, send to signup page.
    
    @IBAction func signUpPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "goToSignUp", sender: self)

        
    }
    
}
