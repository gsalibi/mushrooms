//
//  MushroomClassifier.swift
//  Mushroomer
//
//  Created by SERGIO J RAFAEL ORDINE on 23/07/20.
//  Copyright © 2020 SERGIO J RAFAEL ORDINE. All rights reserved.
//

import Foundation
import CoreML

enum MushroomType {
    case eligible
    case poisonous
}

struct MushroomClassification {
    var value: Double
    var type: MushroomType
}


struct MushroomClassifier {
    
    
    let model = Mushrooms()
    
    //MARK: - Private Methods
    
    /// Create a multi array (vector) from a floating point array
    /// - Parameter inputArray: input data
    /// - Returns: Multi Array with the same data.
    private func createMultiArray(_ inputArray: [Int]) -> MLMultiArray {
        guard let mlMultiArray = try? MLMultiArray(shape:[1,22], dataType:MLMultiArrayDataType.double) else {
            fatalError("Unexpected runtime error. MLMultiArray")
        }
        for (index, element) in inputArray.enumerated() {
            mlMultiArray[index] = NSNumber(value: element)
        }
        
        return mlMultiArray
    }
    
    func predict(_ sample:[Int]) -> MushroomClassification {
        //1. Convert input array to MLMultiArray and create the Model Input
        let inputVector = createMultiArray(sample)
        let input = MushroomsInput(dense_input: inputVector)
        
        //2. Make a prediction based on the input
        let predictionOutput = try? model.prediction(input: input)
        
        //3. Populate prediction accordingly
        let output = predictionOutput?.featureValue(for: "Identity")
        //Poisonous if unable to predict
        let predictionValue = output?.multiArrayValue?[0].doubleValue ?? 1.0
        // Consider 0.5 as the activation value. A safe margin could be considered
        let mushroomType: MushroomType = predictionValue > 0.5 ? .poisonous : .eligible
        
        return MushroomClassification(value: predictionValue,
                                      type: mushroomType)
        
        
    }
    
    
}
