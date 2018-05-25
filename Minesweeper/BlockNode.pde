//
//  SpriteNode.pde
//  Minesweeper
//
//  Created by David Moore on 4/26/18.
//

public final String kBlockNodeName = "BlockNode";

public class BlockNode extends SpriteNode {

	// MARK: - Instance Variables

	/// Block which contains information the receiver must take into account.
	private Block _block;

	// MARK: - Properties

	/// Block which contains information the receiver must take into account.
	public Block block() { return _block; }

	/// Sets the block which contains information the receiver must take into account.
	public void setBlock(Block block) { 
    // Set the i-var.
    _block = block;
    
    if (block.isBomb()) {
      setBackgroundColor(#FC0000);
    } else { 
      setBackgroundColor(color(random(0, 255)));
    }
  }

	// MARK: - Initialization

	public BlockNode(Rect frame, Block block) {
		super(frame, color(255));
    setBlock(block);
		setName(kBlockNodeName);
	}

	// MARK: - Lifecycle

  public void mouseDownAtPoint(Point point) {
    super.mouseDownAtPoint(point);
    
    // Call the parent scene's method.
    ((MinesweeperScene)scene()).mouseDownOnBlockNode(this);
    
    // TODO: Highlight the node as it is being selected.
  }
  
  public void mouseUpAtPoint(Point point) {
    super.mouseUpAtPoint(point);
    
    // Call the parent scene's method.
    ((MinesweeperScene)scene()).mouseUpOnBlockNode(this);
    
    // TODO: Highlight the node as it is being selected.
  }

	public void update(int currentTime) {
		super.update(currentTime);
	}

	public void draw(int currentTime) {
		super.draw(currentTime);
	}
}
