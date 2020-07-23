//
//  MushroomUtil.swift
//  Mushroomer
//
//  Created by SERGIO J RAFAEL ORDINE on 23/07/20.
//  Copyright © 2020 SERGIO J RAFAEL ORDINE. All rights reserved.
//

import Foundation



struct MushroomUtil {
    
    static let parameterMatrix: [[String]] = [
        ["b","c","f","k", "s", "x"],
        ["f", "g", "s", "y"],
        ["b", "c", "e", "g", "n", "p", "r", "u", "w", "y"],
        ["f", "t"],
        ["a", "c", "f", "l", "m", "n", "p", "s", "y"],
        ["a", "f"],
        ["c", "w"],
        ["b", "n"],
        ["b", "e", "g", "h", "k", "n", "o", "p", "r", "u", "w", "y"],
        ["e", "t"],
        ["?", "b", "c", "e", "r"],
        ["f", "k", "s", "y"],
        ["f", "k", "s", "y"],
        ["b", "c", "e", "g", "n", "o", "p", "w", "y"],
        ["b", "c", "e", "g", "n", "o", "p", "w", "y"],
        ["p"],
        ["n", "o", "w", "y"],
        ["n", "o", "t"],
        ["e", "f", "l", "n", "p"],
        ["b", "h", "k", "n", "o", "r", "u", "w", "y"],
        ["a", "c", "n", "s", "v", "y"],
        ["d", "g", "l", "m", "p", "u", "w"]
       ]
    
    
    static func convert(attributes:[String])->[OrderedAttribute] {
        guard attributes.count == parameterMatrix.count else { return [] }
        
        let result = attributes.enumerated().map { (element) -> OrderedAttribute? in
            let index = element.offset
            let currentElement = element.element
            guard let offset = parameterMatrix[index].firstIndex(of: currentElement)
                else { return nil }
            let attribute =  attributeFor(attributeIndex: index, at: offset)
            return attribute
        }
        
        let processedResult = result.compactMap{$0}
        
        guard processedResult.count == result.count else {return []}
        
        return processedResult
    }
    
    
    
    // spore-print-color,
    // population,habitat,veil-type
    
   static func attributeFor(attributeIndex: Int, at offset: Int) -> OrderedAttribute? {
        switch attributeIndex {
        case 0:
            return CapShape(rawValue: offset)
        case 1:
            return CapSurface(rawValue: offset)
        case 2:
            return CapColor(rawValue: offset)
        case 3:
            return Bruises(rawValue: offset)
        case 4:
            return Odor(rawValue: offset)
        case 5:
            return GillAttachment(rawValue: offset)
        case 6:
            return GillSpacing(rawValue: offset)
        case 7:
            return GillSize(rawValue: offset)
        case 8:
            return GillColor(rawValue: offset)
        case 9:
            return StalkShape(rawValue: offset)
        case 10:
            return StalkRoot(rawValue: offset)
        case 11:
            return StalkSurfaceAboveRing(rawValue: offset)
        case 12:
            return StalkSurfaceBellowRing(rawValue: offset)
        case 13:
            return StalkColorAboveRing(rawValue: offset)
        case 14:
            return StalkColorBellowRing(rawValue: offset)
        case 15:
            return VeilType(rawValue: offset)
        case 16:
            return VeilColor(rawValue: offset)
        case 17:
            return RingNumber(rawValue: offset)
        case 18:
            return RingType(rawValue: offset)
        case 19:
            return SporePrintColor(rawValue: offset)
        case 20:
            return Population(rawValue: offset)
        case 21:
            return Habitat(rawValue: offset)
        default:
            return nil
        }
    }
    
}
