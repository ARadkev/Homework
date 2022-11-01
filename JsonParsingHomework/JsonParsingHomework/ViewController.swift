//
//  ViewController.swift
//  JsonParsingHomework
//
//  Created by AR on 2.11.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = Bundle.main.url(forResource: "homework", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        
        do {
            let commentsDecoder = try! JSONDecoder().decode([Comments].self, from: data)
            print(commentsDecoder.first!.id)
        } catch {
            print("Error")
        }
        
        // Do any additional setup after loading the view.
    }


}

