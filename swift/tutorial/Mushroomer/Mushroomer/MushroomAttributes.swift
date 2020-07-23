//
//  MushroomAttributes.swift
//  Mushroomer
//
//  Created by SERGIO J RAFAEL ORDINE on 23/07/20.
//  Copyright © 2020 SERGIO J RAFAEL ORDINE. All rights reserved.
//

import Foundation


protocol OrderedAttribute {
    var rawValue: Int { get }
}

///1. cap-shape: bell=b,conical=c,convex=x,flat=f, knobbed=k,sunken=s
///
///['b' 'c' 'f' 'k' 's' 'x']
enum CapShape:Int,OrderedAttribute {
    case bell = 0
    case conical = 1
    case flat = 2
    case knobbed = 3
    case sunken = 4
    case convex = 5
}

///2. cap-surface: fibrous=f,grooves=g,scaly=y,smooth=s
///
///['f' 'g' 's' 'y']
enum CapSurface: Int,OrderedAttribute {
    case fibrous = 0
    case grooves = 1
    case smooth = 2
    case scaly = 3
}

///3. cap-color: brown=n,buff=b,cinnamon=c,gray=g,green=r, pink=p,purple=u,red=e,white=w,yellow=y
///
///['b' 'c' 'e' 'g' 'n' 'p' 'r' 'u' 'w' 'y']
enum CapColor: Int,OrderedAttribute {

    case buff = 0
    case cinnamon = 1
    case red = 2
    case gray = 3
    case brown = 4
    case pink = 5
    case green = 6
    case purple = 7
    case white = 8
    case yellow = 9
}

///4. bruises?: bruises=t,no=f
///
///['f' 't']
enum Bruises: Int,OrderedAttribute {
    case no = 0
    case bruises = 1
}

///5. odor: almond=a,anise=l,creosote=c,fishy=y,foul=f, musty=m,none=n,pungent=p,spicy=s
///
///['a' 'c' 'f' 'l' 'm' 'n' 'p' 's' 'y']
enum Odor: Int,OrderedAttribute {
    case almond = 0
    case creosote = 1
    case foul = 2
    case anise = 3
    case musty = 4
    case none = 5
    case pungent = 6
    case spicy = 7
    case fishy = 8
}

///6. gill-attachment: attached=a,descending=d,free=f,notched=n
///
///['a' 'f']
enum GillAttachment: Int,OrderedAttribute {
    case attached=0
    case free=1
    case descending=2
    case notched=3
}

///7. gill-spacing: close=c,crowded=w,distant=d
///
///['c' 'w']
enum GillSpacing: Int,OrderedAttribute {
    case close = 0
    case crowded = 1
    case distant = 2
}

///8. gill-size: broad=b,narrow=n
///
///['b' 'n']
enum GillSize: Int,OrderedAttribute {
    case broad=0
    case narrow=1
}

///9. gill-color: black=k,brown=n,buff=b,chocolate=h,gray=g, green=r,orange=o,pink=p,purple=u,red=e, white=w,yellow=y
///
///['b' 'e' 'g' 'h' 'k' 'n' 'o' 'p' 'r' 'u' 'w' 'y']
enum GillColor: Int,OrderedAttribute{
    case buff = 0
    case red = 1
    case gray = 2
    case chocolate = 3
    case black = 4
    case brown = 5
    case orange = 6
    case pink = 7
    case green = 8
    case purple = 9
    case white = 10
    case yellow = 11
}

///10. stalk-shape: enlarging=e,tapering=t
///
///['e' 't']
enum StalkShape: Int,OrderedAttribute {
    case enlarging=0
    case tapering=1
}

///11. stalk-root: bulbous=b,club=c,cup=u,equal=e, rhizomorphs=z,rooted=r,missing=?
///
///['?' 'b' 'c' 'e' 'r']
enum StalkRoot: Int,OrderedAttribute {
    case missing=0
    case bulbous=1
    case club=2
    case equal=3
    case rooted=4
    case cup=5
    case rhizomorphs=6
}

