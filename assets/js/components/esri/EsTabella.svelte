<script>
    import MapView from '@arcgis/core/views/MapView'
    import '@arcgis/core/assets/esri/themes/light/main.css'
    import WebMap from '@arcgis/core/WebMap/'
    import FeatureLayer from '@arcgis/core/layers/FeatureLayer'
    import FeatureTable from '@arcgis/core/widgets/FeatureTable'
    //import { reactiveUtils } from '@arcgis/core/rea'

    let selectedFeature, id

    const webmap = new WebMap({
        portalItem: {
            id: '209aa768f537468cb5f76f35baa7e013'
        }
    })

    // ADD this function:
    /* const createMap = (domNode) => {
        view = new MapView({
            map: webmap,
            zoom: 3,
            center: [-98, 38.5],
            popup: {
                dockEnabled: true,
                dockOptions: {
                    buttonEnabled: false,
                    breakpoint: false
                }
            }
        })
    
    } */
    const createMap = (domNode) => {
        const view = new MapView({
            map: {
                basemap: 'streets-vector'
            },
            zoom: 15,
            center: [9.6477, 40.6338] // longitude, latitude
        })
    }

    // When view is ready, find feature layer and set title and outFields
    // view.when(() => {
    //     const featureLayer = webmap.findLayerById('OverlaySchools_2862')
    //     featureLayer.title = 'US Private school enrollment'
    //     featureLayer.outFields = ['*']

    //     // Get references to div elements for toggling table visibility
    //     const appContainer = document.getElementById('appContainer')
    //     const tableContainer = document.getElementById('tableContainer')
    //     const tableDiv = document.getElementById('tableDiv')

    //     // Create FeatureTable
    //     const featureTable = new FeatureTable({
    //         view: view, // make sure to pass in view in order for selection to work
    //         layer: featureLayer,
    //         tableTemplate: {
    //             // autocasts to TableTemplate
    //             columnTemplates: [
    //                 // takes an array of GroupColumnTemplate and FieldColumnTemplate
    //                 {
    //                     // autocasts to FieldColumnTemplate
    //                     type: 'field',
    //                     fieldName: 'state_name',
    //                     label: 'State',
    //                     direction: 'asc'
    //                 },
    //                 {
    //                     type: 'field',
    //                     fieldName: 'PercentagePrivate',
    //                     label: 'Private school percentage'
    //                 },
    //                 {
    //                     type: 'field',
    //                     fieldName: 'PercentagePublic',
    //                     label: 'Public school percentage'
    //                 }
    //             ]
    //         },
    //         container: tableDiv
    //     })

    //     // Add toggle visibility slider
    //     view.ui.add(document.getElementById('mainDiv'), 'top-right')

    //     // Get reference to div elements
    //     const checkboxEle = document.getElementById('checkboxId')
    //     const labelText = document.getElementById('labelText')

    //     // Listen for when toggle is changed, call toggleFeatureTable function
    //     checkboxEle.onchange = () => {
    //         toggleFeatureTable()
    //     }

    //     function toggleFeatureTable() {
    //         // Check if the table is displayed, if so, toggle off. If not, display.
    //         if (!checkboxEle.checked) {
    //             appContainer.removeChild(tableContainer)
    //             labelText.innerHTML = 'Show Feature Table'
    //         } else {
    //             appContainer.appendChild(tableContainer)
    //             labelText.innerHTML = 'Hide Feature Table'
    //         }
    //     }

    //     // Watch for the popup's visible property. Once it is true, clear the current table selection and select the corresponding table row from the popup
    //     reactiveUtils.watch(
    //         () => view.popup.viewModel.active,
    //         () => {
    //             selectedFeature = view.popup.selectedFeature
    //             if (selectedFeature !== null && view.popup.visible !== false) {
    //                 featureTable.highlightIds.removeAll()
    //                 featureTable.highlightIds.add(view.popup.selectedFeature.attributes.OBJECTID)
    //                 id = selectedFeature.getObjectId()
    //             }
    //         }
    //     )
    // })
</script>

<div id="viewDiv" class="view" use:createMap />
<div id="appContainer">
    <div id="tableContainer" class="container">
        <div id="tableDiv" />
    </div>
    <div id="mainDiv" class="esri-widget">
        <label class="switch">
            <input id="checkboxId" type="checkbox" checked="yes" />
            <span class="slider round" />
        </label>
        <!-- svelte-ignore a11y-label-has-associated-control -->
        <label class="labelText" id="labelText">Hide feature table</label>
    </div>
</div>

<style>
    .view {
        height: 400px;
        width: 800px;
    }
    /* .esri-popup--is-docked-top-right .esri-popup__main-container {
        max-height: 100%;
    } */
    /* 
    #appContainer {
        display: flex;
        flex-direction: column;
        height: 100%;
        width: 100%;
    }

    #viewDiv {
        flex: 1;
        width: 100%;
    }

    .container {
        display: flex;
        flex: 1;
        width: 100%;
    }

    .switch {
        position: relative;
        display: inline-block;
        width: 45px;
        height: 22px;
        vertical-align: middle;
    }

    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        -webkit-transition: 0.4s;
        transition: 0.4s;
    }

    .slider:before {
        position: absolute;
        content: '';
        height: 20px;
        width: 20px;
        left: 3px;
        bottom: 1px;
        background-color: white;
        -webkit-transition: 0.4s;
        transition: 0.4s;
    }

    input:checked + .slider {
        background-color: #2196f3;
    }

    input:focus + .slider {
        box-shadow: 0 0 1px #2196f3;
    }

    input:checked + .slider:before {
        -webkit-transform: translateX(20px);
        -ms-transform: translateX(20px);
        transform: translateX(20px);
    }

  

    .slider.round {
        border-radius: 20px;
    }

    .slider.round:before {
        border-radius: 50%;
    }

    .labelText {
        padding-left: 5px;
        font-size: 15px;
    }

    #mainDiv {
        padding: 8px;
    } */
</style>
