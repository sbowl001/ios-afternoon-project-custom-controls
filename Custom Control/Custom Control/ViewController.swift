//
//  ViewController.swift
//  Custom Control
//
//  Created by Stephanie Bowles on 6/10/19.
//  Copyright © 2019 Stephanie Bowles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func updateRating(_ ratingControl: CustomControl) {
//        self.title = "User Rating: \(ratingControl.value) \(stars)"
        self.title = "User Rating: N Stars"
    }
    
}

