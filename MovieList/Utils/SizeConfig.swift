//
//  SizeConfig.swift
//  MovieList
//
//  Created by mac 2019 on 10/7/22.
//

import Foundation
import UIKit

class SizeConfig {
    static var defaultSize: CGSize { return CGSize(width: 375.0, height: 812.0) }
    static var screenWidth: Double = defaultSize.width
    static var screenHeight: Double = defaultSize.height
    static var padding: UIEdgeInsets = UIEdgeInsets.zero
    static var scaleWidth: Double = 1.0
    static var scaleHeight: Double = 1.0
    static var scaleText: Double = 1.0
    
    static var bottomBarHeight: CGFloat {
        get {
            return 50.s + SizeConfig.padding.bottom
        }
    }
    static var navBarHeight: CGFloat {
        get {
            return 50.s + SizeConfig.padding.top
        }
    }
    
    init() {
        SizeConfig.screenWidth = UIScreen.main.bounds.size.width
        SizeConfig.screenHeight = UIScreen.main.bounds.size.height
        SizeConfig.padding = UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets.zero
        SizeConfig.scaleWidth = SizeConfig.screenWidth/SizeConfig.defaultSize.width
        SizeConfig.scaleHeight = SizeConfig.screenHeight/SizeConfig.defaultSize.height
        SizeConfig.scaleText = min(SizeConfig.scaleWidth, SizeConfig.scaleHeight)
        print("Nirob test padding: \(SizeConfig.padding)")
    }
    
    static func setWidth(width: CGFloat) -> CGFloat { return width * scaleWidth }
    static func setHeight(height: CGFloat) -> CGFloat { return height * scaleHeight }
    static func setScale(value: CGFloat) -> CGFloat { return value * scaleText }
    static func radius(r: CGFloat) -> CGFloat { return r * scaleText }
    static func setSp(fontSize: CGFloat) -> CGFloat { return fontSize * scaleText }
}
