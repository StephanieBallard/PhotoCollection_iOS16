//
//  PhotoController.swift
//  PhotoCollection_iOS16
//
//  Created by Stephanie Ballard on 3/26/20.
//  Copyright © 2020 Stephanie Ballard. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func create(imageData: Data, title: String) {
        let newPhoto = Photo(imageData: imageData, title: title)
        photos.append(newPhoto)
    }
    
    func update(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        var scratch = photo
        scratch.imageData = imageData
        scratch.title = title
        
        photos.remove(at: index)
        photos.insert(scratch, at: index)
    }
}
