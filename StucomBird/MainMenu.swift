//
//  MainMenu.swift
//  StucomBird
//
//  Created by Ferran Escolano on 14/5/19.
//  Copyright © 2019 DAM. All rights reserved.
//

import Foundation
import SpriteKit


class MainMenu: SKScene {
    var fondo = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        //self.backgroundColor = SKColor.green
        
        crearFondoConAnimacion()
        //playButton = self.childNode(withName: "") as! SKSpriteNode
        let scoreLabel:SKLabelNode = self.childNode(withName: "Score") as! SKLabelNode
        scoreLabel.text = String(Score)
    }
    
    func crearFondoConAnimacion() {
        // Textura para el fondo
        let texturaFondo = SKTexture(imageNamed: "fondo6.png")
        
        // Acciones del fondo (para hacer ilusión de movimiento)
        
        // Desplazamos en el eje de las x cada 0.3s
        
        let movimientoFondo = SKAction.move(by: CGVector(dx: -texturaFondo.size().width, dy: 0), duration: 5)
        
        
        
        
        let movimientoFondoOrigen = SKAction.move(by: CGVector(dx: texturaFondo.size().width, dy: 0), duration: 0)
        // let movimientoFondoOrigen = SKAction.move(by: CGVector(dx: texturaFondo.size().width, dy: 0), duration: 0)
        
        // repetimos hasta el infinito
        let movimientoInfinitoFondo = SKAction.repeatForever(SKAction.sequence([movimientoFondo, movimientoFondoOrigen]))
        
        // Necesitamos más de un fondo para que no se vea la pantalla en negro
        
        // contador de fondos
        var i: CGFloat = 0
        
        while i < 3{
            
            // Le ponemos la textura al fondo
            fondo = SKSpriteNode(texture: texturaFondo)
            
            let posx = texturaFondo.size().width
            
            
            // Indicamos la posición inicial del fondo
            fondo.position = CGPoint(x: posx * i, y: self.frame.midY)
            
            
            // Estiramos la altura de la imagen para que se adapte al alto de la pantalla
            fondo.size.width = self.frame.width
            
            //fondo.size.height = self.frame.width
            fondo.size.height = self.frame.height/4
            
            // Indicamos zPosition para que quede detrás de todo
            fondo.zPosition = -1
            
            // Aplicamos la acción
            fondo.run(movimientoInfinitoFondo)
            // Ponemos el fondo en la escena
            self.addChild(fondo)
            
            // Incrementamos contador
            i += 1
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch = touches.first
        let posicion = touch!.location(in: self)
        let nodoTocado = self.atPoint(posicion)
        
        if let name = nodoTocado.name{
            
            if name == "tryAgain"{
                
                let GameScene = MainMenu(fileNamed: "GameScene")
                GameScene?.scaleMode = .aspectFill
                self.view?.presentScene(GameScene)
                
            }
            
            if name == "menu"{
                
                let LevelScene = LevelSelector(fileNamed: "LevelSelector")
                LevelScene?.scaleMode = .aspectFill
                self.view?.presentScene(LevelScene)
            }
        }
        
        
        
    }
    
    
    
}
