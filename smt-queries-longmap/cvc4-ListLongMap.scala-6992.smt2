; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88622 () Bool)

(assert start!88622)

(declare-fun res!682915 () Bool)

(declare-fun e!573033 () Bool)

(assert (=> start!88622 (=> (not res!682915) (not e!573033))))

(declare-datatypes ((B!1662 0))(
  ( (B!1663 (val!11915 Int)) )
))
(declare-datatypes ((tuple2!15376 0))(
  ( (tuple2!15377 (_1!7699 (_ BitVec 64)) (_2!7699 B!1662)) )
))
(declare-datatypes ((List!21603 0))(
  ( (Nil!21600) (Cons!21599 (h!22797 tuple2!15376) (t!30604 List!21603)) )
))
(declare-fun l!996 () List!21603)

(declare-fun isStrictlySorted!668 (List!21603) Bool)

(assert (=> start!88622 (= res!682915 (isStrictlySorted!668 l!996))))

(assert (=> start!88622 e!573033))

(declare-fun e!573032 () Bool)

(assert (=> start!88622 e!573032))

(assert (=> start!88622 true))

(declare-fun tp_is_empty!23729 () Bool)

(assert (=> start!88622 tp_is_empty!23729))

(declare-fun b!1018425 () Bool)

(declare-fun res!682916 () Bool)

(assert (=> b!1018425 (=> (not res!682916) (not e!573033))))

(declare-fun key!261 () (_ BitVec 64))

(declare-fun containsKey!528 (List!21603 (_ BitVec 64)) Bool)

(assert (=> b!1018425 (= res!682916 (containsKey!528 l!996 key!261))))

(declare-fun value!172 () B!1662)

(declare-fun lt!449559 () List!21603)

(declare-fun b!1018426 () Bool)

(assert (=> b!1018426 (= e!573033 (and (is-Cons!21599 l!996) (= (_1!7699 (h!22797 l!996)) key!261) (not (= lt!449559 (Cons!21599 (tuple2!15377 key!261 value!172) (t!30604 l!996))))))))

(declare-fun insertStrictlySorted!349 (List!21603 (_ BitVec 64) B!1662) List!21603)

(assert (=> b!1018426 (= lt!449559 (insertStrictlySorted!349 l!996 key!261 value!172))))

(declare-fun b!1018427 () Bool)

(declare-fun tp!71062 () Bool)

(assert (=> b!1018427 (= e!573032 (and tp_is_empty!23729 tp!71062))))

(assert (= (and start!88622 res!682915) b!1018425))

(assert (= (and b!1018425 res!682916) b!1018426))

(assert (= (and start!88622 (is-Cons!21599 l!996)) b!1018427))

(declare-fun m!939313 () Bool)

(assert (=> start!88622 m!939313))

(declare-fun m!939315 () Bool)

(assert (=> b!1018425 m!939315))

(declare-fun m!939317 () Bool)

(assert (=> b!1018426 m!939317))

(push 1)

(assert (not b!1018426))

(assert tp_is_empty!23729)

(assert (not b!1018425))

(assert (not start!88622))

