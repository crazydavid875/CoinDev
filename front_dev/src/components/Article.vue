<template>
  <div>
    <h3>
      論文
    </h3>

    <table class="table table-hover">
      <thead>
        <tr>
          <td>#</td>
          <td>Title</td>
          <td>Auther</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in datas" :key="'d' + index">
          <td>{{ index + 1 }}</td>
          <td>{{ item.title }}</td>
          <td>{{ item.auth }}</td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td><input class="form-control" type="text" v-model="newTitle" /></td>
          <td><input class="form-control" type="text" v-model="newAuth" /></td>
          <td>
            <button
              type="buttons"
              class="btn btn-outline-primary"
              @click="newArticle()"
            >
              新增
            </button>
          </td>
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
    newTitle: '',
    newAuth: ''
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
  methods: {
    newArticle () {
      this.datas.push({ title: this.newTitle, auth: this.newAuth })
      this.postNewArticle(this.newTitle, this.newAuth)
      this.newTitle = ''
      this.newAuth = ''
    },
    postNewArticle (title, auth) {
      axios
        .post('/back/article/', { title: title, auth: auth })
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
  }
}
</script>

<style></style>
