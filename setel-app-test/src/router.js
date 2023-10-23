import { createRouter, createWebHistory } from 'vue-router';
import LandingPage from './components/LandingPage.vue';
import LoginPage from './components/LoginPage.vue';
import DashboardPage from './components/DashboardPage.vue'
import InventoryPageVue from './components/InventoryPage.vue';
import ReportPageVue from './components/ReportPage.vue';

const routes = [
  {
    path: '/LandingPage',
    name: 'LandingPage',
    component: LandingPage
  },
  {
    path: '/LoginPage',
    name: 'LoginPage',
    component: LoginPage
  },
  {
    path: '/DashboardPage',
    name: 'DashboardPage',
    component: DashboardPage
  },
  {
    path: '/InventoryPage',
    name: 'InventoryPage',
    component: InventoryPage
  },
  {
    path: '/ReportPage',
    name: 'ReportPage',
    component: ReportPage
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
