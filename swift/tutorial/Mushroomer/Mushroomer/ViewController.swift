//
//  ViewController.swift
//  Mushroomer
//
//  Created by SERGIO J RAFAEL ORDINE on 22/07/20.
//  Copyright © 2020 SERGIO J RAFAEL ORDINE. All rights reserved.
//

import UIKit
import CoreML

class ViewController: UIViewController {
    
    
    //Result:p
    let testP = [
    //x,s,n,t,p,f,c,n,k,e,
      5,2,4,1,6,1,0,1,4,0,
    //e,s,s,w,w,p,w,o,p,k,
      3,2,2,7,7,0,2,1,4,2,
    //s,u
      3,5
    ]
    
    //Result:e
    let testE = [
    //x,s,y,t,a,f,c,b,k,e,
      5,2,9,1,0,1,0,0,4,0,
    //c,s,s,w,w,p,w,o,p,n,
      2,2,2,7,7,0,2,1,4,3,
    //n,g
      2,1
    ]
    
    //Result:p
    let sample1 = ["x","y","w","t","p","f","c","n","k","e",
                   "e","s","s","w","w","p","w","o","p","n",
                   "s","u"]
    //Result: e
    let sample2 = ["x","y","y","t","l","f","c","b","n","e",
                   "c","s","s","w","w","p","w","o","p","n",
                   "n","m"]
    
    var classifier = MushroomClassifier()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var prediction = classifier.predict(testP)
        print(prediction)
        
        prediction = classifier.predict(testE)
        print(prediction)
        
        prediction = classifier.predict(sample1)
        print(prediction)
        
        prediction = classifier.predict(sample2)
        print(prediction)
        
    }
    
}

