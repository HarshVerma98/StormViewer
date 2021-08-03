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
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didpressRec))
        super.viewDidLoad()
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        for x in items {
            if x.hasPrefix("nssl") {
                pic.append(x)
                pic.sort()
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
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    @objc func didpressRec() {
        let link = "https://www.google.com"
        let vc = UIActivityViewController(activityItems: [link], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ids", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = pic[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let vc = storyboard?.instantiateViewController(identifier: "detail") as? DetailViewController {
            vc.selected = pic[indexPath.row]
            vc.title = "Pictures \(indexPath.row + 1) of \(pic.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
