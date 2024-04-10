; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137952 () Bool)

(assert start!137952)

(declare-fun b!1583690 () Bool)

(declare-fun res!1081803 () Bool)

(declare-fun e!884007 () Bool)

(assert (=> b!1583690 (=> (not res!1081803) (not e!884007))))

(declare-fun newKey!123 () (_ BitVec 64))

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-datatypes ((B!2890 0))(
  ( (B!2891 (val!19807 Int)) )
))
(declare-datatypes ((tuple2!25782 0))(
  ( (tuple2!25783 (_1!12902 (_ BitVec 64)) (_2!12902 B!2890)) )
))
(declare-datatypes ((List!36927 0))(
  ( (Nil!36924) (Cons!36923 (h!38466 tuple2!25782) (t!51841 List!36927)) )
))
(declare-fun l!1251 () List!36927)

(get-info :version)

(assert (=> b!1583690 (= res!1081803 (and (not (= otherKey!56 newKey!123)) ((_ is Cons!36923) l!1251)))))

(declare-fun b!1583691 () Bool)

(declare-fun res!1081805 () Bool)

(assert (=> b!1583691 (=> (not res!1081805) (not e!884007))))

(declare-fun containsKey!989 (List!36927 (_ BitVec 64)) Bool)

(assert (=> b!1583691 (= res!1081805 (not (containsKey!989 l!1251 otherKey!56)))))

(declare-fun b!1583692 () Bool)

(declare-fun res!1081801 () Bool)

(assert (=> b!1583692 (=> (not res!1081801) (not e!884007))))

(assert (=> b!1583692 (= res!1081801 (not (containsKey!989 (t!51841 l!1251) otherKey!56)))))

(declare-fun b!1583693 () Bool)

(declare-fun newValue!123 () B!2890)

(declare-fun isStrictlySorted!1155 (List!36927) Bool)

(declare-fun insertStrictlySorted!621 (List!36927 (_ BitVec 64) B!2890) List!36927)

(assert (=> b!1583693 (= e!884007 (not (isStrictlySorted!1155 (insertStrictlySorted!621 l!1251 newKey!123 newValue!123))))))

