<template>
  <v-card>
    <v-layout>
      <v-navigation-drawer permanent location="left" color="red-darken-4">
        <template v-slot:prepend>
          <v-list-item lines="two" prepend-icon="mdi-account-circle-outline" title="ADMIN"
            subtitle="Administrator"></v-list-item>
        </template>

        <v-divider></v-divider>

        <v-list density="compact" nav>
          <v-list-item prepend-icon="mdi-home-outline" title="Dashboard" value="dashboard" to="/DashboardPage"
            active-class="active-item"></v-list-item>
          <v-list-item prepend-icon="mdi-inbox" title="Inventory" value="inventory" to="/InventoryPage"
            active-class="active-item"></v-list-item>
          <v-list-item prepend-icon="mdi-chart-line" title="Report" value="report" to="/ReportPage"
            active-class="active-item"></v-list-item>
          <v-list-item prepend-icon="mdi-message-alert" title="Feedback" value="feedback" to="/FeedbackPage"
            active-class="active-item"></v-list-item>
        </v-list>

        <template v-slot:append>
          <div>
            <div class="pa-2">
              <v-list-item prepend-icon="mdi-logout" title="Logout" value="logout" active-class="active-item"
                @click="dialog = true"></v-list-item>
            </div>

            <v-dialog v-model="dialog" width="auto">
              <v-card width="500">
                <v-card-text>
                  Apakah Anda yakin ingin logout?
                </v-card-text>

                <v-card-actions>
                  <v-spacer></v-spacer>
                  <v-btn text="No" @click="dialog = false"></v-btn>
                  <v-btn text="Yes" @click="dialog = false" to="/LoginPage" color="#B11116"></v-btn>
                </v-card-actions>
              </v-card>
            </v-dialog>
          </div>
        </template>
      </v-navigation-drawer>
      <v-main style="min-height: 100vh"></v-main>
    </v-layout>
  </v-card>
</template>

<script>
export default {
  data() {
    return {
      dialog: false,
    }
  },
}
</script>

<style>
.active-item {
  color: #a32929;
  background-color: white;
}
</style>
