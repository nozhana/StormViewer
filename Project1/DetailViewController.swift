//
//  DetailViewController.swift
//  Project1
//
//  Created by Nozhan Amiri on 4/16/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Set navbar Title to selected image name
        title = selectedImage
//        Never display large titles on this view
        navigationItem.largeTitleDisplayMode = .never

//        Unpacking selectedImage as an optional safely and loading it in a UIImage type
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        Hide navbar when view appears
        navigationController?.hidesBarsOnTap = true
        
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        Show navbar when view disappears
        navigationController?.hidesBarsOnTap = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
