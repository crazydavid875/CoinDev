<template>
  <div class="paymentpage">
    <div class="container">
      <div class="row mb-3">
        <h2>Payment</h2>
      </div>
      <div class="row mb-3">
        <label for="inputAmount" class="col-sm-2 col-form-label">Amount </label>
        <div class="col-sm-10">
          <input
            class="form-control"
            type="text"
            :placeholder="amt + ' NTD'"
            id="inputAmount"
            readonly
          />
        </div>
      </div>
      <div class="row mb-3">
        <label for="inputReceipt" class="col-sm-2 col-form-label"
          >Receipt (Invoice) Title (Not Necessary)
        </label>
        <div class="col-sm-10">
          <input
            class="form-control"
            type="text"
            id="inputReceipt"
            v-model="receipt"
          />
        </div>
      </div>
      <div class="row mb-3">
        <label for="inputmethods" class="col-sm-2 col-form-label"
          >Payment methods</label
        >
        <div class="col-sm-10">
          <select class="form-select" id="inputmethods" v-model="paytype">
            <option value="CREDIT" selected>Credit</option>
            <option value="CVS">Others</option>
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
          Submit
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
    paytype: 'CREDIT',
    receipt: ''
  }),
  mounted () {
    this.getAmt()
  },
  methods: {
    onpay () {
      var vm = this
      axios
        .post('/back/payment/getMPGRecord/' + this.$route.params.id, {
          paytype: vm.paytype,
          receipt: vm.receipt
        })
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
        .get('/back/payment/record/' + this.$route.params.id)
        .then(res => {
          vm.amt = res.data.total
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
