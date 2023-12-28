<template>
  <v-container>
    <h1 class="mb-5 display-1 font-weight-bold">Feedback</h1>

    <v-row align="center" justify="flex-end">
      <v-text-field 
        v-model="search"
        label="Search..." 
        solo-inverted 
        @input="loadItems"
        prepend-icon="mdi-magnify"
        class="mx-4"
      ></v-text-field>
    </v-row>

    <v-data-table
      :headers="headers"
      :items="itemsWithFormattedTimestamp"
      :search="search"
      :loading="loading"
      :pagination="pagination"
      :items-per-page="itemsPerPage"
      hide-default-footer
    >
      <template v-slot:item="{ item }">
        <tr class="text-start">
          <td>{{ item.id }}</td>
          <td>{{ item.username }}</td>
          <td>{{ item.nim }}</td>
          <td>{{ item.timestampFormatted }}</td>
          <td>{{ item.text }}</td>
        </tr>
      </template>
    </v-data-table>
  </v-container>
</template>

<script>
  export default {
    data() {
      return {
          items: [
          {
            id: 1,
            nim: '1302210004',
            username: 'jeanrikha',
            timestamp: new Date('2023-11-28 11:01:03'),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum.',
          },
          {
            id: 2,
            nim: '1302213030',
            username: 'novitasabila',
            timestamp: new Date('2023-11-25 07:11:02'),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          },
          {
            id: 3,
            nim: '1302213038',
            username: 'aishueo',
            timestamp: new Date('2023-11-19 05:09:11'),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum.',
          },
          {
            id: 4,
            nim: '1302213051',
            username: 'jannatinurrohmah',
            timestamp: new Date('2023-11-15 17:19:23'),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.',
          },
          {
            id: 5,
            nim: '1302213091',
            username: 'trianipmumpuni',
            timestamp: new Date('2023-11-10 20:02:49'),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula',
          },
          {
            id: 6,
            nim: '1302213007',
            username: 'aerichanie',
            timestamp: new Date('2023-10-31 15:03:19'),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
          },
          {
            id: 7,
            nim: '1204190002',
            username: 'karinateryoo',
            timestamp: new Date('2023-10-29 14:00:00'),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.',
          },
          {
            id: 8,
            nim: '1653173301',
            username: 'ningningguang',
            timestamp: new Date('2023-10-28 17:04:11'),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          },
          {
            id: 9,
            nim: '1282303218',
            username: 'huangren',
            timestamp: new Date('2023-10-27 12:57:34'),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum.',
          },
          {
            id: 10,
            nim: '1281999216',
            username: 'marklee',
            timestamp: new Date('2023-10-25 10:00:00'),
            text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          },
    ],
    headers: [
      { title: 'ID', key: 'id', align: 'center' },
      { title: 'Username', key: 'username', align: 'center' },
      { title: 'NIM', key: 'nim', align: 'center' },
      { title: 'Tanggal & Waktu', key: 'timestamp', align: 'start' },
      { title: 'Feedback', key: 'text', align: 'center' },
    ],
    search: '',
      loading: false,
      pagination: {
          page: 1,
          rowsPerPage: 5,
      },
      itemsPerPage: 5,
    };
  },
 computed: {
    itemsWithFormattedTimestamp() {
      return this.items.map((item) => ({
        ...item,
        timestampFormatted: this.formatTimestamp(item.timestamp),
      }));
    },
  },
  methods: {
    formatTimestamp(timestamp) {
      return new Date(timestamp).toLocaleString('en-US', { year: 'numeric', month: 'numeric', day: 'numeric', hour: 'numeric', minute: 'numeric', second: 'numeric', hour12: false });
    },
  },
  loadItems() {
    this.loading = true;
    this.$axios
      .get('http://localhost:3000/api/feedback')
      .then((response) => {
        this.items = response.data;
        this.loading = false;
      })
      .catch((error) => {
        console.error('Error fetching data:', error);
        this.loading = false;
      });
  },
}
</script>

<style scoped>
.v-data-table {
  overflow-x: auto;
}
</style>