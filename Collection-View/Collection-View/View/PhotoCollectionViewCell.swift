
import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    
    var imageName:String! {
        didSet {
            image.image = UIImage(named: imageName)
        }
    }
}
