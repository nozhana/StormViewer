//
//  ViewController.swift
//  Project1
//
//  Created by Nozhan Amiri on 4/16/22.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
//                Picture to load
                pictures.append(item)
            }
        }
        
        print(pictures)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        Typecast UIViewController (return value for instantiateViewController as DetailViewController
//        storyboard might be nil if not instantiated from a storyboard, so we use optionals
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {

//            Modify selectedImage property of DetailViewController to be the filename from indexPath retrieved from pictures indices
            vc.selectedImage = pictures[indexPath.row]
            
//            Push the new view controller using navigationController
            navigationController?.pushViewController(vc, animated: true)
        }
//        If either storyboard? or instantiateViewController or typecasting as? DetailViewController fail, the if let clause isn't executed at all. So the code is "safe" but non-functioning.
    }
}

