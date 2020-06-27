# Coding Interviews Tasks

## Sorting players scores by rank 
```
Competitive Gaming
A group of friends is playing a competitive video
game together. During the game, each player
receives a certain amount of points based on their
performance. At the end of a round, players who
achieve at least a certain rank get to “level up" their
character, gaining increased abilities for them. Given
the scores of the players at the end of the round,
how many players will be able to level up their
character?

Note that players with equal scores will have equal
ranks, but the player with the next lowest score will
be ranked based on the position within the list of all
players’ scores, For example, if there are four
players, and three players tie for first place, their
ranks would be 1, 1, 1, and 4. Also, no player with a
score of 0 can level up, no matter what their rank.

For example, let's say there are n = 4 players, where
the cutoff rank is k = 3 and scores = [100, 50, 50,
25]. These players’ ranks are [1, 2, 2, 4]. Because the
players need to have a rank of at least 3 to level up
their characters, only the first three players will be
able to do so. Therefore, the answer is 3.
```

## Finding the most visited places in the sprint training class
```
Sprint Training
Pat is an ordinary kid who works hard to be a great
runner. As part of training, Pat must run sprints of
different intervals on a straight trail. The trail has
numbered markers that the coach uses as goals.
Pat's coach provides a list of goals to reach in

order. Each time Pat starts at, stops at, or passes a
marker itis considered a visit. Determine the lowest,
numbered marker that is visited the most times
during Pat's day of training,

Example
n=5
sprints = (2, 4, 1, 3]

if the number of markers on the trail, n= 5, and
assigned sprints = [2, 4, 1, 3], Pat first sprints from
position 2» 4. The next sprint is from position 4 —»
1, and then 1 3. A marker numbered position p is
considered to be visited each time Pat either starts
or ends a sprint there and each time it is passed
while sprinting. 
```

## Transforming seconfs to time units
```
Duration Formatter
The function must accept a non-negative integer. If it is zero, it just returns "now". Otherwise, the duration is expressed as a combination of years, days, hours, minutes and seconds.

It is much easier to understand with an example:

formatDuration(62)    // returns "1 minute and 2 seconds"
formatDuration(3662)  // returns "1 hour, 1 minute and 2 seconds"

A year is 365 days and a day is 24 hours.

Note that spaces are important.

### Detailed rules

The resulting expression is made of components like 4 seconds, 1 year, etc. In general, a positive integer and one of the valid units of time, separated by a space. The unit of time is used in plural if the integer is greater than 1.

The components are separated by a comma and a space (`", "`). Except the last component, which is separated by " and ", just like it would be written in English.

A more significant units of time will occur before than a least significant one. Therefore, 1 second and 1 year is not correct, but 1 year and 1 second is.

Different components have different unit of times. So there is not repeated units like in 5 seconds and 1 second.

A component will not appear at all if its value happens to be zero. Hence, 1 minute and 0 seconds is not valid, but it should be just 1 minute.

A unit of time must be used "as much as possible". It means that the function should not return 61 seconds, but 1 minute and 1 second instead. Formally, the duration specified by of a component must not be greater than any valid more significant unit of time.
```

##Transforming korean numerals to numbers
```
DATA = [
  ['오백삼십조칠천팔백구십만천오백삼십구', '삼조사천이만삼천구'],
  ['육십사억삼천십팔만칠천육백구', '사십삼'],
  ['구백육십조칠천억팔천백삼십이만칠천일', '사십삼조오천이백억육천구백십만일'],
  ['이천구백육십조천오백칠십만삼천구백구십', '삼천사백오십조일억이천만육백사십삼'],
  ['사십오억삼천육십만오백구십', '칠십억천이백삼십오만칠천구십이'],
  ['천백십일', '구천오백구십구'],
  ['오억사천', '백십일'],
  ['일조', '삼'],
  ['일억', '만'],
]
KNS = {
  '조' => 1000000000000,
  '억' => 100000000,
  '만' => 10000, 
  '천' => 1000,
  '백' => 100,
  '십' => 10,
  '영' => 0,
  '일' => 1,
  '이' => 2,
  '삼' => 3,
  '사' => 4, 
  '오' => 5, 
  '육' => 6, 
  '칠' => 7, 
  '팔' => 8, 
  '구' => 9
}
```
