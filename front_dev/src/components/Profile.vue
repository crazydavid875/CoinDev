<template>
  <div>
    <div class="container profile">
      <div class="row mb-3">
        <div class="col">
          <h3>
            Profile
          </h3>
        </div>
        <div class="col">
          <button
            type="button"
            class="btn btn-outline-light"
            @click="onChangeMode()"
          >
            {{ changeText }}
          </button>
        </div>
      </div>
      <div :class="'alert ' + (alerttext=='Success'?' alert-success':' alert-danger')" role="alert">
        {{alerttext }}
      </div>
      <div class="row mb-3">
        <label for="E-mail" class="col-sm-2 col-form-label">
          E-mail
        </label>
        <div class="col-5">
          <span>{{ email }}</span>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-md-2">
          payment status
        </div>
        <div class="col-5">
          <span>{{ ispay ? 'paid' : 'outstanding' }}</span>
        </div>
      </div>
      <div class="row mb-3">
        <label for="fullname" class="col-sm-2 col-form-label">
          Full Name
        </label>
        <div class="col-5">
          <span v-if="!changeMode">
            {{ name }}
          </span>
          <input
            v-else
            id="fullname"
            class="form-control"
            type="text"
            v-model="name"
          />
        </div>
      </div>
      <div class="row mb-3">
        <label for="Position" class="col-sm-2 col-form-label">
          Position
        </label>
        <div class="col-10">
          <span v-if="!changeMode">
            {{ Position }}
          </span>
          <div v-else>
            <div class="form-check form-check-inline">
              <input
                class="form-check-input"
                type="radio"
                name="inlineRadioOptions"
                id="inlineRadio1"
                value="Prof."
                v-model="Position"
              />
              <label class="form-check-label" for="inlineRadio1">Prof.</label>
            </div>
            <div class="form-check form-check-inline">
              <input
                class="form-check-input"
                type="radio"
                name="inlineRadioOptions"
                id="inlineRadio2"
                value="Assoc. Prof."
                v-model="Position"
              />
              <label class="form-check-label" for="inlineRadio2"
                >Assoc. Prof.</label
              >
            </div>
            <div class="form-check form-check-inline">
              <input
                class="form-check-input"
                type="radio"
                name="inlineRadioOptions"
                id="inlineRadio3"
                value="Asst. Prof."
                v-model="Position"
              />
              <label class="form-check-label" for="inlineRadio3"
                >Asst. Prof.</label
              >
            </div>
            <div class="form-check form-check-inline">
              <input
                class="form-check-input"
                type="radio"
                name="inlineRadioOptions"
                id="inlineRadio4"
                value="Dr."
                v-model="Position"
              />
              <label class="form-check-label" for="inlineRadio4">Dr.</label>
            </div>
            <div class="form-check form-check-inline">
              <input
                class="form-check-input"
                type="radio"
                name="inlineRadioOptions"
                id="inlineRadio5"
                value="Mr."
                v-model="Position"
              />
              <label class="form-check-label" for="inlineRadio5">Mr.</label>
            </div>
            <div class="form-check form-check-inline">
              <input
                class="form-check-input"
                type="radio"
                name="inlineRadioOptions"
                id="inlineRadio6"
                value="Ms."
                v-model="Position"
              />
              <label class="form-check-label" for="inlineRadio6">Ms.</label>
            </div>
          </div>
        </div>
      </div>
      <div class="row mb-3">
        <label for="Affiliation" class="col-sm-2 col-form-label">
          Affiliation
        </label>
        <div class="col-5">
          <span v-if="!changeMode">
            {{ Affiliation }}
          </span>
          <input
            v-else
            id="Affiliation"
            class="form-control"
            type="text"
            v-model="Affiliation"
          />
        </div>
      </div>
      <div class="row mb-3">
        <label for="Country" class="col-sm-2 col-form-label">
          Country
        </label>
        <div class="col-5">
          <span v-if="!changeMode">
            {{ Country }}
          </span>
          <Counrtypicker v-else :Country.sync="Country"></Counrtypicker>
        </div>
      </div>

      <div class="row  mb-3">
        <label for="Tel" class="col-sm-2 col-form-label">
          Tel.
        </label>

        <div class="col-5">
          <span v-if="!changeMode">
            {{ Tel }}
          </span>
          <input
            v-else
            id="Tel"
            class="form-control"
            type="text"
            v-model="Tel"
          />
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-5">
          <div v-if="!changeMode">
            <div class="form-check form-switch">
              <input
                class="form-check-input"
                type="checkbox"
                id="flexSwitchCheckDefault"
                v-model="isIEEE"
                disabled
              />
              <label class="form-check-label" for="flexSwitchCheckDefault"
                >IEEE Member</label
              >
            </div>
          </div>
          <div v-else>
            <div class="form-check form-switch">
              <label
                class="form-check-label"
                for="flexSwitchCheckDefault"
                data-bs-toggle="collapse"
                data-bs-target="#collapseExample"
                aria-expanded="false"
                aria-controls="collapseExample"
                ><input
                  class="form-check-input"
                  type="checkbox"
                  id="flexSwitchCheckDefault"
                  v-model="isIEEE"
                />
                IEEE Member</label
              >
            </div>
          </div>
        </div>
      </div>
      <div v-if="!changeMode && IEEEMemberID != ''" class="row mb-3 ">
        <div class="col-2">
          <span class="col-sm-3 col-form-label">IEEE Member ID</span>
        </div>

        <div class="col-5">
          <span>{{ IEEEMemberID }}</span>
        </div>
      </div>
      <div
        v-else
        :class="'row mb-3 collapse ' + (IEEEMemberID != '' ? 'show' : '')"
        id="collapseExample"
      >
        <label for="IEEEMemberID" class="col-sm-3 col-form-label"
          >IEEE Member ID</label
        >
        <div class="col-sm-5">
          <input
            type="text"
            name="IEEEMemberID"
            :class="'form-control'"
            id="IEEEMemberID"
            v-model="IEEEMemberID"
          />
        </div>
      </div>
      <div class="row mb-3">
        <div v-if="!changeMode">
          <div class="form-check form-switch">
            <input
              class="form-check-input"
              type="checkbox"
              id="st"
              v-model="isStudent"
              disabled
            /><label class="form-check-label" for="st"> Student</label>
          </div>
        </div>
        <div v-else>
          <div class="form-check form-switch">
            <label
              class="form-check-label"
              for="st"
              data-bs-toggle="collapse"
              data-bs-target="#collapsest"
              aria-expanded="false"
              aria-controls="collapsest"
              ><input
                class="form-check-input"
                type="checkbox"
                id="st"
                v-model="isStudent"
              />
              Student</label
            >
          </div>
        </div>
      </div>
      <div v-if="!changeMode && studentid != ''" class="row mb-3 ">
        <div class="col-2">
          <span for="StudentID" class=" col-form-label">Student ID</span>
        </div>
        <div class="col-5">
          <span>{{ studentid }}</span>
        </div>
      </div>
      <div
        v-else
        :class="'row mb-3 collapse ' + (studentid != '' ? 'show' : '')"
        id="collapsest"
      >
        <label for="StudentID" class="col-sm-3 col-form-label"
          >Student ID</label
        >
        <div class="col-sm-5">
          <input
            type="text"
            name="StudentID"
            :class="'form-control'"
            id="StudentID"
            v-model="studentid"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
