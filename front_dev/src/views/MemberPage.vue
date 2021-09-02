<template>
  <div class="mpage ">
    <nav
      class="navbar navbar-expand-lg justify-content-center navbar-dark  bg-dark"
    >
      <div class="container-fluid">
        <a class="navbar-brand" href="#">WOCC</a>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNavAltMarkup"
          aria-controls="navbarNavAltMarkup"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
          <div class="navbar-nav">
            <router-link
              :class="
                'nav-link ' + (this.$route.params.act == '1' ? 'active' : '')
              "
              to="/MemberPage/1/profile"
              >Profile</router-link
            >

            <router-link
              :class="
                'nav-link ' + (this.$route.params.act == '2' ? 'active' : '')
              "
              to="/MemberPage/2/paper"
              >Paper(s)</router-link
            >

            <router-link
              :class="
                'nav-link ' + (this.$route.params.act == '3' ? 'active' : '')
              "
              to="/MemberPage/3/payrecord"
              >Payment Record</router-link
            >
          </div>
        </div>
      </div>
    </nav>
    <div class="mycontents">
      <transition>
        <router-view></router-view>
      </transition>
    </div>
  </div>
</template>

<script>
export default {}
</script>

<style>
.mpage {
}
.mycontents {
  padding-top: 2rem;
}
</style>
