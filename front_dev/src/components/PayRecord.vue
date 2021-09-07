<template>
  <div class="payrec">
    <h3>
      Payment Record
    </h3>
    <table class="table  table-light  table-striped ">
      <thead>
        <tr>
          <td>#</td>
          <td>Record ID Number</td>
          <td>CreateTime</td>
          <td>Payment</td>
          <td>Total</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in datas" :key="'d' + index">
          <td>{{ index + 1 }}</td>
          <td>{{ item.id }}</td>
          <td>{{ item.createtimestr }}</td>
          <td>{{ item.paytime == null ? 'unpaid' : 'paid' }}</td>
          <td>{{ item.total }} NTD</td>
          <td>
            <button
              v-if="item.paytime == null"
              class="btn  btn-link"
              type="submit"
              @click="goPay(item.id)"
            >
              Pay
            </button>
          </td>
        </tr>
      </tbody>
    </table>
    <button
      v-if="nopaycount > 0"
      @click="goPayAll()"
      class="btn  btn-outline-light"
      type="submit"
    >
      Pay
    </button>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: () => ({
    datas: [] // [{ id: '1', name: 'aa', time: '2021-01-11', status: '未繳費' }]
  }),
  mounted () {
    this.getRecord()
  },
  methods: {
    getRecord () {
      var vm = this
      axios
        .get('/back/payment/record')
        .then(res => {
          vm.datas = res.data
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
    goPay (id) {
      this.$router.push('/onpay/' + id)
    },
    goPayAll () {
      var vm = this
      axios
        .post('/back/payment/payAll')
        .then(res => {
          console.log(res)

          vm.$router.push('/onpay/' + res.data.id)
          // Perform Success Action push to memberpage
        })
        .catch(error => {
          console.log(error)
          this.errored = true
        })
    }
  },
  computed: {
    nopaycount () {
      return this.datas.filter(record => {
        return record.status !== '已繳費'
      }).length
    }
  }
}
</script>

<style>
.payrec {
  height: 100vh;
}
</style>
