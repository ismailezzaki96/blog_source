--- 
title: "Quack Quack Says The Duck now with added threading" 
layout: "post" 
permalink: "/2010/03/quack-quack-says-duck-now-with-added.html" 
uuid: "7914781701982322430" 
guid: "tag:blogger.com,1999:blog-6728560442491983758.post-7914781701982322430" 
date: "2010-03-29 12:01:00" 
updated: "2010-03-29 12:42:39" 
description: 
blogger: 
siteid: "6728560442491983758" 
postid: "7914781701982322430" 
comments: "0" 
categories: 
author: 
name: "Paul D'Ambra" 
url: "https://plus.google.com/114260096260757534167?rel=author"
image: "//lh5.googleusercontent.com/-nN3yNuaSWDs/AAAAAAAAAAI/AAAAAAAABQU/ESeyTW5Duf0/s512-c/photo.jpg" 
---

In a <a href="http://mindlessramblingnonsense.blogspot.com/2009/10/quack-quack-says-duck.html">previous post</a> I advertised an application I'd made for WinMo to entertain my toddler.
    <br />
    <br />Having watched her play with it and having been <a href="http://stackoverflow.com/questions/2498609/handle-windows-mobile-click-event-so-that-it-doesnt-queue-while-my-program-is">reminded to K.I.S.S</a>. I've fixed a bug that highlighted the difference
    in expectations between myself and a toddler.

<!--more-->

    <br />No not the world-weary pessimism I'm practising instead when I tested and used the app I would click and then wait for something to happen... whereas my toddler would bash at the screen having got the link between doing so and stuff happening.
    <br
    />
    <br />While the UI was blocking the OS would register all the clicks and then process them before updating the screen.
    <br />
    <br />In the context of this application that meant that you could have a sheep on screen that was barking like a dog.... not teaching my kid the lessons I was hoping!
    <br />
    <br />I moved the actual sound playing onto a background thread and set a boolean flag to try to control the click event
    <br />
{% highlight vbnet %}
Private Sub picBox_Click(ByVal sender As Object, ByVal e As EventArgs) Handles picBox.Click
	If Not isPlaying Then
		isPlaying = True
			Dim t As Threading.Thread = New Threading.Thread(New Threading.ThreadStart(AddressOf playSound))
		t.Start()
		t.Join()
		'playSound has finished now so...
		refreshScreen()
	End If
End Sub
		
Private Sub playSound()
	If currentObject.getSoundLocation() <> "" Then
    	currentObject.playSound()
    End If
End Sub
    
Private Sub refreshScreen()
    picBox.Image = Nothing
    currentObject = thisCollectionOfThings.getNextObject()
    If Not currentObject Is Nothing Then addImage()
    	playTimer.Enabled = True
End Sub
    
Private Sub playTimer_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles playTimer.Tick
    playTimer.Enabled = False
    isPlaying = False
End Sub
{% endhighlight %}
The astute among you (pat yourselves on the back) will notice that there's also a timer in there... I found that if I hit the screen 5 times (for example) during the sound playing the last one or two clicks would be picked up and their audio played
        before the image finally refreshed.
        <br />
        <br />I guess the UI was blocking briefly as processing control passed from the spawned thread back to the UI thread.
        <br />
        <br />So I added a short timer that is started by the refreshScreen method and which stops itself and resets the isPlaying flag on its first tick.
        <br />
        <br />That might be a bit hacky and there might be a better way but since that seems to work I'm happy with it.
        <br />
        <br />And now I have a slightly more toddler-proof toddler game.
        <br />You can view all of the source code and download an install cab <a href="http://qqstd.codeplex.com/">here</a>
</div>