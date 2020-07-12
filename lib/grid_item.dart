import 'package:flutter/material.dart';

class GridItem extends StatefulWidget {
  bool isSortScreen = false;
  List dataSource = [];
  GridItem({this.isSortScreen, this.dataSource});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {
  bool clickExpand = false;

  _showElements() {
    clickExpand = !clickExpand;
    setState(() {});
  }

  Widget _addElementsToCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'End Date : ',
          //  style: labelTextStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Request Type : ',
          //  style: labelTextStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'ID : ',
          // style: labelTextStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            //    IconButton(icon: Image.asset(IC_DELETE), onPressed: () {}),
            //   IconButton(icon: Image.asset(IC_DELETE), onPressed: () {}),
            // IconButton(icon: Image.asset(IC_DELETE), onPressed: () {}),
          ],
        ),
      ],
    );
  }

  var _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      //  color: widget.isSortScreen ? Colors.black54 : Colors.white,
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 6,
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        // print('your length is ${widget.dataSource.length}');
        child: ListView.builder(
          shrinkWrap: true,
          itemCount:
              widget.dataSource.length < 3 ? widget.dataSource.length : 3,
          itemBuilder: (ctx, columnIndex) => ExpansionTile(
            title: !_isExpanded
                ? Column(
                    children: <Widget>[
                      Text(
                        widget.dataSource[columnIndex]['columns'][0] ?? null,
                      ),
                      Text(
                        widget.dataSource[columnIndex]['columns'][1] ?? null,
                      ),
                      Text(
                        widget.dataSource[columnIndex]['columns'][2] ?? null,
                      ),
                    ],
                  )
                : null,
            children: <Widget>[
              ...widget.dataSource[columnIndex]['columns']
                  .map<Widget>((e) => onlyThreeItemsOfList(e))
                  .toList(),
              Row(
                children: <Widget>[
                  _iconButton(Icons.edit, () {}),
                  _iconButton(Icons.copyright, () {}),
                  _iconButton(Icons.delete, () {}),
                ],
              ),
            ],
            onExpansionChanged: (_) {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
          ),
        ),
      ),
    );
  }

  _iconButton(IconData icon, Function onTap) {
    return Expanded(
      child: IconButton(
        icon: Icon(icon),
        onPressed: onTap,
      ),
    );
  }

  Widget expandListView(int i) {
    return Text('Your index is $i');
  }

  Widget onlyThreeItemsOfList(value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            '$value',
            //  style: labelTextStyle,
          ),
        ),
      ],
    );
  }

  Widget moreThanThreeItemsOfList(value) {
    print('gone');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            '$value',
            //  style: labelTextStyle,
          ),
        ),
        // FlatButton(
        //   onPressed: (){},
        //   child: Text(''),
        // ),
      ],
    );
  }
}
