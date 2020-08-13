/**
*  CasperishTheme
*  Copyright (c) Arnaud Joubay 2020
*  MIT license, see LICENSE file for details
*/

import Foundation
import Plot
import Publish
import ReadingTimePublishPlugin
import SwiftPygmentsPublishPlugin

public extension Theme where Site: CasperishWebsite {
    static var casperish: Self {
        Theme(
            htmlFactory: CasperishHTMLFactory(),
            resourcePaths: ["Resources/CasperishTheme/styles.css"]
        )
    }
}

public protocol CasperishWebsiteItemMetadata {
    var cover: String? { get }
}

public enum ContactPoint {
    case twitter, dev, linkedIn, gitHub, stackoverflow
    
    func url(_ handler: String) -> String {
        switch self {
        case .twitter:
            return "https://twitter.com/\(handler)"
        case .dev:
            return "https://dev.to/\(handler)"
        case .linkedIn:
            return "https://www.linkedin.com/in/\(handler)/"
        case .gitHub:
            return "https://github.com/\(handler)"
        case .stackoverflow:
            return "https://stackoverflow.com/users/\(handler)"
        }
    }
    
    var svg: Node<HTML.AnchorContext> {
        switch self {
        case .twitter:
            return .element(named: "svg", nodes: [
                .class("fill-current h-4"),
                .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg"),
                .attribute(named: "viewBox", value: "0 0 32 32"),
                .element(named: "path", attributes: [.attribute(named: "d", value: "M30.063 7.313c-.813 1.125-1.75 2.125-2.875 2.938v.75c0 1.563-.188 3.125-.688 4.625a15.088 15.088 0 0 1-2.063 4.438c-.875 1.438-2 2.688-3.25 3.813a15.015 15.015 0 0 1-4.625 2.563c-1.813.688-3.75 1-5.75 1-3.25 0-6.188-.875-8.875-2.625.438.063.875.125 1.375.125 2.688 0 5.063-.875 7.188-2.5-1.25 0-2.375-.375-3.375-1.125s-1.688-1.688-2.063-2.875c.438.063.813.125 1.125.125.5 0 1-.063 1.5-.25-1.313-.25-2.438-.938-3.313-1.938a5.673 5.673 0 0 1-1.313-3.688v-.063c.813.438 1.688.688 2.625.688a5.228 5.228 0 0 1-1.875-2c-.5-.875-.688-1.813-.688-2.75 0-1.063.25-2.063.75-2.938 1.438 1.75 3.188 3.188 5.25 4.25s4.313 1.688 6.688 1.813a5.579 5.579 0 0 1 1.5-5.438c1.125-1.125 2.5-1.688 4.125-1.688s3.063.625 4.188 1.813a11.48 11.48 0 0 0 3.688-1.375c-.438 1.375-1.313 2.438-2.563 3.188 1.125-.125 2.188-.438 3.313-.875z")])
            ])
        case .dev:
            return .element(named: "svg", nodes: [.class("fill-current h-4"), .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg"), .attribute(named: "viewBox", value: "0 0 448 512"), .element(named: "path", attributes: [.attribute(named: "d", value: "M120.12 208.29c-3.88-2.9-7.77-4.35-11.65-4.35H91.03v104.47h17.45c3.88 0 7.77-1.45 11.65-4.35 3.88-2.9 5.82-7.25 5.82-13.06v-69.65c-.01-5.8-1.96-10.16-5.83-13.06zM404.1 32H43.9C19.7 32 .06 51.59 0 75.8v360.4C.06 460.41 19.7 480 43.9 480h360.2c24.21 0 43.84-19.59 43.9-43.8V75.8c-.06-24.21-19.7-43.8-43.9-43.8zM154.2 291.19c0 18.81-11.61 47.31-48.36 47.25h-46.4V172.98h47.38c35.44 0 47.36 28.46 47.37 47.28l.01 70.93zm100.68-88.66H201.6v38.42h32.57v29.57H201.6v38.41h53.29v29.57h-62.18c-11.16.29-20.44-8.53-20.72-19.69V193.7c-.27-11.15 8.56-20.41 19.71-20.69h63.19l-.01 29.52zm103.64 115.29c-13.2 30.75-36.85 24.63-47.44 0l-38.53-144.8h32.57l29.71 113.72 29.57-113.72h32.58l-38.46 144.8z")])])
        case .linkedIn:
            return .element(named: "svg", nodes: [.class("fill-current h-4"), .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg"), .attribute(named: "viewBox", value: "0 0 448 512"), .element(named: "path", attributes: [.attribute(named: "d", value: "M100.28 448H7.4V148.9h92.88zM53.79 108.1C24.09 108.1 0 83.5 0 53.8a53.79 53.79 0 0 1 107.58 0c0 29.7-24.1 54.3-53.79 54.3zM447.9 448h-92.68V302.4c0-34.7-.7-79.2-48.29-79.2-48.29 0-55.69 37.7-55.69 76.7V448h-92.78V148.9h89.08v40.8h1.3c12.4-23.5 42.69-48.3 87.88-48.3 94 0 111.28 61.9 111.28 142.3V448z")])])
        case .gitHub:
            return .element(named: "svg", nodes: [.class("fill-current h-4"), .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg"), .attribute(named: "viewBox", value: "0 0 24 24"), .element(named: "path", attributes: [.attribute(named: "d", value: "M12 .297c-6.63 0-12 5.373-12 12 0 5.303 3.438 9.8 8.205 11.385.6.113.82-.258.82-.577 0-.285-.01-1.04-.015-2.04-3.338.724-4.042-1.61-4.042-1.61C4.422 18.07 3.633 17.7 3.633 17.7c-1.087-.744.084-.729.084-.729 1.205.084 1.838 1.236 1.838 1.236 1.07 1.835 2.809 1.305 3.495.998.108-.776.417-1.305.76-1.605-2.665-.3-5.466-1.332-5.466-5.93 0-1.31.465-2.38 1.235-3.22-.135-.303-.54-1.523.105-3.176 0 0 1.005-.322 3.3 1.23.96-.267 1.98-.399 3-.405 1.02.006 2.04.138 3 .405 2.28-1.552 3.285-1.23 3.285-1.23.645 1.653.24 2.873.12 3.176.765.84 1.23 1.91 1.23 3.22 0 4.61-2.805 5.625-5.475 5.92.42.36.81 1.096.81 2.22 0 1.606-.015 2.896-.015 3.286 0 .315.21.69.825.57C20.565 22.092 24 17.592 24 12.297c0-6.627-5.373-12-12-12")])])
        case .stackoverflow:
            return .element(named: "svg", nodes: [.class("fill-current h-4"), .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg"), .attribute(named: "viewBox", value: "0 0 384 512"), .element(named: "path", attributes: [.attribute(named: "d", value: "M290.7 311L95 269.7 86.8 309l195.7 41zm51-87L188.2 95.7l-25.5 30.8 153.5 128.3zm-31.2 39.7L129.2 179l-16.7 36.5L293.7 300zM262 32l-32 24 119.3 160.3 32-24zm20.5 328h-200v39.7h200zm39.7 80H42.7V320h-40v160h359.5V320h-40z")])])
        }
    }
}

public protocol CasperishWebsite {
    associatedtype ItemMetadata: CasperishWebsiteItemMetadata
    var rootPathString: String { get }
    var cover: String { get }
    var headerColor: String { get }
    var author: String { get }
    var avatar: String { get }
    var bio: String { get }
    var icon: String { get }
    var newsletterAction: String { get }
    var contacts: [(ContactPoint, String)] { get }
}

// MARK: - Defaults
extension CasperishWebsite {
    var rootPathString: String { "/" }
    var headerColor: String { "#222" }
    var cover: String { "" }
    var author: String { "Casperish" }
    var bio: String { "A Publish port of Ghost's Casper Theme" }
    var avatar: String { "http://i.pravatar.cc/300" }
    var icon: String { "👻" }
    var newsletterAction: String { "" }
    var contacts: [(ContactPoint, String)] { [
        (.twitter, "sowenjub"),
        (.dev, "sowenjub"),
        (.linkedIn, "arnaudjoubay"),
        (.gitHub, "sowenjub"),
        (.stackoverflow, "229688"),
        ]}
    var headerBackgroundImageStyle: String {
        return cover.isEmpty ? "" : "background-image:url('\(cover)');"
    }
    var rootPath: Path { Path(rootPathString) }
}

private struct CasperishHTMLFactory<Site: Website>: HTMLFactory where Site: CasperishWebsite {
    func makeIndexHTML(for index: Index,
                       context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site, stylesheetPaths: [context.site.rootPath.appendingComponent("/styles.css")]),
            .indexBody(for: context.allItems(
                sortedBy: \.date,
                order: .descending
            ), context: context, location: nil)
        )
    }
    
    func makeSectionHTML(for section: Section<Site>,
                         context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site, stylesheetPaths: [context.site.rootPath.appendingComponent("/styles.css")]),
            .indexBody(for: section.items, context: context, title: section.title, subtitle: section.description, location: section)
        )
    }
    
    func makeItemHTML(for item: Item<Site>,
                      context: PublishingContext<Site>) throws -> HTML {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"
        let dateText = dateFormatter.string(from: item.date).uppercased()
        
        let itemSiblings = context.sections[item.sectionID].items.filter({ $0 != item }).shuffled().prefix(3)
        
        return HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site, stylesheetPaths: [context.site.rootPath.appendingComponent("/styles.css")]),
            .pageBody(for: context, location: item,
                      .group(
                        .div(.class("text-center pt-16 md:pt-32"),
                             .p(.class("text-xs md:text-sm text-casper-blue font-bold"), .text(dateText), .span(.class("text-gray-900 px-1"), "/"), .tagList(for: item, on: context.site)),
                             .h1(.class("font-bold break-normal text-3xl md:text-5xl max-w-6xl mx-auto"), .text(item.title))
                        ),
                        .unwrap(item.metadata.cover, { .div(.class("container w-full max-w-6xl h-48 md:h-cover mx-auto bg-white bg-cover bg-center mt-8 sm:rounded"), .style("background-color: \(context.site.headerColor); background-image:url('\($0)');")) }),
                        .div(.class("container max-w-5xl mx-auto \(item.metadata.cover == nil ? "" : "md:-mt-32")"),
                             .div(.class("mx-0 sm:mx-6"),
                                  .main(.class("bg-white w-full p-8 md:p-24 text-gray-800 leading-normal"),
                                        .article(.class("prose prose-sm sm:prose-xl break-words"), .contentBody(item.body))
                                ),
                                  .if(!context.site.newsletterAction.isEmpty, .subscribe(for: context.site)),
                                  .authorAndMore(for: context.site)
                            )
                        ),
                        .if(!itemSiblings.isEmpty,
                            .div(.class("bg-gray-200"),
                                 .div(.class("container w-full max-w-6xl mx-auto px-2 py-8"),
                                      .div(.class("grid grid-cols-1 sm:grid-cols-3 gap-12"),
                                           .forEach(itemSiblings, { .postCard(for: $0, on: context.site, imageHeight: "h-64") })
                                    )
                                )
                            )
                        )
                )
            )
        )
    }
    
    func makePageHTML(for page: Page,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: [context.site.rootPath.appendingComponent("/styles.css")]),
            .pageBody(for: context, location: page,
                      .group(.div(.class("container max-w-5xl mx-auto"),
                                  .div(.class("mx-0 sm:mx-6"),
                                       .main(.class("bg-white w-full p-8 md:p-24 text-xl md:text-2xl text-gray-800 leading-normal"),
                                             .article(.class("prose prose-sm sm:prose-xl break-words"), .contentBody(page.body))
                                    )
                        )
                        ))
            )
        )
    }
    
