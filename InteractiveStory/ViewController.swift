//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Frederico on 02/02/2017.
//  Copyright © 2017 Fuad Adetoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldBottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure" {
            do {
                if let name = textField.text {
                    if name == "" {
                        throw AdventureError.nameNotProvided
                    } else {
                        guard let pageController = segue.destination as? PageController else {
                            return
                        }
                        
                        pageController.page = Adventure.story(withName: name)
                    }
                }
            } catch AdventureError.nameNotProvided {
                let alertController = UIAlertController(title: "Name Not Provided", message: "Provide a name to start the story", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            } catch let error {
                fatalError("\(error)")
            }
        }
    }
    
    func keyboardWillShow(_ notification: Notification) {
        if let info = notification.userInfo, let keyboardFrame = info[UIKeyboardFrameEndUserInfoKey] as? NSValue {
            let frame = keyboardFrame.cgRectValue
            
            textFieldBottomConstraint.constant = frame.size.height + 10
            
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        textFieldBottomConstraint.constant = 40
        
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
        
        return true
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}







