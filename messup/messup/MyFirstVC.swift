//
//  MyFirstVC.swift
//  messup
//
//  Created by appinventiv on 05/09/17.
//  Copyright © 2017 yogesh singh negi. All rights reserved.
//

import UIKit
import FirebaseDatabase

//=============================================================//
//MARK: MyFirstVC Class
//=============================================================//

class MyFirstVC: UIViewController {
    
//=============================================================//
//MARK: Stored Properties
//=============================================================//
    
    var ref: DatabaseReference!
    
    var postMessageArray = [String]()
    
//=============================================================//
//MARK: Defining IBOutlet
//=============================================================//
    
    @IBOutlet weak var messageDisplayTableView: UITableView!
    
//=============================================================//
//MARK: View Methods
//=============================================================//
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.messageDisplayTableView.delegate = self
        self.messageDisplayTableView.dataSource = self
        self.navigationItem.title = "Message From Firebase"
        
        //Initializing reference object of DatabaseRefernce
        ref = Database.database().reference()
        
        //Reading vaules from the Firebase through observe method
        ref.child("Posts").observe( .childAdded, with: { (tempValue) in
            
            //Retriving only String Value from tempValue
            guard let post = tempValue.value as? String else { fatalError("Snapshot failed") }
            self.postMessageArray.append(post)
            
            //Reloading TableView to Display the content from Firebase dynamically
            self.messageDisplayTableView.reloadData()
        })
    }

}

//=============================================================//
//MARK: MyFirstVC Class Extension
//=============================================================//

extension MyFirstVC: UITableViewDelegate, UITableViewDataSource {
    
//=============================================================//
//MARK: Setting Number Of Rows
//=============================================================//
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postMessageArray.count
    }
    
//=============================================================//
//MARK: Setting Row View
//=============================================================//
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: "classForRowCell_ID", for: indexPath) as? ClassForRowCell else { fatalError("Cell is not loaded into memory") }
        
        tableCell.textLabel?.text = postMessageArray[indexPath.row]
        return tableCell
        
    }
    
    
}

//=============================================================//
//MARK: Class for TableView Cell UIViews
//=============================================================//

class ClassForRowCell: UITableViewCell {
    
    
}

