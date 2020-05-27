
class Gift {

  final image;
  final name;

  Gift(this.image, this.name);

  @override
  bool operator ==(other) {
    return this.name == other.name && this.image == other.image;
  }

}