(assert (not b!1018427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1018508 () Bool)

(declare-fun e!573078 () List!21603)

(declare-fun call!42984 () List!21603)

(assert (=> b!1018508 (= e!573078 call!42984)))

(declare-fun b!1018509 () Bool)

(declare-fun c!103176 () Bool)

(assert (=> b!1018509 (= c!103176 (and (is-Cons!21599 l!996) (bvsgt (_1!7699 (h!22797 l!996)) key!261)))))

(declare-fun e!573075 () List!21603)

(assert (=> b!1018509 (= e!573075 e!573078)))

(declare-fun b!1018510 () Bool)

(declare-fun e!573076 () List!21603)

(assert (=> b!1018510 (= e!573076 e!573075)))

(declare-fun c!103174 () Bool)

(assert (=> b!1018510 (= c!103174 (and (is-Cons!21599 l!996) (= (_1!7699 (h!22797 l!996)) key!261)))))

(declare-fun b!1018511 () Bool)

(declare-fun e!573074 () List!21603)

(assert (=> b!1018511 (= e!573074 (ite c!103174 (t!30604 l!996) (ite c!103176 (Cons!21599 (h!22797 l!996) (t!30604 l!996)) Nil!21600)))))

(declare-fun b!1018512 () Bool)

(declare-fun res!682933 () Bool)

(declare-fun e!573077 () Bool)

(assert (=> b!1018512 (=> (not res!682933) (not e!573077))))

(declare-fun lt!449568 () List!21603)

(assert (=> b!1018512 (= res!682933 (containsKey!528 lt!449568 key!261))))

(declare-fun b!1018513 () Bool)

(assert (=> b!1018513 (= e!573074 (insertStrictlySorted!349 (t!30604 l!996) key!261 value!172))))

(declare-fun bm!42979 () Bool)

(declare-fun call!42983 () List!21603)

(assert (=> bm!42979 (= call!42984 call!42983)))

(declare-fun d!121861 () Bool)

(assert (=> d!121861 e!573077))

(declare-fun res!682934 () Bool)

(assert (=> d!121861 (=> (not res!682934) (not e!573077))))

(assert (=> d!121861 (= res!682934 (isStrictlySorted!668 lt!449568))))

(assert (=> d!121861 (= lt!449568 e!573076)))

(declare-fun c!103177 () Bool)

(assert (=> d!121861 (= c!103177 (and (is-Cons!21599 l!996) (bvslt (_1!7699 (h!22797 l!996)) key!261)))))

(assert (=> d!121861 (isStrictlySorted!668 l!996)))

(assert (=> d!121861 (= (insertStrictlySorted!349 l!996 key!261 value!172) lt!449568)))

(declare-fun b!1018514 () Bool)

(assert (=> b!1018514 (= e!573075 call!42983)))

(declare-fun bm!42980 () Bool)

(declare-fun call!42982 () List!21603)

(declare-fun $colon$colon!581 (List!21603 tuple2!15376) List!21603)

(assert (=> bm!42980 (= call!42982 ($colon$colon!581 e!573074 (ite c!103177 (h!22797 l!996) (tuple2!15377 key!261 value!172))))))

(declare-fun c!103175 () Bool)

(assert (=> bm!42980 (= c!103175 c!103177)))

(declare-fun b!1018515 () Bool)

(assert (=> b!1018515 (= e!573076 call!42982)))

(declare-fun b!1018516 () Bool)

(declare-fun contains!5901 (List!21603 tuple2!15376) Bool)

(assert (=> b!1018516 (= e!573077 (contains!5901 lt!449568 (tuple2!15377 key!261 value!172)))))

(declare-fun b!1018517 () Bool)

(assert (=> b!1018517 (= e!573078 call!42984)))

(declare-fun bm!42981 () Bool)

(assert (=> bm!42981 (= call!42983 call!42982)))

(assert (= (and d!121861 c!103177) b!1018515))

(assert (= (and d!121861 (not c!103177)) b!1018510))

(assert (= (and b!1018510 c!103174) b!1018514))

(assert (= (and b!1018510 (not c!103174)) b!1018509))

(assert (= (and b!1018509 c!103176) b!1018508))

(assert (= (and b!1018509 (not c!103176)) b!1018517))

(assert (= (or b!1018508 b!1018517) bm!42979))

(assert (= (or b!1018514 bm!42979) bm!42981))

(assert (= (or b!1018515 bm!42981) bm!42980))

(assert (= (and bm!42980 c!103175) b!1018513))

(assert (= (and bm!42980 (not c!103175)) b!1018511))

(assert (= (and d!121861 res!682934) b!1018512))

(assert (= (and b!1018512 res!682933) b!1018516))

(declare-fun m!939339 () Bool)

(assert (=> b!1018513 m!939339))

(declare-fun m!939341 () Bool)

(assert (=> bm!42980 m!939341))

(declare-fun m!939343 () Bool)

(assert (=> b!1018512 m!939343))

(declare-fun m!939345 () Bool)

(assert (=> b!1018516 m!939345))

(declare-fun m!939347 () Bool)

(assert (=> d!121861 m!939347))

(assert (=> d!121861 m!939313))

(assert (=> b!1018426 d!121861))

(declare-fun d!121867 () Bool)

(declare-fun res!682951 () Bool)

(declare-fun e!573095 () Bool)

(assert (=> d!121867 (=> res!682951 e!573095)))

(assert (=> d!121867 (= res!682951 (and (is-Cons!21599 l!996) (= (_1!7699 (h!22797 l!996)) key!261)))))

(assert (=> d!121867 (= (containsKey!528 l!996 key!261) e!573095)))

(declare-fun b!1018534 () Bool)

(declare-fun e!573096 () Bool)

(assert (=> b!1018534 (= e!573095 e!573096)))

(declare-fun res!682952 () Bool)

(assert (=> b!1018534 (=> (not res!682952) (not e!573096))))

(assert (=> b!1018534 (= res!682952 (and (or (not (is-Cons!21599 l!996)) (bvsle (_1!7699 (h!22797 l!996)) key!261)) (is-Cons!21599 l!996) (bvslt (_1!7699 (h!22797 l!996)) key!261)))))

(declare-fun b!1018535 () Bool)

(assert (=> b!1018535 (= e!573096 (containsKey!528 (t!30604 l!996) key!261))))

(assert (= (and d!121867 (not res!682951)) b!1018534))

(assert (= (and b!1018534 res!682952) b!1018535))

(declare-fun m!939353 () Bool)

(assert (=> b!1018535 m!939353))

(assert (=> b!1018425 d!121867))

(declare-fun d!121873 () Bool)

(declare-fun res!682969 () Bool)

(declare-fun e!573113 () Bool)

(assert (=> d!121873 (=> res!682969 e!573113)))

(assert (=> d!121873 (= res!682969 (or (is-Nil!21600 l!996) (is-Nil!21600 (t!30604 l!996))))))

(assert (=> d!121873 (= (isStrictlySorted!668 l!996) e!573113)))

(declare-fun b!1018556 () Bool)

(declare-fun e!573114 () Bool)

(assert (=> b!1018556 (= e!573113 e!573114)))

(declare-fun res!682970 () Bool)

(assert (=> b!1018556 (=> (not res!682970) (not e!573114))))

(assert (=> b!1018556 (= res!682970 (bvslt (_1!7699 (h!22797 l!996)) (_1!7699 (h!22797 (t!30604 l!996)))))))

(declare-fun b!1018557 () Bool)

(assert (=> b!1018557 (= e!573114 (isStrictlySorted!668 (t!30604 l!996)))))

(assert (= (and d!121873 (not res!682969)) b!1018556))

(assert (= (and b!1018556 res!682970) b!1018557))

(declare-fun m!939359 () Bool)

(assert (=> b!1018557 m!939359))

(assert (=> start!88622 d!121873))

(declare-fun b!1018568 () Bool)

(declare-fun e!573123 () Bool)

(declare-fun tp!71071 () Bool)

(assert (=> b!1018568 (= e!573123 (and tp_is_empty!23729 tp!71071))))

(assert (=> b!1018427 (= tp!71062 e!573123)))

(assert (= (and b!1018427 (is-Cons!21599 (t!30604 l!996))) b!1018568))

(push 1)

(assert (not b!1018512))

(assert tp_is_empty!23729)

(assert (not bm!42980))

(assert (not b!1018568))

(assert (not b!1018535))

(assert (not b!1018513))

(assert (not b!1018557))

(assert (not b!1018516))

(assert (not d!121861))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!121903 () Bool)

