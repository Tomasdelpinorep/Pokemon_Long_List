import 'item.dart';
import 'version_detail.dart';

class HeldItem {
	Item? item;
	List<VersionDetail>? versionDetails;

	HeldItem({this.item, this.versionDetails});

	factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
				item: json['item'] == null
						? null
						: Item.fromJson(json['item'] as Map<String, dynamic>),
				versionDetails: (json['version_details'] as List<dynamic>?)
						?.map((e) => VersionDetail.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'item': item?.toJson(),
				'version_details': versionDetails?.map((e) => e.toJson()).toList(),
			};
}
