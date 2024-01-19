import 'version.dart';

class VersionDetail {
	int? rarity;
	Version? version;

	VersionDetail({this.rarity, this.version});

	factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
				rarity: json['rarity'] as int?,
				version: json['version'] == null
						? null
						: Version.fromJson(json['version'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'rarity': rarity,
				'version': version?.toJson(),
			};
}
