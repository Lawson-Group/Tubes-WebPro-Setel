<template>
    <v-data-table
        :headers="headers"
        :items="vehicles"
        item-value="name"
        class="elevation-1"
    >
        <template v-slot:top>
            <v-toolbar flat>
            <v-toolbar-title>Data Kendaraan</v-toolbar-title>
            <v-divider class="mx-4" inset vertical></v-divider>
            <v-spacer></v-spacer>
            <v-dialog v-model="dialog" max-width="500px">
                <template v-slot:activator="{props}">
                    <v-btn color="#B11116" dark class="mb-2" v-bind="props" variant="outlined">
                        New Data
                    </v-btn>
                </template>
            
                <v-card>
                    <v-card-title>
                        <span class="text-h5">{{ formTitle }}</span>
                    </v-card-title>

                    <v-card-text>
                        <v-container>
                            <v-row>
                                <v-col cols="12" sm="6" md="4">
                                    <v-text-field
                                        v-model="editedItem.nomor"
                                        label="Nomor Unit"
                                    ></v-text-field>
                                </v-col>
                                <v-col cols="12" sm="6" md="4">
                                    <v-text-field
                                        v-model="editedItem.jenis"
                                        label="Jenis Kendaraan"
                                    ></v-text-field>
                                </v-col>
                                <v-col cols="12" sm="6" md="4">
                                    <v-text-field
                                        v-model="editedItem.status"
                                        label="Status"
                                    ></v-text-field>
                                </v-col>
                            </v-row>
                        </v-container>
                    </v-card-text>

                    <v-card-actions>
                        <v-spacer></v-spacer>
                        <v-btn color="blue-darken-1" variant="text" @click="close">Cancel</v-btn>
                        <v-btn color="blue-darken-1" variant="text" @click="save">Save</v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>
            </v-toolbar>
        </template>

        <!-- <v-dialog v-model="dialogDelete" max-width="500px">
            <v-card>
                <v-card-title class="text-h5">
                    Yakin hapus data ini?
                </v-card-title>

                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="blue-darken-1" variant="text" @click="closeDelete">Cancel</v-btn>
                    <v-btn color="blue-darken-1" variant="text" @click="deleteItemConfirm">Ya</v-btn>
                    <v-spacer></v-spacer>
                </v-card-actions>
            </v-card>
        </v-dialog> -->
        <template v-slot:items="props">
            <v-btn @click="editItem(props.item)">mdi-pencil</v-btn>
            <v-btn @click="deleteItem(props.item)">mdi-delete</v-btn>
        </template>
    </v-data-table>
</template>

<script>
  export default {
    data: ()  => ({
        dialog: false,
        dialogDelete: false,      
        headers: [
            {
                title: 'Nomor Unit',
                align: 'start',
                sortable: false,
                key: 'nomor',
            },
            { title: 'Jenis Kendaraan', key: 'jenis' },
            { title: 'Status', key: 'status' },
            { title: 'Aksi', key: 'actions' },
        ],
        vehicles: [],
        editedIndex: -1,
        editedItem: {
            nomor: '',
            jenis: '',
            status: '',
        },
        defaultItem: {
            nomor: '',
            jenis: '',
            status: '',
        },
    }),

    computed: {
        formTitle() {
            return this.editedIndex === -1 ? 'Input Data Baru' : 'Edit Item'
        },
    },

    watch: {
        dialog(val) {
        val || this.close()
      },
      
      dialogDelete(val) {
        val || this.closeDelete()
      },
    },

    created() {
      const storedData = localStorage.getItem('vehicles');

      if (storedData) {
        this.vehicles = JSON.parse(storedData);
      } else {
        this.initialize();
      }
    },

    methods: {
        initialize() {
            this.vehicles = [
                {
                    nomor: 'A100',
                    jenis: 'Sepeda',
                    status: 'Available',
                },
                {
                    nomor: 'B100',
                    jenis: 'Skuter',
                    status: 'Available',
                },
                {
                    nomor: 'A102',
                    jenis: 'Sepeda',
                    status: 'In Use',
                },
            ]
        },

        save() {
            if (this.editedIndex > -1) {
            Object.assign(this.vehicles[this.editedIndex], this.editedItem)
            } else {
            this.vehicles.push(this.editedItem)
            }
            this.saveToLocalStorage()
            this.close()
        },

        saveToLocalStorage(){
            localStorage.setItem('vehicles', JSON.stringify(this.vehicles))
        },

        editItem(item) {
            this.editedIndex = this.vehicles.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialog = true
        },

        deleteItem(item) {
            this.editedIndex = this.vehicles.indexOf(item)
            this.editedItem = Object.assign({}, item)
            this.dialogDelete = true
        },

        deleteItemConfirm() {
            this.vehicles.splice(this.editedIndex, 1)
            this.closeDelete()
        },

        close() {
            this.dialog = false
            this.$nextTick(() => {
            this.editedItem = Object.assign({}, this.defaultItem)
            this.editedIndex = -1
            })
        },

        closeDelete() {
            this.dialogDelete = false
            this.$nextTick(() => {
            this.editedItem = Object.assign({}, this.defaultItem)
            this.editedIndex = -1
            })
        },
    }
}
</script>