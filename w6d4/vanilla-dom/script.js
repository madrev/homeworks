document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  const placesForm = document.getElementById("places-form");

  placesForm.addEventListener("submit", event => {
    event.preventDefault();

    const placeInput = document.getElementById("favorite-input");
    const li = document.createElement("li");
    const placesList = document.getElementById("sf-places");
    const inputVal = placeInput.value;
    li.textContent = inputVal;

    placeInput.value = "";
    placesList.appendChild(li);
  });



  // adding new photos
  const showPhotoForm = function () {
    const photoForm = document.querySelector(".photo-form-container");
    photoForm.classList.toggle("hidden");
  };

  const toggleButton = document.querySelector(".photo-show-button")
  toggleButton.addEventListener("click", showPhotoForm)

  const handlePhotoInput = function (e) {
    e.preventDefault();
    const urlInput = document.querySelector(".photo-url-input")
    const imgUrl = urlInput.value;
    const newImg = document.createElement("img");
    newImg.src = imgUrl
    urlInput.value = "";
    document.querySelector(".dog-photos").appendChild(newImg);
  }

  document.querySelector(".photo-url-submit").addEventListener("click", handlePhotoInput)

  // --- your code here!



});
