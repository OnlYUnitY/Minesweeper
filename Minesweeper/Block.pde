//
//  Block.pde
//  Minesweeper
//
//  Created by David Moore on 5/14/18.
//

public class Block {

	// MARK: - Instance Variables

	/// Boolean value indicating if the block is a bomb.
	private boolean _isBomb;

	// MARK: - Properties

	/// Boolean value indicating if the block is a bomb.
	public boolean isBomb() { return _isBomb; }

	/// Sets a boolean value indicating if the block is a bomb.
	public void setIsBomb(boolean isBomb) { _isBomb = isBomb; }

	// MARK: - Initialization

	public Block(boolean isBomb) {
		setIsBomb(isBomb);
	}
}
