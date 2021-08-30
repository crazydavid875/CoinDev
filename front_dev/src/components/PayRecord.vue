<template>
  <div>
    <h3>
      付款紀錄
    </h3>
    <table class="table table-sm">
      <thead>
        <tr>
          <td>#</td>
          <td>項目</td>
          <td>建立時間</td>
          <td>狀態</td>
          <td>金額</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in datas" :key="'d' + index">
          <td>{{ index + 1 }}</td>
          <td>{{ item.content }}</td>
          <td>{{ item.time }}</td>
          <td>{{ item.status }}</td>
          <td>{{ item.amt }}</td>
          <td>
            <button
              v-if="item.status != '已繳費'"
              class="btn  btn-link"
              type="submit"
              @click="goPay(item.id)"
            >
              前往繳費
            </button>
          </td>
        </tr>
      </tbody>
    </table>
    <button
      v-if="nopaycount > 0"
      @click="goPayAll()"
      class="btn btn-primary"
      type="submit"
    >
      一次付清
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
    goPay (id) {},
    goPayAll () {}
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

<style></style>
