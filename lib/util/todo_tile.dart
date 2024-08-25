import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile(
      {super.key,
      required String taskName,
      required bool taskCompleted,
      required dynamic Function(bool?)? onChanged,
      required dynamic Function(BuildContext)? deleteTile})
      : _deleteTile = deleteTile,
        _onChanged = onChanged,
        _taskCompleted = taskCompleted,
        _taskName = taskName;

  final String _taskName;
  final bool _taskCompleted;

  final Function(bool?)? _onChanged;
  final Function(BuildContext)? _deleteTile;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: _deleteTile,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: _taskCompleted ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(value: _taskCompleted, onChanged: _onChanged),
              Text(_taskName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: _taskCompleted ? Colors.white : Colors.black,
                    decoration: _taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
