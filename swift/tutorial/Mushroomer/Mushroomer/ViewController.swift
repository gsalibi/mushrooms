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
    //x,s,n,t,p,
      5,2,4,1,6,
    //f,c,n,k,e,
      1,0,1,4,0,
    //e,s,s,w,w,
      3,2,2,7,7,
    //p,w,o,p,k,
      0,2,1,4,2,
    //  s,u
      3,5
    ]
    
    //Result:e
    let testE = [
    //x,s,y,t,a,
      5,2,9,1,0,
    //f,c,b,k,e,
      1,0,0,4,0,
    //c,s,s,w,w,
      2,2,2,7,7,
    //p,w,o,p,n,
      0,2,1,4,3,
    //n,g
      2,1
    ]
    
    
    /// Create a multi array (vector) from a floating point array
    /// - Parameter inputArray: input data
    /// - Returns: Multi Array with the same data.
    private func createMultiArray(_ inputArray: [Float32]) -> MLMultiArray {
        guard let mlMultiArray = try? MLMultiArray(shape:[1,22], dataType:MLMultiArrayDataType.double) else {
            fatalError("Unexpected runtime error. MLMultiArray")
        }
        for (index, element) in inputArray.enumerated() {
            mlMultiArray[index] = NSNumber(value: element)
        }
        
        return mlMultiArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1. Convert array to floating points
        var inputArray = testP.map {Float32($0)}
        
        //2. Convert input array to MLMultiArray
        var inputVector = createMultiArray(inputArray)
        

        let predictor = Mushrooms()
        
        var input = MushroomsInput(dense_input: inputVector)
        var predictionOutput = try? predictor.prediction(input: input)
        
        var output = predictionOutput?.featureValue(for: "Identity")
        var prediction: Double = (output?.multiArrayValue?[0].doubleValue) ?? 1.0

        var result = (prediction > 0.5) ? "poisonous" : "edible"
        
        print("\(result) \(prediction)")
        
        inputArray = testE.map {Float32($0)}
        inputVector = createMultiArray(inputArray)
        input = MushroomsInput(dense_input: inputVector)
        predictionOutput = try? predictor.prediction(input: input)
        output = predictionOutput?.featureValue(for: "Identity")
        prediction = (output?.multiArrayValue?[0].doubleValue) ?? 1.0

        result = (prediction > 0.5) ? "poisonous" : "edible"
        
        print("\(result) \(prediction)")
        
    }
    
}

