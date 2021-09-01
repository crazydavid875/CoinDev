import Vue from 'vue'
import VueRouter from 'vue-router'

import Login from '../components/Login.vue'
import Regist from '../components/Regist.vue'
import AddArticle from '../components/AddArticle.vue'
import Startpage from '../views/Startpage.vue'
import Payment from '../views/Payment.vue'
import MemberPage from '../views/MemberPage.vue'
import Admin from '../views/Admin.vue'
import articleList from '../components/adminArticleList.vue'
Vue.use(VueRouter)

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/MemberPage',
    name: 'MemberPage',
    component: MemberPage
  },
  {
    path: '/Admin',
    name: 'Admin',
    component: Admin
  },
  {
    path: '/Admin/articleList/:id',
    name: 'articleList',
    component: articleList
  },
  {
    path: '/onpay/:id',
    name: 'Payment',
    component: Payment
  },
  {
    path: '/regist',
    name: 'Regist',
    component: Regist
  },
  {
    path: '/AddArticle',
    name: 'AddArticle',
    component: AddArticle
  },
  {
    path: '/',
    name: 'Startpage',
    component: Startpage
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
