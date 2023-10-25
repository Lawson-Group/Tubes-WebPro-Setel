import { createRouter, createWebHistory } from 'vue-router';
import LandingPage from './components/LandingPage.vue';
import LoginPage from './components/LoginPage.vue';
import DashboardPage from './components/DashboardPage.vue'
import InventoryPage from './components/InventoryPage.vue';
import ReportPage from './components/ReportPage.vue';
import FeedbackPage from './components/FeedbackPage.vue';


const routes = [
  {
    path: '/',
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
  },
  {
    path: '/FeedbackPage',
    name: 'FeedbackPage',
    component: FeedbackPage
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;
