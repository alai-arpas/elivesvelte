const esbuild = require('esbuild')
const sveltePlugin = require('esbuild-svelte')
const postCssPlugin = require('esbuild-style-plugin')

const args = process.argv.slice(2)
const watch = args.includes('--watch')
const deploy = args.includes('--deploy')

const loader = {
    // Add loaders for images/fonts/etc, e.g.
    '.svg': 'file',
    '.woff2': 'file',
    '.woff': 'file',
    '.gif': 'file',
    '.ttf': 'file',
    '.png': 'dataurl'
}

const plugins = [
    // Add and configure plugins here
    sveltePlugin(),
    postCssPlugin({
        postcss: {
            plugins: [require('tailwindcss'), require('autoprefixer')]
        }
    })
]

let opts = {
    entryPoints: ['js/app.js'],
    mainFields: ['svelte', 'browser', 'module', 'main'],
    bundle: true,
    minify: false,
    target: 'es2017',
    outdir: '../priv/static/assets',
    logLevel: 'info',
    loader,
    plugins
}

if (watch) {
    opts = {
        ...opts,
        watch,
        sourcemap: 'inline'
    }
}

if (deploy) {
    opts = {
        ...opts,
        minify: true
    }
}

const promise = esbuild.build(opts)

if (watch) {
    promise.then((_result) => {
        process.stdin.on('close', () => {
            process.exit(0)
        })

        process.stdin.resume()
    })
}
