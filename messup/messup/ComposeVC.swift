//
//  ComposeVC.swift
//  messup
//
//  Created by appinventiv on 05/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//

import UIKit
import FirebaseDatabase

//=============================================================//
//MARK: ComposeVC Class
//=============================================================//

class ComposeVC: UIViewController {
    
//=============================================================//
//MARK: Stored Properties - reference object of DatabaseReference
//=============================================================//
    
    var ref: DatabaseReference!
    
//=============================================================//
//MARK: Defining IBOutlet
//=============================================================//
    
    @IBOutlet weak var messageTextView: UITextView!
    
//=============================================================//
//MARK: View Methods
//=============================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initializing reference object of DatabaseReference
        ref = Database.database().reference()
    }
    
//=============================================================//
//MARK: Defining IBActions
//=============================================================//

    @IBAction func deleteMessageBtnTapped(_ sender: UIBarButtonItem) {
        
        //Going back to the privious View Controller
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addMessageBtnTapped(_ sender: UIBarButtonItem) {
        
        if messageTextView.text != ""{
            //Storing or Inserting Values from the textView
            ref.child("Posts").childByAutoId().setValue(messageTextView.text)
        }
        
        //Going back to the privious View Controller
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}
