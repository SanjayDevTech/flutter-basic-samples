import 'package:meta/meta.dart';

class Backend {
  const Backend(this.hostUrl);

  final String hostUrl;

  Future<List<Rocket>> getRockets() async {
    await Future.delayed(Duration(seconds: 5));
    return const [
      Rocket(name: 'Falcon Heavy', description: 'Hello world'),
    ];
  }
}

class Rocket {
  const Rocket({
    @required this.name,
    @required this.description,
    this.flickrImages = const [],
  })  : assert(name != null),
        assert(description != null);

  final String name;
  final String description;
  final List<String> flickrImages;
}
