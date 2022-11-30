//
//  CellWith.swift
//  СР
//
//  Created by AR on 27.11.22.
//

import UIKit

class CellWith: UITableViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func plusButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBOutlet weak var myImage: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        deleteUsers()
    }
    
    func deleteUsers() {
        guard  let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "DELETE"
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in }
    }
    
    func addUsers() {
        guard  let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in }
    }
    
}
