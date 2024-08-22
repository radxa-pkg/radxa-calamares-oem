/* === This file is part of Calamares - <http://github.com/calamares> ===
 *
 *   Copyright 2015, Teo Mrnjavac <teo@kde.org>
 *   Copyright 2018-2019, Jonathan Carter <jcc@debian.org>
 *
 *   Calamares is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, or (at your option) any later version.
 *
 *   Calamares is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with Calamares. If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0;
import calamares.slideshow 1.0;

Presentation
{
    id: presentation

    function nextSlide() {
        console.log("QML Component (default slideshow) Next slide");
        presentation.goToNextSlide();
    }

    Timer {
        id: timer
        interval: 20000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: presentation.nextSlide()
    }

    /* These functions are called when the presentation starts and
     * ends, respectively. They could be used to start the timer,
     * but that is done automatically through *activatedInCalamares*,
     * so there's nothing **to** do.
     *
     * Leaving these functions out is fine, although Calamares will
     * complain that they are missing, then.
     */
    function onActivate() { }
    function onLeave() { }

    Slide {
        Image {
            id: logo
            source: "logo.svg"
            width: 280
            height: 280
            fillMode: Image.PreserveAspectFit
            anchors.centerIn: parent
        }
        Text {
            anchors.horizontalCenter: logo.horizontalCenter
            anchors.top: logo.bottom
            text: "<h1>Welcome to RadxaOS!</h1>"
            wrapMode: Text.WordWrap
            width: presentation.width
            horizontalAlignment: Text.Center
        }
    }
}
