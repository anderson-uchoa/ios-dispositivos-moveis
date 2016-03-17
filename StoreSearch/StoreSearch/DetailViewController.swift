//
//  DetailViewController.swift
//  StoreSearch
//
//  Created by Anderson Uchôa on 11/03/16.
//  Copyright © 2016 Anderson Uchôa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var priceButton: UIButton!
    
    var searchResult: BuscaResultado!
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        modalPresentationStyle = .Custom
        transitioningDelegate = self
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = UIColor(red: 20/255, green: 160/255, blue: 160/255, alpha: 1)
        popupView.layer.cornerRadius = 10
      
        // fechar pop-up ao clicar em qualquer lugar
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("close"))
        gestureRecognizer.cancelsTouchesInView = false
        gestureRecognizer.delegate = self
        view.addGestureRecognizer(gestureRecognizer)
        
        
        
        if searchResult != nil {
            updateUI()
        }
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func openInStore() {
        if let url = NSURL(string: searchResult.storeURL) {
        UIApplication.sharedApplication().openURL(url)
        }
    }
    
    
    @IBAction func close() {
     dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func updateUI() {
        nameLabel.text = searchResult.name
        if searchResult.artistName.isEmpty {
        artistNameLabel.text = "Desconhencido"
     } else {
        artistNameLabel.text = searchResult.artistName
        }
        kindLabel.text = searchResult.kindForDisplay()
        genreLabel.text = searchResult.genre
    
    
    
    }

    
   
}

extension DetailViewController: UIViewControllerTransitioningDelegate {
    
    func presentationControllerForPresentedViewController(presented: UIViewController,presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        
        return DimmingPresentationController(presentedViewController: presented,presentingViewController: presenting)
    }
    
}

//fechar pop-up  ao clicar em qualquer lugar

extension DetailViewController: UIGestureRecognizerDelegate {
        func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldReceiveTouch touch: UITouch) -> Bool {
            return (touch.view === self.view)
        }
}

