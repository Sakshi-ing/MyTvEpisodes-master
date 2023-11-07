

import UIKit

class SettingsTableViewCell: UITableViewCell {
   
    @IBOutlet var NotificationButton: UIButton!
    
    @IBOutlet var NeverButton: UIButton!
     override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
 
    }
}
