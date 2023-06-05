//
//  PhotoCollectionViewCell.swift
//  Video Player
//
//  Created by Madesh on 17/04/23.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    

//    @IBOutlet weak var PhotoDetails: UILabel!
//    @IBOutlet weak var PhotoImage
//    : UIImageView!
    static let identifier = "PhotoCell"
    
//    let vc = PhotoCollectionViewController()
    
    
    let PhotoDetails:UILabel = UILabel()
    let PhotoImage:UIImageView = UIImageView()
    let imageDuration:UIImageView = UIImageView()
    let videoDurationLabel:UILabel = UILabel()
    let playIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "play.circle.fill")
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    private let imgview:UIImageView = {
//        let ImgView = UIImageView()
//        imgview.image = UIImage(named: "dog")
//            return ImgView
//    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        PhotoImage.translatesAutoresizingMaskIntoConstraints = false
        PhotoImage.contentMode = .scaleAspectFit
        PhotoImage.clipsToBounds = true
        PhotoImage.backgroundColor = .black
        contentView.addSubview(PhotoImage)
        
        imageDuration.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(imageDuration)
        
        videoDurationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(videoDurationLabel)
        videoDurationLabel.textAlignment = .justified
        
        contentView.addSubview(playIconImageView)
        
        
        PhotoImage.topAnchor.constraint(equalTo: contentView.topAnchor) .isActive = true
        PhotoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor) .isActive = true
        PhotoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor) .isActive = true
        PhotoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor) .isActive = true
        
        imageDuration.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0) .isActive = true
        imageDuration.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: 0) .isActive = true
//        imageDuration.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: 0) .isActive = true
//        imageDuration.widthAnchor.constraint(equalTo: contentView.widthAnchor, constant: 0)    .isActive = true
        imageDuration.heightAnchor.constraint(equalToConstant: 20) .isActive = true
        imageDuration.widthAnchor.constraint(equalToConstant: 20) .isActive = true
        
        videoDurationLabel.heightAnchor.constraint(equalToConstant: 20) .isActive = true
        videoDurationLabel.widthAnchor.constraint(equalToConstant: 40) .isActive = true
        videoDurationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0) .isActive = true
        videoDurationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0) .isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
