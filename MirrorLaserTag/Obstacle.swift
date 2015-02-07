//
//  Obstacle.swift
//  MirrorLaserTag
//
//  Created by Kristian Andersen on 07/02/15.
//  Copyright (c) 2015 Robocat. All rights reserved.
//

import SpriteKit

enum ObstacleType: String {
	case Plant = "plant"
}

class Obstacle : SKSpriteNode {
	convenience init(type: ObstacleType) {
		let texture = SKTexture(imageNamed: type.rawValue)
		
		self.init(texture: texture, color: nil, size: texture.size())
	}
	
	override init(texture: SKTexture!, color: NSColor!, size: CGSize) {
		super.init(texture: texture, color: color, size: size)
		setupPhysics()
	}
	
	required init?(coder aDecoder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
	
	func setupPhysics() {
		physicsBody = SKPhysicsBody(texture: texture, size: size)
		physicsBody?.affectedByGravity = false
		physicsBody?.dynamic = false
		physicsBody?.categoryBitMask = PhysicsType.Obstacle.rawValue
	}
}

