<template>
  <div
    class="tab-pane fade show active"
    id="nav-home"
    role="tabpanel"
    aria-labelledby="nav-home-tab"
  >
    <div class="container">
      <div class="row align-self-center">
        <div class="col">
          <form id="loginForm">
            <div class="row mb-3">
              <label for="inputEmail3" class="col-sm-2 col-form-label"
                >Email</label
              >
              <div class="col-sm-10">
                <input
                  type="email"
                  name="email"
                  class="form-control"
                  id="inputEmail3"
                  v-model="email"
                />
              </div>
            </div>
            <div class="row mb-3">
              <label for="inputPassword3" class="col-sm-2 col-form-label"
                >Password</label
              >
              <div class="col-sm-10">
                <input
                  type="password"
                  name="pwd"
                  class="form-control"
                  id="inputPassword3"
                  v-model="pwd"
                />
              </div>
            </div>

            <button type="button" class="btn btn-primary" @click="onlogin()">
              Login
            </button>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: () => ({
    email: null,
    pwd: null
  }),
  methods: {
    onlogin () {
      var vm = this
      axios
        .post('/back/account/login', {
          email: this.email,
          pwd: this.pwd
        })
        .then(res => {
          console.log(res)
          vm.$router.push('/MemberPage')
          // Perform Success Action push to memberpage
        })
        .catch(error => {
          if (error.response.status === 400) {
            console.log(error.response.log)
          }
          // error.response.status Check status code
        })
        .finally(() => {
          // Perform action in always
        })
    }
  }
}
</script>
