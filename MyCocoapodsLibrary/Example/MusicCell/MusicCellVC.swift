//
//  TableViewCell.swift
//  Video Player
//
//  Created by Madesh on 10/04/23.
//

import UIKit

class MusicCellVC: UITableViewCell {
    
    
        @IBOutlet weak var MusicIcon: UIImageView!
        @IBOutlet weak var MusicTitle: UILabel!
    
    //    @IBOutlet weak var MusicArtist: UILabel!
    
//    var MusicIcon:UIImageView = UIImageView()
//    var MusicTitle:UILabel = UILabel()
//    let audioVC = AudioViewController()
    
//    override init(style:UITableViewCell.CellStyle, reuseIdentifier: String?){
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.addSubview(MusicIcon)
//        MusicIcon.image = UIImage(systemName: "music.note")
//        MusicIcon.translatesAutoresizingMaskIntoConstraints = false
//
//        contentView.addSubview(MusicTitle)
//        MusicTitle.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([
//                   MusicIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//                   MusicIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//                   MusicIcon.widthAnchor.constraint(equalToConstant: 40),
//                   MusicIcon.heightAnchor.constraint(equalToConstant: 40),
//
//                   MusicTitle.leadingAnchor.constraint(equalTo: MusicTitle.trailingAnchor, constant: 16),
//                   MusicTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//                   MusicTitle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//               ])
//
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        view.addSubview(MusicIcon)
//        view.addSubview(MusicTitle)
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
}
