//
//  Model.swift
//  BGNmobiCase
//
//  Created by Cüneyt ALSU on 17.04.2022.
//

import Foundation

class PokemonsModel: Decodable {
    var results: [Pokemons?]?
   
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(results: [Pokemons?]?){
        self.results = results
    }
}

class Pokemons: Decodable {
    var name: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
    }
    
    init(name: String, url: String) {
        
        self.name = name
        self.url = url
    }
}

class PokemonDetails: Decodable {
    var name: String
    var stats: [Stats?]?
    var sprites: Sprites?
   
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case stats = "stats"
        case sprites = "sprites"
    }
    
    init(name: String, stats: [Stats?]?, sprites: Sprites?) {
        self.name = name
        self.stats = stats
        self.sprites = sprites
    }

}

class Stats: Decodable {
    var base_stat: Float?
    var effort: Int?
    var stat: Stat?
    
    enum CodingKeys: String, CodingKey {
        case base_stat = "base_stat"
        case effort = "effort"
        case stat = "stat"
    }
    
    init(base_stat: Float?, effort: Int?, stat: Stat?) {
        self.base_stat = base_stat
        self.effort = effort
        self.stat = stat
    }
}

class Stat: Decodable {
    var name: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
    }
    
    init(name: String?) {
        self.name = name
    }
}

