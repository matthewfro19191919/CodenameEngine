package funkin.editors;

class UndoList<T> {
	public var undoList:Array<T> = [];
	public var redoList:Array<T> = [];

	public function new() {}

	public inline function addToUndo(c:T) {
		redoList = [];
		undoList.insert(0, c);
		while(undoList.length > Options.maxUndos)
			undoList.pop();
	}

	public inline function undo():T {
		var undo = undoList.shift();
		if (undo != null)
			redoList.insert(0, undo);
		return undo;
	}

	public inline function redo():T {
		var redo = redoList.shift();
		if (redo != null)
			undoList.insert(0, redo);
		return redo;
	}
}