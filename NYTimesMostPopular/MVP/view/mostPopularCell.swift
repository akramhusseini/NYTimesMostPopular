//
//  mostPopularCell.swift
//  NYTimesMostPopular
//
//  Created by Akram Samir Akram Husseini on 5/25/20.
//  Copyright © 2020 Akram Samir Akram Husseini. All rights reserved.
//

import UIKit

class mostPopularCell: UITableViewCell {

    
    @IBOutlet weak var itemImageView: UIImageView! {didSet{
        itemImageView.layer.borderWidth = 1.0
        itemImageView.layer.masksToBounds = false
        itemImageView.layer.borderColor = UIColor.white.cgColor
        itemImageView.layer.cornerRadius = itemImageView.frame.size.width/2
        itemImageView.clipsToBounds = true
        }}
    
    
    @IBOutlet weak var entryTitle: UILabel!
    @IBOutlet weak var content: UILabel! 
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
