<template>
  <v-container>
        <h1 class="mb-5 display-1 font-weight-bold;">Report</h1>
        
        <v-row align="center" justify="center">
            <v-text-field
                v-model="search"
                label="Search..."
                @input="searchItems"
                solo-inverted
                class="mx-4"
                prepend-icon="mdi-magnify"
            >
            </v-text-field>
        </v-row>
        <v-data-table
            :headers="headers"
            :items="items"
            :search="search"
            :loading="loading"
            :pagination="pagination"
            :items-per-page="itemsPerPage"
            hide-default-footer
        >
        <template v-slot:item="{ item }">
            <tr class="text-left">
                <td>{{ item.idPeminjaman }}</td>
                <td>{{ item.username }}</td>
                <td>{{ item.tgl_wkt }}</td>
                <td>{{ item.noUnit }}</td>
                <td>{{ item.jenisKendaraan }}</td>
                <td>{{ item.shelterAwal }}</td>
                <td>{{ item.shelterAkhir }}</td>
            </tr>
        </template>
        </v-data-table>
  </v-container>
</template>
  
<script>
import axios from 'axios';

export default {
  data() {
    return {
      items: [],
      headers: [
        { title: 'ID Peminjaman', key: 'idPeminjaman', align: 'left' },
        { title: 'Username', key: 'username', align: 'left' },
        { title: 'Tanggal&Waktu', key: 'tgl_wkt', align: 'left' },
        { title: 'Nomor Unit', key: 'noUnit', align: 'left' },
        { title: 'Jenis Kendaraan', key: 'jenisKendaraan', align: 'left' },
        { title: 'Shelter Awal', key: 'shelterAwal', align: 'left' },
        { title: 'Shelter Akhir', key: 'shelterAkhir', align: 'left' }
      ],
      search: '',
      loading: false,
      pagination: {
        page: 1,
        rowsPerPage: 5
      },
      itemsPerPage: 5
    };
  },
  mounted() {
    this.ambilDataDariDatabase();
  },
  methods: {
    ambilDataDariDatabase() {
      axios
        .get('http://localhost:3000/api/report')
        .then(response => {
          // Format tanggal sebelum menetapkannya ke properti items
          this.items = response.data.map(item => {
            return {
              ...item,
              tgl_wkt: this.formatTanggalWaktu(item.tgl_wkt)
            };
          });
        })
        .catch(error => {
          console.error(error);
        });
    },
    formatTanggalWaktu(tgl_wkt) {
      const options = {
        year: 'numeric',
        month: 'long',
        day: 'numeric',
        hour: '2-digit',
        minute: '2-digit',
        second: '2-digit',
        timeZoneName: 'short'
      };

      return new Date(tgl_wkt).toLocaleString('id-ID', options);
    }
  }
};
</script>