//
//  PhotoDetailViewController.swift
//  PhotoCollection_iOS16
//
//  Created by Stephanie Ballard on 3/26/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    
    var photoController: PhotoController?
    var photo: Photo?
    var themeHelper: ThemeHelper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTheme()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhotoButton(_ sender: UIButton) {
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    func setTheme() {
        guard let themePreference = themeHelper?.themePreference else { return }
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = .darkGray
        case "Pink":
            backgroundColor = .systemPink
        default:
            break
        }
        
        view.backgroundColor = backgroundColor
    }
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

