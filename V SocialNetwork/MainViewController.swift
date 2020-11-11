//
//  MainViewController.swift
//  V SocialNetwork
//
//  Created by Максим Грицков on 10.11.2020.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseAuth


class MainViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    let ref = Database.database().reference()
    
    var currentPost = 0
    var totalPosts = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        ref.child("posts/totalPosts").observeSingleEvent(of: .value) { (DataSnapshot) in
            self.totalPosts = (DataSnapshot.value as? Int)!
            let postToLoad = Int.random(in: 0...self.totalPosts)
            self.ref.child("posts/posts/post\(postToLoad)/text").observeSingleEvent(of: .value) { (DataSnapshot2) in
                self.textView.text = DataSnapshot2.value as? String
            }
            
            self.currentPost = postToLoad
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @IBAction func nextActio(_ sender: Any) {
        ref.child("posts/totalPosts").observeSingleEvent(of: .value) { (DataSnapshot) in
            self.totalPosts = (DataSnapshot.value as? Int)!
            let postToLoad = Int.random(in: 0...self.totalPosts)
            self.ref.child("posts/posts/post\(postToLoad)/text").observeSingleEvent(of: .value) { (DataSnapshot2) in
                self.textView.text = DataSnapshot2.value as? String
            }
        }
    }
}