class Sprites: Decodable {
    var back_default: String?
    var back_female: String?
    var back_shiny: String?
    var back_shiny_female: String?
    var front_default: String?
    var front_female: String?
    var front_shiny: String?
    var front_shiny_female: String?
    var others: Others?
    var versions: Versions?
    var imageArray: [String] = []
    var animated: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case back_default = "back_default"
        case back_female = "back_female"
        case back_shiny = "back_shiny"
        case back_shiny_female = "back_shiny_female"
        case front_default = "front_default"
        case front_female = "front_female"
        case front_shiny = "front_shiny"
        case front_shiny_female = "front_shiny_female"
        case others = "other"
        case versions = "versions"
        case animated = "animated"
    }
    
    init(back_default: String?, back_female: String?, back_shiny: String?, back_shiny_female: String?, front_default: String?, front_female: String?, front_shiny: String?, front_shiny_female: String?, others: Others?, versions: Versions?, animated: Sprites?) {
        self.back_default = back_default
        self.back_female = back_female
        self.back_shiny = back_shiny
        self.back_shiny_female = back_shiny_female
        self.front_default = front_default
        self.front_female = front_female
        self.front_shiny = front_shiny
        self.front_shiny_female = front_shiny_female
        self.others = others
        self.versions = versions
        self.animated = animated
    }
    
    func getImages(){
        if let back_default = self.back_default {
            imageArray.append(back_default)
        }
        
        if let back_female = self.back_female {
            imageArray.append(back_female)
        }
        
        if let back_shiny = self.back_shiny {
            imageArray.append(back_shiny)
        }
        
        if let back_shiny_female = self.back_shiny_female {
            imageArray.append(back_shiny_female)
        }
        
        if let front_default = self.front_default {
            imageArray.append(front_default)
        }
        
        if let front_female = self.front_female {
            imageArray.append(front_female)
        }
        
        if let front_shiny = self.front_shiny {
            imageArray.append(front_shiny)
        }
        
        if let front_shiny_female = self.front_shiny_female {
            imageArray.append(front_shiny_female)
        }
        
        if let animated = self.animated {
            animated.getImages()
            if animated.imageArray.count > 0 {
                imageArray = imageArray + animated.imageArray
            }
        }

        if let others = self.others {
            others.dream_world?.getImages()
            if let dream_world = others.dream_world, dream_world.imageArray.count > 0 {
                imageArray = imageArray + dream_world.imageArray
            }
            others.home?.getImages()
            if let home = others.home, home.imageArray.count > 0 {
                imageArray = imageArray + home.imageArray
            }
            others.officialArtwork?.getImages()
            if let officialArtwork = others.officialArtwork, officialArtwork.imageArray.count > 0 {
                imageArray = imageArray + officialArtwork.imageArray
            }
        }
        
        if let generationi = self.versions?.generationi {
            generationi.redBlue?.getImages()
            if let redBlue = generationi.redBlue, redBlue.imageArray.count > 0 {
                imageArray = imageArray + redBlue.imageArray
            }
            generationi.yellow?.getImages()
            if let yellow = generationi.yellow, yellow.imageArray.count > 0 {
                imageArray = imageArray + yellow.imageArray
            }
        }
        
        if let generationii = self.versions?.generationii {
            generationii.silver?.getImages()
            if let silver = generationii.silver, silver.imageArray.count > 0 {
                imageArray = imageArray + silver.imageArray
            }
            generationii.crystal?.getImages()
            if let crystal = generationii.crystal, crystal.imageArray.count > 0 {
                imageArray = imageArray + crystal.imageArray
            }
            generationii.gold?.getImages()
            if let gold = generationii.gold, gold.imageArray.count > 0 {
                imageArray = imageArray + gold.imageArray
            }
        }
        
        if let generationiii = self.versions?.generationiii {
            generationiii.emerald?.getImages()
            if let emerald = generationiii.emerald, emerald.imageArray.count > 0 {
                imageArray = imageArray + emerald.imageArray
            }
            generationiii.fireredLeafgreen?.getImages()
            if let fireredLeafgreen = generationiii.fireredLeafgreen, fireredLeafgreen.imageArray.count > 0 {
                imageArray = imageArray + fireredLeafgreen.imageArray
            }
            generationiii.rubySapphire?.getImages()
            if let rubySapphire = generationiii.rubySapphire, rubySapphire.imageArray.count > 0 {
                imageArray = imageArray + rubySapphire.imageArray
            }
        }
        
        if let generationiv = self.versions?.generationiv {
            generationiv.diamondPearl?.getImages()
            if let diamondPearl = generationiv.diamondPearl, diamondPearl.imageArray.count > 0 {
                imageArray = imageArray + diamondPearl.imageArray
            }
            generationiv.heartgoldSoulsilver?.getImages()
            if let heartgoldSoulsilver = generationiv.heartgoldSoulsilver, heartgoldSoulsilver.imageArray.count > 0 {
                imageArray = imageArray + heartgoldSoulsilver.imageArray
            }
            generationiv.platinum?.getImages()
            if let platinum = generationiv.platinum, platinum.imageArray.count > 0 {
                imageArray = imageArray + platinum.imageArray
            }
        }
        
        if let generationv = self.versions?.generationv {
            generationv.blackWhite?.getImages()
            if let blackWhite = generationv.blackWhite, blackWhite.imageArray.count > 0 {
                imageArray = imageArray + blackWhite.imageArray
            }
        }
        
        if let generationvi = self.versions?.generationvi {
            generationvi.omegarubyAlphasapphire?.getImages()
            if let omegarubyAlphasapphire = generationvi.omegarubyAlphasapphire, omegarubyAlphasapphire.imageArray.count > 0 {
                imageArray = imageArray + omegarubyAlphasapphire.imageArray
            }
            generationvi.xY?.getImages()
            if let xY = generationvi.xY, xY.imageArray.count > 0 {
                imageArray = imageArray + xY.imageArray
            }
        }
        
        if let generationvii = self.versions?.generationvii {
            generationvii.icons?.getImages()
            if let icons = generationvii.icons, icons.imageArray.count > 0 {
                imageArray = imageArray + icons.imageArray
            }
            generationvii.ultraSunUltraMoon?.getImages()
            if let ultraSunUltraMoon = generationvii.ultraSunUltraMoon, ultraSunUltraMoon.imageArray.count > 0 {
                imageArray = imageArray + ultraSunUltraMoon.imageArray
            }
        }
        
        if let generationviii = self.versions?.generationviii {
            generationviii.icons?.getImages()
            if let icons = generationviii.icons, icons.imageArray.count > 0 {
                imageArray = imageArray + icons.imageArray
            }
        }
        imageArray = imageArray.filter{!$0.contains(".svg")
        }
    }
}

class Others: Decodable {
    var dream_world: Sprites?
    var home: Sprites?
    var officialArtwork: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case dream_world = "dream_world"
        case home = "home"
        case officialArtwork = "official-artwork"
    }
    
    init(dream_world: Sprites?, home: Sprites?, officialArtwork: Sprites? ) {
        self.dream_world = dream_world
        self.home = home
        self.officialArtwork = officialArtwork
    }
}