(assert (=> b!1583693 (not (containsKey!989 (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52293 0))(
  ( (Unit!52294) )
))
(declare-fun lt!677202 () Unit!52293)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!8 (List!36927 (_ BitVec 64) B!2890 (_ BitVec 64)) Unit!52293)

(assert (=> b!1583693 (= lt!677202 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!8 (t!51841 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun res!1081802 () Bool)

(assert (=> start!137952 (=> (not res!1081802) (not e!884007))))

(assert (=> start!137952 (= res!1081802 (isStrictlySorted!1155 l!1251))))

(assert (=> start!137952 e!884007))

(declare-fun e!884008 () Bool)

(assert (=> start!137952 e!884008))

(assert (=> start!137952 true))

(declare-fun tp_is_empty!39423 () Bool)

(assert (=> start!137952 tp_is_empty!39423))

(declare-fun b!1583694 () Bool)

(declare-fun tp!115024 () Bool)

(assert (=> b!1583694 (= e!884008 (and tp_is_empty!39423 tp!115024))))

(declare-fun b!1583695 () Bool)

(declare-fun res!1081804 () Bool)

(assert (=> b!1583695 (=> (not res!1081804) (not e!884007))))

(assert (=> b!1583695 (= res!1081804 (isStrictlySorted!1155 (t!51841 l!1251)))))

(assert (= (and start!137952 res!1081802) b!1583691))

(assert (= (and b!1583691 res!1081805) b!1583690))

(assert (= (and b!1583690 res!1081803) b!1583695))

(assert (= (and b!1583695 res!1081804) b!1583692))

(assert (= (and b!1583692 res!1081801) b!1583693))

(assert (= (and start!137952 ((_ is Cons!36923) l!1251)) b!1583694))

(declare-fun m!1453421 () Bool)

(assert (=> b!1583692 m!1453421))

(declare-fun m!1453423 () Bool)

(assert (=> b!1583691 m!1453423))

(declare-fun m!1453425 () Bool)

(assert (=> start!137952 m!1453425))

(declare-fun m!1453427 () Bool)

(assert (=> b!1583693 m!1453427))

(declare-fun m!1453429 () Bool)

(assert (=> b!1583693 m!1453429))

(declare-fun m!1453431 () Bool)

(assert (=> b!1583693 m!1453431))

(declare-fun m!1453433 () Bool)

(assert (=> b!1583693 m!1453433))

(assert (=> b!1583693 m!1453433))

(declare-fun m!1453435 () Bool)

(assert (=> b!1583693 m!1453435))

(assert (=> b!1583693 m!1453429))

(declare-fun m!1453437 () Bool)

(assert (=> b!1583695 m!1453437))

(check-sat (not b!1583693) (not b!1583694) (not b!1583695) (not b!1583692) (not b!1583691) (not start!137952) tp_is_empty!39423)
(check-sat)
(get-model)

(declare-fun d!167271 () Bool)

(declare-fun res!1081829 () Bool)

(declare-fun e!884023 () Bool)

(assert (=> d!167271 (=> res!1081829 e!884023)))

(assert (=> d!167271 (= res!1081829 (or ((_ is Nil!36924) l!1251) ((_ is Nil!36924) (t!51841 l!1251))))))

(assert (=> d!167271 (= (isStrictlySorted!1155 l!1251) e!884023)))

(declare-fun b!1583722 () Bool)

(declare-fun e!884024 () Bool)

(assert (=> b!1583722 (= e!884023 e!884024)))

(declare-fun res!1081830 () Bool)

(assert (=> b!1583722 (=> (not res!1081830) (not e!884024))))

(assert (=> b!1583722 (= res!1081830 (bvslt (_1!12902 (h!38466 l!1251)) (_1!12902 (h!38466 (t!51841 l!1251)))))))

(declare-fun b!1583723 () Bool)

(assert (=> b!1583723 (= e!884024 (isStrictlySorted!1155 (t!51841 l!1251)))))

(assert (= (and d!167271 (not res!1081829)) b!1583722))

(assert (= (and b!1583722 res!1081830) b!1583723))

(assert (=> b!1583723 m!1453437))

(assert (=> start!137952 d!167271))

(declare-fun d!167277 () Bool)

(declare-fun res!1081849 () Bool)

(declare-fun e!884043 () Bool)

(assert (=> d!167277 (=> res!1081849 e!884043)))

(assert (=> d!167277 (= res!1081849 (and ((_ is Cons!36923) l!1251) (= (_1!12902 (h!38466 l!1251)) otherKey!56)))))

(assert (=> d!167277 (= (containsKey!989 l!1251 otherKey!56) e!884043)))

(declare-fun b!1583742 () Bool)

(declare-fun e!884044 () Bool)

(assert (=> b!1583742 (= e!884043 e!884044)))

(declare-fun res!1081850 () Bool)

(assert (=> b!1583742 (=> (not res!1081850) (not e!884044))))

(assert (=> b!1583742 (= res!1081850 (and (or (not ((_ is Cons!36923) l!1251)) (bvsle (_1!12902 (h!38466 l!1251)) otherKey!56)) ((_ is Cons!36923) l!1251) (bvslt (_1!12902 (h!38466 l!1251)) otherKey!56)))))

(declare-fun b!1583743 () Bool)

(assert (=> b!1583743 (= e!884044 (containsKey!989 (t!51841 l!1251) otherKey!56))))

(assert (= (and d!167277 (not res!1081849)) b!1583742))

(assert (= (and b!1583742 res!1081850) b!1583743))

(assert (=> b!1583743 m!1453421))

(assert (=> b!1583691 d!167277))

(declare-fun d!167285 () Bool)

(declare-fun res!1081851 () Bool)

(declare-fun e!884045 () Bool)

(assert (=> d!167285 (=> res!1081851 e!884045)))

(assert (=> d!167285 (= res!1081851 (or ((_ is Nil!36924) (t!51841 l!1251)) ((_ is Nil!36924) (t!51841 (t!51841 l!1251)))))))

(assert (=> d!167285 (= (isStrictlySorted!1155 (t!51841 l!1251)) e!884045)))

(declare-fun b!1583744 () Bool)

(declare-fun e!884046 () Bool)

(assert (=> b!1583744 (= e!884045 e!884046)))

(declare-fun res!1081852 () Bool)

(assert (=> b!1583744 (=> (not res!1081852) (not e!884046))))

(assert (=> b!1583744 (= res!1081852 (bvslt (_1!12902 (h!38466 (t!51841 l!1251))) (_1!12902 (h!38466 (t!51841 (t!51841 l!1251))))))))

(declare-fun b!1583745 () Bool)

(assert (=> b!1583745 (= e!884046 (isStrictlySorted!1155 (t!51841 (t!51841 l!1251))))))

(assert (= (and d!167285 (not res!1081851)) b!1583744))

(assert (= (and b!1583744 res!1081852) b!1583745))

(declare-fun m!1453459 () Bool)

(assert (=> b!1583745 m!1453459))

(assert (=> b!1583695 d!167285))

(declare-fun b!1583816 () Bool)

(declare-fun e!884090 () List!36927)

(declare-fun e!884091 () List!36927)

(assert (=> b!1583816 (= e!884090 e!884091)))

(declare-fun c!146775 () Bool)

(assert (=> b!1583816 (= c!146775 (and ((_ is Cons!36923) l!1251) (= (_1!12902 (h!38466 l!1251)) newKey!123)))))

(declare-fun bm!72495 () Bool)

(declare-fun c!146778 () Bool)

(declare-fun call!72498 () List!36927)

(declare-fun e!884089 () List!36927)

(declare-fun $colon$colon!1016 (List!36927 tuple2!25782) List!36927)

(assert (=> bm!72495 (= call!72498 ($colon$colon!1016 e!884089 (ite c!146778 (h!38466 l!1251) (tuple2!25783 newKey!123 newValue!123))))))

(declare-fun c!146777 () Bool)

(assert (=> bm!72495 (= c!146777 c!146778)))

(declare-fun bm!72496 () Bool)

(declare-fun call!72499 () List!36927)

(assert (=> bm!72496 (= call!72499 call!72498)))

(declare-fun lt!677212 () List!36927)

(declare-fun e!884087 () Bool)

(declare-fun b!1583817 () Bool)

(declare-fun contains!10520 (List!36927 tuple2!25782) Bool)

(assert (=> b!1583817 (= e!884087 (contains!10520 lt!677212 (tuple2!25783 newKey!123 newValue!123)))))

(declare-fun b!1583818 () Bool)

(assert (=> b!1583818 (= e!884089 (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123))))

(declare-fun b!1583819 () Bool)

(declare-fun e!884088 () List!36927)

(declare-fun call!72500 () List!36927)

(assert (=> b!1583819 (= e!884088 call!72500)))

(declare-fun b!1583820 () Bool)

(declare-fun c!146776 () Bool)

(assert (=> b!1583820 (= c!146776 (and ((_ is Cons!36923) l!1251) (bvsgt (_1!12902 (h!38466 l!1251)) newKey!123)))))

(assert (=> b!1583820 (= e!884091 e!884088)))

(declare-fun b!1583821 () Bool)

(assert (=> b!1583821 (= e!884091 call!72499)))

(declare-fun b!1583822 () Bool)

(declare-fun res!1081876 () Bool)

(assert (=> b!1583822 (=> (not res!1081876) (not e!884087))))

(assert (=> b!1583822 (= res!1081876 (containsKey!989 lt!677212 newKey!123))))

(declare-fun d!167287 () Bool)

(assert (=> d!167287 e!884087))

(declare-fun res!1081875 () Bool)

(assert (=> d!167287 (=> (not res!1081875) (not e!884087))))

(assert (=> d!167287 (= res!1081875 (isStrictlySorted!1155 lt!677212))))

(assert (=> d!167287 (= lt!677212 e!884090)))

(assert (=> d!167287 (= c!146778 (and ((_ is Cons!36923) l!1251) (bvslt (_1!12902 (h!38466 l!1251)) newKey!123)))))

(assert (=> d!167287 (isStrictlySorted!1155 l!1251)))

(assert (=> d!167287 (= (insertStrictlySorted!621 l!1251 newKey!123 newValue!123) lt!677212)))

(declare-fun bm!72497 () Bool)

(assert (=> bm!72497 (= call!72500 call!72499)))

(declare-fun b!1583823 () Bool)

(assert (=> b!1583823 (= e!884090 call!72498)))

(declare-fun b!1583824 () Bool)

(assert (=> b!1583824 (= e!884088 call!72500)))

(declare-fun b!1583825 () Bool)

(assert (=> b!1583825 (= e!884089 (ite c!146775 (t!51841 l!1251) (ite c!146776 (Cons!36923 (h!38466 l!1251) (t!51841 l!1251)) Nil!36924)))))

(assert (= (and d!167287 c!146778) b!1583823))

(assert (= (and d!167287 (not c!146778)) b!1583816))

(assert (= (and b!1583816 c!146775) b!1583821))

(assert (= (and b!1583816 (not c!146775)) b!1583820))

(assert (= (and b!1583820 c!146776) b!1583819))

(assert (= (and b!1583820 (not c!146776)) b!1583824))

(assert (= (or b!1583819 b!1583824) bm!72497))

(assert (= (or b!1583821 bm!72497) bm!72496))

(assert (= (or b!1583823 bm!72496) bm!72495))

(assert (= (and bm!72495 c!146777) b!1583818))

(assert (= (and bm!72495 (not c!146777)) b!1583825))

(assert (= (and d!167287 res!1081875) b!1583822))

(assert (= (and b!1583822 res!1081876) b!1583817))

(declare-fun m!1453463 () Bool)

(assert (=> b!1583817 m!1453463))

(declare-fun m!1453465 () Bool)

(assert (=> bm!72495 m!1453465))

(declare-fun m!1453469 () Bool)

(assert (=> b!1583822 m!1453469))

(assert (=> b!1583818 m!1453433))

(declare-fun m!1453473 () Bool)

(assert (=> d!167287 m!1453473))

(assert (=> d!167287 m!1453425))

(assert (=> b!1583693 d!167287))

(declare-fun d!167295 () Bool)

(declare-fun res!1081879 () Bool)

(declare-fun e!884097 () Bool)

(assert (=> d!167295 (=> res!1081879 e!884097)))

(assert (=> d!167295 (= res!1081879 (or ((_ is Nil!36924) (insertStrictlySorted!621 l!1251 newKey!123 newValue!123)) ((_ is Nil!36924) (t!51841 (insertStrictlySorted!621 l!1251 newKey!123 newValue!123)))))))

(assert (=> d!167295 (= (isStrictlySorted!1155 (insertStrictlySorted!621 l!1251 newKey!123 newValue!123)) e!884097)))

(declare-fun b!1583836 () Bool)

(declare-fun e!884098 () Bool)

(assert (=> b!1583836 (= e!884097 e!884098)))

(declare-fun res!1081880 () Bool)

(assert (=> b!1583836 (=> (not res!1081880) (not e!884098))))

(assert (=> b!1583836 (= res!1081880 (bvslt (_1!12902 (h!38466 (insertStrictlySorted!621 l!1251 newKey!123 newValue!123))) (_1!12902 (h!38466 (t!51841 (insertStrictlySorted!621 l!1251 newKey!123 newValue!123))))))))

(declare-fun b!1583837 () Bool)

(assert (=> b!1583837 (= e!884098 (isStrictlySorted!1155 (t!51841 (insertStrictlySorted!621 l!1251 newKey!123 newValue!123))))))

(assert (= (and d!167295 (not res!1081879)) b!1583836))

(assert (= (and b!1583836 res!1081880) b!1583837))

(declare-fun m!1453479 () Bool)

(assert (=> b!1583837 m!1453479))

(assert (=> b!1583693 d!167295))

(declare-fun b!1583850 () Bool)

(declare-fun e!884109 () List!36927)

(declare-fun e!884110 () List!36927)

(assert (=> b!1583850 (= e!884109 e!884110)))

(declare-fun c!146787 () Bool)

(assert (=> b!1583850 (= c!146787 (and ((_ is Cons!36923) (t!51841 l!1251)) (= (_1!12902 (h!38466 (t!51841 l!1251))) newKey!123)))))

(declare-fun e!884108 () List!36927)

(declare-fun bm!72504 () Bool)

(declare-fun c!146790 () Bool)

(declare-fun call!72507 () List!36927)

(assert (=> bm!72504 (= call!72507 ($colon$colon!1016 e!884108 (ite c!146790 (h!38466 (t!51841 l!1251)) (tuple2!25783 newKey!123 newValue!123))))))

(declare-fun c!146789 () Bool)

(assert (=> bm!72504 (= c!146789 c!146790)))

(declare-fun bm!72505 () Bool)

(declare-fun call!72508 () List!36927)

(assert (=> bm!72505 (= call!72508 call!72507)))

(declare-fun lt!677215 () List!36927)

(declare-fun e!884106 () Bool)

(declare-fun b!1583851 () Bool)

(assert (=> b!1583851 (= e!884106 (contains!10520 lt!677215 (tuple2!25783 newKey!123 newValue!123)))))

(declare-fun b!1583852 () Bool)

(assert (=> b!1583852 (= e!884108 (insertStrictlySorted!621 (t!51841 (t!51841 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1583853 () Bool)

(declare-fun e!884107 () List!36927)

(declare-fun call!72509 () List!36927)

(assert (=> b!1583853 (= e!884107 call!72509)))

(declare-fun b!1583854 () Bool)

(declare-fun c!146788 () Bool)

(assert (=> b!1583854 (= c!146788 (and ((_ is Cons!36923) (t!51841 l!1251)) (bvsgt (_1!12902 (h!38466 (t!51841 l!1251))) newKey!123)))))

(assert (=> b!1583854 (= e!884110 e!884107)))

(declare-fun b!1583855 () Bool)

(assert (=> b!1583855 (= e!884110 call!72508)))

(declare-fun b!1583856 () Bool)

(declare-fun res!1081886 () Bool)

(assert (=> b!1583856 (=> (not res!1081886) (not e!884106))))

(assert (=> b!1583856 (= res!1081886 (containsKey!989 lt!677215 newKey!123))))

(declare-fun d!167299 () Bool)

(assert (=> d!167299 e!884106))

(declare-fun res!1081885 () Bool)

(assert (=> d!167299 (=> (not res!1081885) (not e!884106))))

(assert (=> d!167299 (= res!1081885 (isStrictlySorted!1155 lt!677215))))

(assert (=> d!167299 (= lt!677215 e!884109)))

(assert (=> d!167299 (= c!146790 (and ((_ is Cons!36923) (t!51841 l!1251)) (bvslt (_1!12902 (h!38466 (t!51841 l!1251))) newKey!123)))))

(assert (=> d!167299 (isStrictlySorted!1155 (t!51841 l!1251))))

(assert (=> d!167299 (= (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123) lt!677215)))

(declare-fun bm!72506 () Bool)

(assert (=> bm!72506 (= call!72509 call!72508)))

(declare-fun b!1583857 () Bool)

(assert (=> b!1583857 (= e!884109 call!72507)))

(declare-fun b!1583858 () Bool)

(assert (=> b!1583858 (= e!884107 call!72509)))

(declare-fun b!1583859 () Bool)

(assert (=> b!1583859 (= e!884108 (ite c!146787 (t!51841 (t!51841 l!1251)) (ite c!146788 (Cons!36923 (h!38466 (t!51841 l!1251)) (t!51841 (t!51841 l!1251))) Nil!36924)))))

(assert (= (and d!167299 c!146790) b!1583857))

(assert (= (and d!167299 (not c!146790)) b!1583850))

(assert (= (and b!1583850 c!146787) b!1583855))

(assert (= (and b!1583850 (not c!146787)) b!1583854))

(assert (= (and b!1583854 c!146788) b!1583853))

(assert (= (and b!1583854 (not c!146788)) b!1583858))

(assert (= (or b!1583853 b!1583858) bm!72506))

(assert (= (or b!1583855 bm!72506) bm!72505))

(assert (= (or b!1583857 bm!72505) bm!72504))

(assert (= (and bm!72504 c!146789) b!1583852))

(assert (= (and bm!72504 (not c!146789)) b!1583859))

(assert (= (and d!167299 res!1081885) b!1583856))

(assert (= (and b!1583856 res!1081886) b!1583851))

(declare-fun m!1453491 () Bool)

(assert (=> b!1583851 m!1453491))

(declare-fun m!1453493 () Bool)

(assert (=> bm!72504 m!1453493))

(declare-fun m!1453497 () Bool)

(assert (=> b!1583856 m!1453497))

(declare-fun m!1453501 () Bool)

(assert (=> b!1583852 m!1453501))

(declare-fun m!1453505 () Bool)

(assert (=> d!167299 m!1453505))

(assert (=> d!167299 m!1453437))

(assert (=> b!1583693 d!167299))

(declare-fun d!167305 () Bool)

(assert (=> d!167305 (not (containsKey!989 (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-fun lt!677224 () Unit!52293)

(declare-fun choose!2107 (List!36927 (_ BitVec 64) B!2890 (_ BitVec 64)) Unit!52293)

(assert (=> d!167305 (= lt!677224 (choose!2107 (t!51841 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun e!884129 () Bool)

(assert (=> d!167305 e!884129))

(declare-fun res!1081905 () Bool)

(assert (=> d!167305 (=> (not res!1081905) (not e!884129))))

(assert (=> d!167305 (= res!1081905 (isStrictlySorted!1155 (t!51841 l!1251)))))

(assert (=> d!167305 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!8 (t!51841 l!1251) newKey!123 newValue!123 otherKey!56) lt!677224)))

(declare-fun b!1583894 () Bool)

(declare-fun res!1081906 () Bool)

(assert (=> b!1583894 (=> (not res!1081906) (not e!884129))))

(assert (=> b!1583894 (= res!1081906 (not (containsKey!989 (t!51841 l!1251) otherKey!56)))))

(declare-fun b!1583895 () Bool)

(assert (=> b!1583895 (= e!884129 (not (= otherKey!56 newKey!123)))))

(assert (= (and d!167305 res!1081905) b!1583894))

(assert (= (and b!1583894 res!1081906) b!1583895))

(assert (=> d!167305 m!1453433))

(assert (=> d!167305 m!1453433))

(assert (=> d!167305 m!1453435))

(declare-fun m!1453523 () Bool)

(assert (=> d!167305 m!1453523))

(assert (=> d!167305 m!1453437))

(assert (=> b!1583894 m!1453421))

(assert (=> b!1583693 d!167305))

(declare-fun d!167313 () Bool)

(declare-fun res!1081909 () Bool)

(declare-fun e!884131 () Bool)

(assert (=> d!167313 (=> res!1081909 e!884131)))

(assert (=> d!167313 (= res!1081909 (and ((_ is Cons!36923) (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123)) (= (_1!12902 (h!38466 (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167313 (= (containsKey!989 (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123) otherKey!56) e!884131)))

(declare-fun b!1583898 () Bool)

(declare-fun e!884132 () Bool)

(assert (=> b!1583898 (= e!884131 e!884132)))

(declare-fun res!1081910 () Bool)

(assert (=> b!1583898 (=> (not res!1081910) (not e!884132))))

(assert (=> b!1583898 (= res!1081910 (and (or (not ((_ is Cons!36923) (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123))) (bvsle (_1!12902 (h!38466 (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123))) otherKey!56)) ((_ is Cons!36923) (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123)) (bvslt (_1!12902 (h!38466 (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1583899 () Bool)

(assert (=> b!1583899 (= e!884132 (containsKey!989 (t!51841 (insertStrictlySorted!621 (t!51841 l!1251) newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167313 (not res!1081909)) b!1583898))

(assert (= (and b!1583898 res!1081910) b!1583899))

(declare-fun m!1453527 () Bool)

(assert (=> b!1583899 m!1453527))

(assert (=> b!1583693 d!167313))

(declare-fun d!167317 () Bool)

(declare-fun res!1081913 () Bool)

(declare-fun e!884135 () Bool)

(assert (=> d!167317 (=> res!1081913 e!884135)))

(assert (=> d!167317 (= res!1081913 (and ((_ is Cons!36923) (t!51841 l!1251)) (= (_1!12902 (h!38466 (t!51841 l!1251))) otherKey!56)))))

(assert (=> d!167317 (= (containsKey!989 (t!51841 l!1251) otherKey!56) e!884135)))

(declare-fun b!1583902 () Bool)

(declare-fun e!884136 () Bool)

(assert (=> b!1583902 (= e!884135 e!884136)))

(declare-fun res!1081914 () Bool)

(assert (=> b!1583902 (=> (not res!1081914) (not e!884136))))

(assert (=> b!1583902 (= res!1081914 (and (or (not ((_ is Cons!36923) (t!51841 l!1251))) (bvsle (_1!12902 (h!38466 (t!51841 l!1251))) otherKey!56)) ((_ is Cons!36923) (t!51841 l!1251)) (bvslt (_1!12902 (h!38466 (t!51841 l!1251))) otherKey!56)))))

(declare-fun b!1583903 () Bool)

(assert (=> b!1583903 (= e!884136 (containsKey!989 (t!51841 (t!51841 l!1251)) otherKey!56))))

(assert (= (and d!167317 (not res!1081913)) b!1583902))

(assert (= (and b!1583902 res!1081914) b!1583903))

(declare-fun m!1453531 () Bool)

(assert (=> b!1583903 m!1453531))

(assert (=> b!1583692 d!167317))

(declare-fun b!1583919 () Bool)

(declare-fun e!884147 () Bool)

(declare-fun tp!115033 () Bool)

(assert (=> b!1583919 (= e!884147 (and tp_is_empty!39423 tp!115033))))

(assert (=> b!1583694 (= tp!115024 e!884147)))

(assert (= (and b!1583694 ((_ is Cons!36923) (t!51841 l!1251))) b!1583919))

(check-sat (not b!1583856) (not d!167299) (not b!1583919) (not b!1583818) (not b!1583894) (not b!1583723) (not d!167287) (not b!1583817) (not b!1583837) (not d!167305) (not b!1583745) (not b!1583903) (not b!1583851) (not b!1583822) (not bm!72495) (not b!1583743) (not b!1583899) (not bm!72504) (not b!1583852) tp_is_empty!39423)
(check-sat)
