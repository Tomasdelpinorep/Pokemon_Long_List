class Item {
	String? name;
	String? url;

	Item({this.name, this.url});

	factory Item.fromJson(Map<String, dynamic> json) => Item(
				name: json['name'] as String?,
				url: json['url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'url': url,
			};
}
