//
//  DetailsViewController.swift
//  ARPlanetsRotation
//
//  Created by apoorva on 18/01/18.
//  Copyright © 2018 apoorva. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var planetImageView: UIImageView!
    @IBOutlet weak var planetDetails: UITextView!
    var planet: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch planet {
        case "mercury":
            planetImageView.image = UIImage(named: "mercuryImage.jpg")
            planetDetails.text = "Mercury (0.4 AU from the Sun) is the closest planet to the Sun and the smallest planet in the Solar System (0.055 Earth masses). Mercury has no natural satellites; besides impact craters, its only known geological features are lobed ridges or rupes that were probably produced by a period of contraction early in its history.[68] Mercury's very tenuous atmosphere consists of atoms blasted off its surface by the solar wind.[69] Its relatively large iron core and thin mantle have not yet been adequately explained. Hypotheses include that its outer layers were stripped off by a giant impact; or, that it was prevented from fully accreting by the young Sun's energy."
            break
        case "venus":
            planetImageView.image = UIImage(named: "venusImage.jpeg")
            planetDetails.text = "Venus (0.7 AU from the Sun) is close in size to Earth (0.815 Earth masses) and, like Earth, has a thick silicate mantle around an iron core, a substantial atmosphere, and evidence of internal geological activity. It is much drier than Earth, and its atmosphere is ninety times as dense. Venus has no natural satellites. It is the hottest planet, with surface temperatures over 400 °C (752 °F), most likely due to the amount of greenhouse gases in the atmosphere.[72] No definitive evidence of current geological activity has been detected on Venus, but it has no magnetic field that would prevent depletion of its substantial atmosphere, which suggests that its atmosphere is being replenished by volcanic eruptions."
            break
        case "earth":
            planetImageView.image = UIImage(named: "earthImage.jpg")
            planetDetails.text = "Earth (1 AU from the Sun) is the largest and densest of the inner planets, the only one known to have current geological activity, and the only place where life is known to exist. Its liquid hydrosphere is unique among the terrestrial planets, and it is the only planet where plate tectonics has been observed. Earth's atmosphere is radically different from those of the other planets, having been altered by the presence of life to contain 21% free oxygen. It has one natural satellite, the Moon, the only large satellite of a terrestrial planet in the Solar System."
            break
        case "mars":
            planetImageView.image = UIImage(named: "marsImage.jpeg")
            planetDetails.text = "Mars (1.5 AU from the Sun) is smaller than Earth and Venus (0.107 Earth masses). It has an atmosphere of mostly carbon dioxide with a surface pressure of 6.1 millibars (roughly 0.6% of that of Earth). Its surface, peppered with vast volcanoes, such as Olympus Mons, and rift valleys, such as Valles Marineris, shows geological activity that may have persisted until as recently as 2 million years ago. Its red colour comes from iron oxide (rust) in its soil. Mars has two tiny natural satellites (Deimos and Phobos) thought to be captured asteroids."
            break
        case "jupitor":
            planetImageView.image = UIImage(named: "jupiterImage.jpeg")
            planetDetails.text = "Jupiter (5.2 AU), at 318 Earth masses, is 2.5 times the mass of all the other planets put together. It is composed largely of hydrogen and helium. Jupiter's strong internal heat creates semi-permanent features in its atmosphere, such as cloud bands and the Great Red Spot. Jupiter has 69 known satellites. The four largest, Ganymede, Callisto, Io, and Europa, show similarities to the terrestrial planets, such as volcanism and internal heating. Ganymede, the largest satellite in the Solar System, is larger than Mercury."
            break
        case "saturn":
            planetImageView.image = UIImage(named: "saturnImage.jpg")
            planetDetails.text = "Saturn (9.5 AU), distinguished by its extensive ring system, has several similarities to Jupiter, such as its atmospheric composition and magnetosphere. Although Saturn has 60% of Jupiter's volume, it is less than a third as massive, at 95 Earth masses. Saturn is the only planet of the Solar System that is less dense than water. The rings of Saturn are made up of small ice and rock particles. Saturn has 62 confirmed satellites composed largely of ice. Two of these, Titan and Enceladus, show signs of geological activity. Titan, the second-largest moon in the Solar System, is larger than Mercury and the only satellite in the Solar System with a substantial atmosphere."
            break
        case "neptune":
            planetImageView.image = UIImage(named: "neptuneImage.jpeg")
            planetDetails.text = "Neptune (30.1 AU), though slightly smaller than Uranus, is more massive (equivalent to 17 Earths) and hence more dense. It radiates more internal heat, but not as much as Jupiter or Saturn. Neptune has 14 known satellites. The largest, Triton, is geologically active, with geysers of liquid nitrogen. Triton is the only large satellite with a retrograde orbit. Neptune is accompanied in its orbit by several minor planets, termed Neptune trojans, that are in 1:1 resonance with it.."
            break
        case "uranus":
            planetImageView.image = UIImage(named: "uranusImage.jpeg")
            planetDetails.text = "Uranus (19.2 AU), at 14 Earth masses, is the lightest of the outer planets. Uniquely among the planets, it orbits the Sun on its side; its axial tilt is over ninety degrees to the ecliptic. It has a much colder core than the other giant planets and radiates very little heat into space. Uranus has 27 known satellites, the largest ones being Titania, Oberon, Umbriel, Ariel, and Miranda."
            break
        case "sun":
            planetImageView.image = UIImage(named: "sunImage.jpg")
            planetDetails.text = """
            The Sun is the Solar System's star and by far its most massive component. Its large mass (332,900 Earth masses)[48] produces temperatures and densities in its core high enough to sustain nuclear fusion of hydrogen into helium, making it a main-sequence star. This releases an enormous amount of energy, mostly radiated into space as electromagnetic radiation peaking in visible light.
            The Sun is a G2-type main-sequence star. Hotter main-sequence stars are more luminous. The Sun's temperature is intermediate between that of the hottest stars and that of the coolest stars. Stars brighter and hotter than the Sun are rare, whereas substantially dimmer and cooler stars, known as red dwarfs, make up 85% of the stars in the Milky Way.
            """
            break
        case "moon":
            planetImageView.image = UIImage(named: "moon.jpg")
            planetDetails.text = "The Moon is an astronomical body that orbits planet Earth, being Earth's only permanent natural satellite. It is the fifth-largest natural satellite in the Solar System, and the largest among planetary satellites relative to the size of the planet that it orbits."
            break
        default:
            break
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
