//
//  BluetoothManager.swift
//  StepperControl
//
//  Created by Jeremy Boy on 09.03.21.
//

import CoreBluetooth
import Foundation

class BluetoothManager {
    
    static let shared = BluetoothManager(serial: BluetoothSerial())
    
    private var connectedPeripheral: CBPeripheral?
    private let serial: BluetoothSerialType
    
    init(serial: BluetoothSerialType) {
        self.serial = serial
        self.serial.delegate = self
    }
    
    var state: CBManagerState {
        serial.state
    }
    
    func startScan() {
        serial.startScan()
    }
    
    func send(_ msg: String) {
        serial.sendMessageToDevice(msg)
    }
    
    func send(_ msgs: [String]) {
        msgs.forEach { msg in
            serial.sendMessageToDevice(msg + "\r")
        }
    }
}



extension BluetoothManager: BluetoothSerialDelegate {
    func serialDidChangeState() {
        print("BTM serialDidChangeState")
    }
    
    func serialDidDisconnect(_ peripheral: CBPeripheral, error: NSError?) {
        if let error = error {
            print("BTM disconnect with error " + error.localizedDescription)
        } else {
            print("BTM disconect")
        }
        self.connectedPeripheral = nil
    }
    func serialDidDiscoverPeripheral(_ peripheral: CBPeripheral, RSSI: NSNumber?) {
        print("BTM discover " + peripheral.debugDescription)
        serial.connect(toPeripheral: peripheral)
    }
    func serialDidReceiveString(_ message: String) {
        print("BTM did receive " + message)
    }
    func serialDidReceiveBytes(_ bytes: [UInt8]) {
        print("BTM did receive bytes")
    }
    func serialDidReceiveData(_ data: Data) {
        print("BTM did receive data")
    }
    func serialDidReadRSSI(_ rssi: NSNumber) {
        print("BTM did read RSSI")
    }
    func serialDidConnect(_ peripheral: CBPeripheral) {
        print("BTM did connect peripheral " + peripheral.debugDescription)
        self.connectedPeripheral = peripheral
    }
    func serialDidFailToConnect(_ peripheral: CBPeripheral, error: NSError?) {
        print("BTM did fail to connectperipheral " + peripheral.debugDescription)
        self.connectedPeripheral = nil
    }
    func serialIsReady(_ peripheral: CBPeripheral) {
        print("BTM ready: " + peripheral.debugDescription)
    }
}
