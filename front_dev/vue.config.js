module.exports = {
  // publicPath: process.env.NODE_ENV === "production" ? "" : "/",
  publicPath: process.env.NODE_ENV === 'production' ? '/front/' : '/',
  assetsDir: 'assets',
  productionSourceMap: false,
  filenameHashing: true,

  transpileDependencies: ['vuetify'],

  chainWebpack: config => {
    config.module.rules.delete('eslint')
  },
  devServer: {
    // host: 'localhost',
    port: 80,
    proxy: {
      '/back': {
        target: 'http://localhost/back',
        ws: true,
        changeOrigin: true,
        pathRewrite: {
          '^/back': '' // 請求的時候使用這個api就可以
        }
      }
    }
    //    port: "8080",
  }
}
