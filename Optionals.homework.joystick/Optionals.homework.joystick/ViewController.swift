//
//  ViewController.swift
//  Optionals.homework.joystick
//
//  Created by 100nout on 21.08.22.
//

import UIKit

//class Joystick: UIViewController {
//
//    @IBOutlet weak var topButton: UIButton!
//    @IBOutlet weak var bottomButton: UIButton!
//    @IBOutlet weak var leftButton: UIButton!
//    @IBOutlet weak var rightButton: UIButton!
//
//    @IBAction func hideJoystickButtonTapped(_ sender: UIButton) {
//        topButton.removeFromSuperview()
//        bottomButton.removeFromSuperview()
//        leftButton.removeFromSuperview()
//        rightButton.removeFromSuperview()
//    }
//
//    deinit {
//        print("Joystick was deinited")
//    }
//}

class ViewController: UIViewController {
    
    @IBOutlet var topButton: UIButton!
    @IBOutlet var bottomButton: UIButton!
    @IBOutlet var leftButton: UIButton!
    @IBOutlet var rightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showHideButtonTapped(_ sender: UIButton) {
//        topButton.removeFromSuperview()
        topButton.isHidden = true
        bottomButton.isHidden = true
        leftButton.isHidden = true
        rightButton.isHidden = true
    }
    
    @IBAction func respondTapGesture(_ sender: UITapGestureRecognizer) {
        topButton.isHidden = false
        bottomButton.isHidden = false
        leftButton.isHidden = false
        rightButton.isHidden = false
    }
    
    deinit {
        print("View Controller is deinited")
    }
    
}

