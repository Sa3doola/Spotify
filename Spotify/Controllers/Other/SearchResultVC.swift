//
//  SearchResultVC.swift
//  Spotify
//
//  Created by Saad Sherif on 3/3/21.
//

import UIKit

struct SearchSection {
    let title: String
    let results: [SearchResult]
}

protocol SearchResultVCDelegate: AnyObject {
    func didTapResult(_ result: SearchResult)
}

class SearchResultVC: UIViewController {
    
    weak var delegate: SearchResultVCDelegate?
    
    private var sections: [SearchSection] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SearchResultDefaultTVC.self,
                           forCellReuseIdentifier: SearchResultDefaultTVC.identifier)
        tableView.register(SearchResultSubTitleTVC.self,
                           forCellReuseIdentifier: SearchResultSubTitleTVC.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func update(with results: [SearchResult]) {
        let artists = results.filter({
            switch $0 {
            case .artist: return true
            default: return false
            }
        })
        
        let albums = results.filter({
            switch $0 {
            case .album: return true
            default: return false
            }
        })
        
        let tracks = results.filter({
            switch $0 {
            case .track: return true
            default: return false
            }
        })
        
        let playlists = results.filter({
            switch $0 {
            case .playlist: return true
            default: return false
            }
        })
        
        self.sections = [
            SearchSection(title: "Songs", results: tracks),
            SearchSection(title: "Artists", results: artists),
            SearchSection(title: "Playlists", results: playlists),
            SearchSection(title: "Albums", results: albums)
        ]
        tableView.reloadData()
        tableView.isHidden = results.isEmpty
    }
}

extension SearchResultVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let results = sections[indexPath.section].results[indexPath.row]
        
        switch results {
        case .artist(let artist):
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SearchResultDefaultTVC.identifier,
                    for: indexPath) as? SearchResultDefaultTVC else {
                return UITableViewCell()
            }
            let viewModel = SearchResultDefaultTVCVM(
                title: artist.name,
                imageURL: URL(string: artist.images?.first?.url ?? "")
            )
            cell.configure(with: viewModel)
            return cell
        case .album(let album):
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SearchResultSubTitleTVC.identifier,
                    for: indexPath) as? SearchResultSubTitleTVC else {
                return UITableViewCell()
            }
            let viewModel = SearchResultSubTitleTVCVM(
                title: album.name,
                subTitle: album.artists.first?.name ?? "",
                imageURL: URL(string: album.images.first?.url ?? "")
            )
            cell.configure(with: viewModel)
            return cell
        case .playlist(let playlist):
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SearchResultSubTitleTVC.identifier,
                    for: indexPath) as? SearchResultSubTitleTVC else {
                return UITableViewCell()
            }
            let viewModel = SearchResultSubTitleTVCVM(
                title: playlist.name,
                subTitle: playlist.owner.display_name,
                imageURL: URL(string: playlist.images.first?.url ?? "")
            )
            cell.configure(with: viewModel)
            return cell
        case .track(let track):
            guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: SearchResultSubTitleTVC.identifier,
                    for: indexPath) as? SearchResultSubTitleTVC else {
                return UITableViewCell()
            }
            let viewModel = SearchResultSubTitleTVCVM(
                title: track.name,
                subTitle: track.artists.first?.name ?? "" ,
                imageURL: URL(string: track.album?.images.first?.url ?? "")
            )
            cell.configure(with: viewModel)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let results = sections[indexPath.section].results[indexPath.row]
        delegate?.didTapResult(results)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
