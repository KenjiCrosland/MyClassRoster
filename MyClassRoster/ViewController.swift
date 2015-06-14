//
//  ViewController.swift
//  MyClassRoster
//
//  Created by Kenji Crosland on 6/3/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  var people = [Person]()
  let ned = Person(first: "Eddard", last: "Stark")
  let drog = Person(first: "Khal", last: "Drogo")
  let tyrion = Person(first: "Tyrion", last: "Lannister")
  let bran = Person(first: "Brandon", last: "Stark")
  let dany = Person(first: "Daenerys", last: "Targaryen")

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.tableView.dataSource = self
    people.append(ned)
    people.append(drog)
    people.append(tyrion)
    people.append(bran)
    people.append(dany)
  }
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    let personToDisplay = people[indexPath.row]
    let nameToDisplay = personToDisplay.firstName + " " + personToDisplay.lastName
    cell.textLabel?.text = nameToDisplay
    
    return cell
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      var detailViewConroller = segue.destinationViewController as! DetailViewController
      
      var selectedIndexPath = tableView.indexPathForSelectedRow()
      
      var selectedPerson = people[selectedIndexPath!.row]
      
      detailViewConroller.person = selectedPerson
    }
  }
}

