//
//  MinesweeperScene.pde
//  Minesweeper
//
//  Created by David Moore on 4/26/18.
//

/// Constant integer value for the number of bombs there will be.
final int kMinesweeperSceneNumberOfBombs = 10;

/// Constant integer value for the dimension of the array.
final int kMinesweeperSceneBlockDimension = 10;

public class MinesweeperScene extends Scene {

	// MARK: - Instance Variables

	/// Grid of blocks that are considered the major component of the game.
	private Block[][] _blocks;

	// MARK: - Properties

	/// Grid of blocks that are considered the major component of the game.
	private Block[][] blocks() { return _blocks; }

	/// Sets a grid of blocks that are considered the major component of the game.
	private void setBlocks(Block[][] blocks) { _blocks = blocks; }

  /// Array of BlockNode instances.
  public ArrayList<Node> blockNodes() {
    return childNodesWithName(kBlockNodeName);
  }

	// MARK: - Initialization

	public MinesweeperScene(Rect frame) {
		super(frame);
		setBlocks(new Block[10][10]);
	}

	// MARK: - Lifecycle

	/// Called immediately after the scene has been initialized.
	public void sceneDidLoad() {
		super.sceneDidLoad();

		configureBlocks();
		configureBlockNodes();
	}

	/// Performs any scene-specific updates that need to occur before scene actions are evaluated.
	///
	/// - Parameter currentTime: The time since starting the program in milliseconds.
	public void update(int currentTime) {
		super.update(currentTime);
	}

	// MARK: - Block Configuration

	/// Configures the Minesweeper blocks as new.
	private void configureBlocks() {
		// Create an int that will count down.
		int numberOfBombsRequired = kMinesweeperSceneNumberOfBombs;

    // Create an array that will contain the index pairs (i, j) of each bomb.
		int[] bombIndexPairs = new int[kMinesweeperSceneNumberOfBombs * 2];

    // Enumerate for the dimensional size.
		for (int k = 0; k < numberOfBombsRequired; k++) {
      // Randomly pick i and j.
			int i = (int)(random(0, kMinesweeperSceneBlockDimension) + 0.5);
			int j = (int)(random(0, kMinesweeperSceneBlockDimension) + 0.5);

      // Create l, the proper array index.
			int l = k * 2;

      // Store i and j.
			bombIndexPairs[l] = i;
			bombIndexPairs[l + 1] = j;
		}

		// Enumerate through the necessary dimensions to generate a 2D array that is kMinesweeperSceneBlockDimension * kMinesweeperSceneBlockDimension in element count.
		for (int i = 0; i < kMinesweeperSceneBlockDimension; i++) {
			for (int j = 0; j < kMinesweeperSceneBlockDimension; j++) {
        // Create a boolean value that will determine if the Block is a bomb.
        boolean isBomb = false;
  
        // Enumerate the index pairs.
				for (int k = 0; k < kMinesweeperSceneBlockDimension; k++) {
          // Determine the proper index.
          int l = k * 2;
          
          // Set the boolean value.
          isBomb = (bombIndexPairs[l] == i) && (bombIndexPairs[l + 1] == j);
          
          // Exit from the loop if it is a bomb.
          if (isBomb)
            break;
        }

				// Create a new Block.
				blocks()[i][j] = new Block(isBomb);
			}
		}
	}

	// Creates and configures sprite nodes for previously initialized blocks.
	private void configureBlockNodes() {
    // Calculate the width and height of the node.
    final float nodeWidth = frame().width() / (float)kMinesweeperSceneBlockDimension;
    final float nodeHeight = frame().height() / (float)kMinesweeperSceneBlockDimension;
  
    // Enumerate the 2D array of Block instances.
		for (int i = 0; i < kMinesweeperSceneBlockDimension; i++) {
			for (int j = 0; j < kMinesweeperSceneBlockDimension; j++) {
        // Create a new BlockNode.
				BlockNode node = new BlockNode(new Rect(frame().x() + j * nodeWidth, frame().y() + i * nodeHeight, nodeWidth, nodeHeight), blocks()[i][j]);

        // Add the BlockNode.
				addChild(node);
			}
		}
	}

	// MARK: - User Interaction

  /// Called when the mouse has clicked on a block node.
  public void mouseDownOnBlockNode(BlockNode node) {
    // TODO: Implement distance calculation and other actions.
  }
  
  /// Called when the mouse has released on a block node.
  public void mouseUpOnBlockNode(BlockNode node) {}

	/// Informs the receiver that the user has pressed a key.
	public void keyDownWithEvent(KeyEvent event) {
		super.keyDownWithEvent(event);
	}

	/// Informs the receiver that the user has released a key.
	public void keyUpWithEvent(KeyEvent event) {
		super.keyUpWithEvent(event);
	}
}
