import 'package:flutter/material.dart';
import 'package:news_app/model/news_filter.dart';

typedef FilterCallback = void Function(NewsFilter newsFilter);

class FilterWidget extends StatefulWidget {
  final FilterCallback? onFiltered;
  const FilterWidget({Key? key,required this.onFiltered }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  TextEditingController searchItemControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextField(
          keyboardType: TextInputType.name,
          controller: searchItemControler,
          decoration: const InputDecoration(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: 'Search'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: (){
              //validate

              var filterObj= NewsFilter(searchTerm: searchItemControler.text);
              widget.onFiltered!(filterObj);
              
            }, child: const Text('Filter')),
            
          ],
        )
      ],
    );
  }
}
