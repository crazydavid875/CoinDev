<template>
  <div>
    <h3>{{ userName }}的論文</h3>

    <table class="table  table-hover">
      <thead>
        <tr>
          <td>#</td>
          <td>Title</td>
          <td>Auther</td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in datas" :key="'d' + index">
          <td>{{ index + 1 }}</td>
          <td>{{ item.title }}</td>
          <td>{{ item.auth }}</td>
          <td></td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: () => ({
    datas: [],
    userName: 'aa'
  }),
  mounted () {
    var vm = this
    axios
      .get('/back/article/')
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
  computed: {
    useid () {
      return this.$route.params.id
    }
  }
}
</script>

<style></style>
