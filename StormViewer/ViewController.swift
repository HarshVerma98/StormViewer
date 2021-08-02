//
//  ViewController.swift
//  StormViewer
//
//  Created by Harsh Verma on 02/08/21.
//

import UIKit

class ViewController: UIViewController {

    var pic = [String]()
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        for x in items {
            if x.hasPrefix("nssl") {
                pic.append(x)
            }
        }
        print(pic.count)
        print(pic)
        setupTable()
        // Do any additional setup after loading the view.
    }
    
    func setupTable() {
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ids")
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ids", for: indexPath)
        cell.textLabel?.text = pic[indexPath.row]
        return cell
    }
    
    
}
