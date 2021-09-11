<template>
  <div>
    <div class="container profile">
      <div class="row mb-3">
        <div class="col-auto">
          <h3>
            Profile
          </h3>
        </div>
        <div class="col" v-if="alerttext !== 'Please complete your Profile'">
          <button type="button" class="btn btn-primary" @click="onChangeMode()">
            Edit
          </button>
        </div>
      </div>
      <div
        :class="
          'alert ' +
            (alerttext == 'No Payment Due' ? ' alert-success' : ' alert-danger')
        "
        role="alert"
      >
        {{ alerttext }}

        <button
          v-if="alerttext == 'Please complete your Profile'"
          type="button"
          class="btn btn-primary"
          @click="onChangeMode()"
        >
          Edit
        </button>

        <a
          v-if="alerttext == 'You can...'"
          @click="gotopay()"
          class="btn btn-primary"
        >
          Pay without paper
        </a>
        <span v-if="alerttext == 'You can...'" > or </span>
        <a
          v-if="alerttext == 'You can...'"
          @click="gotopaper()"
          class="btn btn-primary"
        >
          Add paper(s)
        </a>
      </div>
      <div class="row mb-2">
        <label for="E-mail" class="col-sm-2 text-end col-form-label">
          E-mail
        </label>
        <label class="col-sm-2 text-start col-form-label">
          {{ email }}
        </label>
      </div>
      <div class="row mb-3" v-if="changeMode">
        <label for="firstname" class="col-sm-2  text-end col-form-label">
          First Name
        </label>
        <div class="col-2">
          <input
            id="firstname"
            class="form-control text-start"
            type="text"
            v-model="fname"
          />
        </div>
        <label for="lastname" class="col-sm-2  text-end col-form-label">
          Last Name
        </label>
        <div class="col-4">
          <input
            id="lastname"
            class="form-control  text-start"
            type="text"
            v-model="lname"
          />
        </div>
      </div>
      <div class="row mb-3" v-else>
        <label for="firstname" class="col-sm-2 text-end col-form-label">
          Full Name
        </label>
        <div class="col">
          <label
            v-if="!changeMode"
            class=" text-start col-form-label"
            >{{ name }}</label
          >
        </div>
      </div>
      <div class="row mb-3">
        <label class="col-sm-2  text-end col-form-label">
          Position
        </label>
        <div class="col-10">
          <label v-if="!changeMode" class="text-start col-form-label">
            {{ Position }}
          </label>
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
              <label class="form-check-label " for="inlineRadio2"
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
              <label class="form-check-label " for="inlineRadio3"
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
        <label for="Affiliation" class="col-sm-2  text-end col-form-label">
          Affiliation
        </label>
        <div class="col-5">
          <label v-if="!changeMode" class="text-start col-form-label">
            {{ Affiliation }}
          </label>
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
        <label for="Country" class="col-sm-2  text-end col-form-label">
          Country
        </label>
        <div class="col-5">
          <label v-if="!changeMode" class=" text-start col-form-label">
            {{ Country }}
          </label>
          <Counrtypicker v-else :Country.sync="Country"></Counrtypicker>
        </div>
      </div>

      <div class="row  mb-3">
        <label for="Tel" class="col-sm-2  text-end col-form-label">
          Tel.
        </label>

        <div class="col-5">
          <label v-if="!changeMode" class="text-start col-form-label">
            {{ Tel }}
          </label>
          <input
            v-else
            id="Tel"
            class="form-control"
            type="tel"
            v-model="Tel"
            ref="tel"
          />
        </div>
      </div>
      <div class="row  mb-3">
        <label for="Tel" class="col-sm-2  text-end col-form-label">
          Microsoft Teams ID
        </label>

        <div class="col-5">
          <label v-if="!changeMode" class="text-start col-form-label">
            {{ teamsid }}
          </label>
          <input
            v-else
            id="teamsid"
            class="form-control"
            type="text"
            v-model="teamsid"
          />
        </div>
      </div>
      <div class="row  mb-3">
        <label class="col-sm-2  text-end col-form-label">
          Vegetarian
        </label>
        <label v-if="!changeMode" class="col-sm-2 text-start col-form-label">
          {{ isveg === '1' ? 'yes' : isveg === '0' ? 'no' : '' }}
        </label>

        <div class="col-5" v-else>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="veg"
              id="inlineRadio1"
              v-model="isveg"
              value="1"
            />
            <label class="form-check-label" for="inlineRadio1">yes</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="veg"
              id="inlineRadio2"
              v-model="isveg"
              value="0"
            />
            <label class="form-check-label" for="inlineRadio2">no</label>
          </div>
        </div>
      </div>
      <div class="row mb-3">
        <div class="col-1"></div>
        <div class="col-5">
          <div v-if="!changeMode">
            <div class="form-check  form-switch">
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
        <div class="col-sm-2  text-end">
          <span class=" col-form-label">IEEE Member Number</span>
        </div>
        <div class="col-5">
          <span>{{ IEEEMemberID }}</span>
        </div>
      </div>
      <div
        v-else
        :class="'row mb-3 collapse ' + (isIEEE ? 'show' : '')"
        id="collapseExample"
      >
        <label for="IEEEMemberID" class="col-sm-2  text-end col-form-label"
          >IEEE Member Number</label
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
        <div class="col-1"></div>
        <div class="col-5" v-if="!changeMode">
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
        <div class="col-5" v-else>
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
        <div class="col-sm-2  text-end">
          <span for="StudentID" class=" col-form-label">Student ID Number</span>
        </div>
        <div class="col-5">
          <span>{{ studentid }}</span>
        </div>
      </div>
      <div
        v-else
        :class="'row mb-3 collapse ' + (isStudent ? 'show' : '')"
        id="collapsest"
      >
        <label for="StudentID" class="col-sm-2 text-end col-form-label"
          >Student ID Number</label
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
      <div class="row mb-3 ">
        <div class="col-sm-2 text-end">
          <button
            v-if="changeMode"
            type="button"
            class="  btn btn-primary"
            @click="onSave()"
          >
            Save
          </button>
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
    fname: '',
    lname: '',
    payment: [],
    isveg: '',
    teamsid: ''
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
          vm.fname = data.name.split(' ')[0]
          vm.lname = data.name.split(' ')[1]
          vm.email = data.email
          vm.ispay = data.totalUnPay <= 0 && data.totalpaied > 0
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
          vm.complete = data.complete && vm.fname !== '' && vm.lname !== ''
          vm.isveg = data.isveg === '' ? 0 : data.isveg
          vm.teamsid = data.teamsid
          // Perform Success Action push to memberpage
        })
        .catch(error => {
          if (error.response.status === 400) {
            console.log(error.response.log)
          }
          if (error.response.status === 404) {
            this.$router.push('/')
          }
          // error.response.status Check status code
        })
        .finally(() => {
          // Perform action in always
        })
    },
    onChangeMode () {
      this.changeMode = true
    },
    onSave () {
      if (this.isStudent && this.studentid === '') {
        alert('Student ID ERROR')
        return
      }
      if (this.isIEEE && this.IEEEMemberID === '') {
        alert('IEEE Member ID ERROR')
        return
      }
      if (!this.isStudent) this.studentid = ''
      if (!this.isIEEE) this.IEEEMemberID = ''
      if (this.Country === '') this.Country = 'Taiwan'
      this.name = this.fname + ' ' + this.lname
      axios
        .patch('/back/account', {
          name: this.name,
          position: this.Position,
          affiliation: this.Affiliation,
          country: this.Country,
          tel: this.Tel,
          studentid: this.studentid,
          ieeeid: this.IEEEMemberID,
          isveg: this.isveg,
          teamsid: this.teamsid
        })
        .then(res => {
          // this.$router.go()
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
          this.changeMode = false
          this.onLoad()
          // Perform action in always
        })
    },
    gotopay () {
      this.$router.push('/MemberPage/3/payrecord')
    },
    gotopaper () {
      this.$router.push('/MemberPage/2/paper')
    }
  },
  computed: {
    changeText () {
      return this.changeMode ? 'Save' : 'Edit'
    },
    alerttext () {
      if (!this.complete) return 'Please complete your Profile'
      else if (!this.ispay) return 'You can...'
      else return 'No Payment Due'
    }
  }
}
</script>

<style>
.profile {
  text-align: left;
  padding-bottom: 2rem;
  position: relative;
}
</style>
