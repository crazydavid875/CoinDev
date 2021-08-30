<template>
  <div
    class="tab-pane fade"
    id="nav-profile"
    role="tabpanel"
    aria-labelledby="nav-profile-tab"
  >
    <div class="container">
      <div class="row align-self-center">
        <div class="col">
          <form>
            <div class="row mb-3">
              <label for="inputname" class="col-sm-2 col-form-label"
                >Name</label
              >
              <div class="col-sm-10">
                <input
                  type="text"
                  name="name"
                  :class="'form-control' + NameInvalidText"
                  id="inputname"
                  v-model="name.val"
                />
                <div class="invalid-feedback">{{ NameVoildtext }}</div>
              </div>
            </div>
            <div class="row mb-3">
              <label for="inputEmail3" class="col-sm-2 col-form-label"
                >Email</label
              >
              <div class="col-sm-10">
                <input
                  type="email"
                  name="email"
                  :class="'form-control' + EmailInvalidText"
                  id="inputEmail3"
                  v-model="email.val"
                />
                <div class="invalid-feedback">{{ EmailVoildtext }}</div>
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
                  :class="'form-control' + PwdInvalidText"
                  id="inputPassword3"
                  v-model="pwd.val"
                />
                <div class="invalid-feedback">{{ pwdVoildtext }}</div>
              </div>
            </div>

            <button type="button" @click="onregist()" class="btn btn-primary">
              Next
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
    email: { val: '' },
    pwd: { val: '' },
    name: { val: '' },
    firstCheck: true
  }),
  methods: {
    onregist () {
      var vm = this
      this.firstCheck = false
      if (this.PwdInvalid || this.EmailInvalid || this.NameInvalid) {
        return
      }
      axios
        .post('/back/account/regist', {
          email: this.email.val,
          pwd: this.pwd.val,
          name: this.name.val
        })
        .then(res => {
          console.log(res)
          vm.$router.push('/addArticle')
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
  },
  computed: {
    NameVoildtext () {
      if (this.name.val === '') return 'please input name'
      else {
        return 'Good'
      }
    },
    NameInvalid () {
      return !this.firstCheck && this.NameVoildtext !== 'Good'
    },
    NameInvalidText () {
      return this.NameInvalid ? ' is-invalid' : ''
    },
    EmailInvalidText () {
      return this.EmailInvalid ? ' is-invalid' : ''
    },
    EmailInvalid () {
      return !this.firstCheck && this.EmailVoildtext !== 'Good'
    },
    EmailVoildtext () {
      if (this.email.val === '') return 'please input email'
      else if (!this.email.val.match(/^[^@\s]+@[^@\s]+\.[^@\s]+$/)) {
        return 'emali format error'
      } else {
        return 'Good'
      }
    },
    PwdInvalid () {
      return !this.firstCheck && this.pwdVoildtext !== 'Good'
    },
    PwdInvalidText () {
      return this.PwdInvalid ? ' is-invalid' : ''
    },
    pwdVoildtext () {
      if (this.pwd.val === '') return 'please input password'
      else if (this.pwd.val.length < 12) {
        return 'password length must more than 12'
      } else {
        return 'Good'
      }
    }
  }
}
</script>

<style></style>
