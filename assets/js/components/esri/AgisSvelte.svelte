<script>
    import MapView from '@arcgis/core/views/MapView'
    import '@arcgis/core/assets/esri/themes/light/main.css'
    import WebMap from '@arcgis/core/WebMap/'

    const webmap = new WebMap({
        portalItem: {
            // id: '209aa768f537468cb5f76f35baa7e013'
            id: '251fe7c7c93e4c27b89a0fcf7525ef54'
        }
    })

    import Idrometro from './Idrometro.svelte'
    import IdroDettaglio from './IdroDettaglio.svelte'

    export let anagrafica
    let view, idrometro

    idrometro = anagrafica[0]

    function azione(selezione) {
        console.log(view)
        const lat = Number(selezione.x)
        const lon = Number(selezione.y)
        view.center = [lat, lon]
        idrometro = selezione
    }

    // ADD this function:
    const createMap = (domNode) => {
        view = new MapView({
            container: domNode,
            map: webmap,
            /*  map: {
                basemap: 'streets-vector'
            }, */
            zoom: 15,
            center: [9.6477, 40.6338] // longitude, latitude
        })
        window.alview = view
    }
</script>

<main class="flex flex-row">
    <!-- ADD this line: -->
    <div>
        <div id="mappa" class="view" use:createMap />
        <IdroDettaglio {idrometro} />
    </div>
    <div class="mt-10 overflow-x-auto">
        <table class="table w-full">
            <!-- head -->
            <thead>
                <tr>
                    <th>Codice</th>
                    <th>Nome</th>
                    <th>zoom</th>
                </tr>
            </thead>
            <tbody>
                {#each anagrafica as idrometro (idrometro.cod_srv)}
                    <Idrometro {idrometro} del={azione} />
                {:else}
                    <tr>
                        <th />
                        <th class="italic">Nessun idrometro</th>
                        <th />
                        <th />
                        <th />
                    </tr>
                {/each}
            </tbody>
        </table>
    </div>
</main>

<style>
    /* ADD this section: */
    .view {
        height: 400px;
        width: 800px;
    }
</style>
