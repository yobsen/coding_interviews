const minute = 60
const hour = 3600
const day = 86400
const year = 31536000

function formatDuration(number) {
  if(number < 0) {
    return "function accepts only positive integers"
  }

  if(number === 0) {
    return "now"
  }

  return whichTimeUnitBelongs(number)
}

function whichTimeUnitBelongs(number) {
  if(number < minute) {
    return consistsOfSeconds(number)
  }

  if(number >= minute && number < hour) {
    return consistsOfMinutes(number)
  }

  if(number >= hour && number < day) {
    return consistsOf(number, hour, "hour")
  }

  if(number >= day && number < year) {
    return consistsOf(number, day, "day")
  }

  if(number >= year) {
    return consistsOf(number, year, "year")
  }
}

function consistsOfSeconds(number) {
  if(number === 1) {
    return "1 second"
  }

  if(number < minute && number !== 1) {
    return `${number} seconds`
  }
}

function consistsOfMinutes(number) {
  const amount = Math.floor(number / minute)
  const modulo = number % minute
  const seconds = consistsOfSeconds(modulo)
  const nounNumber = amount !== 1 ? "s" : ""

  if(number === minute) {
    return "1 minute"
  }

  if(modulo === 0  && number !== minute ) {
    return `${amount} minutes`
  } else {
    return `${amount} minute` + `${nounNumber}` + " and " + `${seconds}`
  }
}

function consistsOf(number, timeUnit, timeUnitName) {
  const amount = Math.floor(number / timeUnit)
  const modulo = number % timeUnit
  const nounNumber = amount !== 1 ? "s" : ""

  if(number === timeUnit) {
    return `1 ${timeUnitName}`
  }

  if(modulo === 0 && number !== timeUnit) {
    return `${amount} ${timeUnitName}s`
  } else {
    const timeUnitOfModulo = whichTimeUnitBelongs(modulo)
    const punctuation = timeUnitOfModulo.includes(" and ") ? ", " : " and "
    return `${amount} ${timeUnitName}` + `${nounNumber}` + `${punctuation}` + `${timeUnitOfModulo}`
  }
}

formatDuration(31530060001)
