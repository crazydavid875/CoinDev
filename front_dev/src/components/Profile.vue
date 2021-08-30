<template>
  <div>
    <div class="container profile">
      <div class="row">
        <div class="col">
          <h3>
            基本資料
          </h3>
        </div>
        <div class="col">
          <button
            type="button"
            class="btn btn-outline-secondary"
            @click="onChangeMode()"
          >
            {{ changeText }}
          </button>
        </div>
      </div>
      <div class="row ">
        <div class="col-md-5">
          姓名
        </div>
        <div class="col-5">
          <span v-if="!changeMode">
            {{ name }}
          </span>
          <input v-else class="form-control" type="text" v-model="name" />
        </div>
      </div>
      <div class="row">
        <div class="col-md-5">
          Email
        </div>
        <div class="col-5">
          <span v-if="!changeMode">{{ email }}</span>
          <input v-else class="form-control" type="text" v-model="email" />
        </div>
      </div>
      <div class="row">
        <div class="col-md-5">
          繳費狀況
        </div>
        <div class="col-5">
          <span>{{ ispay }}</span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: () => ({
    name: '',
    email: '',
    ispay: '',
    newName: '',
    newEmail: '',
    changeMode: false
  }),
  mounted () {
    var vm = this
    axios
      .get('/back/account/info')
      .then(res => {
        var data = res.data
        vm.name = data.name
        vm.email = data.email
        vm.ispay = data.ispay
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
  methods: {
    onChangeMode () {
      if (this.changeMode) this.onSave()
      this.changeMode = !this.changeMode
    },
    onSave () {
      var vm = this
      axios
        .patch('/back/account', { name: vm.name, email: vm.email })
        .then(res => {
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
    changeText () {
      return this.changeMode ? '儲存' : '修改'
    }
  }
}
</script>

<style>
.profile {
  text-align: left;
}
</style>