(declare-fun res!683003 () Bool)

(declare-fun e!573164 () Bool)

(assert (=> d!121903 (=> res!683003 e!573164)))

(assert (=> d!121903 (= res!683003 (or (is-Nil!21600 (t!30604 l!996)) (is-Nil!21600 (t!30604 (t!30604 l!996)))))))

(assert (=> d!121903 (= (isStrictlySorted!668 (t!30604 l!996)) e!573164)))

(declare-fun b!1018619 () Bool)

(declare-fun e!573165 () Bool)

(assert (=> b!1018619 (= e!573164 e!573165)))

(declare-fun res!683004 () Bool)

(assert (=> b!1018619 (=> (not res!683004) (not e!573165))))

(assert (=> b!1018619 (= res!683004 (bvslt (_1!7699 (h!22797 (t!30604 l!996))) (_1!7699 (h!22797 (t!30604 (t!30604 l!996))))))))

(declare-fun b!1018620 () Bool)

(assert (=> b!1018620 (= e!573165 (isStrictlySorted!668 (t!30604 (t!30604 l!996))))))

(assert (= (and d!121903 (not res!683003)) b!1018619))

(assert (= (and b!1018619 res!683004) b!1018620))

(declare-fun m!939409 () Bool)

(assert (=> b!1018620 m!939409))

