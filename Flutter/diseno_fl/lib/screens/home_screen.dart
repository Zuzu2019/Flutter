import 'package:flutter/material.dart';

import 'package:diseno_fl/widgets/background.dart';
import 'package:diseno_fl/widgets/card_table.dart';
import 'package:diseno_fl/widgets/custom_bottom_navigation.dart';
import 'package:diseno_fl/widgets/page_title.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Background(),
          // Home Body
          _HomeBody()
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
   );
  }
}

class _HomeBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          // Titulos
          PageTitle(),

          // Card Table
          CardTable(),
        ],
      ),
    );
  }
}