//
//  PhotosCollectionViewController.swift
//  PhotoCollection_iOS16
//
//  Created by Stephanie Ballard on 3/26/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photoController = PhotoController()
    let themeHelper = ThemeHelper()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else { fatalError("Cell is not a photo cell") }
        
        let photo = photoController.photos[indexPath.item]
        cell.photo = photo
        return cell
    }

    func setTheme() {
        guard let themePreference = themeHelper.themePreference else { return }
        var backgroundColor: UIColor!
        
        switch themePreference {
        case "Dark":
            backgroundColor = .darkGray
        case "Pink":
            backgroundColor = .systemPink
        default:
            break
        }
        
        collectionView.backgroundColor = backgroundColor
    }
}

// TODO: Segues
