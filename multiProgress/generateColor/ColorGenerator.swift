//
//  ColorGenerator.swift
//  multiProgress
//
//  Created by Baiaman Apsamatov on 15/10/21.
//
// h---> 19 <= 40, 61 <= 123, 173 <= 331
// s---> 60 <= 80
// b---> 80 <= 100


import UIKit
import Foundation

let klArt: CGFloat = 1
let klIndustry: CGFloat = 2
let k1Art: CGFloat = 0.045
let k1Industry: CGFloat = 0.048
let k2Art: CGFloat = 0.015
let k2Industry: CGFloat = 0.014

struct DataColorsRawValues {
    let hue: CGFloat
    let saturation: CGFloat
    let brightness: CGFloat
}

class ColorGenerator {
    
    var colors: [UIColor] = []
    var rawDataColors: [DataColorsRawValues] = []
    var randHue: [CGFloat] = []
    private var isFirst = true
    
    init() {
        print(#function)
    }
    
    func generatingColors(count: Int) {
        var prevColorDistance: CGFloat = 0.0
        
        var (prevHue, prevSaturation, prevBrightness) = (CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
        
        var (isHue, isSaturation, isBrightness) = (false, false, false)
        
        for _ in 0 ... count {
            
//            var (hue, saturation, brightness) = (CGFloat(0.0), CGFloat(0.0), CGFloat(0.0))
//
//            while ((isHue, isSaturation, isBrightness) != (true, true, true))  {
//
//                if (isHue != true){
//                    hue = self.generateHue(isHue: &isHue)
//                }
//
//                if (isSaturation != true) {
//                    saturation = self.generateSaturation(isSaturation: &isSaturation)
//                }
//
//                if (isBrightness != true) {
//                    brightness = self.generateBrightness(isBrightness: &isBrightness)
//                }
//
//                if (isFirst) {
//                    if (isHue) {
//                        let hsbColor = UIColor(hue: hue/360, saturation: saturation/100, brightness: brightness/100, alpha: 1.0)
//                        self.colors.append(hsbColor)
//                        (prevHue, prevSaturation, prevBrightness) = (hue, saturation, brightness)
//                        (isHue, isSaturation, isBrightness) = (true, true, true)
//                        isFirst = false
//                    } else {
//                        (isHue, isSaturation, isBrightness) = (false, false, false)
//                        isFirst = true
//                    }
//                } else {
//                    let degree = CGFloat.random(in: 19 ... 120)
//
//                    var increaseHue = prevHue + degree
//                    var decreaseHue = prevHue - degree
//
//                    increaseHue += 137.5 / 360.0 //0.618033988749895
//                    let pmet = increaseHue.truncatingRemainder(dividingBy: CGFloat(1.0))
//                    increaseHue += pmet
//
//                    decreaseHue += 137.5 / 360.0 //0.618033988749895
//                    decreaseHue += decreaseHue.truncatingRemainder(dividingBy: CGFloat(1.0))
//
//                    if ((increaseHue >= 19.0 && increaseHue <= 40.0) || (increaseHue >= 61.0 && increaseHue <= 123.0) || (increaseHue >= 173.0 && increaseHue <= 331.0)) {
//                        print(4.35.truncatingRemainder(dividingBy: 1))
//
//
//
//                        let hsbColor = UIColor(hue: increaseHue/360, saturation: saturation/100, brightness: brightness/100, alpha: 1.0)
//                        if (!colors.contains(hsbColor)) {
//                            colors.append(hsbColor)
//                            prevHue = increaseHue
//                            (isSaturation,isBrightness) = (false,false)
//                        }
//                    } else {
//                        let hsbColor = UIColor(hue: decreaseHue/360, saturation: saturation/100, brightness: brightness/100, alpha: 1.0)
//                        if (!colors.contains(hsbColor)) {
//                            colors.append(hsbColor)
//                            prevHue = decreaseHue
//                            (isSaturation,isBrightness) = (false,false)
//                        }
//                    }
////                            let epsilon:CGFloat = 0.23
////                            let colorDistance = sqrt(pow((hue - prevHue) / 1 + k2Industry, 2) + pow((saturation - prevSaturation) / 1 + k1Industry * saturation, 2) + pow((brightness - prevBrightness) / klIndustry * saturation, 2))
////
////                            if (colorDistance.truncatingRemainder(dividingBy: 1) > 0.23) {
////                                prevColorDistance = colorDistance
////                                (prevHue, prevSaturation, prevBrightness) = (hue, saturation, brightness)
////                                self.colors.append(hsbColor)
////                                (isHue, isSaturation, isBrightness) = (true, true, true)
////                            } else {
////                                (isHue, isSaturation, isBrightness) = (false, false, false)
////                            }
//                }
//            }
//            (isHue, isSaturation, isBrightness) = (false,false, false)
            var flag = true
            
            while (flag) {
                
                let localHueGenerate = self.generateHue(isHue: &isHue) / 360
                
                if (isHue) {
                    let localColor = self.goldenRatioColor(hue: localHueGenerate, saturation: self.generateSaturation(isSaturation: &isSaturation), brightness: self.generateBrightness(currentHue: localHueGenerate))
                    if (self.colors.contains(localColor)) {
                        isHue = false
                        continue
                    } else {
                        self.colors.append(localColor)
                        flag = false
                        isHue = false
                        continue
                    }
                } else {
                    flag = true
                    isHue = false
                    continue
                }
            }
        }
    }
    
    private func goldenRatioColor(hue:CGFloat = 0.0,saturation: CGFloat = 0.5, brightness: CGFloat = 0.95) -> UIColor {
        
        let goldenAngle: CGFloat = 0.261818181818//0.618033988749895
        var localHue = hue
            
        localHue += goldenAngle
        localHue = localHue.truncatingRemainder(dividingBy: 1.0)
        
        if (self.checkRangeColors(currentHue: localHue)) {
            return UIColor(hue: localHue, saturation: saturation, brightness: brightness, alpha: 1.0)
        } else {
            return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1.0)
        }
    }
    
    private func generateHue(isHue: inout Bool) -> CGFloat {
        
        let randHue = CGFloat.random(in: 0.0 ... 360.0)
        
        switch randHue {
        case 18.0 ... 41.0:
            isHue = true
            return randHue
        case 60.0 ... 122.0:
            isHue = true
            return randHue
        case 172.0 ... 330.0:
            isHue = true
            return randHue
        default:
            isHue = false
            return 0
        }
//        isHue = true
//        return randHue
    }
    
    private func generateSaturation(isSaturation: inout Bool) -> CGFloat {
        
        let randSaturation = CGFloat.random(in: 50.0 ... 80.0)  // 5
        isSaturation = true
        return randSaturation / 100
    }
    
    private func generateBrightness(currentHue:CGFloat = 0.0) -> CGFloat {
        if (currentHue >= 30.0 && currentHue <= 110.0) {
            let randBrightness = CGFloat.random(in: 60 ... 75)
            return randBrightness / 100
        } else {
            let randBrightness = CGFloat.random(in: 60 ... 90)
            return randBrightness / 100
        }
    }
    
    private func checkRangeColors(currentHue: CGFloat = 0.0) -> Bool {
        
        switch currentHue {
        case 18.0 / 360.0 ... 41.0 / 360.0:
            return true
        case 60.0 / 360.0 ... 122.0 / 360.0:
            return true
        case 172.0 / 360.0 ... 330.0 / 360.0:
            return true
        default:
            return false
        }
    }
}
