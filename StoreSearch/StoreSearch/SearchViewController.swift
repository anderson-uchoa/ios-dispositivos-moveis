//
//  ViewController.swift
//  StoreSearch
//
//  Created by Anderson Uchôa on 04/03/16.
//  Copyright © 2016 Anderson Uchôa. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    struct TableViewCellIdentifiers {
        static let searchResultCell = "SearchResultCell"
        static let nothingFoundCell = "NothingFoundCell"
        static let loadingCell = "LoadingCell"
        
    
    }
    
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
   
    var buscaResultados = [BuscaResultado]()
    var buscado = false
    var isloading = false
    
    var dataTask: NSURLSessionDataTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.becomeFirstResponder()
        tableView.contentInset = UIEdgeInsets(top: 108, left: 0, bottom: 0,right: 0)
        tableView.rowHeight = 80
        
        var cellNib = UINib(nibName: TableViewCellIdentifiers.searchResultCell, bundle: nil)
        tableView.registerNib(cellNib,forCellReuseIdentifier: TableViewCellIdentifiers.searchResultCell)
        
        cellNib = UINib(nibName: TableViewCellIdentifiers.nothingFoundCell, bundle: nil)
        tableView.registerNib(cellNib,forCellReuseIdentifier: TableViewCellIdentifiers.nothingFoundCell)
      
        
        cellNib = UINib(nibName: TableViewCellIdentifiers.loadingCell, bundle: nil)
        tableView.registerNib(cellNib,forCellReuseIdentifier: TableViewCellIdentifiers.loadingCell)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func segmentControl(sender: UISegmentedControl) {
        
       performSearch()
    }
  
    
    
    func urlComBuscaTexto ( searchText: String, category: Int ) -> NSURL {
        
        let nomeCategoria: String
        
        switch category {
            case 1: nomeCategoria = "musicTrack"
            case 2: nomeCategoria = "software"
            case 3: nomeCategoria = "ebook"
            default: nomeCategoria = ""
        }
        
        let escapedSearchText = searchText.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())!
        
        let urlString = String (format:
            "https://itunes.apple.com/search?term=%@&limit=200&entity=%@", escapedSearchText, nomeCategoria)
        let url = NSURL (string: urlString)
        return url!
    
    }
    
    

    
    
    func parseJSON ( data: NSData ) -> [String: AnyObject]? {
        
        do{
            return try NSJSONSerialization.JSONObjectWithData(data, options: []) as? [String: AnyObject]
        }catch{
        print("JSON Erro: '\(error)'")
        return nil
        }
    }

    
    
    func parseDictionary (dicionario: [String: AnyObject]) -> [BuscaResultado] {
    
    
        guard let array = dicionario["results"] as? [AnyObject] else {
        
        print("Expected 'results' array")
        return []
        }
        
        var buscaResultados = [BuscaResultado]()
       
        for resultDict in array {
            if let resultDict = resultDict as? [String: AnyObject] {
            var buscaResultado: BuscaResultado?
            
            if let wrapperType = resultDict["wrapperType"] as? String {
                switch wrapperType {
            case "track":
                     buscaResultado = parseTrack(resultDict)
            case "audiobook":
                    buscaResultado = parseAudioBook(resultDict)
            case "software":
                        buscaResultado = parseSoftware(resultDict)
            default:
                break
                }
           
            }else if let kind = resultDict["Kind"] as? String
                where kind == "ebook"{
                buscaResultado = parseEBook(resultDict)
                }
           
                if let resultado = buscaResultado {
                buscaResultados.append(resultado)
            }
          
        }
    }
        return buscaResultados

}


    func parseTrack(dictionary: [String: AnyObject]) -> BuscaResultado {
    
        let buscaResultado = BuscaResultado()
    
        buscaResultado.name = dictionary["trackName"] as! String
        buscaResultado.artistName = dictionary["artistName"] as! String
        buscaResultado.artworkURL60 = dictionary["artworkUrl60"] as! String
        buscaResultado.artworkURL100 = dictionary["artworkUrl100"] as! String
        buscaResultado.storeURL = dictionary["trackViewUrl"] as! String
        buscaResultado.kind = dictionary["kind"] as! String
        buscaResultado.currency = dictionary["currency"] as! String
    
        if let price = dictionary["trackPrice"] as? Double {
            buscaResultado.price = price
        }
        if let genre = dictionary["primaryGenreName"] as? String {
            buscaResultado.genre = genre
        }
        return buscaResultado
        }
    
    
    func parseAudioBook(dictionary: [String: AnyObject]) -> BuscaResultado {
        let buscaResultado = BuscaResultado()
       
        buscaResultado.name = dictionary["collectionName"] as! String
        buscaResultado.artistName = dictionary["artistName"] as! String
        buscaResultado.artworkURL60 = dictionary["artworkUrl60"] as! String
        buscaResultado.artworkURL100 = dictionary["artworkUrl100"] as! String
        buscaResultado.storeURL = dictionary["collectionViewUrl"] as! String
        buscaResultado.kind = "audiobook"
        buscaResultado.currency = dictionary["currency"] as! String
        
        if let price = dictionary["collectionPrice"] as? Double {
            buscaResultado.price = price
        }
        if let genre = dictionary["primaryGenreName"] as? String {
        buscaResultado.genre = genre
        }
        return buscaResultado
    }
    
    
    
    func parseSoftware(dictionary: [String: AnyObject]) -> BuscaResultado {
          
            let buscaResultado = BuscaResultado()
            buscaResultado.name = dictionary["trackName"] as! String
            buscaResultado.artistName = dictionary["artistName"] as! String
            buscaResultado.artworkURL60 = dictionary["artworkUrl60"] as! String
            buscaResultado.artworkURL100 = dictionary["artworkUrl100"] as! String
            buscaResultado.storeURL = dictionary["trackViewUrl"] as! String
            buscaResultado.kind = dictionary["kind"] as! String
            buscaResultado.currency = dictionary["currency"] as! String
           
            if let price = dictionary["price"] as? Double {
                    buscaResultado.price = price
            }
            if let genre = dictionary["primaryGenreName"] as? String {
                buscaResultado.genre = genre
            }
            
            return buscaResultado
    }
    
    
    
    func parseEBook(dictionary: [String: AnyObject]) -> BuscaResultado {
           
            let buscaResultado = BuscaResultado()
            buscaResultado.name = dictionary["trackName"] as! String
            buscaResultado.artistName = dictionary["artistName"] as! String
            buscaResultado.artworkURL60 = dictionary["artworkUrl60"] as! String
            buscaResultado.artworkURL100 = dictionary["artworkUrl100"] as! String
            buscaResultado.storeURL = dictionary["trackViewUrl"] as! String
            buscaResultado.kind = dictionary["kind"] as! String
            buscaResultado.currency = dictionary["currency"] as! String
            if let price = dictionary["price"] as? Double {
                
                buscaResultado.price = price
            }
            if let genres: AnyObject = dictionary["genres"] {
            buscaResultado.genre = (genres as! [String]).joinWithSeparator(", ")
            }
            return buscaResultado
    }
    
    
  
    
    func showNetworkError(){
        
     let alert = UIAlertController(title: "Desculpe!", message: "Existe um erro no iTunes Store. Por favor tente novamente.", preferredStyle: .Alert)
        
    let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
        
        
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
        let detailViewController = segue.destinationViewController as! DetailViewController
        let indexPath = sender as! NSIndexPath
        let searchResult = buscaResultados[indexPath.row]
        detailViewController.searchResult = searchResult
        }
    }
    



}


