pragma solidity 0.4.25;
import "ZBGameMode.sol";

contract ExampleGame is ZBGameMode  {

    function beforeMatchStart(bytes serializedGameState) external {
        GameState memory gameState;
        gameState.init(serializedGameState);

        ZBSerializer.SerializedGameStateChanges memory changes;
        changes.init();

        changes.changePlayerDefense(Player.Player1, 15);
        changes.changePlayerDefense(Player.Player2, 15);

        changes.changeCurrentGooVials(Player.Player1, 3);
        changes.changeCurrentGooVials(Player.Player2, 3);

        changes.changeCurrentGoo(Player.Player1, 3);
        changes.changeCurrentGoo(Player.Player2, 3);

        changes.changeMaxGooVials(Player.Player1, 8);
        changes.changeMaxGooVials(Player.Player2, 8);
    } //end function beforeMatchStart()

} //end contract ExampleGame{}