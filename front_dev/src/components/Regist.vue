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
              <label for="inputEmail3" class="col-sm-2  text-end col-form-label"
                >Email</label
              >
              <div class="col-sm-7">
                <input
                  type="email"
                  name="email"
                  :class="'form-control' + EmailInvalidText"
                  id="inputEmail3"
                  v-model="email.val"
                  :readonly="verifydisable"
                />
                <div class="invalid-feedback">{{ EmailVoildtext }}</div>
              </div>
              <div class="col-sm-3">
                <button
                  type="button"
                  @click="onSendCode()"
                  class="btn btn-primary"
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseExample"
                  aria-expanded="false"
                  aria-controls="collapseExample"
                >
                  Send Verification code to email
                </button>
              </div>
            </div>
            <div class="row mb-3 collapse" :id="hiddenclass">
              <label for="inputverifycode" class="col-sm-2  text-end col-form-label"
                >Verification code</label
              >
              <div class="col-sm-2">
                <input
                  type="text"
                  name="verifycode"
                  :class="'form-control' + verifycodeInvalidText"
                  id="inputverifycode"
                  v-model="verifycode.val"
                  :readonly="verifydisable"
                />
                <div class="invalid-feedback">{{ verifycodeVoildtext }}</div>
              </div>
            </div>
            <div class="row mb-3">
              <label for="inputPassword3" class="col-sm-2  text-end col-form-label"
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
                <div class="col-auto">
                  <span id="passwordHelpInline" class="form-text">
                    Must be 8-20 characters long.
                  </span>
                </div>
              </div>
            </div>
            <div class="row mb-3">
              <label for="inputPassword4" class="col-sm-2  text-end col-form-label"
                >Password confirm</label
              >
              <div class="col-sm-10">
                <input
                  type="password"
                  :class="'form-control' + ConfirmInvalidText"
                  id="inputPassword4"
                  v-model="confirm.val"
                />
                <div class="invalid-feedback">{{ ConfirmVoildtext }}</div>
              </div>
            </div>
            <button type="button" @click="onregist()" class="btn btn-primary">
              Register
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
    confirm: { val: '' },
    verifycode: { val: '' },
    firstCheck: true,
    hiddenclass: 'collapseExample',
    verifycodeInvalidText: '',
    verifycodeInvalid: true,
    verifycodeVoildtext: 'Please input verification code',
    verifydisable: false
  }),
  methods: {
    onregist () {
      var vm = this
      this.firstCheck = false

      if (this.PwdInvalid || this.EmailInvalid || this.ConfirmInvalid) {
        return
      }
      axios
        .post('/back/account/regist', {
          email: this.email.val,
          pwd: this.pwd.val,
          code: this.verifycode.val
        })
        .then(res => {
          console.log(res)
          vm.$router.push('/MemberPage/1/profile')
          // Perform Success Action push to memberpage
        })
        .catch(error => {
          if (error.response.status === 400) {
          }
          if (error.request.responseText.match(/Duplicate entry/)) {
            alert('You have already regist, please login')
          } else alert(error.request.responseText)
          // error.response.status Check status code
        })
        .finally(() => {
          // Perform action in always
        })
    },
    onSendCode () {
      var vm = this
      axios
        .post('/back/account/SendVerifyCode', {
          email: this.email.val
        })
        .then(res => {
          console.log(res)
          vm.hiddenclass = ''
          // Perform Success Action push to memberpage
        })
        .catch(error => {
          if (error.response.status === 400) {
            console.log(error.response.log)
          } else if (error.response.status === 404) {
            console.log(error.response.log)
          }
          alert(error.response.status + ':' + error.response.log)
          // error.response.status Check status code
        })
        .finally(() => {
          // Perform action in always
        })
    }
  },
  computed: {
    EmailInvalidText () {
      return this.EmailInvalid ? ' is-invalid' : ''
    },
    EmailInvalid () {
      return !this.firstCheck && this.EmailVoildtext !== 'Good'
    },
    EmailVoildtext () {
      if (this.email.val === '') return 'Please input email'
      else if (!this.email.val.match(/^[^@\s]+@[^@\s]+\.[^@\s]+$/)) {
        return 'Emali format error'
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
      if (this.pwd.val === '') return 'Please input password'
      else if (this.pwd.val.length < 8) {
        return 'Password length must more than 8'
      } else {
        return 'Good'
      }
    },
    ConfirmInvalid () {
      return !this.firstCheck && this.ConfirmVoildtext !== 'Good'
    },
    ConfirmInvalidText () {
      return this.ConfirmInvalid ? ' is-invalid' : ''
    },
    ConfirmVoildtext () {
      if (this.confirm.val === '') return 'Please input password'
      else if (this.confirm.val !== this.pwd.val) {
        return 'Please input password again'
      } else {
        return 'Good'
      }
    }
  }
}
</script>

<style></style>
