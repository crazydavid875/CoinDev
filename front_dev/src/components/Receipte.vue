<template>
  <div class="receipt">
    <h3>
      Receipt(s)
    </h3>
    <table class="table  table-light  table-striped ">
      <thead>
        <tr>
          <th style="width:5%">#</th>
          <th style="width:20%">Paper</th>
          <th style="width:15%">Total</th>
          <th style="width:5%">CreateTime</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in datas" :key="'d' + index">
          <td>{{ index + 1 }}</td>
          <td>{{ item.articleTitle }}</td>
          <td>{{ item.total }} NTD</td>
          <td>{{ item.datetime }}</td>

          <td>
            <button
              v-if="item.paytime == null"
              class="btn  btn-link"
              type="submit"
              @click="getpdf(item.id)"
            >
              Download
            </button>
          </td>
        </tr>
      </tbody>
    </table>
    <button
      v-if="nopaycount > 0"
      @click="CreateReceipt()"
      class="btn  btn-primary"
      type="submit"
    >
      CreateReceipt
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
    this.getlist()
  },
  methods: {
    CreateReceipt () {},
    getpdf (id) {
        window.open('/back/receipt/pdf/' + id)
      
    },
    getlist () {
      var vm = this
      axios
        .get('/back/receipt/list')
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
    }
  }
}
</script>
<style>
.receipt {
  height: auto;
  padding-bottom: 3rem;
    min-height: 350px;
}
</style>