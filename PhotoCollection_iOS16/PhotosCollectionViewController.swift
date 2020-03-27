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
        setTheme()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "addPhotoShowSegue":
            guard let destintationViewController = segue.destination as? PhotoDetailViewController else { return }
            destintationViewController.photoController = photoController
            destintationViewController.themeHelper = themeHelper
        case "photoCellShowSegue":
            guard let destinationViewController = segue.destination as? PhotoDetailViewController else { return }
            guard let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            destinationViewController.photoController = photoController
            destinationViewController.photo = photoController.photos[indexPath.item]
            destinationViewController.themeHelper = themeHelper
        case "selectThemeModalSegue":
            guard let destinationViewController = segue.destination as? ThemeSelectionViewController else { return }
            destinationViewController.themeHelper = themeHelper
        default:
            break
        }
    }
    
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


