//
//  MovieCell.swift
//  MovieList
//
//  Created by mac 2019 on 10/7/22.
//

import UIKit

class MovieCell: UITableViewCell {
    static let identifier = "MovieCell"
    @IBOutlet weak var mPosterImgView: UIImageView!
    @IBOutlet weak var mTitleLbl: UILabel!
    @IBOutlet weak var mDescriptionLbl: UILabel!
    
    public var movieModel: MovieModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.layoutIfNeeded()
        mPosterImgView.layer.cornerRadius = 4.0
        mPosterImgView.clipsToBounds = true
    }
    
    private func setupUI() {
        self.selectionStyle = .none
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.clear
        
    }
    
    func setupCell(for indexPath: IndexPath) {
        if let urlStr = movieModel.posterPath, let url = URL(string: APIConstants.imageBaseUrl + urlStr) {
//            mPosterImgView.load(url: url)
            mPosterImgView.downloaded(from: url)
        }
        
        mTitleLbl.text = movieModel.title
        mDescriptionLbl.text = movieModel.overview
    }
    
}