    func makeTagListHTML(for page: TagListPage,
                         context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: [context.site.rootPath.appendingComponent("/styles.css")]),
            .pageBody(for: context, location: page,
                      .group(.div(.class("container max-w-5xl mx-auto"),
                                  .div(.class("mx-0 sm:mx-6"),
                                       .main(.class("bg-white w-full p-8 md:p-24 text-xl md:text-2xl text-gray-800 leading-normal prose lg:prose-xl"),
                                             .h1("Browse all tags"),
                                             .ul(
                                                .class("all-tags"),
                                                .forEach(page.tags.sorted()) { tag in
                                                    .li(
                                                        .class("tag"),
                                                        .a(
                                                            .href(context.site.rootPath.appendingComponent(context.site.path(for: tag).absoluteString)),
                                                            .text(tag.string)
                                                        )
                                                    )
                                                }
                                        ))
                        )
                        )
                )
            )
        )
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage,
                            context: PublishingContext<Site>) throws -> HTML? {
        let taggedItems = context.items(
            taggedWith: page.tag,
            sortedBy: \.date,
            order: .descending
        )
        return HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site, stylesheetPaths: [context.site.rootPath.appendingComponent("/styles.css")]),
            .indexBody(for: taggedItems, context: context, title: page.tag.string, subtitle: "All tagged articles", location: page)
        )
    }
}

