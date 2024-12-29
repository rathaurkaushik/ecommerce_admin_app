import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
class DropdownBtn extends StatelessWidget {
  const DropdownBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: double.infinity,
        child: Card(
          child: Center(
            child: DropdownButtonHideUnderline(
              child: DropdownButton2<String>(
                isExpanded: true,
                hint: const Row(
                  children: [
                    Icon(
                      Icons.list,
                      size: 16,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Select Item',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          // color: Colors.yellow,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: ['items1', 'items2', 'items3']
                    .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
                    .toList(),
                value: 'items1',
                onChanged: (String? value) {

                },
                buttonStyleData: ButtonStyleData(
                    height: 30,
                    width: 100,
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    decoration:
                    BoxDecoration(shape: BoxShape.circle)
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    color: Colors.black,
                    Icons.arrow_drop_down,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.white,
                  ),
                  offset: const Offset(-20, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all<double>(6),
                    thumbVisibility: MaterialStateProperty.all<bool>(true),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
          ),
        ),
      );
  }
}
