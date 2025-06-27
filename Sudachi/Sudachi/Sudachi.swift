//
//  Sudachi.swift
//  Sudachi
//
//  Created by Jarrod Norwell on 4/3/2024.
//

import Foundation
import QuartzCore.CAMetalLayer

public struct Sudachi {
    
    public static let shared = Sudachi()
    
    fileprivate let sudachiObjC = SudachiObjC.shared()
    
    public func configure(layer: CAMetalLayer, with size: CGSize) {
        sudachiObjC.configure(layer: layer, with: size)
    }
    
    public func information(for url: URL) -> SudachiInformation {
        sudachiObjC.gameInformation.information(for: url)
    }
    
    public func insert(game url: URL) {
        sudachiObjC.insert(game: url)
    }
    
    public func insert(games urls: [URL]) {
        sudachiObjC.insert(games: urls)
    }
    
    public func refreshKeys() {
        sudachiObjC.refreshKeys()
    }
    
    public func bootOS() {
        sudachiObjC.bootOS()
    }
    
    public func bootMii() {
        sudachiObjC.bootMii()
    }
    
    public func halt() {
        sudachiObjC.halt()
    }
    
    public func start() {
        sudachiObjC.start()
    }
    
    public func pause() {
        sudachiObjC.pause()
    }
    
    public func play() {
        sudachiObjC.play()
    }
     
    public func ispaused() -> Bool {
        return sudachiObjC.ispaused()
    }
    
    public func FirstFrameShowed() -> Bool {
        return sudachiObjC.hasfirstfame()
    }
    
    public func canGetFullPath() -> Bool {
        return sudachiObjC.canGetFullPath()
    }
    
    
    public func exit() {
        sudachiObjC.quit()
    }
    
    public func step() {
        sudachiObjC.step()
    }
    
    public func orientationChanged(orientation: UIInterfaceOrientation, with layer: CAMetalLayer, size: CGSize) {
        sudachiObjC.orientationChanged(orientation: orientation, with: layer, size: size)
    }
    
    public func touchBegan(at point: CGPoint, for index: UInt) {
        sudachiObjC.touchBegan(at: point, for: index)
    }
    
    public func touchEnded(for index: UInt) {
        sudachiObjC.touchEnded(for: index)
    }
    
    public func touchMoved(at point: CGPoint, for index: UInt) {
        sudachiObjC.touchMoved(at: point, for: index)
    }
    
    public func gyroMoved(x: Float, y: Float, z: Float, accelX: Float, accelY: Float, accelZ: Float, controllerId: Int32, deltaTimestamp: Int32) {
        sudachiObjC.virtualControllerGyro(controllerId,
                                          deltaTimestamp: deltaTimestamp,
                                          gyroX: x,
                                          gyroY: y,
                                          gyroZ: z,
                                          accelX: accelX,
                                          accelY: accelY,
                                          accelZ: accelZ)
    }

    
    public func thumbstickMoved(analog: VirtualControllerAnalogType, x: Float, y: Float, controllerid: Int) {
        sudachiObjC.thumbstickMoved(analog, x: CGFloat(x), y: CGFloat(y), controllerId: Int32(controllerid))
    }
    
    public func virtualControllerButtonDown(button: VirtualControllerButtonType, controllerid: Int) {
        sudachiObjC.virtualControllerButtonDown(button, controllerId: Int32(controllerid))
    }
    
    public func virtualControllerButtonUp(button: VirtualControllerButtonType, controllerid: Int) {
        sudachiObjC.virtualControllerButtonUp(button, controllerId: Int32(controllerid))
    }
    
    public func settingsSaved() {
        sudachiObjC.settingsChanged()
    }
}
