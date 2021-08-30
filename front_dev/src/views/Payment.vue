<template>
  <div class="paymentpage">
    <div class="container">
      <div class="row mb-3">
        <h2>確認繳款</h2>
      </div>
      <div class="row mb-3">
        <label for="inputEmail3" class="col-sm-2 col-form-label"
          >需付金額</label
        >
        <div class="col-sm-10">
          <input
            class="form-control"
            type="text"
            :placeholder="amt"
            aria-label="readonly input example"
            readonly
          />
        </div>
      </div>
      <div class="row mb-3">
        <label for="inputEmail3" class="col-sm-2 col-form-label"
          >付款方式</label
        >
        <div class="col-sm-10">
          <select
            class="form-select"
            aria-label="Default select example"
            v-model="paytype"
          >
            <option value="CREDIT" selected>信用卡</option>
            <option value="CVS">超商繳費</option>
            <option value="VACC">ATM轉帳</option>
          </select>
        </div>
      </div>
      <form
        id="newebpay"
        name="Newebpay"
        method="post"
        action="https://ccore.newebpay.com/MPG/mpg_gateway"
        ref="form"
      >
        <input type="hidden" name="TradeSha" readonly :value="TradeSha" />
        <input type="hidden" name="TradeInfo" readonly :value="TradeInfo" />
        <input type="hidden" name="Version" readonly :value="Version" />
        <input type="hidden" name="MerchantID" readonly :value="MerchantID" />
        <button type="button" @click="onpay()" class="btn btn-primary">
          付款
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: () => ({
    amt: 0,
    itemName: '',
    TradeSha: '',
    TradeInfo: '',
    Version: '',
    MerchantID: '',
    paytype: 'CREDIT'
  }),
  mounted () {
    this.getAmt()
  },
  methods: {
    onpay () {
      var vm = this
      axios
        .post('/back/payment/getMPGRecord/', { paytype: vm.paytype })
        .then(res => {
          var data = res.data
          vm.TradeSha = data.TradeSha
          vm.TradeInfo = data.TradeInfo
          vm.Version = data.Version
          vm.MerchantID = data.MerchantID

          // Perform Success Action push to memberpage
        })
        .catch(error => {
          if (error.response.status === 400) {
            console.log(error.response.log)
          }

          // error.response.status Check status code
        })
        .finally(() => {
          vm.$refs.form.submit()
          // Perform action in always
        })
    },
    getAmt () {
      var vm = this
      axios
        .get('/back/payment/amt/')
        .then(res => {
          vm.amt = res.data
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
.paymentpage {
  margin-top: 3rem;
}
</style>
