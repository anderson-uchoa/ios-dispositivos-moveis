//
//  PlayerDetailsViewController.swift
//  
//
//  Created by Anderson Uchôa on 22/02/16.
//
//

import UIKit

class PlayerDetailsViewController: UITableViewController {
  
    
    var player:Player?
    
    
    
    
    @IBOutlet weak var detailLabel: UIView!
    @IBOutlet weak var nameTextField: UITextField!
    
    var game:String = "Chess" {
        didSet {
            detailLabel.text = game
        }
    }
    
    
    //assegurar que as telas sao carregadas sob demanda
  
    required init?(coder aDecoder: NSCoder) {
        print("init PlayerDetailsViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        print("deinit PlayerDetailsViewController")
    }
    
    
    
    @IBAction func unwindWithSelectedGame(segue:UIStoryboardSegue) {
        if let gamePickerViewController = segue.sourceViewController as? GamePickerViewController,
            selectedGame = gamePickerViewController.selectedGame {
                game = selectedGame
        }
    }
    
    
    
    @IBAction func cancelToPlayersViewController(sender: UIStoryboardSegue) {
    
    }

    @IBAction func savePlayerDetail(sender: UIStoryboardSegue) {
    
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SavePlayerDetail" {
            player = Player(name: nameTextField.text!, game: "Chess", rating: 1)
        }
        if segue.identifier == "PickGame" {
            if let gamePickerViewController = segue.destinationViewController as? GamePickerViewController {
                gamePickerViewController.selectedGame = game
            }
        }
    }
    
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0{
        
        nameTextField.becomeFirstResponder()
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
}
