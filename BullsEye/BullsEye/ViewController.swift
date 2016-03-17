//
//  ViewController.swift
//  BullsEye
//
//  Created by Anderson Uchôa on 25/02/16.
//  Copyright © 2016 Anderson Uchôa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var valorAtual: Int = 50
    var targetValue: Int = 0
    var score = 0
    var rodada = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)

        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackLeftImage = UIImage(named: "SliderTrackLeft") {
            let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackLeftResizable, forState: .Normal)
        }
        
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackRightResizable, forState: .Normal)
        }

        iniciarNovoRound()
        updateLabels()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func mostrarAlerta(){
   
        let diferenca = abs( targetValue - valorAtual )
        var pontos = 100 - diferenca
    
        score = score + pontos
   
    
    let titulo: String
        if diferenca == 0 {
            titulo = "Perfeito!"
            pontos += 100
        } else if diferenca < 5 {
            titulo = "You almost had it!"
            if diferenca == 1 {
            pontos += 50
                }
        } else if diferenca < 10 {
            titulo = "Pretty good!"
        } else {
            titulo = "Not even close..."
        }
        score += pontos
        
        let mensagem = "Seus pontos: \(pontos) pontos"
        
        let alerta = UIAlertController(title: titulo, message: mensagem,
                                        preferredStyle: .Alert)
    
        let acao = UIAlertAction(title: "OK", style: .Default, handler: { acao in
                                                                        self.updateLabels()
                                                                        self.iniciarNovoRound()
                                                                        })
      
        alerta.addAction(acao)
       
        presentViewController(alerta, animated: true, completion: nil)
        
    }
    
    
    func iniciarNovoRound(){
        rodada = rodada + 1
        valorAtual = 50
        targetValue = 1 + Int(arc4random_uniform(100))
        slider.value = Float(valorAtual)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text =  String(score)
        roundLabel.text = String(rodada)
                
    
    }
                
    
    func iniciarNovoGame (){
        score = 0
        rodada = 0
        iniciarNovoRound()
    }
    
    
    @IBAction func moverSlider(slider: UISlider) {
        valorAtual = lroundf(slider.value)
    }
  
    @IBAction func starOver() {
        iniciarNovoGame()
        updateLabels()
   
    }
    

}

