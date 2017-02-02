//
//  Page.swift
//  InteractiveStory
//
//  Created by Frederico on 02/02/2017.
//  Copyright © 2017 Fuad Adetoro. All rights reserved.
//

import Foundation


class Page {
    let story: Story
    
    typealias choice = (title: String, page: Page)
    
    var firstChoice: choice?
    var secondChoice: choice?
    
    init(story: Story) {
        self.story = story
    }
}

extension Page {
    func addChoiceWith(title: String, story: Story) -> Page {
        let page = Page(story: story)
        
        return addChoiceWith(title: title, page: page)
    }
    
    func addChoiceWith(title: String, page: Page) -> Page {
        switch (firstChoice, secondChoice) {
        case (.some, .some):
            return self
        case (.none, .none), (.none, .some):
            firstChoice = (title, page)
        case (.some, .none):
            secondChoice = (title, page)
        }
        
        return page
    }
}



