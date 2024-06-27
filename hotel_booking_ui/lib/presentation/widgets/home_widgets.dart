import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getAppBarUI({required BuildContext context}) {
  final theme = Theme.of(context);
  return Container(
    decoration: BoxDecoration(
      color: theme.scaffoldBackgroundColor,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 2),
            blurRadius: 8.0),
      ],
    ),
    child: Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top, left: 8, right: 8),
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            width: AppBar().preferredSize.height + 40,
            height: AppBar().preferredSize.height,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Explore',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Container(
            width: AppBar().preferredSize.height + 40,
            height: AppBar().preferredSize.height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.favorite_border),
                    ),
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(32.0),
                    ),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(FontAwesomeIcons.locationDot),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget getSearchBarUI({required BuildContext context}) {
  final theme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            child: Container(
              decoration: BoxDecoration(
                color: theme.scaffoldBackgroundColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(38.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      offset: const Offset(0, 2),
                      blurRadius: 8.0),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 4, bottom: 4),
                child: TextField(
                  onChanged: (String txt) {},
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  cursorColor: theme.primaryColor,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'London...',
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: theme.primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(38.0),
            ),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.4),
                  offset: const Offset(0, 2),
                  blurRadius: 8.0),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: const BorderRadius.all(
                Radius.circular(32.0),
              ),
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(FontAwesomeIcons.magnifyingGlass,
                    size: 20, color: theme.scaffoldBackgroundColor),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget getFilterBarUI({required BuildContext context}) {
  final theme = Theme.of(context);
  return Stack(
    children: <Widget>[
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Container(
          height: 24,
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: const Offset(0, -2),
                  blurRadius: 8.0),
            ],
          ),
        ),
      ),
      Container(
        color: theme.scaffoldBackgroundColor,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 4),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '530 hotels found',
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  splashColor: Colors.grey.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    // Navigator.push<dynamic>(
                    //   context,
                    //   MaterialPageRoute<dynamic>(
                    //       builder: (BuildContext context) => FiltersScreen(),
                    //       fullscreenDialog: true),
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Filter',
                          style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 16,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.sort, color: theme.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: Divider(
          height: 1,
        ),
      )
    ],
  );
}
