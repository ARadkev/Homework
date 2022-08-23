//
//  ViewController.swift
//  Optionals.homework.joystick
//
//  Created by 100nout on 21.08.22.
//

import UIKit

protocol BackgroundColorChangeDelegate: AnyObject {
    var myBackgroundColor: UIColor { get set }
}

class View: UIView {
    
    @IBAction func changeButtonsColorButtonTapped(_ sender: UIButton) {
        
        weak var delegate: BackgroundColorChangeDelegate?

            backgroundColor = delegate?.myBackgroundColor ?? .red
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}
