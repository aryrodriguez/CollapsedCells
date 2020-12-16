//
//  CollapseTableViewCell.swift
//  CollapsedCells
//
//  Created by Ary on 16/12/2020.
//  Copyright © 2020 Ary. All rights reserved.
//

import UIKit

class CollapseTableViewCell: UITableViewCell {
    
    @IBOutlet weak var acessoryLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    var isCollapsed: Bool = true {
        
        didSet{
            if oldValue == false {
                
                acessoryLabel.rotate(angle: -180)
            }
            
            if !isCollapsed {
                acessoryLabel.rotate(angle: 180)
            }
            detailsLabel.isHidden = isCollapsed
        }
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        acessoryLabel.rotate(angle: 90)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

extension UIView {
    
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians)
        self.transform = rotation
    }
}
