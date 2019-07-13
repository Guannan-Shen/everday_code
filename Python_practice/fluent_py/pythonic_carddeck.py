import collections
import random
Card = collections.namedtuple('Card', ['rank', 'suit'])

class FrenchDeck:
    ranks = [str(n) for n in range(2, 11)] + list('JQKA')
    suits = 'spades diamonds clubs hearts'.split()
    def __init__(self):
        # the _ between self. and cards
        # use self.cards or self._cards
        self.cards = [Card(rank, suit) for suit in self.suits
                                        for rank in self.ranks]

    def __len__(self):
        return len(self.cards)

    def __getitem__(self, position):
        return self.cards[position]

beer_card = Card('7', 'diamonds')
# use the class
wsop1 = FrenchDeck()
print(len(wsop1))

# the first and the 2nd one
print(wsop1[0])
print(wsop1[1])

# the last one
print(wsop1[-1])

# random one
print(random.choice(wsop1))

# the version of python
import sys

print('Python %s on %s' % (sys.version, sys.platform))