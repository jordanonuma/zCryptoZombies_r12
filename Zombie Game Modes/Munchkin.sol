pragma solidity 0.4.25;

import "ZBGameMode.sol";

contract Munchkin is ZBGameMode  {

    function beforeMatchStart(bytes serializedGameState) external {

        GameState memory gameState;
        gameState.init(serializedGameState);

        ZBSerializer.SerializedGameStateChanges memory changes;
        changes.init();

        // Custom game logic will go here
        for (uint i = 0; i < gameState.playerStates.length; i++) {
            CardInstance[] memory newCards = new CardInstance[](gameState.playerStates[i].cardsInDeck.length);
            uint cardCount = 0;

            for (uint j = 0; j < gameState.playerStates[i].cardsInDeck.length; j++) {
                if (isLegalCard(gameState.playerStates[i].cardsInDeck[j])) {
                    newCards[cardCount] = gameState.playerStates[i].cardsInDeck[j];
                    cardCount++;
                }
            }
            changes.changePlayerCardsInDeck(Player(i), newCards, cardCount); 
        }

        
        changes.emit();

    } //end function beforeMatchStart()

    function isLegalCard(CardInstance card) internal view returns(bool) {
        return (cardd.gooCost <= 2);
    } //end function isLegalCard()

} //end contract Munchkin{}