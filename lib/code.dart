class PCode {
  PCode(String text) {
    final List<String> components = text.split('(');
    name = components[0].replaceAll(')', '');
    if (components.length > 2) {
      args = <PCode>[PCode(components.sublist(1).join('('))];
    } else if (components.length > 1) {
      args = components[1]
          .split(',')
          .map((String component) => PCode(component))
          .toList();
    } else {
      args = <PCode>[];
    }
  }

  String name;
  List<PCode> args = <PCode>[];

  @override
  String toString() {
    if (args.isEmpty) {
      return name;
    }
    return '$name: $args';
  }
}
