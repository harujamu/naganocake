const { environment } = require('@rails/webpacker') 
module.exports = environment

// 以下追加（Bootstrap導入）
const webpack = require('webpack')
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery',
    Popper: 'popper.js'
  })
)