(assert (=> b!1018557 d!121903))

(declare-fun d!121905 () Bool)

(declare-fun res!683005 () Bool)

(declare-fun e!573166 () Bool)

(assert (=> d!121905 (=> res!683005 e!573166)))

(assert (=> d!121905 (= res!683005 (or (is-Nil!21600 lt!449568) (is-Nil!21600 (t!30604 lt!449568))))))

(assert (=> d!121905 (= (isStrictlySorted!668 lt!449568) e!573166)))

(declare-fun b!1018621 () Bool)

(declare-fun e!573167 () Bool)

(assert (=> b!1018621 (= e!573166 e!573167)))

(declare-fun res!683006 () Bool)

(assert (=> b!1018621 (=> (not res!683006) (not e!573167))))

(assert (=> b!1018621 (= res!683006 (bvslt (_1!7699 (h!22797 lt!449568)) (_1!7699 (h!22797 (t!30604 lt!449568)))))))

(declare-fun b!1018622 () Bool)

(assert (=> b!1018622 (= e!573167 (isStrictlySorted!668 (t!30604 lt!449568)))))

(assert (= (and d!121905 (not res!683005)) b!1018621))

(assert (= (and b!1018621 res!683006) b!1018622))

(declare-fun m!939411 () Bool)

(assert (=> b!1018622 m!939411))

(assert (=> d!121861 d!121905))

(assert (=> d!121861 d!121873))

(declare-fun d!121907 () Bool)

(declare-fun res!683007 () Bool)

(declare-fun e!573168 () Bool)

(assert (=> d!121907 (=> res!683007 e!573168)))

(assert (=> d!121907 (= res!683007 (and (is-Cons!21599 lt!449568) (= (_1!7699 (h!22797 lt!449568)) key!261)))))

(assert (=> d!121907 (= (containsKey!528 lt!449568 key!261) e!573168)))

(declare-fun b!1018623 () Bool)

(declare-fun e!573169 () Bool)

(assert (=> b!1018623 (= e!573168 e!573169)))

(declare-fun res!683008 () Bool)

(assert (=> b!1018623 (=> (not res!683008) (not e!573169))))

(assert (=> b!1018623 (= res!683008 (and (or (not (is-Cons!21599 lt!449568)) (bvsle (_1!7699 (h!22797 lt!449568)) key!261)) (is-Cons!21599 lt!449568) (bvslt (_1!7699 (h!22797 lt!449568)) key!261)))))

(declare-fun b!1018624 () Bool)

(assert (=> b!1018624 (= e!573169 (containsKey!528 (t!30604 lt!449568) key!261))))

(assert (= (and d!121907 (not res!683007)) b!1018623))

(assert (= (and b!1018623 res!683008) b!1018624))

(declare-fun m!939413 () Bool)

(assert (=> b!1018624 m!939413))

(assert (=> b!1018512 d!121907))

(declare-fun b!1018625 () Bool)

(declare-fun e!573174 () List!21603)

(declare-fun call!42993 () List!21603)

(assert (=> b!1018625 (= e!573174 call!42993)))

(declare-fun b!1018626 () Bool)

(declare-fun c!103188 () Bool)

(assert (=> b!1018626 (= c!103188 (and (is-Cons!21599 (t!30604 l!996)) (bvsgt (_1!7699 (h!22797 (t!30604 l!996))) key!261)))))

(declare-fun e!573171 () List!21603)

(assert (=> b!1018626 (= e!573171 e!573174)))

(declare-fun b!1018627 () Bool)

(declare-fun e!573172 () List!21603)

(assert (=> b!1018627 (= e!573172 e!573171)))

(declare-fun c!103186 () Bool)

(assert (=> b!1018627 (= c!103186 (and (is-Cons!21599 (t!30604 l!996)) (= (_1!7699 (h!22797 (t!30604 l!996))) key!261)))))

(declare-fun e!573170 () List!21603)

(declare-fun b!1018628 () Bool)

(assert (=> b!1018628 (= e!573170 (ite c!103186 (t!30604 (t!30604 l!996)) (ite c!103188 (Cons!21599 (h!22797 (t!30604 l!996)) (t!30604 (t!30604 l!996))) Nil!21600)))))

(declare-fun b!1018629 () Bool)

(declare-fun res!683009 () Bool)

(declare-fun e!573173 () Bool)

(assert (=> b!1018629 (=> (not res!683009) (not e!573173))))

(declare-fun lt!449577 () List!21603)

(assert (=> b!1018629 (= res!683009 (containsKey!528 lt!449577 key!261))))

(declare-fun b!1018630 () Bool)

(assert (=> b!1018630 (= e!573170 (insertStrictlySorted!349 (t!30604 (t!30604 l!996)) key!261 value!172))))

(declare-fun bm!42988 () Bool)

(declare-fun call!42992 () List!21603)

(assert (=> bm!42988 (= call!42993 call!42992)))

(declare-fun d!121909 () Bool)

(assert (=> d!121909 e!573173))

(declare-fun res!683010 () Bool)

(assert (=> d!121909 (=> (not res!683010) (not e!573173))))

(assert (=> d!121909 (= res!683010 (isStrictlySorted!668 lt!449577))))

(assert (=> d!121909 (= lt!449577 e!573172)))

(declare-fun c!103189 () Bool)

(assert (=> d!121909 (= c!103189 (and (is-Cons!21599 (t!30604 l!996)) (bvslt (_1!7699 (h!22797 (t!30604 l!996))) key!261)))))

(assert (=> d!121909 (isStrictlySorted!668 (t!30604 l!996))))

(assert (=> d!121909 (= (insertStrictlySorted!349 (t!30604 l!996) key!261 value!172) lt!449577)))

(declare-fun b!1018631 () Bool)

(assert (=> b!1018631 (= e!573171 call!42992)))

(declare-fun bm!42989 () Bool)

(declare-fun call!42991 () List!21603)

(assert (=> bm!42989 (= call!42991 ($colon$colon!581 e!573170 (ite c!103189 (h!22797 (t!30604 l!996)) (tuple2!15377 key!261 value!172))))))

(declare-fun c!103187 () Bool)

(assert (=> bm!42989 (= c!103187 c!103189)))

(declare-fun b!1018632 () Bool)

(assert (=> b!1018632 (= e!573172 call!42991)))

(declare-fun b!1018633 () Bool)

(assert (=> b!1018633 (= e!573173 (contains!5901 lt!449577 (tuple2!15377 key!261 value!172)))))

(declare-fun b!1018634 () Bool)

(assert (=> b!1018634 (= e!573174 call!42993)))

(declare-fun bm!42990 () Bool)

(assert (=> bm!42990 (= call!42992 call!42991)))

(assert (= (and d!121909 c!103189) b!1018632))

(assert (= (and d!121909 (not c!103189)) b!1018627))

(assert (= (and b!1018627 c!103186) b!1018631))

(assert (= (and b!1018627 (not c!103186)) b!1018626))

(assert (= (and b!1018626 c!103188) b!1018625))

(assert (= (and b!1018626 (not c!103188)) b!1018634))

(assert (= (or b!1018625 b!1018634) bm!42988))

(assert (= (or b!1018631 bm!42988) bm!42990))

(assert (= (or b!1018632 bm!42990) bm!42989))

(assert (= (and bm!42989 c!103187) b!1018630))

(assert (= (and bm!42989 (not c!103187)) b!1018628))

(assert (= (and d!121909 res!683010) b!1018629))

(assert (= (and b!1018629 res!683009) b!1018633))

(declare-fun m!939415 () Bool)

(assert (=> b!1018630 m!939415))

(declare-fun m!939417 () Bool)

(assert (=> bm!42989 m!939417))

(declare-fun m!939419 () Bool)

(assert (=> b!1018629 m!939419))

(declare-fun m!939421 () Bool)

(assert (=> b!1018633 m!939421))

(declare-fun m!939423 () Bool)

(assert (=> d!121909 m!939423))

