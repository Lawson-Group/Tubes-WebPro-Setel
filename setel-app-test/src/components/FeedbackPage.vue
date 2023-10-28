<template>
  <v-container fluid>
    <v-row justify="center">
      <v-col cols="24" sm="14" md="10" lg="8">
        <v-card elevation="14">
          <v-card-title class="feedback-title">Feedback</v-card-title>
          <v-card-text>
            <div class="feedback-list">
              <div class="feedback-item" v-for="feedback in feedbacks" :key="feedback.id">
                <div class="feedback-profile">
                  <v-avatar class="profile-icon"  size="72" color="#A32929">
                    <v-icon>
                      mdi-account-circle-outline
                    </v-icon>
                  </v-avatar>
                  <div class="profile-info">
                    <div class="profile-nim-name" style="font-size: 30px; color: #A32929;">
                      {{ feedback.nim }} - {{ feedback.username }}
                    </div>
                    <div class="time-ago" style="font-size: 20px; color: #AE5C5C;">
                      {{ getTimeAgo(feedback.timestamp) }}
                    </div>
                    <div class="separator">
                      <div class="separator-line"></div>
                    </div>
                    <div class="feedback-text" style="font-size: 24px;">
                      {{ feedback.text }}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      feedbacks: [
        {
          id: 1,
          nim: '1302213000',
          username: 'Aerichanie',
          timestamp: new Date(),
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
        },

        {
          id: 2,
          nim: '1204190002',
          username: 'Karinater Yoo',
          timestamp: new Date(),
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.',
        },

        {
          id: 3,
          nim: '16531733018',
          username: 'Ningningguang',
          timestamp: new Date(),
          text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sagittis interdum elementum. Proin mi quam, maximus vitae laoreet quis, aliquet eget ligula.Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
        },
      ],
    };
  },
  methods: {
    getTimeAgo(timestamp) {
      const now = new Date();
      const diff = now - new Date(timestamp);
      const seconds = Math.floor(diff / 1000);
      if (seconds < 60) {
        return `${seconds} detik yang lalu`;
      }
      const minutes = Math.floor(seconds / 60);
      if (minutes < 60) {
        return `${minutes} menit yang lalu`;
      }
      const hours = Math.floor(minutes / 60);
      if (hours < 24) {
        return `${hours} jam yang lalu`;
      }
      const days = Math.floor(hours / 24);
      return `${days} hari yang lalu`;
    },
  },
};
</script>

<style scoped>
.feedback-title {
  font-size: 30px;
  text-align: center;
  margin-top: 20px;
  font-weight: bold;
}

.feedback-list {
  margin-top: 20px;
}

.feedback-item {
  border: 1px solid #000; 
  margin: 10px 0;
  padding: 10px;
  border-radius: 30px;
  display: flex;
  flex-direction: row;
}

.feedback-profile {
  display: flex;
  align-items: center;
  flex: 1;
}

.profile-icon {
  display: flex;
  justify-content: center;
  align-items: center;
}

.profile-info {
  flex-direction: column;
}

.profile-nim-name {
  margin-bottom: 10px;
}

.time-ago {
  margin-bottom: 10px;
}

.separator {
  text-align: center;
  margin-top: 10px;
  margin-bottom: 10px;
}

.separator-line {
  border-bottom: 2px solid #000; /* Mengatur garis pemisah menjadi garis yang nyambung dan warnanya hitam */
}

.feedback-text {
  font-size: 24px;
}
</style>
