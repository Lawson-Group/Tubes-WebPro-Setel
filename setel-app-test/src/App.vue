<template>
  <v-app>
    <v-main>
      <!-- <v-row no-gutters style="height: 100vh;"> -->
      <v-row no-gutters>
        <v-col v-if="showNavbar" cols="3" md="2">
          <NavBarVue></NavBarVue>
        </v-col>

        <v-col :style="{
          'height': showNavbar ? '100vh' : 'auto',
          'overflow-y': 'auto'
        }">
          <router-view></router-view>
        </v-col>
      </v-row>
    </v-main>
  </v-app>
</template>

<script>
import NavBarVue from './components/NavBar.vue';

export default {
  name: 'App',
  components: {
    NavBarVue
  },
  computed: {
    showNavbar() {
      const navbarRoutes = ['DashboardPage', 'InventoryPage', 'ReportPage', 'FeedbackPage'];
      return navbarRoutes.includes(this.$route.name);
    }
  },
};

</script>
