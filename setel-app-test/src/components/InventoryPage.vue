<template>
    <v-container>
        <h1 class="mb-5 display-1 font-weight-bold;">Inventory</h1>
        
        <div class="d-flex justify-end align center mb-4">
            <v-text-field
                v-model="search"
                label="Search"
                @input="searchItems"
                solo-inverted
                class="mx-4"
            >
            </v-text-field>

            <v-btn color="#B11116" fab dark right @click="showAddModal" style="position: fixed; top: 20px; right: 20px;">
                + Add Data
            </v-btn>
        </div>

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
    export default {
        data() {
            return {
                items: [
                { nomorUnit: 'A001', jenisKendaraan: 'Sepeda', status: 'Available' },
                { nomorUnit: 'B002', jenisKendaraan: 'Skuter', status: 'Unavailable' }
            ],
            headers: [
                { title: 'Nomor Unit', key: 'nomorUnit', align: 'center' },
                { title: 'Jenis Kendaraan', key: 'jenisKendaraan', align: 'center'},
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
                jenisKendaraan: 'Sepeda',
                status: 'Available'
            },
            editItemIndex: -1,
            editItemData: {
                nomorUnit: '',
                jenisKendaraan: 'Sepeda',
                status: 'Available'
            },
            deleteItemIndex: -1
            }
        },
        methods: {
            showAddModal() {
                this.showAdd = true;
            },
            addItem() {
                this.items.push({ ...this.newItem });
                this.showAdd = false;
            },
            editItem(index) {
                this.editItemIndex = index;
                this.editItemData = { ...this.items[index] };
                this.showEdit = true;
            },
            saveEdit() {
                this.items[this.editItemIndex] = { ...this.editItemData };
                this.showEdit = false;
            },
            confirmDelete(index) {
                this.deleteItemIndex = index;
                this.showDelete = true;
            },
            deleteItem() {
                this.items.splice(this.deleteItemIndex, 1);
                this.showDelete = false;
            },
            cancelDelete() {
                this.showDelete = false;
            }
        }
    }
</script>