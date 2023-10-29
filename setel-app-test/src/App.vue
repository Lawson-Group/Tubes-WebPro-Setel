<template>
  <v-app>
    <v-main>
      <v-row no-gutters style="height: 100vh;">
        <v-col v-if="showNavbar" cols="3" md="2">
          <NavBarVue ></NavBarVue>
        </v-col>

        <v-col style="overflow-y: auto; height: 100vh;">
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
