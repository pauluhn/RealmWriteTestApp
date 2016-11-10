//
//  ViewController.swift
//  RealmWriteTestApp
//
//  Created by Paul Uhn on 11/8/16.
//  Copyright © 2016 Paul Uhn. All rights reserved.
//

import UIKit
import RealmSwift
import RealmWriteTestFramework

class ViewController: UIViewController {

    fileprivate let client = ContactClient()
    fileprivate var contactResult: ContactResult!
    fileprivate var results: Results<Contact>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        contactResult = ContactResult(predicate: nil, sort: "id", ascending: true) { (i, m, d, e) in
            print("\(i.count),\(m.count),\(d.count),\(e):\(self.contactResult.results?.count)")
        }
        contactResult.start()
        results = contactResult.results
        
        client.getAllContactsAndGroups {
            print("finished")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
