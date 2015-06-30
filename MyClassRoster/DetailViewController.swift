//
//  DetailViewController.swift
//  MyClassRoster
//
//  Created by Kenji Crosland on 6/13/15.
//  Copyright (c) 2015 Kenji Crosland. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet weak var firstNameTextField: UITextField!
  @IBOutlet weak var lastNameTextField: UITextField!
  @IBOutlet weak var personImage: UIImageView!
  
  //I referenced the sample code to help build the takePicture action and imagePickerController functions 
  @IBAction func takePicture(sender: AnyObject) {
    if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
      imagePicker.sourceType = .Camera}
    else {
    
      imagePicker.sourceType = .PhotoLibrary
    }
    imagePicker.allowsEditing = true
    presentViewController(imagePicker, animated: true, completion: nil)
    
  }
  
  var selectedPerson: Person!
  let imagePicker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    firstNameTextField.delegate = self
    lastNameTextField.delegate = self
    imagePicker.delegate = self
    
    //Update the first name and last name labels in the view controller
    firstNameTextField.text = selectedPerson.firstName
    lastNameTextField.text = selectedPerson.lastName
    if selectedPerson.image != nil {
      personImage.image = selectedPerson.image
    } else
    {
      personImage.image = UIImage(named: "Eddard")
    }
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
    if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
      personImage.image = pickedImage
      selectedPerson.image = pickedImage
    }
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func textFieldDidEndEditing(textField: UITextField) {
    if textField.tag == 0 {
      selectedPerson.firstName = textField.text
    }
    else
    {
      selectedPerson.lastName = textField.text
    }
  }
  
}
