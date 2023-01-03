<script>
    import MapView from '@arcgis/core/views/MapView'
    import '@arcgis/core/assets/esri/themes/light/main.css'

    import Idrometro from './Idrometro.svelte'

    export let anagrafica

    function azione(id) {
        console.log(id)
    }

    // ADD this function:
    const createMap = (domNode) => {
        const view = new MapView({
            container: domNode,
            map: {
                basemap: 'streets-vector'
            },
            zoom: 15,
            center: [9.6477, 40.6338] // longitude, latitude
        })
    }
</script>

<main>
    <!-- ADD this line: -->
    <div id="mappa" class="view" use:createMap />
    <div class="mt-10 overflow-x-auto">
        <table class="table w-full">
            <!-- head -->
            <thead>
                <tr>
                    <th />
                    <th>Codice</th>
                    <th>Nome</th>
                    <th>Localita</th>
                    <th />
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
