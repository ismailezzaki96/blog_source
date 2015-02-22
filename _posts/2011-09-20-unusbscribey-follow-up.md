---
title: "An unusbscribey follow up"
layout: "post"
permalink: "/2011/09/unusbscribey-follow-up.html"
uuid: "2147600267942601023"
guid: "tag:blogger.com,1999:blog-6728560442491983758.post-2147600267942601023"
date: "2011-09-20 14:21:00"
updated: "2011-09-20 14:22:33"
description: 
blogger:
    siteid: "6728560442491983758"
    postid: "2147600267942601023"
    comments: "0"
categories: 
author: 
    name: "Paul D'Ambra"
    url: "https://plus.google.com/114260096260757534167?rel=author"
    image: "//lh5.googleusercontent.com/-nN3yNuaSWDs/AAAAAAAAAAI/AAAAAAAABQU/ESeyTW5Duf0/s512-c/photo.jpg"
---

So recently I <a href="http://mindlessramblingnonsense.blogspot.com/2011/08/how-to-design-unsubscribe-link.html">blogged a bloggy thing </a>here about unsubscribe links.

I know a lot of people are of the opinion that an unsubscribe link should just unsubscribe you and require no further action and that the whole idempotency thing is software design flim-flam and I was tempted to agree until I was introduced to the concept of pre-fetching...

<!--more-->

In short modern browsers and some email clients will try to speed up your experience by following links in the background so that when you click on a link it seems to launch lightening fast.  Given the massive bandwidth lots of people have in this Buck Rogers-esque world we live in this is a "good thing".   However, if you have recipients of emails with unsubscribe links that require no confirmation and those people are pre-fetching those links then they could be being unsubscribed without even knowing it.<br /><br />&nbsp;This is a good example of why standards are worth following... an unsubscribe link made before the advent of pre-fetching that was idempotent on get doesn't need to worry when prefetching is invented because so long as the people implementing prefetching follow the standards too then your software will continue to work as expected.<br /><br />&nbsp;As with lots of this stuff - it seems like more work now but it's always more work when it breaks!
</div>