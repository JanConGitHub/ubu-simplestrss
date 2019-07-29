import QtQuick 2.4
import QtQuick.Controls 2
import Ubuntu.Components 1.3
import Qt.labs.settings 1.0
import RSSCore 1.0

    
Page {
    id: viewDetailNews

    header: PageHeader {
        title: i18n.tr("Detail article")
            
            trailingActionBar {
                actions: [
                    Action {
                        iconName: "stock_website"
                        text: i18n.tr("Open in browser")
                        onTriggered: {     
                    		Qt.openUrlExternally(urlNews);
                    }
		},
		    Action {
                        iconName: "save-to"
                        text: i18n.tr("Attempt to recover content")
                        onTriggered: {     
				var fulltext = RSSCore.fetchFullArticle(urlNews, "auto", descNews)
				if(fulltext != "") descNews = fulltext
                            }
                    }
               ]
               numberOfSlots: 2
            }
   }
   
    property string urlNews: ""

    property string titleNews: ""
    property string descNews: ""
        
   Flickable {
        id: flickableRss
        anchors.fill: parent
        anchors.topMargin: viewDetailNews.header.height
        contentHeight: detailRSSColumn.height
        flickableDirection: Flickable.VerticalFlick
        clip: true
            
        Column {
            id: detailRSSColumn
            spacing: units.gu(2)
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                leftMargin: units.gu(1)
                rightMargin: units.gu(1)
            }
            
            Text{
                width: parent.width
                wrapMode:Text.WordWrap
		horizontalAlignment:Text.AlignJustify
                text: viewDetailNews.descNews
                color: "black"
            }   
            
        }//column

   }//flickable
}//page
