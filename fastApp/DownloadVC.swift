//
//  downloadsVC.swift
//  fastApp
//
//  Created by 김익두 on 11/13/24.
//

import UIKit

class DownloadVC : UIViewController {
    
    @IBOutlet weak var downloadTabItem: UITabBarItem!   // Tab bar practice
    
    @IBOutlet weak var customTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSongData()
        customTableView.dataSource = self
    }
    
    // list of employee array
    var songList: [Songs] = [Songs(songTitle: "Flowers", singer: "Miley Cyrus"),
                             Songs(songTitle: "Anti-Hero", singer: "Taylor Swift"),
                             Songs(songTitle: "As It Was", singer: "Harry Styles"),
                             Songs(songTitle: "Unholy", singer: "Sam Smith & Kim Petras"),
                             Songs(songTitle: "Kill Bill", singer: "SZA"),
                             Songs(songTitle: "Calm Down", singer: "Rema & Selena Gomez"),
                             Songs(songTitle: "Blinding Lights", singer: "The Weeknd"),
                             Songs(songTitle: "Stay", singer: "The Kid LAROI & Justin Bieber"),
                             Songs(songTitle: "Montero (Call Me By Your Name)", singer: "Lil Nas X"),
                             Songs(songTitle: "Peaches", singer: "Justin Bieber")]
    
    override func viewDidAppear(_ animated: Bool) {
        downloadTabItem.badgeValue = nil    // Tab bar practice
    }
}

extension DownloadVC {
    func loadSongData () {
        let additionalSongs = [
            Songs(songTitle: "Levitating", singer: "Dua Lipa"),
            Songs(songTitle: "Watermelon Sugar", singer: "Harry Styles")
        ]
        
        // Append additional songs to the existing list
        for song in additionalSongs {
            songList.append(song)
        }
    }
}

// Table view practice
extension DownloadVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell") as? CustomCell
        let song = songList[indexPath.row]
        cell?.songName.text = song.songTitle
        cell?.subLabel.text = song.singer
        return cell ?? UITableViewCell()
        
    }
}
