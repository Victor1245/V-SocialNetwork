//
//  RegisterViewController.swift
//  V SocialNetwork
//
//  Created by Максим Грицков on 10.11.2020.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth

public var name = ""

class RegisterViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
    
    @IBAction func create(_ sender: UIButton) {
        let email = nameTF.text! + "@gmail.com"
        let password = passwordTF.text!
        createUser(email: email, password: password)
        
        let ref = Database.database().reference()
        
        name = nameTF.text!
    }
}
