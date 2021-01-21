//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Rakesh Bahadur on 20/01/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var enginePackage = false
    
    let defaultFunds: Int = 1000
    @State private var remainingFunds: Int = 1000
    
    var exhaustPackageDisabled: Bool {
        if remainingFunds < 500 && exhaustPackage == false {
            return true
            
        } else {
            return false
        }
    }
    
    var tiresPackageDisabled: Bool {
        if remainingFunds < 500 && tiresPackage == false {
            return true
        } else {
            return false
        }
    }
    var enginePackageDisabled: Bool {
        if remainingFunds < 1000 && enginePackage == false {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 2
                    remainingFunds += 500
                }
            }
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }
        )
        
        let enginePackageBinding = Binding<Bool> (
            get: { self.enginePackage },
            set: { newValue in
                self.enginePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 2
                    remainingFunds -= 1000
                    
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 2
                    remainingFunds += 1000
                }
            }
        )
        
        VStack {
            Form{
                
                VStack(alignment: .leading, spacing: 20){
                    
                    Text(starterCars.cars[selectedCar].displayStats())
                    
                    Button("Next Car", action: {
                        selectedCar = (selectedCar + 1) % (starterCars.cars.count)
                        resetDisplay()
                    })
                }
            
                Section {
                    Toggle("Exhaust Package (500)", isOn: exhaustPackageBinding).disabled(exhaustPackageDisabled)
                    Toggle("Tires Package (500)", isOn: tiresPackageBinding).disabled(tiresPackageDisabled)
                    Toggle("Engine Package (1,000)", isOn: enginePackageBinding).disabled(enginePackageDisabled)
                }
            }
            
            Text("Remaining Funds: \(remainingFunds)")
                //.foregroundColor(.blue)
                .baselineOffset(20)
            
        }
    }
    
    func resetDisplay() {
        self.exhaustPackage = false
        self.tiresPackage = false
        self.enginePackage = false
        self.remainingFunds = self.defaultFunds
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
