

import Foundation

struct PhotoCategory {
    var categoryImageName: String
    var title: String
    var imageNames: [String]
}

class PhotosLibrary {
    
    class func fetchPhotos() -> [PhotoCategory] {
        var categories = [PhotoCategory]()
        let photosData = PhotosLibrary.downloadPhotosData()
        
        for(categoryTitle, dict) in photosData {
            if let dict = dict as? [String: Any] {
                let categoryImageName = dict["CategoryImageName"] as! String
                if let imageNames = dict["imageNames"] as? [String] {
                    let newCategory = PhotoCategory(
                        categoryImageName: categoryImageName,
                        title: categoryTitle,
                        imageNames: imageNames)
                    categories.append(newCategory)
                }
            }
        }
        return categories
    }
    
    class func downloadPhotosData() -> [String:Any] {
        return [
            "Family": [
                "categoryImageName": "family",
                "imageName": PhotosLibrary.generateImage(
                    categoryPrefix: "family",
                    numberOfImages: 9)
            ],
            "Foods": [
                "categoryImageName": "foods",
                "imageName": PhotosLibrary.generateImage(
                    categoryPrefix: "foods",
                    numberOfImages: 8)
            ],
            "Travel": [
                "categoryImageName": "travel",
                "imageName": PhotosLibrary.generateImage(
                    categoryPrefix: "travel",
                    numberOfImages: 8)
            ],
            "Nature": [
                "categoryImageName": "nature",
                "imageName": PhotosLibrary.generateImage(
                    categoryPrefix: "nature",
                    numberOfImages: 9)
            ]
        ]
    }
    
    class func generateImage(categoryPrefix: String, numberOfImages: Int) -> [String]{
        var imageNames = [String]()
        
        for i in 1...numberOfImages {
            imageNames.append("\(categoryPrefix)\(i)")
        }
        return imageNames
    }
}
