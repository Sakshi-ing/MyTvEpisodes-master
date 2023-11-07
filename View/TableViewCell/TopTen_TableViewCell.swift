

import UIKit

class TopTen_TableViewCell: UITableViewCell {
    
    @IBOutlet var TTimage: UIImageView!
    @IBOutlet var TTid: UILabel!
    @IBOutlet var TTmovieName: UILabel!
    @IBOutlet var TTratings: UILabel!
    @IBOutlet var StarButton: UIButton!
    @IBOutlet var TTgenresName: UILabel!
    
    @IBOutlet var AddButton: UIButton!
     override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        TTimage.image = nil
    }

}
