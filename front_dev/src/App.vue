<template>
  <div id="app">
    <div class="demo-bg demo-content text-center">
      <img id="topimg" src="./assets/top11.png" />
      <router-view />
    </div>
  </div>
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;

  color: #ffffff;
}
.demo-bg {
  background-image: url('./assets/background.jpg');
  background-repeat: no-repeat;
  background-size: cover;
  opacity: 0.9;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  min-height: 100%;
  height: auto;
}
.demo-content {
  position: relative;
  max-width: 100%;
  height: auto;
}
#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
#topimg {
  max-width: 100%;
  padding-top: 2rem;
  padding-bottom: 2rem;
  display: block;
  margin: auto;
}
</style>
