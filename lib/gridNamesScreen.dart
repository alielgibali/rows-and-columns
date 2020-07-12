import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './grid_item.dart';
class GridNamesScreen extends StatefulWidget {
  @override
  _GridNamesScreenState createState() => _GridNamesScreenState();
}

class _GridNamesScreenState extends State<GridNamesScreen> {
  TextEditingController editingController = TextEditingController();
  String searchTyping = "";
  bool isInSearch = false;
  bool isSortByStartDateClicked = false;
  bool isSortByAscendingClicked = false;
  bool sortButtonClicked = false;
  List sortKeywords = ['Start Date', 'End Date', 'Statue', 'Name'];
  List dataSource = [
    {
      "id": 1,
      "row": [
        {
          "columns": ["First Column", "Second Column","Second Column"]
        }
      ]
    },
    {
      "id": 2,
      "row": [
        {
          "columns": [
            "First Column",
            "Second Column",
            "Third Column",
            "Forth Column"
          ]
        }
      ]
    },
    {
      "id": 3,
      "row": [
        {
          "columns": [
            "First Column",
            "Second Column",
            "Third Column",
            "Forth Column",
            "Fifth Column",
            "Seventh Column"
          ]
        }
      ]
    }
  ];


  _sortElements() {
    setState(() {
      sortButtonClicked = !sortButtonClicked;
      if (!sortButtonClicked) {
        isSortByStartDateClicked = false;
        isSortByAscendingClicked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Osama'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 60,
            width: double.infinity,
            child: _buildIconActions(),
          ),
          //    Container(height: 5,color: Colors.white),
          Container(
            margin: EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
            //  color: sortButtonClicked ? Colors.black54 : Colors.white,
            width: double.infinity,
            child: ListView.builder(
              itemCount: dataSource.length,
              itemBuilder: (ctx, rowIndex) => GridItem(
                isSortScreen: sortButtonClicked,
                dataSource: dataSource[rowIndex]['row'],
              ),
              //  GridItem(isSortScreen: sortButtonClicked, ),
            ),
          ),
          sortButtonClicked
              ? Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
                      color: sortButtonClicked ? Colors.black54 : Colors.white,
                      width: double.infinity,
                      //  child: Text(''),
                    ),
                  ],
                )
              : Container(),
          sortButtonClicked
              ? _buildSortButtonsWidget()
              : Container(height: 5, color: Colors.white),
          isSortByStartDateClicked ? _buildStartDateContainer() : Container(),
          isSortByAscendingClicked ? _buildAscendingContainer() : Container(),
        ],
      ),
    );
  }

  Row appBarActions() {
    return Row(
      children: <Widget>[
        //  helpIcon(context),
        //  SizedBox(width: 10),
        //  searchIcon(context),
      ],
    );
  }

  Widget helpIcon(context) {
    return GestureDetector(
        onTap: () {},
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          onPressed: () {},
        ));
  }

  Widget _buildIconActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.blue,
            ),
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (BuildContext context) => AddGridScreen()));
            }),
        IconButton(
          icon: Icon(
            Icons.picture_as_pdf,
            color: Colors.blue,
          ),
          onPressed: () => _downloadAction(),
        ),
        IconButton(
          icon: sortButtonClicked
              ? Icon(
                  Icons.file_download,
                  color: Colors.blue,
                )
              : Icon(
                  Icons.file_download,
                  color: Colors.blue,
                ),
          onPressed: () => _sortElements(),
        ),
      ],
    );
  }

  void _downloadAction() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return Container(
          //  height: getScreenHeight(context) * 0.25,
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  title: Center(
                    child: Text(
                      'Save as Excel (.xlsx)',
                      //  AppLocalizations.of(context).translate('save_as_excel'),
                    //  style: normalTextStyle,
                    ),
                  ),
                  onTap: () {},
                ),
                Divider(),
                ListTile(
                  title: Center(
                    child: Text(
                      'Save as PDF (.pdf)',
                      //  AppLocalizations.of(context).translate('save_as_pdf'),
                    //  style: normalTextStyle,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }

  Widget searchAreaWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blue,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          hintText: ('search'),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(
              const Radius.circular(15.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget showStartDateButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          isSortByStartDateClicked = !isSortByStartDateClicked;
          isSortByAscendingClicked = false;
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(4.0),
          height: 60,
          // color: Theme.of(context).accentColor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey,
              width: 0.8,
            ),
            //  color: color != null ? color : Theme.of(context).accentColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Start Date',
                //  style: dateTextStyle,
                ),
              )),
              Expanded(
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                ), //mage.asset(IC_DROPDOWN),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showAscendingButton(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          isSortByAscendingClicked = !isSortByAscendingClicked;
          isSortByStartDateClicked = false;
          setState(() {});
        },
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(8.0),
          height: 60,
          // color: Theme.of(context).accentColor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(
              color: Colors.grey,
              width: 0.8,
            ),
            //  color: color != null ? color : Theme.of(context).accentColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text('Ascending', 
                // style: dateTextStyle
                ),
              )),
              Expanded(
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.blue,
                ), // Image.asset(IC_DROPDOWN),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStartDateContainer() {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 0.0),
      height: 245,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: sortKeywords.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: sortKeywords
                        .map<Widget>(
                          (value) => ListTile(
                            onTap: () {
                              sortButtonClicked = !sortButtonClicked;
                              isSortByStartDateClicked =
                                  !isSortByStartDateClicked;
                              setState(() {});
                            },
                            leading: Text(value),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ), //showFirstDialog(context),
    );
  }

  Widget _buildAscendingContainer() {
    return Container(
      margin: EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 0.0),
      height: 245,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: sortKeywords.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: sortKeywords
                        .map<Widget>(
                          (value) => ListTile(
                            onTap: () {
                              sortButtonClicked = !sortButtonClicked;
                              isSortByStartDateClicked =
                                  !isSortByStartDateClicked;
                              setState(() {});
                            },
                            leading: Text(value),
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ),
          ],
        ),
      ), //showFirstDialog(context),
    );
  }

  Widget _buildSortButtonsWidget() {
    return Container(
      margin: EdgeInsets.fromLTRB(0.0, 44.0, 0.0, 0.0),
      height: 130,
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 0,
        //  margin: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Sort By'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(child: showStartDateButton(context)),
                SizedBox(width: 0),
                Expanded(child: showAscendingButton(context)),
              ],
            ),
          ],
        ),
      ), //showFirstDialog(context),
    );
  }
}
