//
//  ContentModel.swift
//  Learning App
//
//  Created by Jontrell Foster II on 10/20/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    
    // List of modules
    @Published var modules = [Module]()
    
    // Current module
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    var styleData: Data?
    
    init() {
        getLocalData()
    }
    
    // MARK: Data Methods
    
    func getLocalData() {
        
        // Get a URL to the JSON file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            // Read the file into a data object
            let jsonData = try Data(contentsOf: jsonUrl!)
            
            // Try to decode the JSON into an array of modules
            let jsonDecoder = JSONDecoder()
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            
            // Assign parsed modules to modules property
            self.modules = modules
        }
        catch {
            // TODO log error
        }
        
        // Parse the syle data
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            // Read the file into data object
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            // log error
           
        }
    }
    
    // Mark: Module Navigation Methods
    
    func beginModule(_ moduleid:Int) {

        // Find the index for this module id
        for index in 0..<modules.count {
            
            
            if modules[index].id == moduleid {
                
                
                // Found the matching module
                currentModuleIndex = index
                break
            }
        }
        
        // Set current module
        currentModule = modules[currentModuleIndex]
    }
    
}
