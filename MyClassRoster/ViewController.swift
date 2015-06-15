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
  //Create the array of people in the roster
  var people = [Person]()
  
  //Create each individual person
  let ned = Person(first: "Eddard", last: "Stark")
  let reek = Person(first: "Theon", last: "Greyjoy")
  let tyrion = Person(first: "Tyrion", last: "Lannister")
  let rob = Person(first: "Robert", last: "Baratheon")
  let dany = Person(first: "Daenerys", last: "Targaryen")

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //make the view controller the datasource of the tableview
    self.tableView.dataSource = self
    
    //append each person to the person array
    people.append(ned)
    people.append(reek)
    people.append(tyrion)
    people.append(rob)
    people.append(dany)
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //number of rows is equal to number of people in the people array
    return self.people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
    //select the person that corresponds to the current row, name to display is the first name and last name of the person
    let personToDisplay = people[indexPath.row]
    let nameToDisplay = personToDisplay.firstName + " " + personToDisplay.lastName
    cell.textLabel?.text = nameToDisplay
    
    return cell
  }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      //Pass selected person over to DetailViewController
      var detailViewConroller = segue.destinationViewController as! DetailViewController
      
      var selectedIndexPath = tableView.indexPathForSelectedRow()
      
      var selectedPerson = people[selectedIndexPath!.row]
      
      detailViewConroller.person = selectedPerson
    }
  }
}

