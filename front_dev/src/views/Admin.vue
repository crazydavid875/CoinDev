<template>
  <div>
    <h3>
      付款紀錄
    </h3>
    <table class="table table-sm">
      <thead>
        <tr>
          <td>#</td>
          <td>會員Email</td>
          <td>會員名稱</td>
          <td>Email驗證</td>
          <td>付款狀態</td>
          <td>論文數量</td>
          <td>應繳金額</td>
          <td>已繳金額</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in datas" :key="'d' + index">
          <td>{{ index + 1 }}</td>
          <td>{{ item.email }}</td>
          <td>{{ item.name }}</td>
          <td>{{ item.isVerify }}</td>
          <td>{{ item.status }}</td>
          <td>{{ item.articleCount }}</td>
          <td>${{ item.mustPay }}</td>
          <td>${{ item.hasPay }}</td>
          <td>
            <button
              class="btn  btn-link"
              type="submit"
              @click="searchArticle(item.id)"
            >
              查詢論文
            </button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
// import axios from 'axios'
export default {
  data: () => ({
    datas: [
      {
        id: '1',
        email: 'aa',
        name: 'bbs',
        isVerify: 'true',
        status: '未繳費',
        articleCount: '2',
        mustPay: '100',
        hasPay: '10'
      }
    ]
  }),
  mounted () {
    this.isAdmin()
    this.getRecord()
  },
  methods: {
    isAdmin () {
      // this.$router.push('/')
    },
    getRecord () {
      /* axios
        .get('/back/payment/record')
        .then(res => {
          // vm.datas = res.data
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
        }) */
    },
    searchArticle (id) {
      this.$router.push('/Admin/articleList/' + id)
    }
  },
  computed: {}
}
</script>

<style></style>
