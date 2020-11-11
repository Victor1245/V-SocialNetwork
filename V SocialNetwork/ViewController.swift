//
//  ViewController.swift
//  V SocialNetwork
//
//  Created by Максим Грицков on 09.11.2020.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let provider = FUIOAuth.appleAuthProvider()
    
    override func viewWillAppear(_ animated: Bool) {
        let handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          // ...
        }
        
        Auth.auth().removeStateDidChangeListener(handle)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        Auth.auth().signInAnonymously() { (authResult, error) in
//          // ...
//        }
        
        createUser(email: "test3@gmail.com", password: "123456")
    }
    
    func createUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          // ...
        }
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
          // ...
        }

    }

    @IBAction func login(_ sender: UIButton) {
        let email = nameTF.text! + "@gmail.com"
        let password = passwordTF.text!
        signIn(email: email, password: password)
    }
    
}

