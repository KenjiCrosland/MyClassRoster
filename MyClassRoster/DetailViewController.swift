//
//  DetailViewController.swift
//  MyClassRoster
//
//  Created by Kenji Crosland on 6/13/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  var person: Person!

  @IBOutlet weak var firstNameLabel: UILabel!
  
  @IBOutlet weak var lastNameLabel: UILabel!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      
      //Update the first name and last name labels in the view controller
      firstNameLabel.text = person.firstName
      lastNameLabel.text = person.lastName
    }

}