private extension Node where Context == HTML.BodyContext {
    static func tagList<T>(for item: Item<T>, on site: T) -> Node where T: Website, T: CasperishWebsite {
        let tagLinks = item.tags.map({ tag in
            [Node.a(.href(site.rootPath.appendingComponent(site.path(for: tag).absoluteString)), .text(tag.string.uppercased()))]
        }).joined(separator: [.text(", ")])
        return .group(Array(tagLinks))
    }
    
    static func navigation<T>(
        for context: PublishingContext<T>,
        selectedLocation: Location?,
        wrapperClass: String = ""
    ) -> Node where T: Website, T: CasperishWebsite {
        let selectedSectionId = (selectedLocation as? Section<T>)?.id ?? (selectedLocation as? Item<T>)?.sectionID
        return .div(.class("\(wrapperClass) flex flex-no-wrap pl-4 text-sm"),
                    .ul(.class("list-reset flex justify-between items-center"),
                        .li(.class("mr-2"), .a(.class(selectedLocation == nil ? "inline-block py-2 px-2 text-white no-underline hover:underline" : "inline-block text-gray-600 no-underline hover:text-gray-200 hover:underline py-2 px-2"), .href(context.site.rootPath), .text("HOME"))),
                        .forEach(context.pages) { (path, page) in
                            .li(.a(
                                .class(selectedLocation != nil && path == selectedLocation!.path ? "inline-block py-2 px-2 text-white no-underline hover:underline whitespace-no-wrap" : "inline-block text-gray-600 no-underline hover:text-gray-200 hover:underline py-2 px-2 whitespace-no-wrap"),
                                .href(context.site.rootPath.appendingComponent(page.path.absoluteString)),
                                .text(page.title.uppercased())
                                ))
                        },
                        .forEach(context.sections.ids) { sectionId in
                            .li(.a(
                                .class(sectionId == selectedSectionId ? "inline-block py-2 px-2 text-white no-underline hover:underline whitespace-no-wrap" : "inline-block text-gray-600 no-underline hover:text-gray-200 hover:underline py-2 px-2 whitespace-no-wrap"),
                                .href(context.site.rootPath.appendingComponent(context.sections[sectionId].path.absoluteString)),
                                .text(context.sections[sectionId].title.uppercased())
                                ))
                        }
            )
        )
    }
    
