//
//  ExpandableCell.swift
//  MyTvEpisodes
//
//  Created by mac os on 08/11/23.
//  Copyright © 2023 AtosSyntel. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {
    
    @IBOutlet var SeasonLabel: UILabel!
    @IBOutlet var ExpandButton: UIButton!
    @IBOutlet var EpisodeLabel: UILabel!
    @IBOutlet var SandELabel: UILabel!
    @IBOutlet var DateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
