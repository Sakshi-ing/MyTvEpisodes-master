//
//  Favorite_pageTableViewCell.swift
//  MyTvEpisodes
//
//  Created by mac os on 16/10/23.
//  Copyright © 2023 AtosSyntel. All rights reserved.
//

import UIKit

class Favorite_pageTableViewCell: UITableViewCell {

    @IBOutlet var Movie_Image: UIImageView!
    @IBOutlet var Movie_Name: UILabel!
    @IBOutlet var movie_Season: UILabel!
    @IBOutlet var noOfDaysLabel: UILabel!
    @IBOutlet var movie_Date: UILabel!
    @IBOutlet var DaysLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

      
    }
    override func prepareForReuse() {
        super.prepareForReuse()
      
    }

}
