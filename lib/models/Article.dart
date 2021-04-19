class Article {

	final String title;
	final String description;
	final String thread;

	final int likes;
	
	Article({this.title, this.description, this.thread, this.likes});

	factory Article.fromJson(Map<String, dynamic> data) {

		return Article(
			title: data['title'],
			description: data['description']
		);
	}
}