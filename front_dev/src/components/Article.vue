<template>
  <div class="pap">
    <h3>
      Paper(s)
    </h3>

    <table class="table  table-light table-striped table-hover">
      <thead>
        <tr>
          <td>#</td>
          <td>Title</td>
          <td>Author(s)</td>
          <td>Paper ID</td>
          <td>Pages</td>
          <td></td>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(item, index) in datas" :key="'d' + index">
          <template v-if="item.hasPaid">
            <td>
              <span>{{ index + 1 }}</span>
            </td>
            <td>
              <input
                class="form-control"
                type="text"
                v-model="item.title"
                placeholder="Title"
              />
            </td>
            <td>
              <input
                class="form-control"
                type="text"
                v-model="item.auth"
                placeholder="xxx, xxx, xxx"
              />
            </td>
            <td>
              <input
                class="form-control"
                type="text"
                v-model="item.paperid"
                placeholder="ex : 1570740455"
              />
            </td>
            <td>
              <input
                class="form-control"
                type="number"
                min="1"
                disabled
                v-model="item.pagecount"
                placeholder="Pages"
              />
            </td>
            <td>
              <button
                type="buttons"
                class="btn btn-outline-primary"
                @click="patchArticle(item)"
              >
                Save
              </button>
            </td>
          </template>
          <template v-else>
            <td>
              <span>{{ index + 1 }}</span>
            </td>
            <td>
              <input
                class="form-control"
                type="text"
                v-model="item.title"
                placeholder="Title"
              />
            </td>
            <td>
              <input
                class="form-control"
                type="text"
                v-model="item.auth"
                placeholder="xxx, xxx, xxx"
              />
            </td>
            <td>
              <input
                class="form-control"
                type="text"
                v-model="item.paperid"
                placeholder="ex : 1570740455"
              />
            </td>
            <td>
              <input
                class="form-control"
                type="number"
                min="1"
                v-model="item.pagecount"
                placeholder="Pages"
              />
            </td>
            <td>
              <button
                type="buttons"
                class="btn btn-outline-primary"
                @click="patchArticle(item)"
              >
                Save
              </button>
              <button
                type="buttons"
                class="btn btn-outline-primary"
                @click="DeleteArticle(item.id)"
              >
                Delete
              </button>
            </td>
          </template>
        </tr>
        <tr>
          <td></td>
          <td>
            <input
              class="form-control"
              type="text"
              v-model="newTitle"
              placeholder="Title"
            />
          </td>
          <td>
            <input
              class="form-control"
              type="text"
              v-model="newAuth"
              placeholder="xxx, xxx, xxx"
            />
          </td>
          <td>
            <input
              class="form-control"
              type="text"
              v-model="newpaperid"
              placeholder="ex : 1570740455"
            />
          </td>
          <td>
            <input
              class="form-control"
              type="number"
              min="1"
              v-model="newpagecount"
              placeholder="Pages"
            />
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
    this.getarticle()
  },
  methods: {
    getarticle () {
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
    newArticle () {
      if (
        this.newTitle === '' ||
        this.newAuth === '' ||
        this.newpaperid === '' ||
        this.newpagecount === ''
      ) {
        alert('Please complete all columns')
        return
      }

      this.postNewArticle()
      this.newTitle = ''
      this.newAuth = ''
      this.newpaperid = ''
      this.newpagecount = ''
    },
    patchArticle (item) {
      var data = item
      var vm = this
      if (
        data.title === '' ||
        data.auth === '' ||
        data.paperid === '' ||
        data.pagecount === ''
      ) {
        alert('Please complete all columns')
        return
      }
      axios
        .patch('/back/article/aid/' + data.id, {
          title: data.title,
          auth: data.auth,
          paperid: data.paperid,
          pagecount: data.pagecount
        })
        .then(res => {
          var data = res
          console.log(data.data)
          if (res.data.id != null) {
            vm.$router.go('/MemberPage/2/paper')
          }
          alert('Paper has been changed')
          // this.$router.go()
          // Perform Success Action push to memberpage
        })
        .catch(error => {
          if (error.response.status === 400) {
            console.log(error.response)
          }
          alert(error.response.data)
          this.getarticle()
          // error.response.status Check status code
        })
        .finally(() => {
          // Perform action in always
        })
    },
    DeleteArticle (id) {
      axios
        .delete('/back/article/aid/' + id)
        .then(res => {
          alert('Paper Delete success')
          this.getarticle()

          // Perform Success Action push to memberpage
        })
        .catch(error => {
          if (error.response.status === 400) {
            console.log(error.response)
          }
          alert(error.response.data)
          this.getarticle()
          // error.response.status Check status code
        })
        .finally(() => {
          // Perform action in always
        })
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

<style>
.pap {
  height: 100vh;
}
</style>
