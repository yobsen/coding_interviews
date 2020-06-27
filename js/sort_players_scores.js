function sortPlayersScores(scores) {
  scores.sort( function(a,b) { return b - a })
  return scores.filter(score => score !== 0)
}

function transformScoresToRanks(sortedScores) {
  let ranks = []
  sortedScores.forEach((score, index) => {
    if (index === 0) {
      return ranks.push(1)
    }
    if (score === sortedScores[index-1]) {
      ranks.push(ranks[ranks.length-1])
    } else {
      ranks.push(index + 1)
    }
  })
  return ranks
}

function numPlayers(k, ranks) {
  let sumOfFittingPlayers = 0
  ranks.forEach( (rank) => {
    if (rank <= k) {
      sumOfFittingPlayers++
    }
  })
  return sumOfFittingPlayers
}

arr = [0, 0, 23, 23, 45, 45, 45, 67, 87, 90, 90, 100, 100, 100]

let sortedScores = sortPlayersScores(arr)
console.log(sortedScores)

let ranks = transformScoresToRanks(sortedScores)
console.log(ranks)
numPlayers(9, ranks)
