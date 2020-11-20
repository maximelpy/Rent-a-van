var places = require('places.js');

const initAutocomplete = () => {
  const addressInput = document.getElementById('edit_address');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };
