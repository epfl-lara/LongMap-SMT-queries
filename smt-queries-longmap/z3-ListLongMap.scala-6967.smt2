; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87954 () Bool)

(assert start!87954)

(declare-fun b!1015657 () Bool)

(assert (=> b!1015657 true))

(assert (=> b!1015657 true))

(declare-fun bs!29437 () Bool)

(declare-fun b!1015655 () Bool)

(assert (= bs!29437 (and b!1015655 b!1015657)))

(declare-fun lambda!954 () Int)

(declare-fun lambda!955 () Int)

(declare-datatypes ((B!1508 0))(
  ( (B!1509 (val!11838 Int)) )
))
(declare-datatypes ((tuple2!15302 0))(
  ( (tuple2!15303 (_1!7662 (_ BitVec 64)) (_2!7662 B!1508)) )
))
(declare-datatypes ((List!21534 0))(
  ( (Nil!21531) (Cons!21530 (h!22728 tuple2!15302) (t!30526 List!21534)) )
))
(declare-fun l!1114 () List!21534)

(declare-fun lt!448996 () List!21534)

(assert (=> bs!29437 (= (= lt!448996 l!1114) (= lambda!955 lambda!954))))

(assert (=> b!1015655 true))

(assert (=> b!1015655 true))

(declare-fun b!1015654 () Bool)

(declare-fun res!681286 () Bool)

(declare-fun e!571341 () Bool)

(assert (=> b!1015654 (=> (not res!681286) (not e!571341))))

(declare-fun isEmpty!871 (List!21534) Bool)

(assert (=> b!1015654 (= res!681286 (not (isEmpty!871 l!1114)))))

(declare-fun b!1015656 () Bool)

(declare-fun e!571342 () Bool)

(assert (=> b!1015656 (= e!571341 (not e!571342))))

(declare-fun res!681289 () Bool)

(assert (=> b!1015656 (=> res!681289 e!571342)))

(declare-datatypes ((List!21535 0))(
  ( (Nil!21532) (Cons!21531 (h!22729 (_ BitVec 64)) (t!30527 List!21535)) )
))
(declare-fun keys!40 () List!21535)

(declare-fun forall!272 (List!21535 Int) Bool)

(assert (=> b!1015656 (= res!681289 (not (forall!272 (t!30527 keys!40) lambda!954)))))

(declare-datatypes ((Option!596 0))(
  ( (Some!595 (v!14443 B!1508)) (None!594) )
))
(declare-fun isDefined!398 (Option!596) Bool)

(declare-fun getValueByKey!545 (List!21534 (_ BitVec 64)) Option!596)

(assert (=> b!1015656 (isDefined!398 (getValueByKey!545 lt!448996 (h!22729 keys!40)))))

(declare-datatypes ((Unit!33135 0))(
  ( (Unit!33136) )
))
(declare-fun lt!448993 () Unit!33135)

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!379 (List!21534 (_ BitVec 64)) Unit!33135)

(assert (=> b!1015656 (= lt!448993 (lemmaContainsKeyImpliesGetValueByKeyDefined!379 lt!448996 (h!22729 keys!40)))))

(declare-fun newHead!31 () tuple2!15302)

(assert (=> b!1015656 (= lt!448996 (Cons!21530 newHead!31 l!1114))))

(declare-fun containsKey!487 (List!21534 (_ BitVec 64)) Bool)

(assert (=> b!1015656 (containsKey!487 l!1114 (h!22729 keys!40))))

(declare-fun lt!448994 () Unit!33135)

(declare-fun lemmaGetValueByKeyIsDefinedImpliesContainsKey!7 (List!21534 (_ BitVec 64)) Unit!33135)

(assert (=> b!1015656 (= lt!448994 (lemmaGetValueByKeyIsDefinedImpliesContainsKey!7 l!1114 (h!22729 keys!40)))))

(declare-fun res!681285 () Bool)

(assert (=> b!1015657 (=> (not res!681285) (not e!571341))))

(assert (=> b!1015657 (= res!681285 (forall!272 keys!40 lambda!954))))

(declare-fun b!1015658 () Bool)

(declare-fun res!681287 () Bool)

(assert (=> b!1015658 (=> (not res!681287) (not e!571341))))

(get-info :version)

(assert (=> b!1015658 (= res!681287 ((_ is Cons!21531) keys!40))))

(declare-fun b!1015659 () Bool)

(declare-fun res!681288 () Bool)

(assert (=> b!1015659 (=> (not res!681288) (not e!571341))))

(declare-fun head!954 (List!21534) tuple2!15302)

(assert (=> b!1015659 (= res!681288 (bvslt (_1!7662 newHead!31) (_1!7662 (head!954 l!1114))))))

(declare-fun b!1015660 () Bool)

(declare-fun e!571343 () Bool)

(declare-fun tp_is_empty!23575 () Bool)

(declare-fun tp!70701 () Bool)

(assert (=> b!1015660 (= e!571343 (and tp_is_empty!23575 tp!70701))))

(declare-fun isStrictlySorted!602 (List!21534) Bool)

(assert (=> b!1015655 (= e!571342 (isStrictlySorted!602 lt!448996))))

(assert (=> b!1015655 (forall!272 (t!30527 keys!40) lambda!955)))

(declare-fun value!178 () B!1508)

(declare-fun lt!448995 () Unit!33135)

(declare-fun lemmaForallGetValueByKeySameWithASmallerHead!51 (List!21534 List!21535 B!1508 tuple2!15302) Unit!33135)

(assert (=> b!1015655 (= lt!448995 (lemmaForallGetValueByKeySameWithASmallerHead!51 l!1114 (t!30527 keys!40) value!178 newHead!31))))

(declare-fun res!681290 () Bool)

(assert (=> start!87954 (=> (not res!681290) (not e!571341))))

(assert (=> start!87954 (= res!681290 (isStrictlySorted!602 l!1114))))

(assert (=> start!87954 e!571341))

(assert (=> start!87954 e!571343))

(assert (=> start!87954 true))

(assert (=> start!87954 tp_is_empty!23575))

(assert (= (and start!87954 res!681290) b!1015654))

(assert (= (and b!1015654 res!681286) b!1015657))

(assert (= (and b!1015657 res!681285) b!1015659))

(assert (= (and b!1015659 res!681288) b!1015658))

(assert (= (and b!1015658 res!681287) b!1015656))

(assert (= (and b!1015656 (not res!681289)) b!1015655))

(assert (= (and start!87954 ((_ is Cons!21530) l!1114)) b!1015660))

(declare-fun m!937093 () Bool)

(assert (=> start!87954 m!937093))

(declare-fun m!937095 () Bool)

(assert (=> b!1015655 m!937095))

(declare-fun m!937097 () Bool)

(assert (=> b!1015655 m!937097))

(declare-fun m!937099 () Bool)

(assert (=> b!1015655 m!937099))

(declare-fun m!937101 () Bool)

(assert (=> b!1015654 m!937101))

(declare-fun m!937103 () Bool)

(assert (=> b!1015657 m!937103))

(declare-fun m!937105 () Bool)

(assert (=> b!1015659 m!937105))

(declare-fun m!937107 () Bool)

(assert (=> b!1015656 m!937107))

(declare-fun m!937109 () Bool)

(assert (=> b!1015656 m!937109))

(declare-fun m!937111 () Bool)

(assert (=> b!1015656 m!937111))

(declare-fun m!937113 () Bool)

(assert (=> b!1015656 m!937113))

(declare-fun m!937115 () Bool)

(assert (=> b!1015656 m!937115))

(assert (=> b!1015656 m!937111))

(declare-fun m!937117 () Bool)

(assert (=> b!1015656 m!937117))

(check-sat (not b!1015659) (not b!1015660) (not start!87954) (not b!1015654) (not b!1015657) tp_is_empty!23575 (not b!1015655) (not b!1015656))
(check-sat)
(get-model)

(declare-fun d!120877 () Bool)

(declare-fun res!681331 () Bool)

(declare-fun e!571366 () Bool)

(assert (=> d!120877 (=> res!681331 e!571366)))

(assert (=> d!120877 (= res!681331 (and ((_ is Cons!21530) l!1114) (= (_1!7662 (h!22728 l!1114)) (h!22729 keys!40))))))

(assert (=> d!120877 (= (containsKey!487 l!1114 (h!22729 keys!40)) e!571366)))

(declare-fun b!1015719 () Bool)

(declare-fun e!571367 () Bool)

(assert (=> b!1015719 (= e!571366 e!571367)))

(declare-fun res!681332 () Bool)

(assert (=> b!1015719 (=> (not res!681332) (not e!571367))))

(assert (=> b!1015719 (= res!681332 (and (or (not ((_ is Cons!21530) l!1114)) (bvsle (_1!7662 (h!22728 l!1114)) (h!22729 keys!40))) ((_ is Cons!21530) l!1114) (bvslt (_1!7662 (h!22728 l!1114)) (h!22729 keys!40))))))

(declare-fun b!1015720 () Bool)

(assert (=> b!1015720 (= e!571367 (containsKey!487 (t!30526 l!1114) (h!22729 keys!40)))))

(assert (= (and d!120877 (not res!681331)) b!1015719))

(assert (= (and b!1015719 res!681332) b!1015720))

(declare-fun m!937171 () Bool)

(assert (=> b!1015720 m!937171))

(assert (=> b!1015656 d!120877))

(declare-fun d!120879 () Bool)

(declare-fun res!681337 () Bool)

(declare-fun e!571372 () Bool)

(assert (=> d!120879 (=> res!681337 e!571372)))

(assert (=> d!120879 (= res!681337 ((_ is Nil!21532) (t!30527 keys!40)))))

(assert (=> d!120879 (= (forall!272 (t!30527 keys!40) lambda!954) e!571372)))

(declare-fun b!1015725 () Bool)

(declare-fun e!571373 () Bool)

(assert (=> b!1015725 (= e!571372 e!571373)))

(declare-fun res!681338 () Bool)

(assert (=> b!1015725 (=> (not res!681338) (not e!571373))))

(declare-fun dynLambda!1897 (Int (_ BitVec 64)) Bool)

(assert (=> b!1015725 (= res!681338 (dynLambda!1897 lambda!954 (h!22729 (t!30527 keys!40))))))

(declare-fun b!1015726 () Bool)

(assert (=> b!1015726 (= e!571373 (forall!272 (t!30527 (t!30527 keys!40)) lambda!954))))

(assert (= (and d!120879 (not res!681337)) b!1015725))

(assert (= (and b!1015725 res!681338) b!1015726))

(declare-fun b_lambda!15421 () Bool)

(assert (=> (not b_lambda!15421) (not b!1015725)))

(declare-fun m!937173 () Bool)

(assert (=> b!1015725 m!937173))

(declare-fun m!937175 () Bool)

(assert (=> b!1015726 m!937175))

(assert (=> b!1015656 d!120879))

(declare-fun d!120883 () Bool)

(assert (=> d!120883 (isDefined!398 (getValueByKey!545 lt!448996 (h!22729 keys!40)))))

(declare-fun lt!449023 () Unit!33135)

(declare-fun choose!1649 (List!21534 (_ BitVec 64)) Unit!33135)

(assert (=> d!120883 (= lt!449023 (choose!1649 lt!448996 (h!22729 keys!40)))))

(declare-fun e!571382 () Bool)

(assert (=> d!120883 e!571382))

(declare-fun res!681347 () Bool)

(assert (=> d!120883 (=> (not res!681347) (not e!571382))))

(assert (=> d!120883 (= res!681347 (isStrictlySorted!602 lt!448996))))

(assert (=> d!120883 (= (lemmaContainsKeyImpliesGetValueByKeyDefined!379 lt!448996 (h!22729 keys!40)) lt!449023)))

(declare-fun b!1015735 () Bool)

(assert (=> b!1015735 (= e!571382 (containsKey!487 lt!448996 (h!22729 keys!40)))))

(assert (= (and d!120883 res!681347) b!1015735))

(assert (=> d!120883 m!937111))

(assert (=> d!120883 m!937111))

(assert (=> d!120883 m!937113))

(declare-fun m!937179 () Bool)

(assert (=> d!120883 m!937179))

(assert (=> d!120883 m!937095))

(declare-fun m!937181 () Bool)

(assert (=> b!1015735 m!937181))

(assert (=> b!1015656 d!120883))

(declare-fun b!1015756 () Bool)

(declare-fun e!571398 () Option!596)

(assert (=> b!1015756 (= e!571398 (getValueByKey!545 (t!30526 lt!448996) (h!22729 keys!40)))))

(declare-fun d!120887 () Bool)

(declare-fun c!102864 () Bool)

(assert (=> d!120887 (= c!102864 (and ((_ is Cons!21530) lt!448996) (= (_1!7662 (h!22728 lt!448996)) (h!22729 keys!40))))))

(declare-fun e!571397 () Option!596)

(assert (=> d!120887 (= (getValueByKey!545 lt!448996 (h!22729 keys!40)) e!571397)))

(declare-fun b!1015754 () Bool)

(assert (=> b!1015754 (= e!571397 (Some!595 (_2!7662 (h!22728 lt!448996))))))

(declare-fun b!1015755 () Bool)

(assert (=> b!1015755 (= e!571397 e!571398)))

(declare-fun c!102865 () Bool)

(assert (=> b!1015755 (= c!102865 (and ((_ is Cons!21530) lt!448996) (not (= (_1!7662 (h!22728 lt!448996)) (h!22729 keys!40)))))))

(declare-fun b!1015757 () Bool)

(assert (=> b!1015757 (= e!571398 None!594)))

(assert (= (and d!120887 c!102864) b!1015754))

(assert (= (and d!120887 (not c!102864)) b!1015755))

(assert (= (and b!1015755 c!102865) b!1015756))

(assert (= (and b!1015755 (not c!102865)) b!1015757))

(declare-fun m!937185 () Bool)

(assert (=> b!1015756 m!937185))

(assert (=> b!1015656 d!120887))

(declare-fun d!120895 () Bool)

(assert (=> d!120895 (containsKey!487 l!1114 (h!22729 keys!40))))

(declare-fun lt!449029 () Unit!33135)

(declare-fun choose!1651 (List!21534 (_ BitVec 64)) Unit!33135)

(assert (=> d!120895 (= lt!449029 (choose!1651 l!1114 (h!22729 keys!40)))))

(declare-fun e!571414 () Bool)

(assert (=> d!120895 e!571414))

(declare-fun res!681373 () Bool)

(assert (=> d!120895 (=> (not res!681373) (not e!571414))))

(assert (=> d!120895 (= res!681373 (isStrictlySorted!602 l!1114))))

(assert (=> d!120895 (= (lemmaGetValueByKeyIsDefinedImpliesContainsKey!7 l!1114 (h!22729 keys!40)) lt!449029)))

(declare-fun b!1015773 () Bool)

(assert (=> b!1015773 (= e!571414 (isDefined!398 (getValueByKey!545 l!1114 (h!22729 keys!40))))))

(assert (= (and d!120895 res!681373) b!1015773))

(assert (=> d!120895 m!937109))

(declare-fun m!937193 () Bool)

(assert (=> d!120895 m!937193))

(assert (=> d!120895 m!937093))

(declare-fun m!937195 () Bool)

(assert (=> b!1015773 m!937195))

(assert (=> b!1015773 m!937195))

(declare-fun m!937197 () Bool)

(assert (=> b!1015773 m!937197))

(assert (=> b!1015656 d!120895))

(declare-fun d!120901 () Bool)

(declare-fun isEmpty!874 (Option!596) Bool)

(assert (=> d!120901 (= (isDefined!398 (getValueByKey!545 lt!448996 (h!22729 keys!40))) (not (isEmpty!874 (getValueByKey!545 lt!448996 (h!22729 keys!40)))))))

(declare-fun bs!29440 () Bool)

(assert (= bs!29440 d!120901))

(assert (=> bs!29440 m!937111))

(declare-fun m!937201 () Bool)

(assert (=> bs!29440 m!937201))

(assert (=> b!1015656 d!120901))

(declare-fun d!120905 () Bool)

(declare-fun res!681386 () Bool)

(declare-fun e!571429 () Bool)

(assert (=> d!120905 (=> res!681386 e!571429)))

(assert (=> d!120905 (= res!681386 (or ((_ is Nil!21531) lt!448996) ((_ is Nil!21531) (t!30526 lt!448996))))))

(assert (=> d!120905 (= (isStrictlySorted!602 lt!448996) e!571429)))

(declare-fun b!1015790 () Bool)

(declare-fun e!571430 () Bool)

(assert (=> b!1015790 (= e!571429 e!571430)))

(declare-fun res!681387 () Bool)

(assert (=> b!1015790 (=> (not res!681387) (not e!571430))))

(assert (=> b!1015790 (= res!681387 (bvslt (_1!7662 (h!22728 lt!448996)) (_1!7662 (h!22728 (t!30526 lt!448996)))))))

(declare-fun b!1015791 () Bool)

(assert (=> b!1015791 (= e!571430 (isStrictlySorted!602 (t!30526 lt!448996)))))

(assert (= (and d!120905 (not res!681386)) b!1015790))

(assert (= (and b!1015790 res!681387) b!1015791))

(declare-fun m!937215 () Bool)

(assert (=> b!1015791 m!937215))

(assert (=> b!1015655 d!120905))

(declare-fun d!120915 () Bool)

(declare-fun res!681388 () Bool)

(declare-fun e!571433 () Bool)

(assert (=> d!120915 (=> res!681388 e!571433)))

(assert (=> d!120915 (= res!681388 ((_ is Nil!21532) (t!30527 keys!40)))))

(assert (=> d!120915 (= (forall!272 (t!30527 keys!40) lambda!955) e!571433)))

(declare-fun b!1015796 () Bool)

(declare-fun e!571434 () Bool)

(assert (=> b!1015796 (= e!571433 e!571434)))

(declare-fun res!681389 () Bool)

(assert (=> b!1015796 (=> (not res!681389) (not e!571434))))

(assert (=> b!1015796 (= res!681389 (dynLambda!1897 lambda!955 (h!22729 (t!30527 keys!40))))))

(declare-fun b!1015797 () Bool)

(assert (=> b!1015797 (= e!571434 (forall!272 (t!30527 (t!30527 keys!40)) lambda!955))))

(assert (= (and d!120915 (not res!681388)) b!1015796))

(assert (= (and b!1015796 res!681389) b!1015797))

(declare-fun b_lambda!15429 () Bool)

(assert (=> (not b_lambda!15429) (not b!1015796)))

(declare-fun m!937217 () Bool)

(assert (=> b!1015796 m!937217))

(declare-fun m!937219 () Bool)

(assert (=> b!1015797 m!937219))

(assert (=> b!1015655 d!120915))

(declare-fun bs!29447 () Bool)

(declare-fun b!1015827 () Bool)

(assert (= bs!29447 (and b!1015827 b!1015657)))

(declare-fun lambda!982 () Int)

(assert (=> bs!29447 (= lambda!982 lambda!954)))

(declare-fun bs!29448 () Bool)

(assert (= bs!29448 (and b!1015827 b!1015655)))

(assert (=> bs!29448 (= (= l!1114 lt!448996) (= lambda!982 lambda!955))))

(assert (=> b!1015827 true))

(assert (=> b!1015827 true))

(declare-fun bs!29449 () Bool)

(declare-fun d!120917 () Bool)

(assert (= bs!29449 (and d!120917 b!1015657)))

(declare-fun lambda!983 () Int)

(assert (=> bs!29449 (= (= (Cons!21530 newHead!31 l!1114) l!1114) (= lambda!983 lambda!954))))

(declare-fun bs!29450 () Bool)

(assert (= bs!29450 (and d!120917 b!1015655)))

(assert (=> bs!29450 (= (= (Cons!21530 newHead!31 l!1114) lt!448996) (= lambda!983 lambda!955))))

(declare-fun bs!29451 () Bool)

(assert (= bs!29451 (and d!120917 b!1015827)))

(assert (=> bs!29451 (= (= (Cons!21530 newHead!31 l!1114) l!1114) (= lambda!983 lambda!982))))

(assert (=> d!120917 true))

(assert (=> d!120917 true))

(assert (=> d!120917 true))

(assert (=> d!120917 (forall!272 (t!30527 keys!40) lambda!983)))

(declare-fun lt!449038 () Unit!33135)

(declare-fun choose!1653 (List!21534 List!21535 B!1508 tuple2!15302) Unit!33135)

(assert (=> d!120917 (= lt!449038 (choose!1653 l!1114 (t!30527 keys!40) value!178 newHead!31))))

(declare-fun e!571449 () Bool)

(assert (=> d!120917 e!571449))

(declare-fun res!681412 () Bool)

(assert (=> d!120917 (=> (not res!681412) (not e!571449))))

(assert (=> d!120917 (= res!681412 (isStrictlySorted!602 l!1114))))

(assert (=> d!120917 (= (lemmaForallGetValueByKeySameWithASmallerHead!51 l!1114 (t!30527 keys!40) value!178 newHead!31) lt!449038)))

(declare-fun b!1015826 () Bool)

(declare-fun res!681413 () Bool)

(assert (=> b!1015826 (=> (not res!681413) (not e!571449))))

(assert (=> b!1015826 (= res!681413 (not (isEmpty!871 l!1114)))))

(declare-fun res!681414 () Bool)

(assert (=> b!1015827 (=> (not res!681414) (not e!571449))))

(assert (=> b!1015827 (= res!681414 (forall!272 (t!30527 keys!40) lambda!982))))

(declare-fun b!1015828 () Bool)

(assert (=> b!1015828 (= e!571449 (bvslt (_1!7662 newHead!31) (_1!7662 (head!954 l!1114))))))

(assert (= (and d!120917 res!681412) b!1015826))

(assert (= (and b!1015826 res!681413) b!1015827))

(assert (= (and b!1015827 res!681414) b!1015828))

(declare-fun m!937241 () Bool)

(assert (=> d!120917 m!937241))

(declare-fun m!937243 () Bool)

(assert (=> d!120917 m!937243))

(assert (=> d!120917 m!937093))

(assert (=> b!1015826 m!937101))

(declare-fun m!937245 () Bool)

(assert (=> b!1015827 m!937245))

(assert (=> b!1015828 m!937105))

(assert (=> b!1015655 d!120917))

(declare-fun d!120933 () Bool)

(assert (=> d!120933 (= (isEmpty!871 l!1114) ((_ is Nil!21531) l!1114))))

(assert (=> b!1015654 d!120933))

(declare-fun d!120935 () Bool)

(assert (=> d!120935 (= (head!954 l!1114) (h!22728 l!1114))))

(assert (=> b!1015659 d!120935))

(declare-fun d!120937 () Bool)

(declare-fun res!681425 () Bool)

(declare-fun e!571456 () Bool)

(assert (=> d!120937 (=> res!681425 e!571456)))

(assert (=> d!120937 (= res!681425 (or ((_ is Nil!21531) l!1114) ((_ is Nil!21531) (t!30526 l!1114))))))

(assert (=> d!120937 (= (isStrictlySorted!602 l!1114) e!571456)))

(declare-fun b!1015841 () Bool)

(declare-fun e!571457 () Bool)

(assert (=> b!1015841 (= e!571456 e!571457)))

(declare-fun res!681426 () Bool)

(assert (=> b!1015841 (=> (not res!681426) (not e!571457))))

(assert (=> b!1015841 (= res!681426 (bvslt (_1!7662 (h!22728 l!1114)) (_1!7662 (h!22728 (t!30526 l!1114)))))))

(declare-fun b!1015842 () Bool)

(assert (=> b!1015842 (= e!571457 (isStrictlySorted!602 (t!30526 l!1114)))))

(assert (= (and d!120937 (not res!681425)) b!1015841))

(assert (= (and b!1015841 res!681426) b!1015842))

(declare-fun m!937247 () Bool)

(assert (=> b!1015842 m!937247))

(assert (=> start!87954 d!120937))

(declare-fun d!120939 () Bool)

(declare-fun res!681429 () Bool)

(declare-fun e!571460 () Bool)

