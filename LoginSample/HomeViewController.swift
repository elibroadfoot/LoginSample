//
//  HomeViewController.swift
//  LoginSample
//
//  Created by Eli Broadfoot on 6/3/19.
//  Copyright © 2019 Broadfoot. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //  Hides Back button on navigation bar
        
        self.navigationItem.hidesBackButton = true
        
        //  Creates a right bar button for singing out.
        
        let signOutButton = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOutPressed))
        self.navigationItem.rightBarButtonItem  = signOutButton
                
        //  Customizes the title.
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "SnellRoundhand", size: 40)!, NSAttributedString.Key.foregroundColor:#colorLiteral(red: 1, green: 0.7843137255, blue: 0, alpha: 1)]

    }
    
    //  Makes title visible on navigation bar.
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Bananas"
    }
    
    //  Signs out user and returns to the root view controller.
    
    @objc func signOutPressed() {
        do {
            try Auth.auth().signOut()
        }
        catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let initial = storyboard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = initial
    }

}
