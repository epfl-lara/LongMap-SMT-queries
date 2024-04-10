; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137950 () Bool)

(assert start!137950)

(declare-fun b!1583672 () Bool)

(declare-fun res!1081788 () Bool)

(declare-fun e!884001 () Bool)

(assert (=> b!1583672 (=> (not res!1081788) (not e!884001))))

(declare-datatypes ((B!2888 0))(
  ( (B!2889 (val!19806 Int)) )
))
(declare-datatypes ((tuple2!25780 0))(
  ( (tuple2!25781 (_1!12901 (_ BitVec 64)) (_2!12901 B!2888)) )
))
(declare-datatypes ((List!36926 0))(
  ( (Nil!36923) (Cons!36922 (h!38465 tuple2!25780) (t!51840 List!36926)) )
))
(declare-fun l!1251 () List!36926)

(declare-fun otherKey!56 () (_ BitVec 64))

(declare-fun containsKey!988 (List!36926 (_ BitVec 64)) Bool)

(assert (=> b!1583672 (= res!1081788 (not (containsKey!988 l!1251 otherKey!56)))))

(declare-fun b!1583673 () Bool)

(declare-fun e!884002 () Bool)

(declare-fun tp_is_empty!39421 () Bool)

(declare-fun tp!115021 () Bool)

(assert (=> b!1583673 (= e!884002 (and tp_is_empty!39421 tp!115021))))

(declare-fun b!1583674 () Bool)

(declare-fun res!1081790 () Bool)

(assert (=> b!1583674 (=> (not res!1081790) (not e!884001))))

(assert (=> b!1583674 (= res!1081790 (not (containsKey!988 (t!51840 l!1251) otherKey!56)))))

(declare-fun b!1583675 () Bool)

(declare-fun res!1081786 () Bool)

(assert (=> b!1583675 (=> (not res!1081786) (not e!884001))))

(declare-fun newKey!123 () (_ BitVec 64))

(assert (=> b!1583675 (= res!1081786 (and (not (= otherKey!56 newKey!123)) (is-Cons!36922 l!1251)))))

(declare-fun res!1081787 () Bool)

(assert (=> start!137950 (=> (not res!1081787) (not e!884001))))

(declare-fun isStrictlySorted!1154 (List!36926) Bool)

(assert (=> start!137950 (= res!1081787 (isStrictlySorted!1154 l!1251))))

(assert (=> start!137950 e!884001))

(assert (=> start!137950 e!884002))

(assert (=> start!137950 true))

(assert (=> start!137950 tp_is_empty!39421))

(declare-fun b!1583676 () Bool)

(declare-fun res!1081789 () Bool)

(assert (=> b!1583676 (=> (not res!1081789) (not e!884001))))

(assert (=> b!1583676 (= res!1081789 (isStrictlySorted!1154 (t!51840 l!1251)))))

(declare-fun newValue!123 () B!2888)

(declare-fun b!1583677 () Bool)

(declare-fun insertStrictlySorted!620 (List!36926 (_ BitVec 64) B!2888) List!36926)

(assert (=> b!1583677 (= e!884001 (not (isStrictlySorted!1154 (insertStrictlySorted!620 l!1251 newKey!123 newValue!123))))))

