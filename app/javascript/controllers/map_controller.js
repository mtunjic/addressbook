import { Controller } from "stimulus"

import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import OSM from 'ol/source/OSM';
import { fromLonLat } from 'ol/proj';

export default class extends Controller {

    //static targets = ["map"]
    static values = { lat: Number, lng: Number }

    setMap() {
        console.log(`Latitude:  ${this.latValue}`);
        console.log(`Longitude: ${this.lngValue}`);
    }

    initialize() {
        console.log(`Latitude:  ${this.latValue}`);
        console.log(`Longitude: ${this.lngValue}`);
        const map = new Map({
            layers: [
                new TileLayer({
                    source: new OSM()
                })
            ],
            target: 'map',
            view: new View({
                center: fromLonLat([this.lngValue, this.latValue]),
                zoom: 8
            })
        });
    }

}