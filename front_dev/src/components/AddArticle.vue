<template>
  <div>
    <div class="container">
      <form>
        <div class="row mb-3">
          <div class="alert alert-warning" role="alert">
            未發表論文入會費為250$，發表一篇文章為300$
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-sm-2"></div>
          <div class="col-sm-8">
            <div class="col-sm-3">
              <div class="form-check form-switch">
                <input
                  class="form-check-input"
                  type="checkbox"
                  id="flexSwitchCheckDefault"
                  v-model="collapseSwitch"
                />
                <label class="form-check-label" for="flexSwitchCheckDefault"
                  >是否要發表論文</label
                >
                <button
                  ref="colbtn"
                  class="btn btn-primary"
                  type="button"
                  hidden
                  data-bs-toggle="collapse"
                  data-bs-target="#collapseExample"
                  aria-expanded="false"
                  aria-controls="collapseExample"
                >
                  Button with data-bs-target
                </button>
              </div>
            </div>
            <div class="collapse" id="collapseExample">
              <div class="card card-body">
                <div class="container">
                  <div class="row mb-3">
                    <label for="inputtitle" class="col-sm-2 col-form-label"
                      >論文數量</label
                    >
                    <div class="col-sm-10">
                      <input
                        class="form-control"
                        type="number"
                        v-model="articleCount"
                        min="1"
                      />
                    </div>
                  </div>
                  <template v-for="(n, index) in ArticleCountArr">
                    <div class="row align-self-center" :key="'aarea' + index">
                      <div class="col article area">
                        <div class="row mb-3">
                          <h3 class="text-center">#{{ n }}</h3>
                        </div>
                        <div class="row mb-3">
                          <label
                            for="inputtitle"
                            class="col-sm-2 col-form-label"
                            >Title{{ n }}</label
                          >
                          <div class="col-sm-10">
                            <input
                              type="text"
                              name="title"
                              :class="'form-control'"
                              id="inputtitle"
                              v-model="title[index]"
                            />
                            <div class="invalid-feedback"></div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label
                            for="inputAuther"
                            class="col-sm-2 col-form-label"
                            >Auther{{ n }}</label
                          >
                          <div class="col-sm-10">
                            <input
                              type="text"
                              name="Auther"
                              :class="'form-control'"
                              id="inputAuther"
                              v-model="auther[index]"
                            />
                            <div class="invalid-feedback"></div>
                          </div>
                        </div>
                      </div></div
                  ></template>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row mb-3 ">
          <div class="col-sm-2"></div>
          <div class="col">
            <button type="button" class="btn btn-primary" @click="onskip()">
              略過
            </button>
          </div>
          <div class="col">
            <button type="button" class="btn btn-primary" @click="onPay()">
              前往繳費
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: () => ({
    collapseSwitch: false,
    title: [],
    auther: [],
    firstCheck: true,
    articleCount: 1
  }),
  watch: {
    collapseSwitch: function (val) {
      this.$refs.colbtn.click()
    }
  },
  methods: {
    onskip () {
      this.$router.push('/MemberPage/MemberPage/1/profile')
    },
    onPay () {
      var vm = this
      this.firstCheck = false
      var count = this.articleCount
      var datas = []
      var auth = this.auther
      var title = this.title
      for (var i = 0; i < count; i++) {
        datas.push({ title: title[i], auth: auth[i] })
      }
      if (this.collapseSwitch === true) {
        axios
          .post('/back/article/multi', {
            datas
          })
          .then(res => {
            console.log(res)
            vm.refreash()
            // Perform Success Action push to memberpage
          })
          .catch(error => {
            if (error.response.status === 400) {
              console.log(error.response.log)
            }
            // error.response.status Check status code
          })
      } else {
        vm.$router.push('/onpay')
      }
    },
    refreash () {
      var vm = this
      axios
        .post('/back/payment/refreashRecord')
        .then(res => {
          vm.$router.push('/onpay')
          // Perform Success Action push to memberpage
        })
        .catch(error => {
          if (error.response.status === 400) {
            console.log(error.response.log)
          }
          // error.response.status Check status code
        })
    }
  },
  computed: {
    ArticleCountArr () {
      var ac = this.articleCount
      return Array.from({ length: ac }, (_, i) => i + 1)
    }
  }
}
</script>

<style></style>
