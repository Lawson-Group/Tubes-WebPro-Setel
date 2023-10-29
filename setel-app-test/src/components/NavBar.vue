<template>
  <v-card>
    <v-layout>
      <v-navigation-drawer permanent location="left" color="red-darken-4">
        <template v-slot:prepend> 
          <v-list-item
            lines="two"
            prepend-icon="mdi-account-circle-outline"
            title="ADMIN"
            subtitle="Administrator"
          ></v-list-item>
        </template>

        <v-divider></v-divider>

        <v-list density="compact" nav>
          <v-list-item
            prepend-icon="mdi-home-outline"
            title="Dashboard"
            value="dashboard"
            to="/DashboardPage"
            active-class="active-item"
          ></v-list-item>
          <v-list-item
            prepend-icon="mdi-inbox"
            title="Inventory"
            value="inventory"
            to="/InventoryPage"
            active-class="active-item"
          ></v-list-item>
          <v-list-item
            prepend-icon="mdi-chart-line"
            title="Report"
            value="report"
            to="/ReportPage"
            active-class="active-item"
          ></v-list-item>
          <v-list-item
            prepend-icon="mdi-message-alert"
            title="Feedback"
            value="feedback"
            to="/FeedbackPage"
            active-class="active-item"
          ></v-list-item>
        </v-list>

        <template v-slot:append>
          <div class="pa-2">
            <v-list-item
              prepend-icon="mdi-logout"
              title="Logout"
              value="logout"
              to="/LoginPage"
            active-class="active-item"
            ></v-list-item>
          </div>
        </template>
      </v-navigation-drawer>
      <v-main style="min-height: 100vh"></v-main>
    </v-layout>
  </v-card>
</template>

<style>
.active-item {
  color: #a32929;
  background-color: white;
}
</style>
