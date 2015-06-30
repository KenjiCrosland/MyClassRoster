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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //make the view controller the datasource of the tableview
    self.tableView.dataSource = self
    
    
    //Load from NSKeyedArchiver
    if let archivedPeopleArray = loadFromArchive()
    {
      people = archivedPeopleArray
    }
    else {
    //If the archive returns nil, load from the plist and Save to the Archive
      loadPeopleFromPlist()
      saveToArchive()
    }
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    saveToArchive()
    tableView.reloadData()
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //number of rows is equal to number of people in the people array
    return self.people.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! PersonCell
    //select the person that corresponds to the current row, name to display is the first name and last name of the person
    let personToDisplay = people[indexPath.row]
    
    //Change firstname and lastname label
    cell.firstNameLabel.text = personToDisplay.firstName
    cell.lastNameLabel.text = personToDisplay.lastName
    
    if let image = personToDisplay.image
    {
      cell.personImage.image = image
    }
    else
    {
    //Default display image is Eddard Stark
      cell.personImage.image = UIImage(named: "Eddard")
    }
    
    //Round the image
    cell.personImage.layer.cornerRadius = 25
    
    //Round the Background Drop Shadow
    cell.shadowView.layer.cornerRadius = 25
    
    //Configure the Background Drop Shadow
    cell.shadowView.layer.shadowOffset = CGSizeMake(-3.0, 3.0)
    cell.shadowView.layer.shadowRadius = 3
    cell.shadowView.layer.shadowOpacity = 0.4
    
    return cell
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowDetailViewController" {
      //Pass selected person over to DetailViewController
      if let detailViewConroller = segue.destinationViewController as? DetailViewController,
        selectedIndexPathRow = tableView.indexPathForSelectedRow()?.row
      {
        var selectedPerson = people[selectedIndexPathRow]
        detailViewConroller.selectedPerson = selectedPerson
      }
    }
  }
  
  //Load an array of dictionaries from the plist and use a for in loop to create an array of People for the tableview
  func loadPeopleFromPlist() {
    if let peoplePath = NSBundle.mainBundle().pathForResource("People", ofType: "plist"),
      peopleObjects = NSArray(contentsOfFile: peoplePath) as? [[String : String]] {
        for person in peopleObjects {
          if let firstName = person["firstName"],
            lastName = person["lastName"]{
              let newPerson = Person(first: firstName, last: lastName)
              people.append(newPerson)
          }
        }
    }
  }
  
  //loadFromArchive and saveToArchive functions created with a lot of help by referencing the sample code
  func loadFromArchive() -> [Person]? {
    if let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as? String,
      archivedPeopleArray = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [Person]{
        println("loadingfromarchive")
        
        return archivedPeopleArray
        
    }
    return nil
  }
  
  func saveToArchive() {
    if let documentsPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] as? String {
      println("savingtoarchive")
      NSKeyedArchiver.archiveRootObject(people, toFile:documentsPath + "/archive")
      
    }
  }
  
}

