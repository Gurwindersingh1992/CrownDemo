//
//  CellWrapper.swift
//  CrownStackDemo
//
//  Created by Gurwinder singh on 08/07/21.
//

import UIKit
import SDWebImage

class CellWrapper: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titledes2: UILabel!
    @IBOutlet weak var copyrightLbl: UILabel!
    @IBOutlet weak var titleDes: UILabel!
    @IBOutlet weak var title1: UILabel!
    @IBOutlet weak var img: UIImageView!
    var homeVC = true
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var data: Result?{
        didSet{
            if !homeVC{
                self.copyrightLbl.text = data?.copyright
                self.titledes2.text = data?.country
            }
            self.title1.text = data?.artistName
            self.img.makeRounded()
            self.titleDes.text = data?.collectionName
            self.backView.layer.borderWidth = 1
            self.backView.layer.borderColor = UIColor.lightGray.cgColor

            if data?.artworkUrl30 == nil {
                let defaultImage: UIImage = UIImage(named: "music")!
                self.img.image = defaultImage
            }
            else {
                let url = URL(string: data?.artworkUrl30 ?? "")
                self.img?.sd_setImage(with: url)
            }
        }
    }
    
}

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
