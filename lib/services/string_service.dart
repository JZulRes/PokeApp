class StringService {
  String capitalizeOnlyFirstLater(String world) {
    return "${world[0].toUpperCase()}${world.substring(1)}";
  }
}
