function updateSlider(slideAmount) {
  const displayValue = document.getElementById("chosen_value")
  displayValue.innerHTML = slideAmount

  const rangeLine = document.querySelector('.range-line')
  let lastOp = Number(rangeLine.style.opacity) || .5

  const intervalID = setInterval(function () {
    lastOp > slideAmount / 100 ? less() : more()
  }, 100)

  function less() {
    lastOp * 100 - 5 <= slideAmount
      ? clearInterval(intervalID)
      : rangeLine.style.opacity = lastOp - .05
    lastOp -= .05
  }

  function more() {
    lastOp * 100 + 5 >= slideAmount
      ? clearInterval(intervalID)
      : rangeLine.style.opacity = lastOp + .05
    lastOp += .05
  }
}