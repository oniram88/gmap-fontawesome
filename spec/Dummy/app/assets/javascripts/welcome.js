var map;
function initialize() {
    var mapOptions = {
        zoom:8,
        center:new google.maps.LatLng( -34.397, 150.644 )
    };
    map = new google.maps.Map( document.getElementById( 'map' ),
        mapOptions );

    new google.maps.Marker( {
        map:map,
        icon:{
            path:GMAP_FA.EXCLAMATION,
            scale:0.02,
            rotation:180,
            strokeWeight:0.2,
            strokeColor:'black',
            strokeOpacity:1,
            fillColor:'#000000',
            fillOpacity:0.7
        },
        clickable:false,
        position:new google.maps.LatLng( -34.397, 150.644 )
    } );

}


$( document ).ready( function () {
    initialize();
} );
