class Cell{
	int posX, posY;
	int k;
	int value;
	int state;
	//Cell(int _k, int _value, int _state, int _posX, int _posY){
	//	k = _k;
	//	value = _value;
	//	state = _state;
	//	posX = _posX;
	//	posY = _posY;
	//}
	Cell(){};
	Cell(int _k, int _state){
		k = _k;
		state = _state;
	}
}
