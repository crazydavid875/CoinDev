<template>
  <div class="starpag">
    <nav>
      <div class="nav nav-tabs  justify-content-center" id="nav-tab" role="tablist">
        <button
          class="nav-link active"
          id="nav-home-tab"
          data-bs-toggle="tab"
          data-bs-target="#nav-home"
          type="button"
          role="tab"
          aria-controls="nav-home"
          aria-selected="true"
        >
          Login
        </button>
        <button
          class="nav-link"
          id="nav-profile-tab"
          data-bs-toggle="tab"
          data-bs-target="#nav-profile"
          type="button"
          role="tab"
          aria-controls="nav-profile"
          aria-selected="false"
        >
          Sign up
        </button>
      </div>
    </nav>
    <div class="tab-content mymembertab" id="nav-tabContent">
      <Login />
      <Regist />
    </div>
  </div>
</template>

<script>
import Login from '@/components/Login.vue'
import Regist from '@/components/Regist.vue'
export default {
  components: {
    Login,
    Regist
  }
}
</script>

<style>
.mymembertab {
  margin-top: 1rem;
  text-align: center;
}
.starpag{
 height:100vh;
}
</style>