(assert (=> d!120939 (=> res!681429 e!571460)))

(assert (=> d!120939 (= res!681429 ((_ is Nil!21532) keys!40))))

(assert (=> d!120939 (= (forall!272 keys!40 lambda!954) e!571460)))

(declare-fun b!1015845 () Bool)

(declare-fun e!571461 () Bool)

(assert (=> b!1015845 (= e!571460 e!571461)))

(declare-fun res!681430 () Bool)

(assert (=> b!1015845 (=> (not res!681430) (not e!571461))))

(assert (=> b!1015845 (= res!681430 (dynLambda!1897 lambda!954 (h!22729 keys!40)))))

(declare-fun b!1015846 () Bool)

(assert (=> b!1015846 (= e!571461 (forall!272 (t!30527 keys!40) lambda!954))))

(assert (= (and d!120939 (not res!681429)) b!1015845))

(assert (= (and b!1015845 res!681430) b!1015846))

(declare-fun b_lambda!15433 () Bool)

(assert (=> (not b_lambda!15433) (not b!1015845)))

(declare-fun m!937251 () Bool)

(assert (=> b!1015845 m!937251))

(assert (=> b!1015846 m!937117))

(assert (=> b!1015657 d!120939))

(declare-fun b!1015853 () Bool)

(declare-fun e!571466 () Bool)

(declare-fun tp!70710 () Bool)

(assert (=> b!1015853 (= e!571466 (and tp_is_empty!23575 tp!70710))))

(assert (=> b!1015660 (= tp!70701 e!571466)))

(assert (= (and b!1015660 ((_ is Cons!21530) (t!30526 l!1114))) b!1015853))

(declare-fun b_lambda!15437 () Bool)

(assert (= b_lambda!15433 (or b!1015657 b_lambda!15437)))

(declare-fun bs!29453 () Bool)

(declare-fun d!120947 () Bool)

(assert (= bs!29453 (and d!120947 b!1015657)))

(assert (=> bs!29453 (= (dynLambda!1897 lambda!954 (h!22729 keys!40)) (= (getValueByKey!545 l!1114 (h!22729 keys!40)) (Some!595 value!178)))))

(assert (=> bs!29453 m!937195))

(assert (=> b!1015845 d!120947))

(declare-fun b_lambda!15439 () Bool)

(assert (= b_lambda!15421 (or b!1015657 b_lambda!15439)))

(declare-fun bs!29454 () Bool)

(declare-fun d!120949 () Bool)

(assert (= bs!29454 (and d!120949 b!1015657)))

(assert (=> bs!29454 (= (dynLambda!1897 lambda!954 (h!22729 (t!30527 keys!40))) (= (getValueByKey!545 l!1114 (h!22729 (t!30527 keys!40))) (Some!595 value!178)))))

(declare-fun m!937259 () Bool)

(assert (=> bs!29454 m!937259))

(assert (=> b!1015725 d!120949))

(declare-fun b_lambda!15441 () Bool)

(assert (= b_lambda!15429 (or b!1015655 b_lambda!15441)))

(declare-fun bs!29455 () Bool)

(declare-fun d!120951 () Bool)

(assert (= bs!29455 (and d!120951 b!1015655)))

(assert (=> bs!29455 (= (dynLambda!1897 lambda!955 (h!22729 (t!30527 keys!40))) (= (getValueByKey!545 lt!448996 (h!22729 (t!30527 keys!40))) (Some!595 value!178)))))

(declare-fun m!937261 () Bool)

(assert (=> bs!29455 m!937261))

(assert (=> b!1015796 d!120951))

(check-sat (not b!1015853) (not bs!29454) (not b!1015827) (not b!1015797) (not b!1015842) (not b_lambda!15437) (not b!1015826) (not d!120895) (not b_lambda!15439) (not b!1015773) tp_is_empty!23575 (not d!120883) (not b!1015735) (not d!120901) (not d!120917) (not bs!29453) (not b!1015756) (not b!1015846) (not b_lambda!15441) (not b!1015828) (not b!1015791) (not bs!29455) (not b!1015726) (not b!1015720))
(check-sat)
