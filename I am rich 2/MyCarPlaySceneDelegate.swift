//
//  MyCarPlaySceneDelegate.swift
//  I am rich 2
//
//  Created by Florian Geiger on 07.03.24.
//

import CarPlay

class MyCarPlaySceneDelegate: UIResponder, CPTemplateApplicationSceneDelegate {
    
    var interfaceController: CPInterfaceController?
    
    func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didConnect interfaceController: CPInterfaceController) {
        self.interfaceController=interfaceController
        
        let tabFavs = CPListItem(text: "Favoriten", detailText: "Übersicht der Favoriten")
        let tabRecent = CPListItem(text: "zuletzt verwendet", detailText: "Übersicht der zuletzt verwendeten")
        let tabHistory = CPListItem(text: "Einsatzverlauf", detailText: "Übersicht de Einsatzverlaufs")
        let tabSearch = CPListItem(text: "Suche", detailText: "Übersicht der Suche")
        
        let sectionItemsA = CPListSection(items:[tabFavs,tabRecent,tabHistory,tabSearch])
        let sectionItemsB = CPListSection(items:[tabFavs,tabHistory])
        
        let listTemplate = CPListTemplate(title: "", sections: [sectionItemsA])
        let listTemplateA = CPListTemplate(title: "", sections: [sectionItemsB])
        let listTemplateB = CPListTemplate(title: "", sections: [sectionItemsA])
        let listTemplateC = CPListTemplate(title: "", sections: [sectionItemsB])
        
        let tabA:CPListTemplate = listTemplate
        tabA.tabSystemItem = .favorites
        tabA.showsTabBadge = false
        
        let tabB:CPListTemplate = listTemplateA
        tabA.tabSystemItem = .mostRecent
        tabA.showsTabBadge = true
        
        let tabC:CPListTemplate = listTemplateB
        tabA.tabSystemItem = .history
        tabA.showsTabBadge = false
        
        let tabD:CPListTemplate = listTemplateC
        tabA.tabSystemItem = .search
        tabA.showsTabBadge = false
        
        let tabBarTemplate = CPTabBarTemplate(templates: [tabA,tabB,tabC,tabD])
        self.interfaceController?.setRootTemplate(tabBarTemplate, animated: true)
        
    }
    
    internal func templateApplicationScene(_ templateApplicationScene: CPTemplateApplicationScene, didDisconnectInterfaceController interfaceController: CPInterfaceController) {
        self.interfaceController=nil
    }
}