///12. stalk-surface-above-ring: fibrous=f,scaly=y,silky=k,smooth=s
///
///['f' 'k' 's' 'y']
enum StalkSurfaceAboveRing:Int,OrderedAttribute {
    case fibrous = 0
    case silky = 1
    case smooth = 2
    case scaly = 3
}

///13. stalk-surface-below-ring: fibrous=f,scaly=y,silky=k,smooth=s
///
///['f' 'k' 's']
enum StalkSurfaceBellowRing:Int,OrderedAttribute {
    case fibrous=0
    case silky=1
    case smooth=2
    case scaly=3
}

///14. stalk-color-above-ring: brown=n,buff=b,cinnamon=c,gray=g,orange=o, pink=p,red=e,white=w,yellow=y
///
///['b' 'c' 'e' 'g' 'n' 'o' 'p' 'w' 'y']
enum StalkColorAboveRing:Int,OrderedAttribute {
    case buff = 0
    case cinnamon = 1
    case red = 2
    case gray = 3
    case brown = 4
    case orange = 5
    case  pink = 6
    case white = 7
    case yellow = 8
}

///15. stalk-color-below-ring: brown=n,buff=b,cinnamon=c,gray=g,orange=o, pink=p,red=e,white=w,yellow=y
///
///['b' 'c' 'e' 'g' 'n' 'o' 'p' 'w' 'y']
enum StalkColorBellowRing:Int,OrderedAttribute {
    case buff = 0
    case cinnamon = 1
    case red = 2
    case gray = 3
    case brown = 4
    case orange = 5
    case  pink = 6
    case white = 7
    case yellow = 8
}

///17. veil-color: brown=n,orange=o,white=w,yellow=y
///
///['n' 'o' 'w' 'y']
enum VeilColor: Int,OrderedAttribute {
    case brown = 0
    case orange = 1
    case white = 2
    case yellow = 3
}

///18. ring-number: none=n,one=o,two=t
///
///['n' 'o' 't']
enum RingNumber: Int,OrderedAttribute {
    case none = 0
    case one = 1
    case two = 2
}

///19. ring-type: cobwebby=c,evanescent=e,flaring=f,large=l, none=n,pendant=p,sheathing=s,zone=z
///
///['e' 'f' 'l' 'n' 'p']
enum RingType : Int,OrderedAttribute {
    case evanescent=0
    case flaring=1
    case large=2
    case none=3
    case pendant=4
    case cobwebby=5
    case sheathing=6
    case zone=7
}

///20. spore-print-color: black=k,brown=n,buff=b,chocolate=h,green=r, orange=o,purple=u,white=w,yellow=y
///
///['b' 'h' 'k' 'n' 'o' 'r' 'u' 'w' 'y']
enum SporePrintColor: Int,OrderedAttribute {
    case buff=0
    case chocolate=1
    case black=2
    case brown=3
    case orange=4
    case green=5
    case purple=6
    case white=7
    case yellow=8
}

///21. population: abundant=a,clustered=c,numerous=n, scattered=s,several=v,solitary=y
///
///['a' 'c' 'n' 's' 'v' 'y']
enum Population: Int,OrderedAttribute {
    case abundant=0
    case clustered=1
    case numerous=2
    case scattered=3
    case several=4
    case solitary=5
}

///22. habitat: grasses=g,leaves=l,meadows=m,paths=p, urban=u,waste=w,woods=d
///
///['d' 'g' 'l' 'm' 'p' 'u' 'w']
enum Habitat: Int,OrderedAttribute {
    case woods=0
    case grasses=1
    case leaves=2
    case meadows=3
    case paths=4
    case urban=5
    case waste=6
}

///16. veil-type: partial=p,universal=u
///
///['p']
enum VeilType: Int,OrderedAttribute {
    case partial = 0
    case universal = 1
}






























