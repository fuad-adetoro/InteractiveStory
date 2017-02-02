//
//  ViewController.swift
//  InteractiveStory
//
//  Created by Frederico on 02/02/2017.
//  Copyright © 2017 Fuad Adetoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure" {
            guard let pageController = segue.destination as? PageController else {
                return
            }
            
            pageController.page = Adventure.story
        }
    }
}

