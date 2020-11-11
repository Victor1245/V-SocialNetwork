//
//  CreateViewController.swift
//  V SocialNetwork
//
//  Created by Максим Грицков on 11.11.2020.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth


class CreateViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    let ref = Database.database().reference()
    
    var newPostNumber = 0
    
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

    @IBAction func publishAction(_ sender: UIBarButtonItem) {
        ref.child("posts/totalPosts").observeSingleEvent(of: .value) { (DataSnapshot) in
            self.newPostNumber = (DataSnapshot.value as? Int)! + 1
            var newPostText = ""
            newPostText = self.textView.text
            
            self.ref.child("posts/posts/post\(self.newPostNumber)/text").setValue(newPostText)
            
            self.ref.child("posts/totalPosts").setValue((DataSnapshot.value as? Int)! + 1)
        }
    }
}
