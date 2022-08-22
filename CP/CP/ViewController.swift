//
//  ViewController.swift
//  CP
//
//  Created by 100nout on 22.08.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var array: [Any] = view.subviews
        
        array.forEach {
            switch $0 {
            case let button as UIButton:
                button.backgroundColor = .red
            case let label as UILabel where label.numberOfLines == 0:
                label.backgroundColor = .systemMint
            case let label as UILabel:
                label.backgroundColor = .blue
            case let view as UIView:
                view.backgroundColor = .purple
                
            default:
                print("Fail")
            }
        }
    }


}

