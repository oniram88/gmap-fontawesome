# Gmap::Fontawesome

You can use this gem to display the Font-awesome icons as markers in google-maps 

## Installation

Add this line to your application's Gemfile:

    gem 'gmap-fontawesome'

If you want the last gliphs then execute:

    $ bundle exec rake gmap_awesome:compile  
    
Else you can use the precompiled version and go to the next step

## Usage

include in your javascript file

    //= require gmap-fontawesome


All glyphs have the same names as font-awesome, except they are capitalised, and underscored, eg "exclamation-sign" becomes "EXCLAMATION_SIGN"

    new google.maps.Marker({
        map: map,
        icon: {
            path: GMAP_FA.EXCLAMATION,
            scale:0.02,
            rotation:180,
            strokeWeight: 0.2,
            strokeColor: 'black',
            strokeOpacity: 1,
            fillColor: '#f8ae5f',
            fillOpacity: 0.7,
        },
        clickable: false,
        position: new google.maps.LatLng(lat, lng)
    });


## Contributing

1. Fork it ( http://github.com/<my-github-username>/gmap-fontawesome/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
