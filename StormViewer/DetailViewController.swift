//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Harsh Verma on 02/08/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var selected: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let loaded = selected {
            imageView.image = UIImage(named: loaded)
        }
        // Do any additional setup after loading the view.
    }
    
}