extension SearchViewController: UISearchBarDelegate {
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        performSearch()
    }
    
    
    
    func performSearch() {
       
        if !searchBar.text!.isEmpty {
        searchBar.resignFirstResponder()
        
        dataTask?.cancel()
            
        isloading = true
        tableView.reloadData()
            
        buscado = true
        buscaResultados = [BuscaResultado]()
        
            
        let url = urlComBuscaTexto(searchBar.text! , category: segmentControl.selectedSegmentIndex)
            
        let session = NSURLSession.sharedSession()
        
            dataTask = session.dataTaskWithURL(url, completionHandler: { data, response, error in
             
                if let error = error where error.code == -999 {
                    return
               
                }else if let httpResponse = response as? NSHTTPURLResponse where httpResponse.statusCode == 200 {
                    
                    if let data = data, dictionary = self.parseJSON(data) {
                        self.buscaResultados = self.parseDictionary(dictionary)
                        self.buscaResultados.sortInPlace({ result1, result2 in return result1.name.localizedStandardCompare(
                                    result2.name) == .OrderedAscending
                            })
                        
                        dispatch_async(dispatch_get_main_queue()) {
                                self.isloading = false
                                self.tableView.reloadData()
                        }
                    return
                    
                    }
                    dispatch_async(dispatch_get_main_queue()) {
                        self.buscado = false
                        self.isloading = false
                        self.tableView.reloadData()
                        self.showNetworkError()
                    }
                    
                }else {
                    print("Failure! \(response!)")
                
                }
            })
            
            dataTask?.resume()
    
            }
    }
    
    
    
    func positionForBar(bar: UIBarPositioning) -> UIBarPosition {
        return .TopAttached
    }
    
}
    



extension SearchViewController: UITableViewDataSource {

        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           
            if isloading {
             return 1
            }else if !buscado {
            return 0
                
            }else if buscaResultados.count == 0 {
            return 1
                
            }else{
                return buscaResultados.count
            }
            
            }
            
           
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
            if isloading {
        
                let cell = tableView.dequeueReusableCellWithIdentifier( TableViewCellIdentifiers.loadingCell, forIndexPath: indexPath)
    
                let spinner = cell.viewWithTag(100) as! UIActivityIndicatorView
                spinner.startAnimating()
                return cell
            
            } else if buscaResultados.count == 0 {
          
            return tableView.dequeueReusableCellWithIdentifier(TableViewCellIdentifiers.nothingFoundCell, forIndexPath: indexPath)
            
            }else{
                
            let cell = tableView.dequeueReusableCellWithIdentifier( TableViewCellIdentifiers.searchResultCell, forIndexPath: indexPath) as! SearchResultCell
            
            let buscaResultado = buscaResultados[indexPath.row]
            
             cell.configireForSearchResult(buscaResultado)
            return cell
            }


    }
    
    
}


extension SearchViewController: UITableViewDelegate {
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("ShowDetail", sender: indexPath) 
    }
    
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if buscaResultados.count == 0 || isloading {
        return nil
        }else{
        return indexPath
        }
    }
    
    

}