const app = new Vue({
  el: "#app",

  data() {
    return {
      // データの配列
      snippetList: ['', ''],
      allData: ['', ''],

      // 新規投稿
      dialogPostFlag: false,
      postTitle: '',
      postLanguage: '',
      postContents: '',

      // 更新
      dialogPutFlag: false,
      putTitle: '',
      putLanguage: '',
      putContents: '',

      // 削除
      dialogDeleteFlag: false
    }
  },

  mounted() {
    this.listSnippet();
  },

  methods: {
    /** 一覧を表示(axios.get) */
    listSnippet: function () {
      axios.get('/snippet_apps.json')
        .then((response) => {
          this.allData = response.data;
          console.log(this.allData);
          this.snippetList = this.allData;
          console.log(this.snippetList);
        });
    },

    /** 新規投稿キャンセル */
    togglePostModal: function () {
      console.log(this.dialogPostFlag);
      this.dialogPostFlag = !this.dialogPostFlag;
    },

    /** 新規投稿をpost(axios.post) */
    postSnippet: function () {
      axios.post('./snippet_apps.json', { title: this.postTitle, language: this.postLanguage, contents: this.postContents })
        .then((response) => {
          this.listSnippet();
          this.postTitle = ''; // 空にもどす
          this.postLanguage = ''; // 空にもどす
          this.postContents = ''; // 空にもどす
        });
    },

    /** 更新モーダルの表示・非表示 */
    togglePutModal: function (id) {

      axios.get('./snippet_apps/' + id + '.json') // テーブル名/id/.json の形でRailsでは呼び出されているから
        .then((response) => {
          console.log(`id「${response.data.id}」のデータを取得`);
          this.putTitle = response.data.title;
          this.putLanguage = response.data.language;
          this.putContents = response.data.contents;
        });

      this.id = id; // 更新ボタンを押したときに、その投稿のidをデータに入れておく
      console.log(`idをthis.id「${this.id}」にセット`);
      this.dialogPutFlag = !this.dialogPutFlag;
    },

    /** 更新した内容でデータを上書き(axios.put) */
    putSnippet: function () {
      console.log(`putSnippet: IDの「${this.id}」を更新`);
      console.log(`タイトルを「${this.putTitle}」に更新`);
      console.log(`言語を「${this.putLanguage}」に更新`);
      console.log(`コンテンツを「${this.putContents}」に更新`);

      // togglePutModalで取得したid、title、language、contentsで上書きする
      axios.put('./snippet_apps/' + this.id + '.json', {title: this.putTitle, language: this.putLanguage, contents: this.putContents})
      .then((response) => {
        this.listSnippet();
      });

      this.dialogPutFlag = !this.dialogPutFlag;
    },

    /** 削除 */
    deleteSnippet: function(){
      console.log("confirm deleteボタン押下を検知");
      console.log(`削除予定のidは${this.id}`);
      axios.delete('/snippet_apps/' + this.id + '.json')
      .then((response) => {
        this.listSnippet();
      });
      this.dialogDeleteFlag = !this.dialogDeleteFlag;
    },

    toggleDeleteModal: function(id){
      this.id = id;
      console.log(`this.idに${this.id}をセット完了!`);
      this.dialogDeleteFlag = !this.dialogDeleteFlag;
    }

  }
});