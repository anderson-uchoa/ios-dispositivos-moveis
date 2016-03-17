//
//  SearchResultCellTableViewCell.swift
//  StoreSearch
//
//  Created by Anderson Uchôa on 09/03/16.
//  Copyright © 2016 Anderson Uchôa. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {

    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var artworkImageView: UIImageView!
    
    var downloadTask: NSURLSessionDownloadTask?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let selectedView = UIView(frame: CGRect.zero)
        selectedView.backgroundColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 0.5)
            selectedBackgroundView = selectedView
        
    }

    
    func configireForSearchResult ( searchResult: BuscaResultado ){
        
        nameLabel.text = searchResult.name
        
        if searchResult.artistName.isEmpty {
            artistNameLabel.text = "Desconhencido"
        }else{
            artistNameLabel.text = String(format: "%@ (%@)", searchResult.artistName, searchResult.kindForDisplay())
        }
        
        artworkImageView.image = UIImage(named: "Placeholder")
        if let url = NSURL(string: searchResult.artworkURL60) {
            downloadTask = artworkImageView.loadImageWithURL(url)
        }
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    
        downloadTask?.cancel()
        downloadTask = nil
        nameLabel.text = nil
        artistNameLabel.text = nil
        artworkImageView.image = nil
   
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
