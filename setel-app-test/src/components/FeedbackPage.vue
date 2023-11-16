<template>
  <v-card class="px-13 mt-4" style="height: 100vh; width: 100%; color: #000000;">
    <h1 class="mb-5 display-1 font-weight-bold">Feedback</h1>
    <v-row class="d-flex justify-end ma-2">
      <v-text-field v-model="username" hide-details placeholder="Search Username..." class="ma-2" density="compact"></v-text-field>
    </v-row>

    <v-data-table-server
      v-model:items-per-page="itemsPerPage"
      :search="search"
      :headers="headers"
      :items-length="totalItems"
      :items="dessertsWithProfile"
      :loading="loading"
      class="elevation-1"
      item-value="name"
      @update:options="loadItems"
    ></v-data-table-server>
  </v-card>
</template>

<script>
const desserts = [
  {
    id: 1,
    nim: '1302210004',
    username: 'Jean Rika Haryadi',
    timestamp: new Date('2023-11-28T11:01:03'),
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum.',
  },
  {
    id: 2,
    nim: '1302213030',
    username: 'Novita Sabila Nugraha',
    timestamp: new Date('2023-11-25T07:11:02'),
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  },
  {
    id: 3,
    nim: '1302213038',
    username: 'Aisha Putri Nuryan',
    timestamp: new Date('2023-11-19T05:09:11'),
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum.',
  },
  {
    id: 4,
    nim: '1302213051',
    username: 'Jannatin Nurrohman',
    timestamp: new Date('2023-11-15T17:19:23'),
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.',
  },
  {
    id: 5,
    nim: '1302213091',
    username: 'Triani Putri Mumpuni',
    timestamp: new Date('2023-11-10T20:02:49'),
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula',
  },
  {
    id: 6,
    nim: '1302213007',
    username: 'Aerichanie',
    timestamp: new Date('2023-10-31T15:03:19'),
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
  },
  {
    id: 7,
    nim: '1204190002',
    username: 'Karinater Yoo',
    timestamp: new Date('2023-10-29T14:00:00'),
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.',
  },
  {
    id: 8,
    nim: '1653173301',
    username: 'Ningningguang',
    timestamp: new Date('2023-10-28T17:04:11'),
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  },
  {
    id: 9,
    nim: '1282303218',
    username: 'Huangren',
    timestamp: new Date('2023-10-27T12:57:34'),
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum.',
  },
  {
    id: 10,
    nim: '1281999216',
    username: 'Mark Lee',
    timestamp: new Date('2023-10-25T10:00:00'),
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
  },
];

const FakeAPI = {
  async fetch({ page, itemsPerPage, sortBy, search }) {
    return new Promise((resolve) => {
      setTimeout(() => {
        const start = (page - 1) * itemsPerPage;
        const end = start + itemsPerPage;
        const items = desserts
          .slice()
          .filter((item) => {
            if (search.username && !item.username.toLowerCase().includes(search.username.toLowerCase())) {
              return false;
            }
            return true;
          });

        if (sortBy.length) {
          const sortKey = sortBy[0].key;
          const sortOrder = sortBy[0].order;
          items.sort((a, b) => {
            const aValue = a[sortKey];
            const bValue = b[sortKey];
            return sortOrder === 'desc' ? bValue - aValue : aValue - bValue;
          });
        }

        const paginated = items.slice(start, end);

        resolve({ items: paginated, total: items.length });
      }, 500);
    });
  },
};

export default {
  data: () => ({
    itemsPerPage: 5,
    headers: [
      { title: 'ID', align: 'center', sortable: false, key: 'id' },
      { title: 'Username', key: 'profile', align: 'center' },
      { title: 'NIM', key: 'nim', align: 'center' },
      { title: 'Timestamp', key: 'timestamp', align: 'start' },
      { title: 'Feedback', key: 'text', align: 'start' },
    ],
    serverItems: [],
    loading: true,
    totalItems: 0,
    username: '',
    search: '',
  }),
  watch: {
    username() {
      this.loadItems({ page: 1, itemsPerPage: this.itemsPerPage, sortBy: [] });
    },
  },
  methods: {
    loadItems({ page, itemsPerPage, sortBy }) {
      this.loading = true;
      FakeAPI.fetch({ page, itemsPerPage, sortBy, search: { username: this.username } }).then(({ items, total }) => {
        this.serverItems = items;
        this.totalItems = total;
        this.loading = false;
      });
    },
  },
  computed: {
    dessertsWithProfile() {
      return this.serverItems.map((item) => ({
        ...item,
        profile: `${item.username}`,
      }));
    },
  },
};
</script>

<style scoped>
.v-data-table {
  overflow-x: auto;
}
</style>