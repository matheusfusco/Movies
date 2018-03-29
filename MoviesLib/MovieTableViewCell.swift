//
//  MovieTableViewCell.swift
//  MoviesLib
//
//  Created by Usuário Convidado on 28/03/18.
//  Copyright © 2018 EricBrito. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    //MARK: - Lets and Vars
    var movie: Movie? {
        didSet {
            self.posterImageView.image = UIImage(named: "\((movie?.imageSmall)!)")
            self.titleLabel.text = movie?.title
            self.summaryLabel.text = movie?.summary
            self.ratingLabel.text = "🌟 \((movie?.rating)!)"
            self.categoriesLabel.text = movie?.categoriesDescription
        }
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    
    //MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
