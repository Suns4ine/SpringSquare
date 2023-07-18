//
//  GradientView.swift
//  SpringSquare
//
//  Created by Vyacheslav Pronin on 18.07.2023.
//

import UIKit
import Foundation

final class GradientView: UIView {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    private var gradient: Gradient?
    
    convenience init(gradient: Gradient) {
        self.init(frame: .zero)
        self.gradient = gradient
        setup()
    }
}

private extension GradientView {
    
    func setup() {
        guard let gradient,
              let layerClass = self.layer as? CAGradientLayer
        else { return }
        
        layerClass.colors = gradient.colors
        layerClass.startPoint = gradient.coordinat.start
        layerClass.endPoint = gradient.coordinat.end
        layerClass.type = gradient.type
    }
}

struct Gradient {
    
    /// Координаты начала и конца градиента
    typealias Coordinat = (start: CGPoint, end: CGPoint)
    
    /// Цвета
    let colors: [CGColor]
    
    /// Координаты
    let coordinat: Coordinat
    
    /// Тип градиента
    let type: CAGradientLayerType
}
