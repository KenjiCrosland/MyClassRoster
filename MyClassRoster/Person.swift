//
//  Person.swift
//  MyClassRoster
//
//  Created by Kenji Crosland on 6/13/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class Person: NSObject {
  var firstName : String
  var lastName : String
  var image : UIImage?
  
  init(first: String, last: String) {
    firstName = first
    lastName = last
  }
  
  //Coder and decoder boilerplate code built with help from slides and sample code
  required init(coder aDecoder: NSCoder) {
    self.firstName = aDecoder.decodeObjectForKey("firstName") as! String
    self.lastName = aDecoder.decodeObjectForKey("lastName") as! String
    if let decodedImage = aDecoder.decodeObjectForKey("image") as? UIImage {
      self.image = decodedImage
    }
  }
  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(self.firstName, forKey: "firstName")
    aCoder.encodeObject(self.lastName, forKey: "lastName")
    if self.image != nil {
      aCoder.encodeObject(self.image!, forKey: "image")
    }
  }
  

}
