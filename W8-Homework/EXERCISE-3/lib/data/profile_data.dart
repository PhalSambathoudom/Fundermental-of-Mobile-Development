import 'package:flutter/material.dart';

import '../model/profile_tile_model.dart';

ProfileData ronanProfile = ProfileData(
  name: "Ronan OGOR",
  position: "Flutter Developer",
  avatarUrl: 'assets/images/ronanProfile.png',
  tiles: [
    TileData(icon: Icons.location_on, title: "Address", value: "Cambodia"),
    TileData(icon: Icons.email, title: "Mail", value: "ronan.ogor@cadt.edu"),
    TileData(icon: Icons.language, title: "Website", value: "www.cadt.edu.kh"),
    TileData(icon: Icons.school, title: "Education", value: "Computer Science"),
    TileData(icon: Icons.sports_soccer, title: "Hobby", value: "Football"),
  ],
);