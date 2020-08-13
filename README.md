# Casperish theme for Publish

<p align="center">
    <a href="https://swift.org/package-manager">
        <img src="https://img.shields.io/badge/swiftpm-compatible-brightgreen.svg?style=flat" alt="Swift Package Manager" />
    </a>
     <img src="https://img.shields.io/badge/platforms-mac+linux-brightgreen.svg?style=flat" alt="Mac + Linux" />
    <a href="https://twitter.com/sowenjub">
        <img src="https://img.shields.io/badge/twitter-@sowenjub-blue.svg?style=flat" alt="Twitter: @sowenjub" />
    </a>
</p>

A [Publish](https://github.com/johnsundell/publish) port of Ghost's [Casper](https://github.com/TryGhost/Casper) Theme v2, using [Tailwind CSS](https://tailwindcss.com).

## What's included

![screenshot](https://github.com/sowenjub/CasperishTheme/blob/master/assets/Screenshot%20Desktop.png?raw=true)

- Support for all Publish page types, obviously
- Support for subfolder hosting (compatible with GitHub Pages or /blog path of an existing landing page)
- Icons for your social profiles
- Reading time
- Cover images and beautiful typographic defaults for your posts
- A newsletter form
- Syntax Highligthing with Monokai theme

## Live example

You can see a live example of this theme at [Paraside.in](https://paraside.in).

 ## Installation

 To install it into your [Publish](https://github.com/johnsundell/publish) package, add it as a dependency within your `Package.swift` manifest:

 ```swift
 let package = Package(
     …
     dependencies: [
         …
         .package(url: "https://github.com/sowenjub/CasperishTheme.git", .branch("master"))
     ],
     targets: [
         .target(
             …
             dependencies: [
                 …
                 "CasperishTheme"
             ]
         )
     ]
     ...
 )
 ```

 ## Configuration

 Open main.swift and customize it using the example below

 ```swift
 import Foundation
 import Publish
 import Plot
 import CasperishTheme // 1

 // This type acts as the configuration for your website.
 struct MyWebsite: Website, CasperishWebsite { // 2
     enum SectionID: String, WebsiteSectionID {
         // Add the sections that you want your website to contain here:
         case posts
     }

     struct ItemMetadata: WebsiteItemMetadata, CasperishWebsiteItemMetadata { // 3
         // Add any site-specific metadata that you want to use here.
        var cover: String? // 3 bis
     }

     // Update these properties to configure your website:
     var url = URL(string: "https://your-website-url.com")!
     var name = "MyWebsite"
     var description = "A description of MyWebsite"
     var language: Language { .english }
     var imagePath: Path? { nil }

     // 4
     // Update these properties to configure your casperish-website:
     var rootPathString = "/"
     var headerColor = "#424242"
     var cover = ""
     var author = "Arnaud Joubay"
     var avatar = "http://i.pravatar.cc/300"
     var bio = "Swift & Rails Indie Maker"
     var icon = "🏝"
     var newsletterAction = ""
     var contacts: [(ContactPoint, String)] { [
         (.twitter, "sowenjub"),
         (.dev, "sowenjub"),
         (.linkedIn, "arnaudjoubay"),
         (.gitHub, "sowenjub"),
         (.stackoverflow, "229688"),
     ]}
 }

 // This will generate your website using the built-in Foundation theme:
 try MyWebsite().publish(
     withTheme: .casperish,
     additionalSteps: [
         .installPlugin(.readingTime()),
         .installPlugin(.pygments()),
     ],
     plugins: [.pygments()]
 )  // 5
 ```

1. Well, you need the CasperishTheme package obviously
2. Your Website must adopt the `CasperishWebsite` protocol, which enables theme-specific configurations (see 4.)
3. Your ItemMetadata must adopt the `CasperishWebsiteItemMetadata`, allowing you to add cover photos to each of your posts (which are items in the Publish jargon). So we also need to add the line `var cover: String?` inside.
4. This is where you can really make this theme your own:
    - `rootPathString` this allows you to publish the website in a subfolder, such as on GitHub Pages without a custom domain name. Leave it to `"/"` if your site will leave at the root domain
    - `headerColor` hexadecimal code for the header's background-color. The cover image will hide it if you use one.
    - `cover` optional path to the cover image. Leave blank (`""`) if you want to use the `headerColor` instead. If you have a cover.jpg image, the path should be `"/cover.jpg"` if your image is at the root of your `/Resources` folder (don't forget the / or it won't work on subpages).
    - `author` and  `bio` are displayed just above the footer
    - `avatar` is the path to your profile picture, displayed for each post. The path should be `"/my avatar.jpg"` if your image is at the root of your `/Resources` folder.
    - `icon` can be an emoji or any short text suitable to be the icon in the navigation bar on mobile
    - - `newsletterAction` leave blank (`""`) if you want to hide the newsletter, otherwise replace with the target URL
    - `contacts` is an array of nicknames used to display links to your web profiles in the header (on desktop). For now, it only supports Twitter, Dev.to, LinkedIn, Github and Stack Overflow.
5. To generate your website you need to include the 2 plugins that ship with the theme

# Usage

## Set your title in the front matter

Publish is smart, it will use the first title in your post content as the title, but this means your title will appear twice: once above the cover image, and once below.

Instead, you should set it in your front matter.

## Add covers to your posts, or not
If you want to add a cover image to your post, add it in your posts' front matter.
To use `/Resources/first_post.jpg` as you cover for this post, add `cover: /first_post.jpg` like below:

```markdown
---
title: My first post
cover: /first_post.jpg
date: 2020-08-04 00:46
description: A description of my first post.
tags: life, anew
---
# My first post

My first post's text.
```

If you don't want a cover, just remove the cover line.

## Organizing your content

In order to organize your content, you can play two variables:
* your categories (displayed in the menu, declared in your `main.swift` as SectionID)
* your tags (displayed above each post, declared in each post's front matter)

## Navigation: Pages & Sections

All pages and sections will appear in the navigation menu, first the pages, then the sections.

# Modifying the theme

This theme is powered by [Tailwind CSS](https://tailwindcss.com).

If you want to customize the css, you will need to edit the `Resources/CasperishTheme/theme.css` file, and regenerate the `styles.css` file. 
```bash
cd Resources/CasperishTheme
npx tailwindcss build theme.css -o styles.css -c tailwind.config.js
```

# Special thanks & credits

* [Ghost](https://ghost.org) for its beautiful Casper theme
* [Tailwind CSS](https://tailwindcss.com) for making CSS enjoyable
* [Ghostwind](https://github.com/tailwindtoolbox/Ghostwind) for saving me a lot of time to port the Casper theme to Publish. I went a bit further but the foundation comes from their template.
* [Fontawesome](https://fontawesome.com) for their brand icons as svg
* [Brian Dinsen](https://twitter.com/briandinsen) for [his article](https://brian.dk/posts/create-a-publish-theme-in-its-own-swift-package/) that helped me turn this into a package
* [Zhijin Chen](https://czj.pw) for his [SwiftPygmentsPublishPlugin](https://github.com/Ze0nC/SwiftPygmentsPublishPlugin)
* [Alejandro Martínez](https://twitter.com/alexito4) for his [ReadingTimePublishPlugin](https://github.com/alexito4/ReadingTimePublishPlugin)
