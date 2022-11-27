//
//  ViewController.swift
//  СР
//
//  Created by AR on 16.11.22.
//

import UIKit
import SDWebImage

struct Photos: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

struct Users: Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
    
struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}

struct Geo: Codable {
    let lat: String
    let lng: String
}

struct MatchedUser: Codable {
    let albumId: Int
    let user: Users
    let title: String
    let url: String
    let thumbnailUrl: String
}

let group = DispatchGroup()

var users: [Users] = [.init(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz")]
var photos: [Photos] = [.init(albumId: 1, id: 1, title: "accusamus beatae ad facilis cum similique qui sunt", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952")]
var matchedUsers: [MatchedUser] = [.init(albumId: 1, user: Users.init(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz"), title: "accusamus beatae ad facilis cum similique qui sunt", url: "https://via.placeholder.com/600/92c952", thumbnailUrl: "https://via.placeholder.com/150/92c952")]

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
//    private var cell1: UITableViewCell {
//        let cell = UITableViewCell()
//        cell.textLabel?.text = String([Users.name])
//        return cell
//    }
    
//    let cellIdentifier = "Cell"
    let cellWith = "cellWith"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        group.enter()
        func loadPhotos () {
            guard  let url = URL(string: "https://jsonplaceholder.typicode.com/photos") else { return }
            var urlRequest = URLRequest(url: url)
//            urlRequest.httpMethod = "GET" // "POST", "DELETE", "PUT"
//            urlRequest.allHTTPHeaderFields = ["Content-Type":"text/html"]
            URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
                guard let data = data else { return print(error!) }
                var photos: [Photos] = []
                do {
                    photos = try JSONDecoder().decode([Photos].self, from: data)
                } catch {
                    print(error)
                }
                group.leave()
            }
            .resume()
        }
        
        group.enter()
        func loadUsers () {
            guard  let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
            var urlRequest = URLRequest(url: url)
//            urlRequest.httpMethod = "GET" // "POST", "DELETE", "PUT"
//            urlRequest.allHTTPHeaderFields = ["Content-Type":"text/html"]
            URLSession.shared.dataTask(with: urlRequest) { [weak self] data, response, error in
                guard let data = data else { return print(error!) }
                var users: [Users] = []
                do {
                    users = try JSONDecoder().decode([Users].self, from: data)
                } catch {
                    print(error)
                }
                group.leave()
            }
            .resume()
        }
        
        group.notify(queue: .main) {
            matchedUsers = users.enumerated().map {
                return MatchedUser(albumId: 1, user: $0.element, title: "accusamus beatae ad facilis cum similique qui sunt", url: photos[$0.offset].url, thumbnailUrl: "https://via.placeholder.com/150/92c952")
            }
            
        }
        
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.register(UINib(nibName: "CellWith", bundle: nil), forCellReuseIdentifier: cellWith)
        tableView.dataSource = self
        tableView.delegate = self
        
        setupViews()
        setupConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellWith) as? CellWith
//        let name = MatchedUser[indexPath.row]
        cell?.label.text = matchedUsers.user
        let currentImageUrl = imageUrls[indexPath.row]
        guard let url = URL(string: currentImageUrl) else {
            return cell ?? UITableViewCell()
        }
        cell?.myImage.sd_setImage(with: url)
        return cell ?? UITableViewCell()
    }
}

extension ViewController: UITableViewDelegate {
}

//extension UIImageView {
//    func loadFrom(URLAddress: String) {
//        guard let url = URL(string: URLAddress) else {
//            return
//        }
//    }
//}
