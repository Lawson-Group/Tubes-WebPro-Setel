<template>
  <v-card
      class="px-13 mt-4"
      style="height: 100vh; width: 100%;  color: #000000; "
  >
  <h1 class="mb-5 display-1 font-weight-bold;">Report</h1>
    
    <v-row style="width: 250px;">
      <v-text-field
        v-model="username"
        hide-details
        placeholder="Search Username..."
        class="ml-2"
        dense
        append-icon="mdi-magnify"
      ></v-text-field>
    </v-row>

    <v-data-table-server
      v-model:items-per-page="itemsPerPage"
      :search="search"
      :headers="headers"
      :items-length="totalItems"
      :items="serverItems"
      :loading="loading"
      class="elevation-1"
      item-value="name"
      @update:options="loadItems"
    >
      <template v-slot:tfoot>
        <tr>
          <td>
            
          </td>
        </tr>
      </template>
    </v-data-table-server>
  </v-card>
</template>
  
<script>
  const desserts = [
    {
      idPeminjaman: 1,
      username: 'aishueo',
      tanggalWaktu: '2023-10-26 15:45:30',
      nomorUnit: 'A001',
      jenisKendaraan: 'Sepeda',
    },
    {
      idPeminjaman: 2,
      username: 'jenarikha',
      tanggalWaktu: '2023-11-26 15:45:30',
      nomorUnit: 'A002',
      jenisKendaraan: 'Sepeda',
    },
    {
      idPeminjaman: 3,
      username: 'jannatinurrohmah',
      tanggalWaktu: '2023-12-26 11:45:30',
      nomorUnit: 'A003',
      jenisKendaraan: 'Sepeda',
    },
    {
      idPeminjaman: 4,
      username: 'novitasabila',
      tanggalWaktu: '2023-13-26 10:45:30',
      nomorUnit: 'A004',
      jenisKendaraan: 'Sepeda',
    },
    {
      idPeminjaman: 5,
      username: 'trianimumpuni',
      tanggalWaktu: '2023-15-26 09:45:30',
      nomorUnit: 'A005',
      jenisKendaraan: 'Sepeda',
    },
    {
      idPeminjaman: 6,
      username: 'arlecchino',
      tanggalWaktu: '2023-20-26 15:45:30',
      nomorUnit: 'B001',
      jenisKendaraan: 'Sekuter',
    },
    {
      idPeminjaman: 7,
      username: 'argenti',
      tanggalWaktu: '2023-21-26 15:50:30',
      nomorUnit: 'B002',
      jenisKendaraan: 'Sekuter',
    },
    {
      idPeminjaman: 8,
      username: 'archivistenoe',
      tanggalWaktu: '2023-21-26 14:50:30',
      nomorUnit: 'B003',
      jenisKendaraan: 'Sekuter',
    },
    {
      idPeminjaman: 9,
      username: 'uchinagaeri',
      tanggalWaktu: '2023-22-26 18:50:30',
      nomorUnit: 'B004',
      jenisKendaraan: 'Sekuter',
    },
    {
      idPeminjaman: 10,
      username: 'notningning',
      tanggalWaktu: '2023-25-26 15:50:30',
      nomorUnit: 'B005',
      jenisKendaraan: 'Sekuter',
    },
  ]

  const FakeAPI = {
    async fetch ({ page, itemsPerPage, sortBy, search }) {
      return new Promise(resolve => {
        setTimeout(() => {
          const start = (page - 1) * itemsPerPage
          const end = start + itemsPerPage
          const items = desserts.slice().filter(item => {
            if (search.username && !item.username.toLowerCase().includes(search.username.toLowerCase())) {
              return false
            }

            return true
          })

          if (sortBy.length) {
            const sortKey = sortBy[0].key
            const sortOrder = sortBy[0].order
            items.sort((a, b) => {
              const aValue = a[sortKey]
              const bValue = b[sortKey]
              return sortOrder === 'desc' ? bValue - aValue : aValue - bValue
            })
          }

          const paginated = items.slice(start, end)

          resolve({ items: paginated, total: items.length })
        }, 500)
      })
    },
  }

  export default {
    data: () => ({
      itemsPerPage: 5,
      headers: [
        {
          title: 'ID Peminjaman',
          align: 'start',
          sortable: false,
          key: 'idPeminjaman',
        },
        { title: 'Username', key: 'username', align: 'end' },
        { title: 'Tanggal & Waktu', key: 'tanggalWaktu', align: 'end' },
        { title: 'Nomor Unit', key: 'nomorUnit', align: 'end' },
        { title: 'Jenis Kendaraan', key: 'jenisKendaraan', align: 'end' },
      ],
      serverItems: [],
      loading: true,
      totalItems: 0,
      username: '',
      search: '',
    }),
    watch: {
      username () {
        this.search = String(Date.now())
      },
    },
    methods: {
      loadItems({ page, itemsPerPage, sortBy }) {
        this.loading = true;
        FakeAPI.fetch({ page, itemsPerPage, sortBy, search: {username: this.username} }).then(({ items, total }) => {
          this.serverItems = items;
          this.totalItems = total;
          this.loading = false;
        });
      },
    },
  }
</script>