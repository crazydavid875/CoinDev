<template>
  <div class="mpage">
    <div class="container">
      <div class="row">
        <div class="col-2">
          <div class="list-group" id="list-tab" role="tablist">
            <a
              class="list-group-item list-group-item-action active"
              id="list-profile-list"
              data-bs-toggle="list"
              href="#list-profile"
              role="tab"
              aria-controls="list-profile"
              >基本資料</a
            >
            <a
              class="list-group-item list-group-item-action"
              id="list-messages-list"
              data-bs-toggle="list"
              href="#list-messages"
              role="tab"
              aria-controls="list-messages"
              >論文</a
            >
            <a
              class="list-group-item list-group-item-action"
              id="list-settings-list"
              data-bs-toggle="list"
              href="#list-settings"
              role="tab"
              aria-controls="list-settings"
              >付款紀錄</a
            >
          </div>
        </div>
        <div class="col-8">
          <div class="tab-content" id="nav-tabContent">
            <div
              class="tab-pane fade  show active"
              id="list-profile"
              role="tabpanel"
              aria-labelledby="list-profile-list"
            >
              <Profile />
            </div>
            <div
              class="tab-pane fade"
              id="list-messages"
              role="tabpanel"
              aria-labelledby="list-messages-list"
            >
              <Article />
            </div>
            <div
              class="tab-pane fade"
              id="list-settings"
              role="tabpanel"
              aria-labelledby="list-settings-list"
            >
              <PayRecord />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Profile from '@/components/Profile.vue'
import Article from '@/components/Article.vue'
import PayRecord from '@/components/PayRecord.vue'
export default {
  components: { Profile, Article, PayRecord }
}
</script>

<style>
.mpage {
  margin-top: 5rem;
}
</style>
