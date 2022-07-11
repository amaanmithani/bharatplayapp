class MyRadioList {
  final List<MyRadio> radios;

//<editor-fold desc="Data Methods">

  const MyRadioList({
    required this.radios,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyRadioList &&
          runtimeType == other.runtimeType &&
          radios == other.radios);

  @override
  int get hashCode => radios.hashCode;

  @override
  String toString() {
    return 'MyRadioList{' + ' radios: $radios,' + '}';
  }

  MyRadioList copyWith({
    List<MyRadio>? radios,
  }) {
    return MyRadioList(
      radios: radios ?? this.radios,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'radios': this.radios,
    };
  }

  factory MyRadioList.fromMap(Map<String, dynamic> map) {
    return MyRadioList(
      radios: map['radios'] as List<MyRadio>,
    );
  }

  static List<MyRadio> myFunc(List<dynamic> myList) {
    List<MyRadio> _list = [];
    for (var i = 0; i < myList.length; i++) {
      MyRadio radio = MyRadio.fromMap(myList[i]);
      _list.add(radio);
    }

    return _list;
  }

//</editor-fold>
}

class MyRadio {
  final int id;
  final int order;
  final String name;
  final String tagline;
  final String color;
  final String desc;
  final String url;
  final String category;
  final String icon;
  final String image;
  final String lang;

//<editor-fold desc="Data Methods">

  const MyRadio({
    required this.id,
    required this.order,
    required this.name,
    required this.tagline,
    required this.color,
    required this.desc,
    required this.url,
    required this.category,
    required this.icon,
    required this.image,
    required this.lang,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MyRadio &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          order == other.order &&
          name == other.name &&
          tagline == other.tagline &&
          color == other.color &&
          desc == other.desc &&
          url == other.url &&
          category == other.category &&
          icon == other.icon &&
          image == other.image &&
          lang == other.lang);

  @override
  int get hashCode =>
      id.hashCode ^
      order.hashCode ^
      name.hashCode ^
      tagline.hashCode ^
      color.hashCode ^
      desc.hashCode ^
      url.hashCode ^
      category.hashCode ^
      icon.hashCode ^
      image.hashCode ^
      lang.hashCode;

  @override
  String toString() {
    return 'MyRadio{' +
        ' id: $id,' +
        ' order: $order,' +
        ' name: $name,' +
        ' tagline: $tagline,' +
        ' color: $color,' +
        ' desc: $desc,' +
        ' url: $url,' +
        ' category: $category,' +
        ' icon: $icon,' +
        ' image: $image,' +
        ' lang: $lang,' +
        '}';
  }

  MyRadio copyWith({
    int? id,
    int? order,
    String? name,
    String? tagline,
    String? color,
    String? desc,
    String? url,
    String? category,
    String? icon,
    String? image,
    String? lang,
  }) {
    return MyRadio(
      id: id ?? this.id,
      order: order ?? this.order,
      name: name ?? this.name,
      tagline: tagline ?? this.tagline,
      color: color ?? this.color,
      desc: desc ?? this.desc,
      url: url ?? this.url,
      category: category ?? this.category,
      icon: icon ?? this.icon,
      image: image ?? this.image,
      lang: lang ?? this.lang,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'order': this.order,
      'name': this.name,
      'tagline': this.tagline,
      'color': this.color,
      'desc': this.desc,
      'url': this.url,
      'category': this.category,
      'icon': this.icon,
      'image': this.image,
      'lang': this.lang,
    };
  }

  factory MyRadio.fromMap(Map<String, dynamic> map) {
    return MyRadio(
      id: map['id'] as int,
      order: map['order'] as int,
      name: map['name'] as String,
      tagline: map['tagline'] as String,
      color: map['color'] as String,
      desc: map['desc'] as String,
      url: map['url'] as String,
      category: map['category'] as String,
      icon: map['icon'] as String,
      image: map['image'] as String,
      lang: map['lang'] as String,
    );
  }

  factory MyRadio.defaultRadio() {
    return const MyRadio(
      id: 1,
      name: "92.7",
      tagline: "Suno Sunao, Life Banao!",
      color: "0xffa11431",
      desc:
          "The chills you get when you listen to music, is mostly caused by the brain releasing dopamine while anticipating the peak moment of a song.",
      url: "http://sc-bb.1.fm:8017/;",
      icon:
          "https://mytuner.global.ssl.fastly.net/media/tvos_radios/m8afyszryaqt.png",
      image:
          "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/b5df4c18876369.562d0d4bd94cf.jpg",
      lang: "Hindi",
      category: "pop",
      order: 1,
    );
  }

//</editor-fold>
}
