//
//  BluetoothManager.swift
//  StepperControl
//
//  Created by Jeremy Boy on 09.03.21.
//

import CoreBluetooth
import Foundation

enum BluetoothState {
    case unknown
    case resetting
    case unsupported
    case unauthorized
    case poweredOff
    case poweredOn
    case connecting
    case connected
}

class BluetoothManager: ObservableObject {
    
    @Published var state: BluetoothState = .unknown
    
    static let shared = BluetoothManager(serial: BluetoothSerial())
    
    private var connectedPeripheral: CBPeripheral?
    private let serial: BluetoothSerialType
    
    init(serial: BluetoothSerialType) {
        self.serial = serial
        self.serial.delegate = self
    }
    
    
    func startScan() -> Bool {
        state = .connecting
        return serial.startScan()
    }
    
    func disconnect() {
        state = .poweredOn
        serial.disconnect()
    }
    
    func send(_ msg: String) {
        print("BTM send: \(msg)")
        serial.sendMessageToDevice(msg)
    }
    
    func send(_ msgs: [String]) {
        msgs.forEach { msg in
            self.send(msg + "\r")
        }
    }
}



extension BluetoothManager: BluetoothSerialDelegate {
    func serialDidChangeState(_ newState: CBManagerState) {
        switch newState {
        case .unknown:
            state = .unknown
        case .resetting:
            state = .resetting
        case .unsupported:
            state = .unsupported
        case .unauthorized:
            state = .unauthorized
        case .poweredOff:
            state = .poweredOff
        case .poweredOn:
            state = .poweredOn
        @unknown default:
            state = .unknown
        }
        print("BTM serialDidChangeState")
    }
    
    func serialDidDisconnect(_ peripheral: CBPeripheral, error: NSError?) {
        if let error = error {
            print("BTM disconnect with error " + error.localizedDescription)
        } else {
            print("BTM disconect")
        }
        state = .poweredOn
        self.connectedPeripheral = nil
    }
    func serialDidDiscoverPeripheral(_ peripheral: CBPeripheral, RSSI: NSNumber?) {
        print("BTM discover " + peripheral.debugDescription)
        if state == .connecting {
            serial.connect(toPeripheral: peripheral)
        }
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
        state = .connected
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
