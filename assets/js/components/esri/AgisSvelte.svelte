<script>
    import MapView from '@arcgis/core/views/MapView'
    import '@arcgis/core/assets/esri/themes/light/main.css'
    import WebMap from '@arcgis/core/WebMap/'
    import { DataTable } from 'carbon-components-svelte'
    import { Link } from 'carbon-components-svelte'
    import 'carbon-components-svelte/css/white.css'

    import { DataTableSkeleton } from 'carbon-components-svelte'

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
        <DataTable
            sortable
            expandable
            headers={[
                { key: 'id', value: 'Azioni' },
                { key: 'cod_srv', value: 'Codice' },
                { key: 'cae_nome', value: 'Nome cae' },
                { key: 'tipomisura', value: 'Tipo misura' }
            ]}
            rows={anagrafica}
        >
            <svelte:fragment slot="cell-header" let:header>
                {#if header.key === 'port'}
                    {header.value} (network)
                {:else}
                    {header.value}
                {/if}
            </svelte:fragment>
            <svelte:fragment slot="cell" let:row let:cell>
                {#if cell.key === 'tipomisura' && cell.value === 'Alveo'}
                    <Link href="https://en.wikipedia.org/wiki/Lake" target="_blank"
                        >{cell.value}</Link
                    >
                {:else if cell.key === 'id'}
                    <IdroDettaglio id={cell.value} idrometro={row} del={azione} />
                {:else}
                    {cell.value}
                {/if}
            </svelte:fragment>
            <svelte:fragment slot="expanded-row" let:row>
                <pre>{JSON.stringify(row, null, 2)}</pre>
            </svelte:fragment>
        </DataTable>
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
