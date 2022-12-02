//
//  ViewController.swift
//  Practica1
//
//  Created by Kevin Hernández on 01/12/22.
//
import UIKit
import TinyConstraints

class ViewController: UIViewController {
    
    // Lista de animaciones disponibles
    let animals = ["panda", "toucan", "sloth"]
    var animalSelected : String = "panda"
    
    // Propiedades del segmented control
    lazy var segmentedControl : UISegmentedControl = {
        let control = UISegmentedControl(items: animals)
        control.selectedSegmentIndex = 0
        control.layer.cornerRadius = 9
        control.layer.masksToBounds = true
        control.selectedSegmentTintColor = .systemCyan
        control.setTitleTextAttributes([.foregroundColor : UIColor.white], for: .selected)
        control.addTarget(self, action: #selector(suitDidChange(_:)), for: .valueChanged)
        return control
    }()
    
    // Se coloca un metodo encargado de verificar la opcion elegida por el usuario como animacion
    @objc private func suitDidChange(_ sengmentedControl: UISegmentedControl) {
        switch sengmentedControl.selectedSegmentIndex {
        case 0:
            animalSelected = animals[0]
        case 1:
            animalSelected = animals[1]
        case 2:
            animalSelected = animals[2]
        case 3:
            animalSelected = animals[3]
        default:
            break
        }
        
        // Si la vista con la etiqueta 1 (animacion actual) sigue en el stack de vistas, se procede con removerla
        if (view.viewWithTag(1) != nil) {
            view.viewWithTag(1)?.removeFromSuperview()
        }
        
        animation(animal: animalSelected)
    }
    
    // Creacion del segmented control
    private func setupViews() {
        view.addSubview(segmentedControl)
        view.tag = 100
        
        segmentedControl.edgesToSuperview(
            excluding: .bottom,
            insets: UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12),
            usingSafeArea: true
        )
        
        segmentedControl.height(30)
    }
    
    // Generacion de la animacion elegida por el usuario
    private func animation(animal : String) {
        let animation = LoaderView(name: animal, frame: CGRect(x: 0, y: 0, width: 440, height: 600))
        animation.frame.size = CGSize(width: 440, height: 600)
        animation.center = self.view.center
        view.addSubview(animation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        animation(animal: animalSelected)
    }

}