(assert (=> b!1583677 (not (containsKey!988 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-datatypes ((Unit!52291 0))(
  ( (Unit!52292) )
))
(declare-fun lt!677199 () Unit!52291)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!7 (List!36926 (_ BitVec 64) B!2888 (_ BitVec 64)) Unit!52291)

(assert (=> b!1583677 (= lt!677199 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!7 (t!51840 l!1251) newKey!123 newValue!123 otherKey!56))))

(assert (= (and start!137950 res!1081787) b!1583672))

(assert (= (and b!1583672 res!1081788) b!1583675))

(assert (= (and b!1583675 res!1081786) b!1583676))

(assert (= (and b!1583676 res!1081789) b!1583674))

(assert (= (and b!1583674 res!1081790) b!1583677))

(assert (= (and start!137950 (is-Cons!36922 l!1251)) b!1583673))

(declare-fun m!1453403 () Bool)

(assert (=> b!1583676 m!1453403))

(declare-fun m!1453405 () Bool)

(assert (=> b!1583677 m!1453405))

(declare-fun m!1453407 () Bool)

(assert (=> b!1583677 m!1453407))

(declare-fun m!1453409 () Bool)

(assert (=> b!1583677 m!1453409))

(declare-fun m!1453411 () Bool)

(assert (=> b!1583677 m!1453411))

(assert (=> b!1583677 m!1453411))

(declare-fun m!1453413 () Bool)

(assert (=> b!1583677 m!1453413))

(assert (=> b!1583677 m!1453407))

(declare-fun m!1453415 () Bool)

(assert (=> start!137950 m!1453415))

(declare-fun m!1453417 () Bool)

(assert (=> b!1583674 m!1453417))

(declare-fun m!1453419 () Bool)

(assert (=> b!1583672 m!1453419))

(push 1)

(assert (not b!1583676))

(assert (not b!1583673))

(assert (not b!1583674))

(assert tp_is_empty!39421)

(assert (not start!137950))

(assert (not b!1583672))

(assert (not b!1583677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167275 () Bool)

(declare-fun res!1081843 () Bool)

(declare-fun e!884037 () Bool)

(assert (=> d!167275 (=> res!1081843 e!884037)))

(assert (=> d!167275 (= res!1081843 (and (is-Cons!36922 l!1251) (= (_1!12901 (h!38465 l!1251)) otherKey!56)))))

(assert (=> d!167275 (= (containsKey!988 l!1251 otherKey!56) e!884037)))

(declare-fun b!1583734 () Bool)

(declare-fun e!884038 () Bool)

(assert (=> b!1583734 (= e!884037 e!884038)))

(declare-fun res!1081844 () Bool)

(assert (=> b!1583734 (=> (not res!1081844) (not e!884038))))

(assert (=> b!1583734 (= res!1081844 (and (or (not (is-Cons!36922 l!1251)) (bvsle (_1!12901 (h!38465 l!1251)) otherKey!56)) (is-Cons!36922 l!1251) (bvslt (_1!12901 (h!38465 l!1251)) otherKey!56)))))

(declare-fun b!1583735 () Bool)

(assert (=> b!1583735 (= e!884038 (containsKey!988 (t!51840 l!1251) otherKey!56))))

(assert (= (and d!167275 (not res!1081843)) b!1583734))

(assert (= (and b!1583734 res!1081844) b!1583735))

(assert (=> b!1583735 m!1453417))

(assert (=> b!1583672 d!167275))

(declare-fun d!167283 () Bool)

(declare-fun res!1081859 () Bool)

(declare-fun e!884053 () Bool)

(assert (=> d!167283 (=> res!1081859 e!884053)))

(assert (=> d!167283 (= res!1081859 (or (is-Nil!36923 l!1251) (is-Nil!36923 (t!51840 l!1251))))))

(assert (=> d!167283 (= (isStrictlySorted!1154 l!1251) e!884053)))

(declare-fun b!1583752 () Bool)

(declare-fun e!884054 () Bool)

(assert (=> b!1583752 (= e!884053 e!884054)))

(declare-fun res!1081860 () Bool)

(assert (=> b!1583752 (=> (not res!1081860) (not e!884054))))

(assert (=> b!1583752 (= res!1081860 (bvslt (_1!12901 (h!38465 l!1251)) (_1!12901 (h!38465 (t!51840 l!1251)))))))

(declare-fun b!1583753 () Bool)

(assert (=> b!1583753 (= e!884054 (isStrictlySorted!1154 (t!51840 l!1251)))))

(assert (= (and d!167283 (not res!1081859)) b!1583752))

(assert (= (and b!1583752 res!1081860) b!1583753))

(assert (=> b!1583753 m!1453403))

(assert (=> start!137950 d!167283))

(declare-fun d!167291 () Bool)

(declare-fun res!1081861 () Bool)

(declare-fun e!884055 () Bool)

(assert (=> d!167291 (=> res!1081861 e!884055)))

(assert (=> d!167291 (= res!1081861 (or (is-Nil!36923 (t!51840 l!1251)) (is-Nil!36923 (t!51840 (t!51840 l!1251)))))))

(assert (=> d!167291 (= (isStrictlySorted!1154 (t!51840 l!1251)) e!884055)))

(declare-fun b!1583754 () Bool)

(declare-fun e!884056 () Bool)

(assert (=> b!1583754 (= e!884055 e!884056)))

(declare-fun res!1081862 () Bool)

(assert (=> b!1583754 (=> (not res!1081862) (not e!884056))))

(assert (=> b!1583754 (= res!1081862 (bvslt (_1!12901 (h!38465 (t!51840 l!1251))) (_1!12901 (h!38465 (t!51840 (t!51840 l!1251))))))))

(declare-fun b!1583755 () Bool)

(assert (=> b!1583755 (= e!884056 (isStrictlySorted!1154 (t!51840 (t!51840 l!1251))))))

(assert (= (and d!167291 (not res!1081861)) b!1583754))

(assert (= (and b!1583754 res!1081862) b!1583755))

(declare-fun m!1453461 () Bool)

(assert (=> b!1583755 m!1453461))

(assert (=> b!1583676 d!167291))

(declare-fun b!1583840 () Bool)

(declare-fun res!1081884 () Bool)

(declare-fun e!884103 () Bool)

(assert (=> b!1583840 (=> (not res!1081884) (not e!884103))))

(declare-fun lt!677214 () List!36926)

(assert (=> b!1583840 (= res!1081884 (containsKey!988 lt!677214 newKey!123))))

(declare-fun c!146783 () Bool)

(declare-fun e!884104 () List!36926)

(declare-fun b!1583841 () Bool)

(declare-fun c!146786 () Bool)

(assert (=> b!1583841 (= e!884104 (ite c!146786 (t!51840 l!1251) (ite c!146783 (Cons!36922 (h!38465 l!1251) (t!51840 l!1251)) Nil!36923)))))

(declare-fun b!1583842 () Bool)

(assert (=> b!1583842 (= c!146783 (and (is-Cons!36922 l!1251) (bvsgt (_1!12901 (h!38465 l!1251)) newKey!123)))))

(declare-fun e!884101 () List!36926)

(declare-fun e!884105 () List!36926)

(assert (=> b!1583842 (= e!884101 e!884105)))

(declare-fun b!1583843 () Bool)

(declare-fun call!72504 () List!36926)

(assert (=> b!1583843 (= e!884101 call!72504)))

(declare-fun bm!72501 () Bool)

(declare-fun call!72506 () List!36926)

(assert (=> bm!72501 (= call!72504 call!72506)))

(declare-fun b!1583844 () Bool)

(declare-fun call!72505 () List!36926)

(assert (=> b!1583844 (= e!884105 call!72505)))

(declare-fun b!1583845 () Bool)

(declare-fun contains!10521 (List!36926 tuple2!25780) Bool)

(assert (=> b!1583845 (= e!884103 (contains!10521 lt!677214 (tuple2!25781 newKey!123 newValue!123)))))

(declare-fun bm!72502 () Bool)

(assert (=> bm!72502 (= call!72505 call!72504)))

(declare-fun d!167293 () Bool)

(assert (=> d!167293 e!884103))

(declare-fun res!1081883 () Bool)

(assert (=> d!167293 (=> (not res!1081883) (not e!884103))))

(assert (=> d!167293 (= res!1081883 (isStrictlySorted!1154 lt!677214))))

(declare-fun e!884102 () List!36926)

(assert (=> d!167293 (= lt!677214 e!884102)))

(declare-fun c!146785 () Bool)

(assert (=> d!167293 (= c!146785 (and (is-Cons!36922 l!1251) (bvslt (_1!12901 (h!38465 l!1251)) newKey!123)))))

(assert (=> d!167293 (isStrictlySorted!1154 l!1251)))

(assert (=> d!167293 (= (insertStrictlySorted!620 l!1251 newKey!123 newValue!123) lt!677214)))

(declare-fun b!1583846 () Bool)

(assert (=> b!1583846 (= e!884102 call!72506)))

(declare-fun bm!72503 () Bool)

(declare-fun $colon$colon!1017 (List!36926 tuple2!25780) List!36926)

(assert (=> bm!72503 (= call!72506 ($colon$colon!1017 e!884104 (ite c!146785 (h!38465 l!1251) (tuple2!25781 newKey!123 newValue!123))))))

(declare-fun c!146784 () Bool)

(assert (=> bm!72503 (= c!146784 c!146785)))

(declare-fun b!1583847 () Bool)

(assert (=> b!1583847 (= e!884105 call!72505)))

(declare-fun b!1583848 () Bool)

(assert (=> b!1583848 (= e!884104 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123))))

(declare-fun b!1583849 () Bool)

(assert (=> b!1583849 (= e!884102 e!884101)))

(assert (=> b!1583849 (= c!146786 (and (is-Cons!36922 l!1251) (= (_1!12901 (h!38465 l!1251)) newKey!123)))))

(assert (= (and d!167293 c!146785) b!1583846))

(assert (= (and d!167293 (not c!146785)) b!1583849))

(assert (= (and b!1583849 c!146786) b!1583843))

(assert (= (and b!1583849 (not c!146786)) b!1583842))

(assert (= (and b!1583842 c!146783) b!1583847))

(assert (= (and b!1583842 (not c!146783)) b!1583844))

(assert (= (or b!1583847 b!1583844) bm!72502))

(assert (= (or b!1583843 bm!72502) bm!72501))

(assert (= (or b!1583846 bm!72501) bm!72503))

(assert (= (and bm!72503 c!146784) b!1583848))

(assert (= (and bm!72503 (not c!146784)) b!1583841))

(assert (= (and d!167293 res!1081883) b!1583840))

(assert (= (and b!1583840 res!1081884) b!1583845))

(declare-fun m!1453483 () Bool)

(assert (=> d!167293 m!1453483))

(assert (=> d!167293 m!1453415))

(declare-fun m!1453485 () Bool)

(assert (=> bm!72503 m!1453485))

(declare-fun m!1453487 () Bool)

(assert (=> b!1583840 m!1453487))

(declare-fun m!1453489 () Bool)

(assert (=> b!1583845 m!1453489))

(assert (=> b!1583848 m!1453411))

(assert (=> b!1583677 d!167293))

(declare-fun d!167303 () Bool)

(declare-fun res!1081889 () Bool)

(declare-fun e!884116 () Bool)

(assert (=> d!167303 (=> res!1081889 e!884116)))

(assert (=> d!167303 (= res!1081889 (or (is-Nil!36923 (insertStrictlySorted!620 l!1251 newKey!123 newValue!123)) (is-Nil!36923 (t!51840 (insertStrictlySorted!620 l!1251 newKey!123 newValue!123)))))))

(assert (=> d!167303 (= (isStrictlySorted!1154 (insertStrictlySorted!620 l!1251 newKey!123 newValue!123)) e!884116)))

(declare-fun b!1583870 () Bool)

(declare-fun e!884117 () Bool)

(assert (=> b!1583870 (= e!884116 e!884117)))

(declare-fun res!1081890 () Bool)

(assert (=> b!1583870 (=> (not res!1081890) (not e!884117))))

(assert (=> b!1583870 (= res!1081890 (bvslt (_1!12901 (h!38465 (insertStrictlySorted!620 l!1251 newKey!123 newValue!123))) (_1!12901 (h!38465 (t!51840 (insertStrictlySorted!620 l!1251 newKey!123 newValue!123))))))))

(declare-fun b!1583871 () Bool)

(assert (=> b!1583871 (= e!884117 (isStrictlySorted!1154 (t!51840 (insertStrictlySorted!620 l!1251 newKey!123 newValue!123))))))

(assert (= (and d!167303 (not res!1081889)) b!1583870))

(assert (= (and b!1583870 res!1081890) b!1583871))

(declare-fun m!1453511 () Bool)

(assert (=> b!1583871 m!1453511))

(assert (=> b!1583677 d!167303))

(declare-fun b!1583872 () Bool)

(declare-fun res!1081892 () Bool)

(declare-fun e!884120 () Bool)

(assert (=> b!1583872 (=> (not res!1081892) (not e!884120))))

(declare-fun lt!677217 () List!36926)

(assert (=> b!1583872 (= res!1081892 (containsKey!988 lt!677217 newKey!123))))

(declare-fun c!146795 () Bool)

(declare-fun e!884121 () List!36926)

(declare-fun c!146798 () Bool)

(declare-fun b!1583873 () Bool)

(assert (=> b!1583873 (= e!884121 (ite c!146798 (t!51840 (t!51840 l!1251)) (ite c!146795 (Cons!36922 (h!38465 (t!51840 l!1251)) (t!51840 (t!51840 l!1251))) Nil!36923)))))

(declare-fun b!1583874 () Bool)

(assert (=> b!1583874 (= c!146795 (and (is-Cons!36922 (t!51840 l!1251)) (bvsgt (_1!12901 (h!38465 (t!51840 l!1251))) newKey!123)))))

(declare-fun e!884118 () List!36926)

(declare-fun e!884122 () List!36926)

(assert (=> b!1583874 (= e!884118 e!884122)))

(declare-fun b!1583875 () Bool)

(declare-fun call!72513 () List!36926)

(assert (=> b!1583875 (= e!884118 call!72513)))

(declare-fun bm!72510 () Bool)

(declare-fun call!72515 () List!36926)

(assert (=> bm!72510 (= call!72513 call!72515)))

(declare-fun b!1583876 () Bool)

(declare-fun call!72514 () List!36926)

(assert (=> b!1583876 (= e!884122 call!72514)))

(declare-fun b!1583877 () Bool)

(assert (=> b!1583877 (= e!884120 (contains!10521 lt!677217 (tuple2!25781 newKey!123 newValue!123)))))

(declare-fun bm!72511 () Bool)

(assert (=> bm!72511 (= call!72514 call!72513)))

(declare-fun d!167309 () Bool)

(assert (=> d!167309 e!884120))

(declare-fun res!1081891 () Bool)

(assert (=> d!167309 (=> (not res!1081891) (not e!884120))))

(assert (=> d!167309 (= res!1081891 (isStrictlySorted!1154 lt!677217))))

(declare-fun e!884119 () List!36926)

(assert (=> d!167309 (= lt!677217 e!884119)))

(declare-fun c!146797 () Bool)

(assert (=> d!167309 (= c!146797 (and (is-Cons!36922 (t!51840 l!1251)) (bvslt (_1!12901 (h!38465 (t!51840 l!1251))) newKey!123)))))

(assert (=> d!167309 (isStrictlySorted!1154 (t!51840 l!1251))))

(assert (=> d!167309 (= (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123) lt!677217)))

(declare-fun b!1583878 () Bool)

(assert (=> b!1583878 (= e!884119 call!72515)))

(declare-fun bm!72512 () Bool)

(assert (=> bm!72512 (= call!72515 ($colon$colon!1017 e!884121 (ite c!146797 (h!38465 (t!51840 l!1251)) (tuple2!25781 newKey!123 newValue!123))))))

(declare-fun c!146796 () Bool)

(assert (=> bm!72512 (= c!146796 c!146797)))

(declare-fun b!1583879 () Bool)

(assert (=> b!1583879 (= e!884122 call!72514)))

(declare-fun b!1583880 () Bool)

(assert (=> b!1583880 (= e!884121 (insertStrictlySorted!620 (t!51840 (t!51840 l!1251)) newKey!123 newValue!123))))

(declare-fun b!1583881 () Bool)

(assert (=> b!1583881 (= e!884119 e!884118)))

(assert (=> b!1583881 (= c!146798 (and (is-Cons!36922 (t!51840 l!1251)) (= (_1!12901 (h!38465 (t!51840 l!1251))) newKey!123)))))

(assert (= (and d!167309 c!146797) b!1583878))

(assert (= (and d!167309 (not c!146797)) b!1583881))

(assert (= (and b!1583881 c!146798) b!1583875))

(assert (= (and b!1583881 (not c!146798)) b!1583874))

(assert (= (and b!1583874 c!146795) b!1583879))

(assert (= (and b!1583874 (not c!146795)) b!1583876))

(assert (= (or b!1583879 b!1583876) bm!72511))

(assert (= (or b!1583875 bm!72511) bm!72510))

(assert (= (or b!1583878 bm!72510) bm!72512))

(assert (= (and bm!72512 c!146796) b!1583880))

(assert (= (and bm!72512 (not c!146796)) b!1583873))

(assert (= (and d!167309 res!1081891) b!1583872))

(assert (= (and b!1583872 res!1081892) b!1583877))

(declare-fun m!1453513 () Bool)

(assert (=> d!167309 m!1453513))

(assert (=> d!167309 m!1453403))

(declare-fun m!1453515 () Bool)

(assert (=> bm!72512 m!1453515))

(declare-fun m!1453517 () Bool)

(assert (=> b!1583872 m!1453517))

(declare-fun m!1453519 () Bool)

(assert (=> b!1583877 m!1453519))

(declare-fun m!1453521 () Bool)

(assert (=> b!1583880 m!1453521))

(assert (=> b!1583677 d!167309))

(declare-fun d!167311 () Bool)

(assert (=> d!167311 (not (containsKey!988 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123) otherKey!56))))

