<template>
    <v-container>
        <h1 class="mb-5 display-1 font-weight-bold;">Inventory</h1>
        
        <v-row align="center" justify="center">
            <v-text-field
                v-model="search"
                label="Search"
                @input="searchItems"
                solo-inverted
                class="mx-4"
            >
            </v-text-field>

            <v-btn
                color="#B11116"
                @click="showAddModal"
                class="ml-2"
                size="large"
                elevation="0"
            >
                <h1>+</h1> 
            </v-btn>
        </v-row>

        <v-data-table
            :headers="headers"
            :items="items"
            :search="search"
            :loading="loading"
            :pagination="pagination"
            :items-per-page="itemsPerPage"
        >
            <template v-slot:item="{ item, index }">
                <tr class="text-center">
                    <td>{{ item.nomorUnit }}</td>
                    <td>{{ item.jenisKendaraan }}</td>
                    <td>{{ item.shelter }}</td>
                    <td>{{ item.status }}</td>
                    <td>
                        <button @click="editItem(index)" style="padding-right: 10%;">
                            <v-icon>mdi-pencil</v-icon>
                        </button>
                        <button @click="confirmDelete(index)">
                            <v-icon>mdi-delete</v-icon>
                        </button>
                    </td>
                </tr>
            </template>
        </v-data-table>

        <v-dialog v-model="showAdd" max-width="500">
            <v-card>
                <v-card-title>Enter New Data</v-card-title>
                <v-card-text>
                    <v-text-field v-model="newItem.nomorUnit" label="Nomor Unit"></v-text-field>
                    <v-select v-model="newItem.jenisKendaraan" :items="['Sepeda', 'Skuter']" label="Jenis Kendaraan"></v-select>
                    <v-select v-model="newItem.shelter" :items="['TULT', 'GKU', 'Open Library', 'MSU']" label="Shelter"></v-select>
                    <v-select v-model="newItem.status" :items="['Available', 'Unavailable']" label="Status"></v-select>
                </v-card-text>
                <v-card-actions>
                    <v-btn @click="showAdd = false" color="gray">Cancel</v-btn>
                    <v-btn @click="addItem" color="#B11116">Save</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
        
        <v-dialog v-model="showEdit" max-width="500">
            <v-card>
                <v-card-title>
                    Edit Data
                </v-card-title>
                <v-card-text>
                    <v-text-field v-model="editItemData.nomorUnit" label="Nomor Unit"></v-text-field>
                    <v-select v-model="editItemData.jenisKendaraan" :items="['Sepeda', 'Skuter']" label="Jenis Kendaraan"></v-select>
                    <v-select v-model="editItemData.shelter" :items="['TULT', 'GKU', 'Open Library', 'MSU']" label="Shelter"></v-select>
                    <v-select v-model="editItemData.status" :items="['Available', 'Unavailable']" label="Status"></v-select>
                </v-card-text>
                <v-card-actions>
                    <v-btn @click="showEdit = false" color="gray">Cancel</v-btn>
                    <v-btn @click="saveEdit" color="#B11116">Save Changes</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>

        <v-dialog v-model="showDelete" class="d-flex align-center">
            <v-card width="500px" class="mx-auto">
                <v-card-title>
                    Confirm Delete Data
                </v-card-title>
                <v-card-text>
                    Apakah Anda yakin ingin menghapus data ini?
                </v-card-text>
                <v-card-actions>
                    <v-btn @click="cancelDelete" color="gray">No</v-btn>
                    <v-btn @click="deleteItem" color="#B11116">Yes</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-container>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            items: [],
            headers: [
                { title: 'Nomor Unit', key: 'nomorUnit', align: 'center' },
                { title: 'Jenis Kendaraan', key: 'jenisKendaraan', align: 'center' },
                { title: 'Shelter', key: 'shelter', align: 'center' },
                { title: 'Status', key: 'status', align: 'center' },
                { title: 'Aksi', key: 'actions', align: 'center', sortable: false },
            ],
            search: '',
            loading: false,
            pagination: {
                page: 1,
                rowsPerPage: 5,
            },
            itemsPerPage: 5,
            showAdd: false,
            showEdit: false,
            showDelete: false,
            newItem: {
                nomorUnit: '',
                jenisKendaraan: '',
                shelter: '',
                status: '',
            },
            editItemIndex: -1,
            editItemData: {
                nomorUnit: '',
                jenisKendaraan: '',
                shelter: '',
                status: '',
            },
            deleteItemIndex: -1,
        };
    },
    mounted() {
        this.fetchData();
    },
    methods: {
        fetchData() {
        // Make API view items
        axios.get(`http://localhost:3000/api/kendaraan`)
            .then(response => {
                this.items = response.data;
            })
            .catch(error => {
                console.error('Error fetching data:', error);
            });
    },
    showAddModal() {
        this.showAdd = true;
    },
    addItem() {
        // Validasi nomor unit
        if (!this.validateNomorUnit()) {
            return;
        }

        // Make API call to check if the nomor unit already exists
        axios.post(`http://localhost:3000/api/kendaraan`, this.newItem)
            .then(() => {
            // If successful, update the local data and close the modal
            this.items.push({ ...this.newItem });
            this.showAdd = false;
            // Reset newItem for the next entry
            this.newItem = {
                nomorUnit: '',
                jenisKendaraan: '',
                shelter: '',
                status: '',
            };
            })
            .catch(error => {
            if (error.response && error.response.status === 409) {
                // Nomor unit sudah terdaftar, berikan pemberitahuan
                alert('Nomor unit sudah terdaftar!');
            } else {
                console.error('Error adding item:', error);
            }
        });
    },
    validateNomorUnit() {
        const jenisKendaraanPrefix = this.newItem.jenisKendaraan === 'Sepeda' ? 'A' : 'B';
        const nomorUnitPattern = new RegExp(`^${jenisKendaraanPrefix}[0-9]{3}$`);

        if (!nomorUnitPattern.test(this.newItem.nomorUnit)) {
            alert('Nomor unit tidak valid!');
            return false;
        }

        return true;
        },
        editItem(index) {
        this.editItemIndex = index;
        this.editItemData = { ...this.items[index] };
        this.showEdit = true;
    },
    saveEdit() {
    // Make API call to save edits on an item
        axios.put(`http://localhost:3000/api/kendaraan/${this.editItemData.id}`, this.editItemData)
            .then(() => {
                this.items[this.editItemIndex] = { ...this.editItemData };
                this.showEdit = false;
            })
            .catch(error => {
                console.error('Error saving edit:', error);
            });
        },
        confirmDelete(index) {
        this.deleteItemIndex = index;
        this.showDelete = true;
    },
    deleteItem() {
        const itemId = this.items[this.deleteItemIndex].id;

        // Make API call to delete an item
        axios.delete(`http://localhost:3000/api/kendaraan/${itemId}`)
            .then(() => {
            this.items.splice(this.deleteItemIndex, 1);
            this.showDelete = false;
            })
            .catch(error => {
            console.error('Error deleting item:', error);
            });
    },
    cancelDelete() {
        this.showDelete = false;
    },
    },
};
</script>