    // Navigation on index pages, appearing above the first item.
    // It includes pages+sections (hidden on mobile) and social links.
    static func indexNavigation<T>(
        for context: PublishingContext<T>,
        selectedLocation: Location?
    ) -> Node where T: Website, T: CasperishWebsite {
        .nav(.class("mt-0 w-full mb-2"),
             .div(.class("container mx-auto flex items-center"),
                  .navigation(for: context, selectedLocation: selectedLocation, wrapperClass: "w-1/2 hidden md:flex"),
                  .div(.class("flex w-full md:w-1/2 justify-center md:justify-end content-center"),
                       .forEach(context.site.contacts, { (contactPoint, handler) in
                        .a(.class("inline-block text-gray-500 no-underline hover:text-white hover:text-underline text-center h-10 p-2 md:h-auto md:p-4 avatar transform transition duration-200 ease-in-out hover:scale-125"), .href(contactPoint.url(handler)), contactPoint.svg)
                       }),
                       // RSS
                    .a(.class("inline-block text-gray-500 no-underline hover:text-white hover:text-underline text-center h-10 p-2 md:h-auto md:p-4 avatar transform transition duration-200 ease-in-out hover:scale-125"), .href("\(context.site.rootPathString)feed.rss"), .element(named: "svg", nodes: [.class("fill-current h-4"), .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg"), .attribute(named: "viewBox", value: "0 0 24 24"), .element(named: "circle", attributes: [.attribute(named: "cx", value: "6.18"), .attribute(named: "cy", value: "17.82"), .attribute(named: "r", value: "2.18")]), .element(named: "path", attributes: [.attribute(named: "d", value: "M4 4.44v2.83c7.03 0 12.73 5.7 12.73 12.73h2.83c0-8.59-6.97-15.56-15.56-15.56zm0 5.66v2.83c3.9 0 7.07 3.17 7.07 7.07h2.83c0-5.47-4.43-9.9-9.9-9.9z")])]))
                )
            )
        )
    }
    
    // Navigation bar, visible on mobile or on pages
    static func pageNavigation<T>(
        for context: PublishingContext<T>,
        selectedLocation: Location?
    ) -> Node where T: Website, T: CasperishWebsite {
        .div(.class("pb-16"),
             .nav(.class("fixed z-10 bg-gray-900 p-4 mt-0 w-full overflow-auto scrolling-touch"),
                  .div(.class("container mx-auto flex items-center"),
                       .div(.class("flex-shrink-0 text-white font-extrabold"),
                            .a(.class("flex text-white text-base no-underline hover:text-white hover:no-underline"), .href(context.site.rootPath),
                               .span(.class("block md:hidden md:w-auto pl-1"), .text(context.site.icon)), .span(.class("hidden md:block w-0 md:w-auto pl-1"), .text(context.site.name))
                        )
                    ),
                       .navigation(for: context, selectedLocation: selectedLocation)
                )
            )
        )
    }
    
    static func leadCard<T>(for item: Item<T>, on site: T) -> Node where T: Website, T: CasperishWebsite {
        .div(.class("flex h-full bg-white rounded overflow-hidden shadow-lg transform transition duration-200 ease-in-out hover:scale-105"),
             .a(.href(site.rootPath.appendingComponent(item.path.absoluteString)), .class("flex flex-wrap no-underline hover:no-underline flex-1"),
                .unwrap(item.metadata.cover, { .div(.class("w-full md:w-2/3 rounded-t"), .img(.src($0), .class("h-full w-full shadow object-cover"))) }),
                .div(.class("w-full md:w-1/3 flex flex-col flex-grow flex-shrink"),
                     .div(.class("flex-1 bg-white rounded-t rounded-b-none overflow-hidden shadow-lg"),
                          .p(.class("w-full text-casper-blue text-xs font-medium pt-6 px-6"), .text(item.joinedTags)),
                          .div(.class("w-full font-bold text-3xl text-gray-900 px-6"), .text(item.title)),
                          .p(.class("text-gray-800 font-serif text-xl px-6 mb-5"), .text(item.description))
                    ),
                     .div(.class("flex-none mt-auto bg-white rounded-b rounded-t-none overflow-hidden shadow-lg p-6"),
                          .div(.class("flex items-center justify-between"),
                               .img(.class("w-8 h-8 rounded-full mr-4 avatar"), .src(site.avatar), .alt(site.author)),
                               .p(.class("text-gray-600 text-xs md:text-sm"), .text(item.readTime))
                        )
                    )
                )
            )
        )
    }
    
    static func postCard<T>(for item: Item<T>, on site: T, imageHeight: String = "h-full", colspan: String = "") -> Node where T: Website, T: CasperishWebsite {
        .div(.class("w-full \(colspan) py-6 flex flex-col flex-grow flex-shrink transform transition duration-200 ease-in-out hover:scale-105"),
             .div(.class("flex-1 bg-white rounded-t rounded-b-none overflow-hidden shadow-lg"),
                  .a(.href(site.rootPath.appendingComponent(item.path.absoluteString)), .class("flex flex-wrap no-underline hover:no-underline"),
                     .unwrap(item.metadata.cover, { .img(.src($0), .class("\(imageHeight) w-full rounded-t object-cover")) }),
                     .p(.class("w-full text-casper-blue text-xs font-medium pt-6 px-6"), .text(item.joinedTags)),
                     .div(.class("w-full font-bold text-2xl text-gray-900 px-6"), .text(item.title)),
                     .p(.class("text-gray-800 font-serif text-lg px-6 mb-5"), .text(item.description))
                )
            ),
             .div(.class("flex-none mt-auto bg-white rounded-b rounded-t-none overflow-hidden shadow-lg p-6"),
                  .div(.class("flex items-center justify-between"),
                       .img(.class("w-8 h-8 rounded-full mr-4 avatar"), .src(site.avatar), .alt(site.author)),
                       .p(.class("text-gray-600 text-xs md:text-sm"), .text(item.readTime))
                )
            )
        )
    }
    
    static func itemList<T>(for items: [Item<T>], on site: T) -> Node where T: Website, T: CasperishWebsite {
        var nodes: [Node] = []
        items.forEachSlice(7) { pageItems in
            let thirds = pageItems.prefix(3)
            let halves = pageItems.dropFirst(3).prefix(2)
            let lastTwo = pageItems.dropFirst(5).suffix(2)
            nodes.append(.group(thirds.map { .postCard(for: $0, on: site, imageHeight: "h-64", colspan: "sm:col-span-2") }))
            if !halves.isEmpty {
                nodes.append(.group(halves.map { .postCard(for: $0, on: site, colspan: "sm:col-span-3") }))
            }
            if let twoThirds = lastTwo.first {
                nodes.append(.postCard(for: twoThirds, on: site, colspan: "sm:col-span-4"))
            }
            if let oneThird = lastTwo.last {
                nodes.append(.postCard(for: oneThird, on: site, colspan: "sm:col-span-2"))
            }
        }
        return .group(nodes)
    }
    
    static func footer<T>(for site: T) -> Node where T: Website, T: CasperishWebsite {
        return .footer(.class("bg-gray-900"),
                       .div(.class("container max-w-6xl mx-auto flex items-center px-2 pt-2 pb-8"),
                            .div(.class("w-full mx-auto flex flex-wrap items-center"),
                                 .div(.class("flex w-full md:w-1/2 justify-center md:justify-start text-white font-extrabold"),
                                      .p(.a(.class("text-gray-900 no-underline hover:text-gray-900 hover:no-underline"), .href("#"), .span(.class("text-base text-gray-200"), .text(site.name))
                                        ))
                                ),
                                 .div(.class("flex w-full pt-2 content-center justify-between md:w-1/2 md:justify-end"),
                                      .ul(.class("list-reset flex justify-center flex-1 md:flex-none items-center"),
                                          .li(.a(.class("inline-block text-gray-600 no-underline hover:text-gray-200 hover:underline py-2 px-3 text-sm"), .href(site.rootPath), .text("Latest Posts"))),
                                          .li(.a(.class("inline-block text-gray-600 no-underline hover:text-gray-200 hover:underline py-2 px-3 text-sm"), .href("https://github.com/JohnSundell/Publish"),.text("Publish"))),
                                          .li(.a(.class("inline-block text-gray-600 no-underline hover:text-gray-200 hover:underline py-2 px-3 text-sm"), .href("https://ghost.org"),.text("Ghost"))),
                                          .li(.a(.class("inline-block text-gray-600 no-underline hover:text-gray-200 hover:underline px-3 text-sm"), .href("\(site.rootPath)feed.rss"), .element(named: "svg", nodes: [.class("fill-current h-6"), .attribute(named: "xmlns", value: "http://www.w3.org/2000/svg"), .attribute(named: "viewBox", value: "0 0 24 24"), .element(named: "circle", attributes: [.attribute(named: "cx", value: "6.18"), .attribute(named: "cy", value: "17.82"), .attribute(named: "r", value: "2.18")]), .element(named: "path", attributes: [.attribute(named: "d", value: "M4 4.44v2.83c7.03 0 12.73 5.7 12.73 12.73h2.83c0-8.59-6.97-15.56-15.56-15.56zm0 5.66v2.83c3.9 0 7.07 3.17 7.07 7.07h2.83c0-5.47-4.43-9.9-9.9-9.9z")])])))
                                    )
                                )
                        )
            )
        )
    }
    
    static func subscribe<T>(for site: T) -> Node where T: Website, T: CasperishWebsite {
        return .div(.class("container font-sans bg-blue-100 rounded mt-8 p-4 md:p-24 text-center"),
                    .h2(.class("font-bold break-normal text-2xl md:text-4xl"), .text("Subscribe to \(site.name)")),
                    .h3(.class("font-bold break-normal font-normal text-gray-600 text-base md:text-xl"), .text("Get the latest posts delivered right to your inbox")),
                    .div(.class("w-full text-center pt-4"),
                         .form(.action(site.newsletterAction), .class("max-w-xl mx-auto p-1 pr-0 flex flex-wrap items-center"),
                               .input(.type(.email), .class("flex-1 appearance-none rounded shadow p-3 text-gray-600 mr-2 focus:outline-none"), .attribute(named: "placeholder", value: "your.email@example.com")),
                               .input(.type(.submit), .class("flex-1 mt-4 md:mt-0 block md:inline-block appearance-none bg-casper-blue text-white text-base font-semibold tracking-wider uppercase py-4 rounded shadow hover:bg-blue-400 cursor-pointer"), .value("Subscribe"))
                        )
            )
        )
    }
    
    static func authorAndMore<T>(for site: T) -> Node where T: Website, T: CasperishWebsite {
        .div(.class("flex flex-wrap w-full items-center font-sans p-8 md:p-24"),
             .div(.class("md:flex-1 flex"),
                  .img(.class("w-10 h-10 rounded-full mr-4"), .src(site.avatar), .alt(site.author)),
                  .div(.class("flex-1"),
                       .p(.class("text-base font-bold text-base md:text-xl leading-none"), .text(site.author)),
                       .p(.class("text-gray-600 text-xs md:text-base"), .text(site.bio))
                )
            ),
             .div(.class("mt-8 md:mt-0 mx-auto md:mx-0 md:justify-end"),
                  .a(.class("bg-transparent border border-gray-500 hover:border-casper-blue text-xs text-gray-500 hover:text-casper-blue font-bold py-2 px-4 rounded-full"), .text("All tags"), .href(site.tagListPath))
            )
        )
    }
}

private extension Node where Context == HTML.DocumentContext {
    static func indexBody<T: Website>(for items: [Item<T>], context: PublishingContext<T>, title: String? = nil, subtitle: String? = nil, location: Location?) -> Node where T: Website, T: CasperishWebsite {
        .body(.class("bg-gray-200 font-sans leading-normal tracking-normal"),
              .div(.class("md:hidden"), .pageNavigation(for: context, selectedLocation: location)),
              .div(.class("w-full m-0 p-0 bg-cover bg-bottom"), .style("\(context.site.headerBackgroundImageStyle) background-color: \(context.site.headerColor); height: 60vh; max-height:460px;"),
                   .div(.class("container max-w-4xl mx-auto pt-16 md:pt-32 text-center break-normal px-2"),
                        .p(.class("text-white font-extrabold text-3xl md:text-5xl"), .text(title ?? context.site.name)),
                        .p(.class("text-xl md:text-2xl text-gray-500"), .text(subtitle ?? context.site.description))
                )
            ),
              .div(.class("container px-4 md:px-0 max-w-6xl mx-auto -mt-32"),
                   .div(.class("mx-0 sm:mx-6"),
                        .indexNavigation(for: context, selectedLocation: location),
                        .main(.class("bg-gray-200 w-full text-xl md:text-2xl text-gray-800 leading-normal rounded-t"),
                              .unwrap(items.first, { .leadCard(for: $0, on: context.site) }),
                              .div(.class("grid grid-cols-1 sm:grid-cols-6 gap-12 pt-12"),
                                   .itemList(for: Array(items.dropFirst()), on: context.site)
                            )
                    ),
                        .if(!context.site.newsletterAction.isEmpty, .subscribe(for: context.site)),
                        .authorAndMore(for: context.site)
                )
            ),
              .footer(for: context.site)
        )
    }
    
    static func pageBody<T: Website>(for context: PublishingContext<T>, location: Location, _ nodes: Node<HTML.BodyContext>...) -> Node where T: Website, T: CasperishWebsite {
        .body(.class("bg-white font-sans leading-normal tracking-normal"),
              .pageNavigation(for: context, selectedLocation: location),
              .group(nodes),
              .footer(for: context.site)
        )
    }
}

extension Item {
    public var joinedTags: String {
        tags.map(\.string).joined(separator: ", ").uppercased()
    }
    
    public var readTime: String {
        let minutes = [1, Int(readingTime.minutes)].max() ?? 1
        return "\(minutes) MIN READ"
    }
}

extension Array {
    /*
     [1,2,3,4,5].forEachSlice(2, { print($0) })
     => [1, 2]
     => [3, 4]
     => [5]
     */
    public func forEachSlice(_ n: Int, _ body: (ArraySlice<Element>) throws -> Void) rethrows {
        assert(n > 0, "n require to be greater than 0")
        
        for from in stride(from: self.startIndex, to: self.endIndex, by: n) {
            let to = Swift.min(from + n, self.endIndex)
            try body(self[from..<to])
        }
    }
}
