import mapboxgl from 'mapbox-gl';

  const mapElement = document.getElementById('map');
const initMapbox = () => {

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/maximelpy/ckhnp6twa12nt1aqrtpec7x29',
      center: [-55, 37.8],
      zoom: 3,
    });

    const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup)
      .addTo(map);
  });

map.addControl(
  new mapboxgl.GeolocateControl({
  positionOptions: {
    enableHighAccuracy: true
  },
    trackUserLocation: true
  })
              );
  }
};

export { initMapbox };

