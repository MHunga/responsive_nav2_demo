import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:web_demo/constants.dart';
import 'package:web_demo/controllers/menu_controller.dart';
import 'package:web_demo/responsive.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!Responsive.isWeb(context))
          IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                context.read<MenuController>().showDrawer();
              }),
        if (!Responsive.isMobile(context))
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.headline6,
          ),
        if (!Responsive.isMobile(context))
          Spacer(
            flex: Responsive.isWeb(context) ? 2 : 1,
          ),
        Expanded(child: SearchField()),
        ProfileCard()
      ],
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
          vertical: Responsive.isMobile(context)
              ? defaultPadding
              : defaultPadding / 2),
      margin: EdgeInsets.only(left: defaultPadding),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white10)),
      child: Row(
        children: [
          Image.asset(
            "assets/images/profile_pic.png",
            height: 30,
          ),
          if (!Responsive.isMobile(context))
            Padding(
              padding: const EdgeInsets.all(defaultPadding / 2),
              child: Text("Angelina Joli"),
            ),
          Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: secondaryColor,
          filled: true,
          hintText: "Search",
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          suffixIcon: InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(defaultPadding * 0.75),
              margin: EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2,
                  vertical:
                      Responsive.isMobile(context) ? defaultPadding / 2 : 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: primaryColor,
              ),
              child: SvgPicture.asset("assets/icons/Search.svg"),
            ),
          )),
    );
  }
}