import Counrtypicker from './CountryPicker.vue'
export default {
  data: () => ({
    name: '',
    email: '',
    Position: '',
    Affiliation: '',
    Country: '',
    Tel: '',
    isIEEE: false,
    ieeeid: '',
    isStudent: false,
    studentid: '',
    ispay: '',
    newName: '',
    newEmail: '',
    changeMode: false,
    indent: '',
    IEEEMemberID: '',
    complete: false,
    payment: []
  }),
  mounted () {
    this.onLoad()
  },
  components: { Counrtypicker },
  methods: {
    onLoad () {
      var vm = this
      axios
        .get('/back/account/info')
        .then(res => {
          var data = res.data
          vm.name = data.name
          vm.email = data.email
          vm.ispay =
            data.totalpaied >= data.totalUnPay && data.paymentRecords.length > 0
          vm.payment = data.paymentRecords
          vm.Position = data.position
          vm.Affiliation = data.affiliation
          vm.Country = data.country
          vm.Tel = data.tel
          vm.indent = data.indent
          vm.studentid = data.studentid
          vm.IEEEMemberID = data.ieeeid
          vm.isIEEE = vm.IEEEMemberID !== ''
          vm.isStudent = vm.studentid !== ''
          vm.complete = data.complete
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
    },
    onChangeMode () {
      if (this.changeMode) this.onSave()
      this.changeMode = !this.changeMode
    },
    onSave () {
      if (!this.isStudent) this.studentid = ''
      if (!this.isIEEE) this.IEEEMemberID = ''
      axios
        .patch('/back/account', {
          name: this.name,
          position: this.Position,
          affiliation: this.Affiliation,
          country: this.Country,
          tel: this.Tel,
          studentid: this.studentid,
          ieeeid: this.IEEEMemberID
        })
        .then(res => {
          this.$router.go()
          // Perform Success Action push to memberpage
        })
        .catch(error => {
          if (error.response.status === 400) {
            console.log(error.response.log)
          }
          this.onLoad()
          alert('save failure')
          // error.response.status Check status code
        })
        .finally(() => {
          // Perform action in always
        })
    }
  },
  computed: {
    changeText () {
      return this.changeMode ? 'Save' : 'Edit'
    },
    alerttext () {
      if (!this.complete) return 'Please complete your Profile'
      else if (!this.ispay) return 'Please pay for the account'
      else return 'Success'
    }
  }
}
</script>

<style>
.profile {
  text-align: left;
}
</style>
