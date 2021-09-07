<template>
  <div id="app">
    <div class="demo-bg demo-content text-center">
      <img id="topimg" src="./assets/top11.png" />
      <router-view />
      <div class="mt-auto text-white-50 footer">
        <div class="footcontent wocc">WOCC<br />2021</div>
        <div class="verticalLine"></div>
        <div id="footcontent">
          <div id="footcontact">Contact us</div>
          <div id="footemaildiv">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              class="bi bi-envelope-fill"
              viewBox="0 0 16 16"
            >
              <path
                d="M.05 3.555A2 2 0 0 1 2 2h12a2 2 0 0 1 1.95 1.555L8 8.414.05 3.555zM0 4.697v7.104l5.803-3.558L0 4.697zM6.761 8.83l-6.57 4.027A2 2 0 0 0 2 14h12a2 2 0 0 0 1.808-1.144l-6.57-4.027L8 9.586l-1.239-.757zm3.436-.586L16 11.801V4.697l-5.803 3.546z"
              />
            </svg>
            <span id="footemail">wocc2021@gmail.com</span>
          </div>
        </div>
      </div>
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
.verticalLine {
  border-left: 1px solid white;
  height: 4rem;
  float: left;
  margin-right: 2rem;
}
#nav a {
  font-weight: bold;
  color: #4c647b;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
#topimg {
  max-width: 100%;
  padding-top: 1.5rem;
  padding-bottom: 1.5rem;
  display: block;
  margin: auto;
}
.footer {
  background-color: #212529;
  padding-top: 2rem;
  padding-bottom: 1.5rem;
  padding-left: 3%;
  text-align: left;
  opacity: 0.95;
}
#footemail {
  padding-left: 0.5rem;
  font-size: 15px;
}
#footcontact {
  padding-bottom: 0.2rem;
  font-size: 21px;
  color: #eeeeee;
}
#footemaildiv {
  padding-left: 0rem;
}
#footcontent {
  padding-left: 1.4rem;
}
.wocc {
  float: left;
  margin-right: 2rem;
  text-align: center;
  font-size: 21px;
}
</style>
