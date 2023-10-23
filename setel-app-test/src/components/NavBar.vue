<template>
  <v-layout>
    <v-navigation-drawer
      v-model="drawer"
      :rail="rail"
      @click="rail = false"
    >
      <v-list-item
        prepend-avatar="https://randomuser.me/api/portraits/women/81.jpg"
        title="Admin Setel"
        @click.stop="rail = !rail"
        nav>
      </v-list-item>

      <v-divider></v-divider>

      <v-list density="compact" nav>
        <v-list-item prepend-icon="mdi-home-city" title="Home" value="home"></v-list-item>
        <v-list-item prepend-icon="mdi-account" title="My Account" value="account"></v-list-item>
        <v-list-item prepend-icon="mdi-account-group-outline" title="Users" value="users"></v-list-item>
      </v-list>

      <template v-slot:append>
        <div class="pa-2">
          <v-list-item
            prepend-icon="mdi-logout"
            title="Logout"
            value="logout"
          ></v-list-item>
        </div>
      </template>
    </v-navigation-drawer>
    <v-main style="height: 100vh;"></v-main>
  </v-layout>
</template>

<script>

export default {
data () {
return {
  drawer: true,
  rail: true,
}
},
props: {
rail: {
type: Boolean,
required: true
 }
}
}
</script>