(declare-fun lt!677226 () Unit!52291)

(declare-fun choose!2108 (List!36926 (_ BitVec 64) B!2888 (_ BitVec 64)) Unit!52291)

(assert (=> d!167311 (= lt!677226 (choose!2108 (t!51840 l!1251) newKey!123 newValue!123 otherKey!56))))

(declare-fun e!884139 () Bool)

(assert (=> d!167311 e!884139))

(declare-fun res!1081917 () Bool)

(assert (=> d!167311 (=> (not res!1081917) (not e!884139))))

(assert (=> d!167311 (= res!1081917 (isStrictlySorted!1154 (t!51840 l!1251)))))

(assert (=> d!167311 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysNotContained!7 (t!51840 l!1251) newKey!123 newValue!123 otherKey!56) lt!677226)))

(declare-fun b!1583906 () Bool)

(declare-fun res!1081918 () Bool)

(assert (=> b!1583906 (=> (not res!1081918) (not e!884139))))

(assert (=> b!1583906 (= res!1081918 (not (containsKey!988 (t!51840 l!1251) otherKey!56)))))

(declare-fun b!1583907 () Bool)

(assert (=> b!1583907 (= e!884139 (not (= otherKey!56 newKey!123)))))

(assert (= (and d!167311 res!1081917) b!1583906))

