<template>
  <div>
    <h3>
      Paper
    </h3>

    <table class="table  table-light table-striped table-hover">
      <thead>
        <tr>
          <td>#</td>
          <td>Title</td>
          <td>Auther</td>
          <td>PaperID</td>
          <td>Pages</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in datas" :key="'d' + index">
          <td>{{ index + 1 }}</td>
          <td>{{ item.title }}</td>
          <td>{{ item.auth }}</td>
          <td>{{ item.paperid }}</td>
          <td>{{ item.pagecount }}</td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td><input class="form-control" type="text" v-model="newTitle" /></td>
          <td><input class="form-control" type="text" v-model="newAuth" /></td>
          <td>
            <input class="form-control" type="text" v-model="newpaperid" />
          </td>
          <td>
            <input class="form-control" type="text" v-model="newpagecount" />
          </td>
          <td>
            <button
              type="buttons"
              class="btn btn-outline-primary"
              @click="newArticle()"
            >
              New
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
    newAuth: '',
    newpaperid: '',
    newpagecount: ''
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
      this.datas.push({
        title: this.newTitle,
        auth: this.newAuth,
        paperid: this.newpaperid,
        pagecount: this.newpagecount
      })
      this.postNewArticle()
      this.newTitle = ''
      this.newAuth = ''
      this.newpaperid = ''
      this.newpagecount = ''
    },
    postNewArticle () {
      axios
        .post('/back/article/', {
          title: this.newTitle,
          auth: this.newAuth,
          paperid: this.newpaperid,
          pagecount: this.newpagecount
        })
        .then(res => {
          this.$router.go()
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
