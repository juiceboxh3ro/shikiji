<template>
<div class="container">
  <section class="review-panel">
    <h3 id="word">漢字</h3>
    <p id="reading">かんじ</p>
    <p id="definition">moonrunes</p>
  </section>
  <div>
    <section class="review-buttons">
      <button @click="forgot_card()">Forgot</button>
      <button @click="next_review_interval(1)">Hard</button>
      <button @click="next_review_interval(2)">Normal</button>
      <button @click="next_review_interval(3)">Easy</button>
    </section>
    <section class="info-pane">
      <div>
        <p>Review Count: {{ review_count }}</p>
        <p>Next Review: {{ next_review }}</p>
      </div>
      <div>
        <p>Average Answer: {{ average_answer }}</p>
      </div>
    </section>
  </div>
</div>
</template>

<script>
export default {
  data() {
    return {
      initial_amount: 1,
      growth_rate: 0.2,
      review_count: 1, // how many times this card has been reviewed
      level: 1, // the difficulty, where 1 == hard
      review_cap: 1, // limits the number of days before next review
      next_review: 0,
      hard_counter: 0,
      forgot_counter: 0, // reset review count after 3
      too_easy_counter: 0, // if too many, mark card burned
      forgive: false, // if too many hard counters, ask if they want to reset,
      answer_history: [],
      times_marked_forgotten: 0,
    }
  },
  methods: {
    exp_gr(a, r, x) {
      return a * (1 + r) ** x/4
    },
    prediction(level, review_count = this.review_count) {
      const new_interval = this.exp_gr(this.initial_amount, this.growth_rate, review_count)
      return Math.floor((new_interval * level) * 60)
    },
    next_review_interval(level) {
      const result = this.prediction(level)
      this.save_results(result, level)
    },
    save_results(result, level) {
      let the_result
      if (this.review_cap) result >= 365 * 24 * this.review_cap ? the_result = Math.ceil(365 * 24 * this.review_cap) : the_result = result

      this.review_count += 1
      this.next_review = the_result
      this.answer_history.push(level)
      if (level === 1) this.hard_counter += 1
    },
    forgot_card() {
      this.forgive = confirm("This will reset your study history for this card.")
      if (!this.forgive) return
      this.times_marked_forgotten += 1
      this.review_count = 0
      this.next_review = 0
      this.answer_history = []
    }
  },
  computed: {
    // projected_progress() {
    //   if (this.answer_history.length < 5) return "Not enough information..."
    //   let prediction_array = []
    //   let recent_reviews = this.answer_history.slice(this.answer_history.length - 5, this.answer_history.length - 1)
    //   let recent_reviews_avg = recent_reviews.reduce((a, b) => a + b, 0) / recent_reviews.length

    //   for (let i = 0 ; i < 4 ; i++) {
    //     prediction_array.push(this.prediction(recent_reviews_avg, this.review_count + i))
    //   }
    //   return prediction_array.join(", ")
    // },
    average_answer() {
      if (!this.answer_history.length) return "No study information yet."
      const average = this.answer_history.reduce((a, b) => a + b, 0) / this.answer_history.length
      let answer
      switch (Math.round(average)) {
        case 3:
          answer = "Easy"
          break
        case 2:
          answer = "Normal"
          break
        default:
          answer = "Hard"
          break
      }
      return answer
    }
  }
}
</script>

<style scoped>
.container {
  margin-top: 110px;
}
.review-buttons {
  margin: 20px auto 45px;
  display: flex;
  justify-content: center;
  align-items: center;
  gap: 15px;
}
.review-buttons button {
  padding: 8px 12px;
  font-size: 1.3rem;
  cursor: pointer;
}
.review-panel {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  gap: 10px;
  min-width: 300px;
  min-height: 300px;
  max-width: 25%;
  margin: 0 auto 50px;
  font-size: 5rem;
  border: 1.5px solid black;
  border-radius: 5px;
  box-shadow: 0 0 5px 3px rgba(0,0,0,0.1);
  background-color: white;
}
.info-pane {
  display: flex;
  flex-direction: column;
  gap: 20px;
}
</style>