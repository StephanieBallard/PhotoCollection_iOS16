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
        updateViews()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhotoButton(_ sender: UIButton) {
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let image = imageView.image,
            let imageData = image.pngData(),
            let title = textField.text else { return }
        
        if let photo = photo {
            photoController?.update(photo: photo, imageData: photo.imageData, title: photo.title)
        } else {
            photoController?.create(imageData: imageData, title: title)
        }
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        // create an update views function that takes the property values of the photo object, if it isn't nil
        guard let photo = photo else { return }
        // sets them in the appropriate UI element, use the UIImage(data: Data) init to convert the photo's imageData to a UIImage
        imageView.image = UIImage(data: photo.imageData)
        textField.text = photo.title
        self.title = photo.title
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