class Versions: Decodable {
    var generationi: Generationi?
    var generationii: Generationii?
    var generationiii: Generationiii?
    var generationiv: Generationiv?
    var generationv: Generationv?
    var generationvi: Generationvi?
    var generationvii: Generationvii?
    var generationviii: Generationviii?
    
    enum CodingKeys: String, CodingKey {
        case generationi = "generation-i"
        case generationii = "generation-ii"
        case generationiii = "generation-iii"
        case generationiv = "generation-iv"
        case generationv = "generation-v"
        case generationvi = "generation-vi"
        case generationvii = "generation-vii"
        case generationviii = "generation-viii"
    }
    
    init(generationi: Generationi?, generationii: Generationii?, generationiii: Generationiii?, generationiv: Generationiv?, generationv: Generationv?, generationvi: Generationvi?, generationvii: Generationvii?, generationviii: Generationviii?) {
        
        self.generationi = generationi
        self.generationii = generationii
        self.generationiii = generationiii
        self.generationiv = generationiv
        self.generationv = generationv
        self.generationvi = generationvi
        self.generationvii = generationvii
        self.generationviii = generationviii
        
    }
}

class Generationi: Decodable {
    var redBlue: Sprites?
    var yellow: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case redBlue = "red-blue"
        case yellow = "yellow"
    }
    
    init(redBlue: Sprites?, yellow: Sprites?) {
        self.redBlue = redBlue
        self.yellow = yellow
    }
}

class Generationii: Decodable {
    var crystal: Sprites?
    var gold: Sprites?
    var silver: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case crystal = "crystal"
        case gold = "gold"
        case silver = "silver"
    }
    
    init(crystal: Sprites?, gold: Sprites?, silver: Sprites?) {
        self.crystal = crystal
        self.gold = gold
        self.silver = silver
    }
}

class Generationiii: Decodable {
    var emerald: Sprites?
    var fireredLeafgreen: Sprites?
    var rubySapphire: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case emerald = "emerald"
        case fireredLeafgreen = "firered-leafgreen"
        case rubySapphire = "ruby-sapphire"
    }
    
    init(emerald: Sprites?, fireredLeafgreen: Sprites?, rubySapphire: Sprites?) {
        self.emerald = emerald
        self.fireredLeafgreen = fireredLeafgreen
        self.rubySapphire = rubySapphire
    }
}

class Generationiv: Decodable {
    var diamondPearl: Sprites?
    var heartgoldSoulsilver: Sprites?
    var platinum: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case diamondPearl = "diamond-pearl"
        case heartgoldSoulsilver = "heartgold-soulsilver"
        case platinum = "platinum"
    }
    
    init(diamondPearl: Sprites?, heartgoldSoulsilver: Sprites?, platinum: Sprites?) {
        self.diamondPearl = diamondPearl
        self.heartgoldSoulsilver = heartgoldSoulsilver
        self.platinum = platinum
    }
}

class Generationv: Decodable {
    var blackWhite: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case blackWhite = "black-white"
    }
    
    init(blackWhite: Sprites?) {
        self.blackWhite = blackWhite
    }
}

class Generationvi: Decodable {
    var omegarubyAlphasapphire: Sprites?
    var xY: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case omegarubyAlphasapphire = "omegaruby-alphasapphire"
        case xY = "x-y"
    }
    
    init(omegarubyAlphasapphire: Sprites?, xY: Sprites?) {
        self.omegarubyAlphasapphire = omegarubyAlphasapphire
        self.xY = xY
    }
}

class Generationvii: Decodable {
    var icons: Sprites?
    var ultraSunUltraMoon: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case icons = "icons"
        case ultraSunUltraMoon = "ultra-sun-ultra-moon"
    }
    
    init(icons: Sprites?, ultraSunUltraMoon: Sprites?) {
        self.icons = icons
        self.ultraSunUltraMoon = ultraSunUltraMoon
    }
}

class Generationviii: Decodable {
    var icons: Sprites?
    
    enum CodingKeys: String, CodingKey {
        case icons = "icons"
    }
    
    init(icons: Sprites?, ultraSunUltraMoon: Sprites?) {
        self.icons = icons
    }
}
