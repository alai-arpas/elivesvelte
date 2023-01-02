<script>
    import MapView from '@arcgis/core/views/MapView'
    import '@arcgis/core/assets/esri/themes/light/main.css'

    export let content

    // ADD this function:
    const createMap = (domNode) => {
        const view = new MapView({
            container: domNode,
            map: {
                basemap: 'streets-vector'
            },
            zoom: 15,
            center: [-90.1928, 38.6226] // longitude, latitude
        })
    }
</script>

<main>
    <!-- ADD this line: -->
    <div class="view" use:createMap />
    <div class="text-lg bg-slate-200">{content}</div>
</main>

<style>
    /* ADD this section: */
    .view {
        height: 400px;
        width: 800px;
    }
</style>
