//
//  ViewController.swift
//  MoviesLib
//
//  Created by Eric on 06/03/17.
//  Copyright © 2017 EricBrito. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {

    //MARK: - Lets and Vars
    var movie: Movie? {
        didSet {
            self.title = movie?.title
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbGenre: UILabel!
    @IBOutlet weak var lbDuration: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var tvSinopsis: UITextView!
    @IBOutlet weak var lcButtonX: NSLayoutConstraint!
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ivPoster.image = UIImage(named: "\((movie?.imageWide)!)")
        self.lbTitle.text = movie?.title
        self.lbGenre.text = movie?.categoriesDescription
        self.lbDuration.text = movie?.duration
        self.lbScore.text = "\((movie?.rating)!)"
        self.tvSinopsis.text = movie?.summary
    }
    
}
