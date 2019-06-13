#ifndef ARTICLE_H_
#define ARTICLE_H_

#include <QString>
#include <QXmlStreamWriter>

class Article {
	public:
		Article(int id = 0);
		Article(QString favIcon, int id = 0);
		~Article() = default;
	
		void setLink(QString link);
		void updateAuthor(QString author);
		void updateCategory(QString category);
		void updateTitle(QString title);
		void updateDescription(QString desc);
		void setStrDate(QString date);
		void setNumDate(qint64 date);
	  	void setMedia(QString media);
		QString getMedia();
		QString getDescription();
		qint64 getNumDate();
		void writeXmlStream(QXmlStreamWriter& stream) const;
	private:
		int _id;
		QString _link;
		QString _author;
		QString _category;
		QString _title;
		QString _desc;
		QString _strDate;
		QString _media;
		QString _iconUri;
		qint64 _numDate;

};


#endif //ARTICLE_H_
