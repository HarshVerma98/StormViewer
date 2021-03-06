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
    var totalCount = 0
    var selectedItem = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let loaded = selected {
            imageView.image = UIImage(named: loaded)
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didPressShare))
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func didPressShare() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.2) else {
            return
        }
        let vc = UIActivityViewController(activityItems: [image, selected!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
}
