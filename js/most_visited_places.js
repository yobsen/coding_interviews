function getMostVisited(n, sprints) {
  let allVisitedPoints = []

  sprints.forEach((number, index) => {
    let nextNumber = sprints[index+1]
    if (nextNumber) {
      let startPoint = Math.min(number, nextNumber)
      let endPoint = Math.max(number, nextNumber)

      let range = [...Array(endPoint + 1).keys()].filter( numbers => numbers >= startPoint)
      allVisitedPoints.push(range)
    }
  })

  let sortedPoints = allVisitedPoints.flat().sort( function(a,b) { return a -b })

  let pointsAndTheirAmounts = sortedPoints.reduce(function(amountOfVisits, visit) {
  amountOfVisits[visit] = ++amountOfVisits[visit] || 1
  return amountOfVisits
}, {})

  console.log(pointsAndTheirAmounts)

  let mostVisitedPoint = Object.keys(pointsAndTheirAmounts).sort(function(a,b){return pointsAndTheirAmounts[b]-pointsAndTheirAmounts[a]})

  return mostVisitedPoint[0]
}

let sprints = [2, 4, 1, 3, 5, 8, 10, 4]
getMostVisited(10, sprints)
