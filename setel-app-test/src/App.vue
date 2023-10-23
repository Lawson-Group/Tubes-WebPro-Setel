<template>
  <v-app>
    <v-main>
      <v-row no-gutters>
        <v-col v-if="showNavbar" cols="3" md="2">
          <NavBarVue></NavBarVue>
        </v-col>

        <v-col cols=""> 
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
      const navbarRoutes = ['DashboardPage'];
      return navbarRoutes.includes(this.$route.name);
    }
  },
};

</script>