(assert (=> d!121909 m!939359))

(assert (=> b!1018513 d!121909))

(declare-fun d!121911 () Bool)

(declare-fun res!683011 () Bool)

(declare-fun e!573175 () Bool)

(assert (=> d!121911 (=> res!683011 e!573175)))

(assert (=> d!121911 (= res!683011 (and (is-Cons!21599 (t!30604 l!996)) (= (_1!7699 (h!22797 (t!30604 l!996))) key!261)))))

(assert (=> d!121911 (= (containsKey!528 (t!30604 l!996) key!261) e!573175)))

(declare-fun b!1018635 () Bool)

(declare-fun e!573176 () Bool)

(assert (=> b!1018635 (= e!573175 e!573176)))

(declare-fun res!683012 () Bool)

(assert (=> b!1018635 (=> (not res!683012) (not e!573176))))

(assert (=> b!1018635 (= res!683012 (and (or (not (is-Cons!21599 (t!30604 l!996))) (bvsle (_1!7699 (h!22797 (t!30604 l!996))) key!261)) (is-Cons!21599 (t!30604 l!996)) (bvslt (_1!7699 (h!22797 (t!30604 l!996))) key!261)))))

(declare-fun b!1018636 () Bool)

(assert (=> b!1018636 (= e!573176 (containsKey!528 (t!30604 (t!30604 l!996)) key!261))))

(assert (= (and d!121911 (not res!683011)) b!1018635))

(assert (= (and b!1018635 res!683012) b!1018636))

(declare-fun m!939425 () Bool)

(assert (=> b!1018636 m!939425))

(assert (=> b!1018535 d!121911))

(declare-fun lt!449580 () Bool)

(declare-fun d!121913 () Bool)

(declare-fun content!487 (List!21603) (Set tuple2!15376))

(assert (=> d!121913 (= lt!449580 (member (tuple2!15377 key!261 value!172) (content!487 lt!449568)))))

(declare-fun e!573181 () Bool)

(assert (=> d!121913 (= lt!449580 e!573181)))

(declare-fun res!683017 () Bool)

(assert (=> d!121913 (=> (not res!683017) (not e!573181))))

(assert (=> d!121913 (= res!683017 (is-Cons!21599 lt!449568))))

(assert (=> d!121913 (= (contains!5901 lt!449568 (tuple2!15377 key!261 value!172)) lt!449580)))

(declare-fun b!1018641 () Bool)

(declare-fun e!573182 () Bool)

(assert (=> b!1018641 (= e!573181 e!573182)))

(declare-fun res!683018 () Bool)

(assert (=> b!1018641 (=> res!683018 e!573182)))

(assert (=> b!1018641 (= res!683018 (= (h!22797 lt!449568) (tuple2!15377 key!261 value!172)))))

(declare-fun b!1018642 () Bool)

(assert (=> b!1018642 (= e!573182 (contains!5901 (t!30604 lt!449568) (tuple2!15377 key!261 value!172)))))

(assert (= (and d!121913 res!683017) b!1018641))

(assert (= (and b!1018641 (not res!683018)) b!1018642))

(declare-fun m!939427 () Bool)

(assert (=> d!121913 m!939427))

(declare-fun m!939429 () Bool)

(assert (=> d!121913 m!939429))

(declare-fun m!939431 () Bool)

(assert (=> b!1018642 m!939431))

(assert (=> b!1018516 d!121913))

(declare-fun d!121915 () Bool)

(assert (=> d!121915 (= ($colon$colon!581 e!573074 (ite c!103177 (h!22797 l!996) (tuple2!15377 key!261 value!172))) (Cons!21599 (ite c!103177 (h!22797 l!996) (tuple2!15377 key!261 value!172)) e!573074))))

(assert (=> bm!42980 d!121915))

(declare-fun b!1018643 () Bool)

(declare-fun e!573183 () Bool)

(declare-fun tp!71074 () Bool)

(assert (=> b!1018643 (= e!573183 (and tp_is_empty!23729 tp!71074))))

(assert (=> b!1018568 (= tp!71071 e!573183)))

(assert (= (and b!1018568 (is-Cons!21599 (t!30604 (t!30604 l!996)))) b!1018643))

(push 1)