(assert (= (and b!1583906 res!1081918) b!1583907))

(assert (=> d!167311 m!1453411))

(assert (=> d!167311 m!1453411))

(assert (=> d!167311 m!1453413))

(declare-fun m!1453535 () Bool)

(assert (=> d!167311 m!1453535))

(assert (=> d!167311 m!1453403))

(assert (=> b!1583906 m!1453417))

(assert (=> b!1583677 d!167311))

(declare-fun d!167321 () Bool)

(declare-fun res!1081919 () Bool)

(declare-fun e!884144 () Bool)

(assert (=> d!167321 (=> res!1081919 e!884144)))

(assert (=> d!167321 (= res!1081919 (and (is-Cons!36922 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123)) (= (_1!12901 (h!38465 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(assert (=> d!167321 (= (containsKey!988 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123) otherKey!56) e!884144)))

(declare-fun b!1583916 () Bool)

(declare-fun e!884145 () Bool)

(assert (=> b!1583916 (= e!884144 e!884145)))

(declare-fun res!1081920 () Bool)

(assert (=> b!1583916 (=> (not res!1081920) (not e!884145))))

(assert (=> b!1583916 (= res!1081920 (and (or (not (is-Cons!36922 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123))) (bvsle (_1!12901 (h!38465 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123))) otherKey!56)) (is-Cons!36922 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123)) (bvslt (_1!12901 (h!38465 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123))) otherKey!56)))))

(declare-fun b!1583917 () Bool)

(assert (=> b!1583917 (= e!884145 (containsKey!988 (t!51840 (insertStrictlySorted!620 (t!51840 l!1251) newKey!123 newValue!123)) otherKey!56))))

(assert (= (and d!167321 (not res!1081919)) b!1583916))

(assert (= (and b!1583916 res!1081920) b!1583917))

(declare-fun m!1453537 () Bool)

(assert (=> b!1583917 m!1453537))

(assert (=> b!1583677 d!167321))

(declare-fun d!167323 () Bool)

(declare-fun res!1081921 () Bool)

(declare-fun e!884148 () Bool)

(assert (=> d!167323 (=> res!1081921 e!884148)))

(assert (=> d!167323 (= res!1081921 (and (is-Cons!36922 (t!51840 l!1251)) (= (_1!12901 (h!38465 (t!51840 l!1251))) otherKey!56)))))

(assert (=> d!167323 (= (containsKey!988 (t!51840 l!1251) otherKey!56) e!884148)))

(declare-fun b!1583920 () Bool)

(declare-fun e!884149 () Bool)

(assert (=> b!1583920 (= e!884148 e!884149)))

(declare-fun res!1081922 () Bool)

(assert (=> b!1583920 (=> (not res!1081922) (not e!884149))))

(assert (=> b!1583920 (= res!1081922 (and (or (not (is-Cons!36922 (t!51840 l!1251))) (bvsle (_1!12901 (h!38465 (t!51840 l!1251))) otherKey!56)) (is-Cons!36922 (t!51840 l!1251)) (bvslt (_1!12901 (h!38465 (t!51840 l!1251))) otherKey!56)))))

(declare-fun b!1583921 () Bool)

(assert (=> b!1583921 (= e!884149 (containsKey!988 (t!51840 (t!51840 l!1251)) otherKey!56))))

(assert (= (and d!167323 (not res!1081921)) b!1583920))

(assert (= (and b!1583920 res!1081922) b!1583921))

(declare-fun m!1453539 () Bool)

(assert (=> b!1583921 m!1453539))

(assert (=> b!1583674 d!167323))

(declare-fun b!1583926 () Bool)

(declare-fun e!884152 () Bool)

(declare-fun tp!115036 () Bool)

(assert (=> b!1583926 (= e!884152 (and tp_is_empty!39421 tp!115036))))

(assert (=> b!1583673 (= tp!115021 e!884152)))

(assert (= (and b!1583673 (is-Cons!36922 (t!51840 l!1251))) b!1583926))

(push 1)

