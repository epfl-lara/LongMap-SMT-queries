; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103750 () Bool)

(assert start!103750)

(declare-fun res!828441 () Bool)

(declare-fun e!704057 () Bool)

(assert (=> start!103750 (=> (not res!828441) (not e!704057))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103750 (= res!828441 (not (= key1!25 key2!15)))))

(assert (=> start!103750 e!704057))

(assert (=> start!103750 true))

(declare-fun e!704058 () Bool)

(assert (=> start!103750 e!704058))

(declare-fun tp_is_empty!31289 () Bool)

(assert (=> start!103750 tp_is_empty!31289))

(declare-fun b!1242076 () Bool)

(declare-fun res!828439 () Bool)

(assert (=> b!1242076 (=> (not res!828439) (not e!704057))))

(declare-datatypes ((B!1890 0))(
  ( (B!1891 (val!15707 Int)) )
))
(declare-datatypes ((tuple2!20286 0))(
  ( (tuple2!20287 (_1!10154 (_ BitVec 64)) (_2!10154 B!1890)) )
))
(declare-datatypes ((List!27372 0))(
  ( (Nil!27369) (Cons!27368 (h!28577 tuple2!20286) (t!40835 List!27372)) )
))
(declare-fun l!644 () List!27372)

(declare-fun isStrictlySorted!765 (List!27372) Bool)

(assert (=> b!1242076 (= res!828439 (isStrictlySorted!765 l!644))))

(declare-fun b!1242077 () Bool)

(declare-fun res!828440 () Bool)

(assert (=> b!1242077 (=> (not res!828440) (not e!704057))))

(assert (=> b!1242077 (= res!828440 (isStrictlySorted!765 (t!40835 l!644)))))

(declare-fun b!1242078 () Bool)

(declare-fun res!828442 () Bool)

(assert (=> b!1242078 (=> (not res!828442) (not e!704057))))

(assert (=> b!1242078 (= res!828442 (is-Cons!27368 l!644))))

(declare-fun b!1242079 () Bool)

(declare-fun v1!20 () B!1890)

(declare-fun insertStrictlySorted!439 (List!27372 (_ BitVec 64) B!1890) List!27372)

(declare-fun removeStrictlySorted!132 (List!27372 (_ BitVec 64)) List!27372)

(assert (=> b!1242079 (= e!704057 (not (= (insertStrictlySorted!439 (removeStrictlySorted!132 l!644 key2!15) key1!25 v1!20) (removeStrictlySorted!132 (insertStrictlySorted!439 l!644 key1!25 v1!20) key2!15))))))

(assert (=> b!1242079 (= (insertStrictlySorted!439 (removeStrictlySorted!132 (t!40835 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!132 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41265 0))(
  ( (Unit!41266) )
))
(declare-fun lt!562190 () Unit!41265)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!18 (List!27372 (_ BitVec 64) B!1890 (_ BitVec 64)) Unit!41265)

(assert (=> b!1242079 (= lt!562190 (lemmaInsertAndRemoveStrictlySortedCommutative!18 (t!40835 l!644) key1!25 v1!20 key2!15))))

(declare-fun b!1242080 () Bool)

(declare-fun tp!92750 () Bool)

(assert (=> b!1242080 (= e!704058 (and tp_is_empty!31289 tp!92750))))

(assert (= (and start!103750 res!828441) b!1242076))

(assert (= (and b!1242076 res!828439) b!1242078))

(assert (= (and b!1242078 res!828442) b!1242077))

(assert (= (and b!1242077 res!828440) b!1242079))

(assert (= (and start!103750 (is-Cons!27368 l!644)) b!1242080))

(declare-fun m!1144797 () Bool)

(assert (=> b!1242076 m!1144797))

(declare-fun m!1144799 () Bool)

(assert (=> b!1242077 m!1144799))

(declare-fun m!1144801 () Bool)

(assert (=> b!1242079 m!1144801))

(declare-fun m!1144803 () Bool)

(assert (=> b!1242079 m!1144803))

(assert (=> b!1242079 m!1144801))

(declare-fun m!1144805 () Bool)

(assert (=> b!1242079 m!1144805))

(declare-fun m!1144807 () Bool)

(assert (=> b!1242079 m!1144807))

(declare-fun m!1144809 () Bool)

(assert (=> b!1242079 m!1144809))

(assert (=> b!1242079 m!1144807))

(declare-fun m!1144811 () Bool)

(assert (=> b!1242079 m!1144811))

(declare-fun m!1144813 () Bool)

(assert (=> b!1242079 m!1144813))

(assert (=> b!1242079 m!1144811))

(assert (=> b!1242079 m!1144805))

(declare-fun m!1144815 () Bool)

(assert (=> b!1242079 m!1144815))

(declare-fun m!1144817 () Bool)

(assert (=> b!1242079 m!1144817))

(push 1)

(assert (not b!1242080))

(assert (not b!1242076))

(assert (not b!1242077))

(assert (not b!1242079))

(assert tp_is_empty!31289)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!1242101 () Bool)

(declare-fun e!704072 () List!27372)

(declare-fun e!704073 () List!27372)

(assert (=> b!1242101 (= e!704072 e!704073)))

(declare-fun c!121535 () Bool)

(assert (=> b!1242101 (= c!121535 (and (is-Cons!27368 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)) (not (= (_1!10154 (h!28577 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))) key2!15))))))

(declare-fun b!1242102 () Bool)

(assert (=> b!1242102 (= e!704072 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)))))

(declare-fun b!1242103 () Bool)

(assert (=> b!1242103 (= e!704073 Nil!27369)))

(declare-fun b!1242104 () Bool)

(declare-fun e!704071 () Bool)

(declare-fun lt!562195 () List!27372)

(declare-fun containsKey!613 (List!27372 (_ BitVec 64)) Bool)

(assert (=> b!1242104 (= e!704071 (not (containsKey!613 lt!562195 key2!15)))))

(declare-fun b!1242105 () Bool)

(declare-fun $colon$colon!627 (List!27372 tuple2!20286) List!27372)

(assert (=> b!1242105 (= e!704073 ($colon$colon!627 (removeStrictlySorted!132 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)) key2!15) (h!28577 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))))))

(declare-fun d!136589 () Bool)

(assert (=> d!136589 e!704071))

(declare-fun res!828447 () Bool)

(assert (=> d!136589 (=> (not res!828447) (not e!704071))))

(assert (=> d!136589 (= res!828447 (isStrictlySorted!765 lt!562195))))

(assert (=> d!136589 (= lt!562195 e!704072)))

(declare-fun c!121534 () Bool)

(assert (=> d!136589 (= c!121534 (and (is-Cons!27368 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)) (= (_1!10154 (h!28577 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!136589 (isStrictlySorted!765 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))))

(assert (=> d!136589 (= (removeStrictlySorted!132 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20) key2!15) lt!562195)))

(assert (= (and d!136589 c!121534) b!1242102))

(assert (= (and d!136589 (not c!121534)) b!1242101))

(assert (= (and b!1242101 c!121535) b!1242105))

(assert (= (and b!1242101 (not c!121535)) b!1242103))

(assert (= (and d!136589 res!828447) b!1242104))

(declare-fun m!1144819 () Bool)

(assert (=> b!1242104 m!1144819))

(declare-fun m!1144821 () Bool)

(assert (=> b!1242105 m!1144821))

(assert (=> b!1242105 m!1144821))

(declare-fun m!1144823 () Bool)

(assert (=> b!1242105 m!1144823))

(declare-fun m!1144825 () Bool)

(assert (=> d!136589 m!1144825))

(assert (=> d!136589 m!1144807))

(declare-fun m!1144827 () Bool)

(assert (=> d!136589 m!1144827))

(assert (=> b!1242079 d!136589))

(declare-fun c!121557 () Bool)

(declare-fun call!61288 () List!27372)

(declare-fun bm!61283 () Bool)

(declare-fun e!704105 () List!27372)

(assert (=> bm!61283 (= call!61288 ($colon$colon!627 e!704105 (ite c!121557 (h!28577 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) (tuple2!20287 key1!25 v1!20))))))

(declare-fun c!121554 () Bool)

(assert (=> bm!61283 (= c!121554 c!121557)))

(declare-fun b!1242159 () Bool)

(declare-fun e!704109 () List!27372)

(declare-fun call!61286 () List!27372)

(assert (=> b!1242159 (= e!704109 call!61286)))

(declare-fun b!1242160 () Bool)

(declare-fun e!704107 () List!27372)

(declare-fun call!61287 () List!27372)

(assert (=> b!1242160 (= e!704107 call!61287)))

(declare-fun c!121555 () Bool)

(declare-fun b!1242161 () Bool)

(assert (=> b!1242161 (= c!121555 (and (is-Cons!27368 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) (bvsgt (_1!10154 (h!28577 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) key1!25)))))

(assert (=> b!1242161 (= e!704109 e!704107)))

(declare-fun d!136593 () Bool)

(declare-fun e!704108 () Bool)

(assert (=> d!136593 e!704108))

(declare-fun res!828466 () Bool)

(assert (=> d!136593 (=> (not res!828466) (not e!704108))))

(declare-fun lt!562201 () List!27372)

(assert (=> d!136593 (= res!828466 (isStrictlySorted!765 lt!562201))))

(declare-fun e!704106 () List!27372)

(assert (=> d!136593 (= lt!562201 e!704106)))

(assert (=> d!136593 (= c!121557 (and (is-Cons!27368 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) (bvslt (_1!10154 (h!28577 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) key1!25)))))

(assert (=> d!136593 (isStrictlySorted!765 (removeStrictlySorted!132 (t!40835 l!644) key2!15))))

(assert (=> d!136593 (= (insertStrictlySorted!439 (removeStrictlySorted!132 (t!40835 l!644) key2!15) key1!25 v1!20) lt!562201)))

(declare-fun b!1242162 () Bool)

(assert (=> b!1242162 (= e!704107 call!61287)))

(declare-fun bm!61284 () Bool)

(assert (=> bm!61284 (= call!61286 call!61288)))

(declare-fun b!1242163 () Bool)

(assert (=> b!1242163 (= e!704106 call!61288)))

(declare-fun b!1242164 () Bool)

(assert (=> b!1242164 (= e!704105 (insertStrictlySorted!439 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) key1!25 v1!20))))

(declare-fun b!1242165 () Bool)

(declare-fun c!121556 () Bool)

(assert (=> b!1242165 (= e!704105 (ite c!121556 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) (ite c!121555 (Cons!27368 (h!28577 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) Nil!27369)))))

(declare-fun b!1242166 () Bool)

(assert (=> b!1242166 (= e!704106 e!704109)))

(assert (=> b!1242166 (= c!121556 (and (is-Cons!27368 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) (= (_1!10154 (h!28577 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) key1!25)))))

(declare-fun bm!61285 () Bool)

(assert (=> bm!61285 (= call!61287 call!61286)))

(declare-fun b!1242167 () Bool)

(declare-fun contains!7394 (List!27372 tuple2!20286) Bool)

(assert (=> b!1242167 (= e!704108 (contains!7394 lt!562201 (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242168 () Bool)

(declare-fun res!828465 () Bool)

(assert (=> b!1242168 (=> (not res!828465) (not e!704108))))

(assert (=> b!1242168 (= res!828465 (containsKey!613 lt!562201 key1!25))))

(assert (= (and d!136593 c!121557) b!1242163))

(assert (= (and d!136593 (not c!121557)) b!1242166))

(assert (= (and b!1242166 c!121556) b!1242159))

(assert (= (and b!1242166 (not c!121556)) b!1242161))

(assert (= (and b!1242161 c!121555) b!1242162))

(assert (= (and b!1242161 (not c!121555)) b!1242160))

(assert (= (or b!1242162 b!1242160) bm!61285))

(assert (= (or b!1242159 bm!61285) bm!61284))

(assert (= (or b!1242163 bm!61284) bm!61283))

(assert (= (and bm!61283 c!121554) b!1242164))

(assert (= (and bm!61283 (not c!121554)) b!1242165))

(assert (= (and d!136593 res!828466) b!1242168))

(assert (= (and b!1242168 res!828465) b!1242167))

(declare-fun m!1144841 () Bool)

(assert (=> b!1242164 m!1144841))

(declare-fun m!1144843 () Bool)

(assert (=> bm!61283 m!1144843))

(declare-fun m!1144845 () Bool)

(assert (=> b!1242167 m!1144845))

(declare-fun m!1144847 () Bool)

(assert (=> d!136593 m!1144847))

(assert (=> d!136593 m!1144811))

(declare-fun m!1144849 () Bool)

(assert (=> d!136593 m!1144849))

(declare-fun m!1144851 () Bool)

(assert (=> b!1242168 m!1144851))

(assert (=> b!1242079 d!136593))

(declare-fun call!61294 () List!27372)

(declare-fun c!121565 () Bool)

(declare-fun e!704115 () List!27372)

(declare-fun bm!61289 () Bool)

(assert (=> bm!61289 (= call!61294 ($colon$colon!627 e!704115 (ite c!121565 (h!28577 l!644) (tuple2!20287 key1!25 v1!20))))))

(declare-fun c!121562 () Bool)

(assert (=> bm!61289 (= c!121562 c!121565)))

(declare-fun b!1242179 () Bool)

(declare-fun e!704119 () List!27372)

(declare-fun call!61292 () List!27372)

(assert (=> b!1242179 (= e!704119 call!61292)))

(declare-fun b!1242180 () Bool)

(declare-fun e!704117 () List!27372)

(declare-fun call!61293 () List!27372)

(assert (=> b!1242180 (= e!704117 call!61293)))

(declare-fun b!1242181 () Bool)

(declare-fun c!121563 () Bool)

(assert (=> b!1242181 (= c!121563 (and (is-Cons!27368 l!644) (bvsgt (_1!10154 (h!28577 l!644)) key1!25)))))

(assert (=> b!1242181 (= e!704119 e!704117)))

(declare-fun d!136603 () Bool)

(declare-fun e!704118 () Bool)

(assert (=> d!136603 e!704118))

(declare-fun res!828470 () Bool)

(assert (=> d!136603 (=> (not res!828470) (not e!704118))))

(declare-fun lt!562203 () List!27372)

(assert (=> d!136603 (= res!828470 (isStrictlySorted!765 lt!562203))))

(declare-fun e!704116 () List!27372)

(assert (=> d!136603 (= lt!562203 e!704116)))

(assert (=> d!136603 (= c!121565 (and (is-Cons!27368 l!644) (bvslt (_1!10154 (h!28577 l!644)) key1!25)))))

(assert (=> d!136603 (isStrictlySorted!765 l!644)))

(assert (=> d!136603 (= (insertStrictlySorted!439 l!644 key1!25 v1!20) lt!562203)))

(declare-fun b!1242182 () Bool)

(assert (=> b!1242182 (= e!704117 call!61293)))

(declare-fun bm!61290 () Bool)

(assert (=> bm!61290 (= call!61292 call!61294)))

(declare-fun b!1242183 () Bool)

(assert (=> b!1242183 (= e!704116 call!61294)))

(declare-fun b!1242184 () Bool)

(assert (=> b!1242184 (= e!704115 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))))

(declare-fun b!1242185 () Bool)

(declare-fun c!121564 () Bool)

(assert (=> b!1242185 (= e!704115 (ite c!121564 (t!40835 l!644) (ite c!121563 (Cons!27368 (h!28577 l!644) (t!40835 l!644)) Nil!27369)))))

(declare-fun b!1242186 () Bool)

(assert (=> b!1242186 (= e!704116 e!704119)))

(assert (=> b!1242186 (= c!121564 (and (is-Cons!27368 l!644) (= (_1!10154 (h!28577 l!644)) key1!25)))))

(declare-fun bm!61291 () Bool)

(assert (=> bm!61291 (= call!61293 call!61292)))

(declare-fun b!1242187 () Bool)

(assert (=> b!1242187 (= e!704118 (contains!7394 lt!562203 (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242188 () Bool)

(declare-fun res!828469 () Bool)

(assert (=> b!1242188 (=> (not res!828469) (not e!704118))))

(assert (=> b!1242188 (= res!828469 (containsKey!613 lt!562203 key1!25))))

(assert (= (and d!136603 c!121565) b!1242183))

(assert (= (and d!136603 (not c!121565)) b!1242186))

(assert (= (and b!1242186 c!121564) b!1242179))

(assert (= (and b!1242186 (not c!121564)) b!1242181))

(assert (= (and b!1242181 c!121563) b!1242182))

(assert (= (and b!1242181 (not c!121563)) b!1242180))

(assert (= (or b!1242182 b!1242180) bm!61291))

(assert (= (or b!1242179 bm!61291) bm!61290))

(assert (= (or b!1242183 bm!61290) bm!61289))

(assert (= (and bm!61289 c!121562) b!1242184))

(assert (= (and bm!61289 (not c!121562)) b!1242185))

(assert (= (and d!136603 res!828470) b!1242188))

(assert (= (and b!1242188 res!828469) b!1242187))

(assert (=> b!1242184 m!1144807))

(declare-fun m!1144865 () Bool)

(assert (=> bm!61289 m!1144865))

(declare-fun m!1144867 () Bool)

(assert (=> b!1242187 m!1144867))

(declare-fun m!1144869 () Bool)

(assert (=> d!136603 m!1144869))

(assert (=> d!136603 m!1144797))

(declare-fun m!1144871 () Bool)

(assert (=> b!1242188 m!1144871))

(assert (=> b!1242079 d!136603))

(declare-fun call!61300 () List!27372)

(declare-fun c!121577 () Bool)

(declare-fun e!704129 () List!27372)

(declare-fun bm!61295 () Bool)

(assert (=> bm!61295 (= call!61300 ($colon$colon!627 e!704129 (ite c!121577 (h!28577 (removeStrictlySorted!132 l!644 key2!15)) (tuple2!20287 key1!25 v1!20))))))

(declare-fun c!121574 () Bool)

(assert (=> bm!61295 (= c!121574 c!121577)))

(declare-fun b!1242207 () Bool)

(declare-fun e!704133 () List!27372)

(declare-fun call!61298 () List!27372)

(assert (=> b!1242207 (= e!704133 call!61298)))

(declare-fun b!1242208 () Bool)

(declare-fun e!704131 () List!27372)

(declare-fun call!61299 () List!27372)

(assert (=> b!1242208 (= e!704131 call!61299)))

(declare-fun b!1242209 () Bool)

(declare-fun c!121575 () Bool)

(assert (=> b!1242209 (= c!121575 (and (is-Cons!27368 (removeStrictlySorted!132 l!644 key2!15)) (bvsgt (_1!10154 (h!28577 (removeStrictlySorted!132 l!644 key2!15))) key1!25)))))

(assert (=> b!1242209 (= e!704133 e!704131)))

(declare-fun d!136607 () Bool)

(declare-fun e!704132 () Bool)

(assert (=> d!136607 e!704132))

(declare-fun res!828474 () Bool)

(assert (=> d!136607 (=> (not res!828474) (not e!704132))))

(declare-fun lt!562207 () List!27372)

(assert (=> d!136607 (= res!828474 (isStrictlySorted!765 lt!562207))))

(declare-fun e!704130 () List!27372)

(assert (=> d!136607 (= lt!562207 e!704130)))

(assert (=> d!136607 (= c!121577 (and (is-Cons!27368 (removeStrictlySorted!132 l!644 key2!15)) (bvslt (_1!10154 (h!28577 (removeStrictlySorted!132 l!644 key2!15))) key1!25)))))

(assert (=> d!136607 (isStrictlySorted!765 (removeStrictlySorted!132 l!644 key2!15))))

(assert (=> d!136607 (= (insertStrictlySorted!439 (removeStrictlySorted!132 l!644 key2!15) key1!25 v1!20) lt!562207)))

(declare-fun b!1242210 () Bool)

(assert (=> b!1242210 (= e!704131 call!61299)))

(declare-fun bm!61296 () Bool)

(assert (=> bm!61296 (= call!61298 call!61300)))

(declare-fun b!1242211 () Bool)

(assert (=> b!1242211 (= e!704130 call!61300)))

(declare-fun b!1242212 () Bool)

(assert (=> b!1242212 (= e!704129 (insertStrictlySorted!439 (t!40835 (removeStrictlySorted!132 l!644 key2!15)) key1!25 v1!20))))

(declare-fun c!121576 () Bool)

(declare-fun b!1242213 () Bool)

(assert (=> b!1242213 (= e!704129 (ite c!121576 (t!40835 (removeStrictlySorted!132 l!644 key2!15)) (ite c!121575 (Cons!27368 (h!28577 (removeStrictlySorted!132 l!644 key2!15)) (t!40835 (removeStrictlySorted!132 l!644 key2!15))) Nil!27369)))))

(declare-fun b!1242214 () Bool)

(assert (=> b!1242214 (= e!704130 e!704133)))

(assert (=> b!1242214 (= c!121576 (and (is-Cons!27368 (removeStrictlySorted!132 l!644 key2!15)) (= (_1!10154 (h!28577 (removeStrictlySorted!132 l!644 key2!15))) key1!25)))))

(declare-fun bm!61297 () Bool)

(assert (=> bm!61297 (= call!61299 call!61298)))

(declare-fun b!1242215 () Bool)

(assert (=> b!1242215 (= e!704132 (contains!7394 lt!562207 (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242216 () Bool)

(declare-fun res!828473 () Bool)

(assert (=> b!1242216 (=> (not res!828473) (not e!704132))))

(assert (=> b!1242216 (= res!828473 (containsKey!613 lt!562207 key1!25))))

(assert (= (and d!136607 c!121577) b!1242211))

(assert (= (and d!136607 (not c!121577)) b!1242214))

(assert (= (and b!1242214 c!121576) b!1242207))

(assert (= (and b!1242214 (not c!121576)) b!1242209))

(assert (= (and b!1242209 c!121575) b!1242210))

(assert (= (and b!1242209 (not c!121575)) b!1242208))

(assert (= (or b!1242210 b!1242208) bm!61297))

(assert (= (or b!1242207 bm!61297) bm!61296))

(assert (= (or b!1242211 bm!61296) bm!61295))

(assert (= (and bm!61295 c!121574) b!1242212))

(assert (= (and bm!61295 (not c!121574)) b!1242213))

(assert (= (and d!136607 res!828474) b!1242216))

(assert (= (and b!1242216 res!828473) b!1242215))

(declare-fun m!1144881 () Bool)

(assert (=> b!1242212 m!1144881))

(declare-fun m!1144883 () Bool)

(assert (=> bm!61295 m!1144883))

(declare-fun m!1144885 () Bool)

(assert (=> b!1242215 m!1144885))

(declare-fun m!1144887 () Bool)

(assert (=> d!136607 m!1144887))

(assert (=> d!136607 m!1144801))

(declare-fun m!1144889 () Bool)

(assert (=> d!136607 m!1144889))

(declare-fun m!1144891 () Bool)

(assert (=> b!1242216 m!1144891))

(assert (=> b!1242079 d!136607))

(declare-fun b!1242229 () Bool)

(declare-fun e!704142 () List!27372)

(declare-fun e!704143 () List!27372)

(assert (=> b!1242229 (= e!704142 e!704143)))

(declare-fun c!121583 () Bool)

(assert (=> b!1242229 (= c!121583 (and (is-Cons!27368 l!644) (not (= (_1!10154 (h!28577 l!644)) key2!15))))))

(declare-fun b!1242230 () Bool)

(assert (=> b!1242230 (= e!704142 (t!40835 l!644))))

(declare-fun b!1242231 () Bool)

(assert (=> b!1242231 (= e!704143 Nil!27369)))

(declare-fun b!1242232 () Bool)

(declare-fun e!704141 () Bool)

(declare-fun lt!562209 () List!27372)

(assert (=> b!1242232 (= e!704141 (not (containsKey!613 lt!562209 key2!15)))))

(declare-fun b!1242233 () Bool)

(assert (=> b!1242233 (= e!704143 ($colon$colon!627 (removeStrictlySorted!132 (t!40835 l!644) key2!15) (h!28577 l!644)))))

(declare-fun d!136611 () Bool)

(assert (=> d!136611 e!704141))

(declare-fun res!828479 () Bool)

(assert (=> d!136611 (=> (not res!828479) (not e!704141))))

(assert (=> d!136611 (= res!828479 (isStrictlySorted!765 lt!562209))))

(assert (=> d!136611 (= lt!562209 e!704142)))

(declare-fun c!121582 () Bool)

(assert (=> d!136611 (= c!121582 (and (is-Cons!27368 l!644) (= (_1!10154 (h!28577 l!644)) key2!15)))))

(assert (=> d!136611 (isStrictlySorted!765 l!644)))

(assert (=> d!136611 (= (removeStrictlySorted!132 l!644 key2!15) lt!562209)))

(assert (= (and d!136611 c!121582) b!1242230))

(assert (= (and d!136611 (not c!121582)) b!1242229))

(assert (= (and b!1242229 c!121583) b!1242233))

(assert (= (and b!1242229 (not c!121583)) b!1242231))

(assert (= (and d!136611 res!828479) b!1242232))

(declare-fun m!1144905 () Bool)

(assert (=> b!1242232 m!1144905))

(assert (=> b!1242233 m!1144811))

(assert (=> b!1242233 m!1144811))

(declare-fun m!1144907 () Bool)

(assert (=> b!1242233 m!1144907))

(declare-fun m!1144909 () Bool)

(assert (=> d!136611 m!1144909))

(assert (=> d!136611 m!1144797))

(assert (=> b!1242079 d!136611))

(declare-fun d!136615 () Bool)

(assert (=> d!136615 (= (insertStrictlySorted!439 (removeStrictlySorted!132 (t!40835 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!132 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562216 () Unit!41265)

(declare-fun choose!1842 (List!27372 (_ BitVec 64) B!1890 (_ BitVec 64)) Unit!41265)

(assert (=> d!136615 (= lt!562216 (choose!1842 (t!40835 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!136615 (not (= key1!25 key2!15))))

(assert (=> d!136615 (= (lemmaInsertAndRemoveStrictlySortedCommutative!18 (t!40835 l!644) key1!25 v1!20 key2!15) lt!562216)))

(declare-fun bs!34976 () Bool)

(assert (= bs!34976 d!136615))

(assert (=> bs!34976 m!1144807))

(assert (=> bs!34976 m!1144809))

(assert (=> bs!34976 m!1144807))

(declare-fun m!1144917 () Bool)

(assert (=> bs!34976 m!1144917))

(assert (=> bs!34976 m!1144811))

(assert (=> bs!34976 m!1144811))

(assert (=> bs!34976 m!1144813))

(assert (=> b!1242079 d!136615))

(declare-fun c!121591 () Bool)

(declare-fun call!61306 () List!27372)

(declare-fun bm!61301 () Bool)

(declare-fun e!704150 () List!27372)

(assert (=> bm!61301 (= call!61306 ($colon$colon!627 e!704150 (ite c!121591 (h!28577 (t!40835 l!644)) (tuple2!20287 key1!25 v1!20))))))

(declare-fun c!121588 () Bool)

(assert (=> bm!61301 (= c!121588 c!121591)))

(declare-fun b!1242244 () Bool)

(declare-fun e!704154 () List!27372)

(declare-fun call!61304 () List!27372)

(assert (=> b!1242244 (= e!704154 call!61304)))

(declare-fun b!1242245 () Bool)

(declare-fun e!704152 () List!27372)

(declare-fun call!61305 () List!27372)

(assert (=> b!1242245 (= e!704152 call!61305)))

(declare-fun b!1242246 () Bool)

(declare-fun c!121589 () Bool)

(assert (=> b!1242246 (= c!121589 (and (is-Cons!27368 (t!40835 l!644)) (bvsgt (_1!10154 (h!28577 (t!40835 l!644))) key1!25)))))

(assert (=> b!1242246 (= e!704154 e!704152)))

(declare-fun d!136619 () Bool)

(declare-fun e!704153 () Bool)

(assert (=> d!136619 e!704153))

(declare-fun res!828483 () Bool)

(assert (=> d!136619 (=> (not res!828483) (not e!704153))))

(declare-fun lt!562218 () List!27372)

(assert (=> d!136619 (= res!828483 (isStrictlySorted!765 lt!562218))))

(declare-fun e!704151 () List!27372)

(assert (=> d!136619 (= lt!562218 e!704151)))

(assert (=> d!136619 (= c!121591 (and (is-Cons!27368 (t!40835 l!644)) (bvslt (_1!10154 (h!28577 (t!40835 l!644))) key1!25)))))

(assert (=> d!136619 (isStrictlySorted!765 (t!40835 l!644))))

(assert (=> d!136619 (= (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20) lt!562218)))

(declare-fun b!1242247 () Bool)

(assert (=> b!1242247 (= e!704152 call!61305)))

(declare-fun bm!61302 () Bool)

(assert (=> bm!61302 (= call!61304 call!61306)))

(declare-fun b!1242248 () Bool)

(assert (=> b!1242248 (= e!704151 call!61306)))

(declare-fun b!1242249 () Bool)

(assert (=> b!1242249 (= e!704150 (insertStrictlySorted!439 (t!40835 (t!40835 l!644)) key1!25 v1!20))))

(declare-fun b!1242250 () Bool)

(declare-fun c!121590 () Bool)

(assert (=> b!1242250 (= e!704150 (ite c!121590 (t!40835 (t!40835 l!644)) (ite c!121589 (Cons!27368 (h!28577 (t!40835 l!644)) (t!40835 (t!40835 l!644))) Nil!27369)))))

(declare-fun b!1242251 () Bool)

(assert (=> b!1242251 (= e!704151 e!704154)))

(assert (=> b!1242251 (= c!121590 (and (is-Cons!27368 (t!40835 l!644)) (= (_1!10154 (h!28577 (t!40835 l!644))) key1!25)))))

(declare-fun bm!61303 () Bool)

(assert (=> bm!61303 (= call!61305 call!61304)))

(declare-fun b!1242252 () Bool)

(assert (=> b!1242252 (= e!704153 (contains!7394 lt!562218 (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242253 () Bool)

(declare-fun res!828482 () Bool)

(assert (=> b!1242253 (=> (not res!828482) (not e!704153))))

(assert (=> b!1242253 (= res!828482 (containsKey!613 lt!562218 key1!25))))

(assert (= (and d!136619 c!121591) b!1242248))

(assert (= (and d!136619 (not c!121591)) b!1242251))

(assert (= (and b!1242251 c!121590) b!1242244))

(assert (= (and b!1242251 (not c!121590)) b!1242246))

(assert (= (and b!1242246 c!121589) b!1242247))

(assert (= (and b!1242246 (not c!121589)) b!1242245))

(assert (= (or b!1242247 b!1242245) bm!61303))

(assert (= (or b!1242244 bm!61303) bm!61302))

(assert (= (or b!1242248 bm!61302) bm!61301))

(assert (= (and bm!61301 c!121588) b!1242249))

(assert (= (and bm!61301 (not c!121588)) b!1242250))

(assert (= (and d!136619 res!828483) b!1242253))

(assert (= (and b!1242253 res!828482) b!1242252))

(declare-fun m!1144931 () Bool)

(assert (=> b!1242249 m!1144931))

(declare-fun m!1144933 () Bool)

(assert (=> bm!61301 m!1144933))

(declare-fun m!1144935 () Bool)

(assert (=> b!1242252 m!1144935))

(declare-fun m!1144937 () Bool)

(assert (=> d!136619 m!1144937))

(assert (=> d!136619 m!1144799))

(declare-fun m!1144939 () Bool)

(assert (=> b!1242253 m!1144939))

(assert (=> b!1242079 d!136619))

(declare-fun b!1242264 () Bool)

(declare-fun e!704161 () List!27372)

(declare-fun e!704162 () List!27372)

(assert (=> b!1242264 (= e!704161 e!704162)))

(declare-fun c!121597 () Bool)

(assert (=> b!1242264 (= c!121597 (and (is-Cons!27368 (insertStrictlySorted!439 l!644 key1!25 v1!20)) (not (= (_1!10154 (h!28577 (insertStrictlySorted!439 l!644 key1!25 v1!20))) key2!15))))))

(declare-fun b!1242265 () Bool)

(assert (=> b!1242265 (= e!704161 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20)))))

(declare-fun b!1242266 () Bool)

(assert (=> b!1242266 (= e!704162 Nil!27369)))

(declare-fun b!1242267 () Bool)

(declare-fun e!704160 () Bool)

(declare-fun lt!562220 () List!27372)

(assert (=> b!1242267 (= e!704160 (not (containsKey!613 lt!562220 key2!15)))))

(declare-fun b!1242268 () Bool)

(assert (=> b!1242268 (= e!704162 ($colon$colon!627 (removeStrictlySorted!132 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20)) key2!15) (h!28577 (insertStrictlySorted!439 l!644 key1!25 v1!20))))))

(declare-fun d!136625 () Bool)

(assert (=> d!136625 e!704160))

(declare-fun res!828486 () Bool)

(assert (=> d!136625 (=> (not res!828486) (not e!704160))))

(assert (=> d!136625 (= res!828486 (isStrictlySorted!765 lt!562220))))

(assert (=> d!136625 (= lt!562220 e!704161)))

(declare-fun c!121596 () Bool)

(assert (=> d!136625 (= c!121596 (and (is-Cons!27368 (insertStrictlySorted!439 l!644 key1!25 v1!20)) (= (_1!10154 (h!28577 (insertStrictlySorted!439 l!644 key1!25 v1!20))) key2!15)))))

(assert (=> d!136625 (isStrictlySorted!765 (insertStrictlySorted!439 l!644 key1!25 v1!20))))

(assert (=> d!136625 (= (removeStrictlySorted!132 (insertStrictlySorted!439 l!644 key1!25 v1!20) key2!15) lt!562220)))

(assert (= (and d!136625 c!121596) b!1242265))

(assert (= (and d!136625 (not c!121596)) b!1242264))

(assert (= (and b!1242264 c!121597) b!1242268))

(assert (= (and b!1242264 (not c!121597)) b!1242266))

(assert (= (and d!136625 res!828486) b!1242267))

(declare-fun m!1144951 () Bool)

(assert (=> b!1242267 m!1144951))

(declare-fun m!1144953 () Bool)

(assert (=> b!1242268 m!1144953))

(assert (=> b!1242268 m!1144953))

(declare-fun m!1144955 () Bool)

(assert (=> b!1242268 m!1144955))

(declare-fun m!1144957 () Bool)

(assert (=> d!136625 m!1144957))

(assert (=> d!136625 m!1144805))

(declare-fun m!1144959 () Bool)

(assert (=> d!136625 m!1144959))

(assert (=> b!1242079 d!136625))

(declare-fun b!1242274 () Bool)

(declare-fun e!704167 () List!27372)

(declare-fun e!704168 () List!27372)

(assert (=> b!1242274 (= e!704167 e!704168)))

(declare-fun c!121601 () Bool)

(assert (=> b!1242274 (= c!121601 (and (is-Cons!27368 (t!40835 l!644)) (not (= (_1!10154 (h!28577 (t!40835 l!644))) key2!15))))))

(declare-fun b!1242275 () Bool)

(assert (=> b!1242275 (= e!704167 (t!40835 (t!40835 l!644)))))

(declare-fun b!1242276 () Bool)

(assert (=> b!1242276 (= e!704168 Nil!27369)))

(declare-fun b!1242277 () Bool)

(declare-fun e!704166 () Bool)

(declare-fun lt!562222 () List!27372)

(assert (=> b!1242277 (= e!704166 (not (containsKey!613 lt!562222 key2!15)))))

(declare-fun b!1242278 () Bool)

(assert (=> b!1242278 (= e!704168 ($colon$colon!627 (removeStrictlySorted!132 (t!40835 (t!40835 l!644)) key2!15) (h!28577 (t!40835 l!644))))))

(declare-fun d!136629 () Bool)

(assert (=> d!136629 e!704166))

(declare-fun res!828488 () Bool)

(assert (=> d!136629 (=> (not res!828488) (not e!704166))))

(assert (=> d!136629 (= res!828488 (isStrictlySorted!765 lt!562222))))

(assert (=> d!136629 (= lt!562222 e!704167)))

(declare-fun c!121600 () Bool)

(assert (=> d!136629 (= c!121600 (and (is-Cons!27368 (t!40835 l!644)) (= (_1!10154 (h!28577 (t!40835 l!644))) key2!15)))))

(assert (=> d!136629 (isStrictlySorted!765 (t!40835 l!644))))

(assert (=> d!136629 (= (removeStrictlySorted!132 (t!40835 l!644) key2!15) lt!562222)))

(assert (= (and d!136629 c!121600) b!1242275))

(assert (= (and d!136629 (not c!121600)) b!1242274))

(assert (= (and b!1242274 c!121601) b!1242278))

(assert (= (and b!1242274 (not c!121601)) b!1242276))

(assert (= (and d!136629 res!828488) b!1242277))

(declare-fun m!1144971 () Bool)

(assert (=> b!1242277 m!1144971))

(declare-fun m!1144973 () Bool)

(assert (=> b!1242278 m!1144973))

(assert (=> b!1242278 m!1144973))

(declare-fun m!1144975 () Bool)

(assert (=> b!1242278 m!1144975))

(declare-fun m!1144977 () Bool)

(assert (=> d!136629 m!1144977))

(assert (=> d!136629 m!1144799))

(assert (=> b!1242079 d!136629))

(declare-fun d!136633 () Bool)

(declare-fun res!828498 () Bool)

(declare-fun e!704180 () Bool)

(assert (=> d!136633 (=> res!828498 e!704180)))

(assert (=> d!136633 (= res!828498 (or (is-Nil!27369 l!644) (is-Nil!27369 (t!40835 l!644))))))

(assert (=> d!136633 (= (isStrictlySorted!765 l!644) e!704180)))

(declare-fun b!1242292 () Bool)

(declare-fun e!704181 () Bool)

(assert (=> b!1242292 (= e!704180 e!704181)))

(declare-fun res!828499 () Bool)

(assert (=> b!1242292 (=> (not res!828499) (not e!704181))))

(assert (=> b!1242292 (= res!828499 (bvslt (_1!10154 (h!28577 l!644)) (_1!10154 (h!28577 (t!40835 l!644)))))))

(declare-fun b!1242293 () Bool)

(assert (=> b!1242293 (= e!704181 (isStrictlySorted!765 (t!40835 l!644)))))

(assert (= (and d!136633 (not res!828498)) b!1242292))

(assert (= (and b!1242292 res!828499) b!1242293))

(assert (=> b!1242293 m!1144799))

(assert (=> b!1242076 d!136633))

(declare-fun d!136637 () Bool)

(declare-fun res!828502 () Bool)

(declare-fun e!704184 () Bool)

(assert (=> d!136637 (=> res!828502 e!704184)))

(assert (=> d!136637 (= res!828502 (or (is-Nil!27369 (t!40835 l!644)) (is-Nil!27369 (t!40835 (t!40835 l!644)))))))

(assert (=> d!136637 (= (isStrictlySorted!765 (t!40835 l!644)) e!704184)))

(declare-fun b!1242296 () Bool)

(declare-fun e!704185 () Bool)

(assert (=> b!1242296 (= e!704184 e!704185)))

(declare-fun res!828503 () Bool)

(assert (=> b!1242296 (=> (not res!828503) (not e!704185))))

(assert (=> b!1242296 (= res!828503 (bvslt (_1!10154 (h!28577 (t!40835 l!644))) (_1!10154 (h!28577 (t!40835 (t!40835 l!644))))))))

(declare-fun b!1242297 () Bool)

(assert (=> b!1242297 (= e!704185 (isStrictlySorted!765 (t!40835 (t!40835 l!644))))))

(assert (= (and d!136637 (not res!828502)) b!1242296))

(assert (= (and b!1242296 res!828503) b!1242297))

(declare-fun m!1144989 () Bool)

(assert (=> b!1242297 m!1144989))

(assert (=> b!1242077 d!136637))

(declare-fun b!1242308 () Bool)

(declare-fun e!704192 () Bool)

(declare-fun tp!92755 () Bool)

(assert (=> b!1242308 (= e!704192 (and tp_is_empty!31289 tp!92755))))

(assert (=> b!1242080 (= tp!92750 e!704192)))

(assert (= (and b!1242080 (is-Cons!27368 (t!40835 l!644))) b!1242308))

(push 1)

(assert (not d!136607))

(assert (not bm!61301))

(assert (not b!1242277))

(assert (not b!1242297))

(assert (not b!1242216))

(assert (not d!136629))

(assert (not b!1242249))

(assert (not bm!61295))

(assert (not d!136625))

(assert (not b!1242215))

(assert (not b!1242232))

(assert (not b!1242253))

(assert (not d!136589))

(assert (not bm!61289))

(assert (not b!1242105))

(assert (not b!1242164))

(assert (not b!1242187))

(assert (not b!1242267))

(assert (not b!1242233))

(assert (not d!136619))

(assert (not b!1242168))

(assert (not bm!61283))

(assert (not b!1242293))

(assert (not d!136611))

(assert (not b!1242212))

(assert (not b!1242278))

(assert (not b!1242104))

(assert (not d!136593))

(assert (not b!1242268))

(assert (not b!1242188))

(assert (not b!1242308))

(assert (not b!1242167))

(assert (not d!136603))

(assert (not b!1242252))

(assert (not b!1242184))

(assert (not d!136615))

(assert tp_is_empty!31289)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!136815 () Bool)

(assert (=> d!136815 (= ($colon$colon!627 e!704115 (ite c!121565 (h!28577 l!644) (tuple2!20287 key1!25 v1!20))) (Cons!27368 (ite c!121565 (h!28577 l!644) (tuple2!20287 key1!25 v1!20)) e!704115))))

(assert (=> bm!61289 d!136815))

(declare-fun d!136817 () Bool)

(declare-fun lt!562262 () Bool)

(declare-fun content!604 (List!27372) (Set tuple2!20286))

(assert (=> d!136817 (= lt!562262 (member (tuple2!20287 key1!25 v1!20) (content!604 lt!562207)))))

(declare-fun e!704406 () Bool)

(assert (=> d!136817 (= lt!562262 e!704406)))

(declare-fun res!828660 () Bool)

(assert (=> d!136817 (=> (not res!828660) (not e!704406))))

(assert (=> d!136817 (= res!828660 (is-Cons!27368 lt!562207))))

(assert (=> d!136817 (= (contains!7394 lt!562207 (tuple2!20287 key1!25 v1!20)) lt!562262)))

(declare-fun b!1242602 () Bool)

(declare-fun e!704407 () Bool)

(assert (=> b!1242602 (= e!704406 e!704407)))

(declare-fun res!828659 () Bool)

(assert (=> b!1242602 (=> res!828659 e!704407)))

(assert (=> b!1242602 (= res!828659 (= (h!28577 lt!562207) (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242603 () Bool)

(assert (=> b!1242603 (= e!704407 (contains!7394 (t!40835 lt!562207) (tuple2!20287 key1!25 v1!20)))))

(assert (= (and d!136817 res!828660) b!1242602))

(assert (= (and b!1242602 (not res!828659)) b!1242603))

(declare-fun m!1145299 () Bool)

(assert (=> d!136817 m!1145299))

(declare-fun m!1145301 () Bool)

(assert (=> d!136817 m!1145301))

(declare-fun m!1145303 () Bool)

(assert (=> b!1242603 m!1145303))

(assert (=> b!1242215 d!136817))

(declare-fun d!136819 () Bool)

(declare-fun res!828661 () Bool)

(declare-fun e!704408 () Bool)

(assert (=> d!136819 (=> res!828661 e!704408)))

(assert (=> d!136819 (= res!828661 (or (is-Nil!27369 lt!562220) (is-Nil!27369 (t!40835 lt!562220))))))

(assert (=> d!136819 (= (isStrictlySorted!765 lt!562220) e!704408)))

(declare-fun b!1242604 () Bool)

(declare-fun e!704409 () Bool)

(assert (=> b!1242604 (= e!704408 e!704409)))

(declare-fun res!828662 () Bool)

(assert (=> b!1242604 (=> (not res!828662) (not e!704409))))

(assert (=> b!1242604 (= res!828662 (bvslt (_1!10154 (h!28577 lt!562220)) (_1!10154 (h!28577 (t!40835 lt!562220)))))))

(declare-fun b!1242605 () Bool)

(assert (=> b!1242605 (= e!704409 (isStrictlySorted!765 (t!40835 lt!562220)))))

(assert (= (and d!136819 (not res!828661)) b!1242604))

(assert (= (and b!1242604 res!828662) b!1242605))

(declare-fun m!1145305 () Bool)

(assert (=> b!1242605 m!1145305))

(assert (=> d!136625 d!136819))

(declare-fun d!136821 () Bool)

(declare-fun res!828663 () Bool)

(declare-fun e!704410 () Bool)

(assert (=> d!136821 (=> res!828663 e!704410)))

(assert (=> d!136821 (= res!828663 (or (is-Nil!27369 (insertStrictlySorted!439 l!644 key1!25 v1!20)) (is-Nil!27369 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20)))))))

(assert (=> d!136821 (= (isStrictlySorted!765 (insertStrictlySorted!439 l!644 key1!25 v1!20)) e!704410)))

(declare-fun b!1242606 () Bool)

(declare-fun e!704411 () Bool)

(assert (=> b!1242606 (= e!704410 e!704411)))

(declare-fun res!828664 () Bool)

(assert (=> b!1242606 (=> (not res!828664) (not e!704411))))

(assert (=> b!1242606 (= res!828664 (bvslt (_1!10154 (h!28577 (insertStrictlySorted!439 l!644 key1!25 v1!20))) (_1!10154 (h!28577 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20))))))))

(declare-fun b!1242607 () Bool)

(assert (=> b!1242607 (= e!704411 (isStrictlySorted!765 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20))))))

(assert (= (and d!136821 (not res!828663)) b!1242606))

(assert (= (and b!1242606 res!828664) b!1242607))

(declare-fun m!1145307 () Bool)

(assert (=> b!1242607 m!1145307))

(assert (=> d!136625 d!136821))

(declare-fun d!136823 () Bool)

(declare-fun res!828669 () Bool)

(declare-fun e!704416 () Bool)

(assert (=> d!136823 (=> res!828669 e!704416)))

(assert (=> d!136823 (= res!828669 (and (is-Cons!27368 lt!562207) (= (_1!10154 (h!28577 lt!562207)) key1!25)))))

(assert (=> d!136823 (= (containsKey!613 lt!562207 key1!25) e!704416)))

(declare-fun b!1242612 () Bool)

(declare-fun e!704417 () Bool)

(assert (=> b!1242612 (= e!704416 e!704417)))

(declare-fun res!828670 () Bool)

(assert (=> b!1242612 (=> (not res!828670) (not e!704417))))

(assert (=> b!1242612 (= res!828670 (and (or (not (is-Cons!27368 lt!562207)) (bvsle (_1!10154 (h!28577 lt!562207)) key1!25)) (is-Cons!27368 lt!562207) (bvslt (_1!10154 (h!28577 lt!562207)) key1!25)))))

(declare-fun b!1242613 () Bool)

(assert (=> b!1242613 (= e!704417 (containsKey!613 (t!40835 lt!562207) key1!25))))

(assert (= (and d!136823 (not res!828669)) b!1242612))

(assert (= (and b!1242612 res!828670) b!1242613))

(declare-fun m!1145309 () Bool)

(assert (=> b!1242613 m!1145309))

(assert (=> b!1242216 d!136823))

(declare-fun d!136825 () Bool)

(assert (=> d!136825 (= ($colon$colon!627 (removeStrictlySorted!132 (t!40835 (t!40835 l!644)) key2!15) (h!28577 (t!40835 l!644))) (Cons!27368 (h!28577 (t!40835 l!644)) (removeStrictlySorted!132 (t!40835 (t!40835 l!644)) key2!15)))))

(assert (=> b!1242278 d!136825))

(declare-fun b!1242614 () Bool)

(declare-fun e!704419 () List!27372)

(declare-fun e!704420 () List!27372)

(assert (=> b!1242614 (= e!704419 e!704420)))

(declare-fun c!121671 () Bool)

(assert (=> b!1242614 (= c!121671 (and (is-Cons!27368 (t!40835 (t!40835 l!644))) (not (= (_1!10154 (h!28577 (t!40835 (t!40835 l!644)))) key2!15))))))

(declare-fun b!1242615 () Bool)

(assert (=> b!1242615 (= e!704419 (t!40835 (t!40835 (t!40835 l!644))))))

(declare-fun b!1242616 () Bool)

(assert (=> b!1242616 (= e!704420 Nil!27369)))

(declare-fun b!1242617 () Bool)

(declare-fun e!704418 () Bool)

(declare-fun lt!562263 () List!27372)

(assert (=> b!1242617 (= e!704418 (not (containsKey!613 lt!562263 key2!15)))))

(declare-fun b!1242618 () Bool)

(assert (=> b!1242618 (= e!704420 ($colon$colon!627 (removeStrictlySorted!132 (t!40835 (t!40835 (t!40835 l!644))) key2!15) (h!28577 (t!40835 (t!40835 l!644)))))))

(declare-fun d!136827 () Bool)

(assert (=> d!136827 e!704418))

(declare-fun res!828671 () Bool)

(assert (=> d!136827 (=> (not res!828671) (not e!704418))))

(assert (=> d!136827 (= res!828671 (isStrictlySorted!765 lt!562263))))

(assert (=> d!136827 (= lt!562263 e!704419)))

(declare-fun c!121670 () Bool)

(assert (=> d!136827 (= c!121670 (and (is-Cons!27368 (t!40835 (t!40835 l!644))) (= (_1!10154 (h!28577 (t!40835 (t!40835 l!644)))) key2!15)))))

(assert (=> d!136827 (isStrictlySorted!765 (t!40835 (t!40835 l!644)))))

(assert (=> d!136827 (= (removeStrictlySorted!132 (t!40835 (t!40835 l!644)) key2!15) lt!562263)))

(assert (= (and d!136827 c!121670) b!1242615))

(assert (= (and d!136827 (not c!121670)) b!1242614))

(assert (= (and b!1242614 c!121671) b!1242618))

(assert (= (and b!1242614 (not c!121671)) b!1242616))

(assert (= (and d!136827 res!828671) b!1242617))

(declare-fun m!1145311 () Bool)

(assert (=> b!1242617 m!1145311))

(declare-fun m!1145313 () Bool)

(assert (=> b!1242618 m!1145313))

(assert (=> b!1242618 m!1145313))

(declare-fun m!1145315 () Bool)

(assert (=> b!1242618 m!1145315))

(declare-fun m!1145317 () Bool)

(assert (=> d!136827 m!1145317))

(assert (=> d!136827 m!1144989))

(assert (=> b!1242278 d!136827))

(declare-fun d!136829 () Bool)

(declare-fun res!828672 () Bool)

(declare-fun e!704421 () Bool)

(assert (=> d!136829 (=> res!828672 e!704421)))

(assert (=> d!136829 (= res!828672 (and (is-Cons!27368 lt!562222) (= (_1!10154 (h!28577 lt!562222)) key2!15)))))

(assert (=> d!136829 (= (containsKey!613 lt!562222 key2!15) e!704421)))

(declare-fun b!1242619 () Bool)

(declare-fun e!704422 () Bool)

(assert (=> b!1242619 (= e!704421 e!704422)))

(declare-fun res!828673 () Bool)

(assert (=> b!1242619 (=> (not res!828673) (not e!704422))))

(assert (=> b!1242619 (= res!828673 (and (or (not (is-Cons!27368 lt!562222)) (bvsle (_1!10154 (h!28577 lt!562222)) key2!15)) (is-Cons!27368 lt!562222) (bvslt (_1!10154 (h!28577 lt!562222)) key2!15)))))

(declare-fun b!1242620 () Bool)

(assert (=> b!1242620 (= e!704422 (containsKey!613 (t!40835 lt!562222) key2!15))))

(assert (= (and d!136829 (not res!828672)) b!1242619))

(assert (= (and b!1242619 res!828673) b!1242620))

(declare-fun m!1145319 () Bool)

(assert (=> b!1242620 m!1145319))

(assert (=> b!1242277 d!136829))

(declare-fun d!136831 () Bool)

(declare-fun res!828674 () Bool)

(declare-fun e!704423 () Bool)

(assert (=> d!136831 (=> res!828674 e!704423)))

(assert (=> d!136831 (= res!828674 (or (is-Nil!27369 lt!562195) (is-Nil!27369 (t!40835 lt!562195))))))

(assert (=> d!136831 (= (isStrictlySorted!765 lt!562195) e!704423)))

(declare-fun b!1242621 () Bool)

(declare-fun e!704424 () Bool)

(assert (=> b!1242621 (= e!704423 e!704424)))

(declare-fun res!828675 () Bool)

(assert (=> b!1242621 (=> (not res!828675) (not e!704424))))

(assert (=> b!1242621 (= res!828675 (bvslt (_1!10154 (h!28577 lt!562195)) (_1!10154 (h!28577 (t!40835 lt!562195)))))))

(declare-fun b!1242622 () Bool)

(assert (=> b!1242622 (= e!704424 (isStrictlySorted!765 (t!40835 lt!562195)))))

(assert (= (and d!136831 (not res!828674)) b!1242621))

(assert (= (and b!1242621 res!828675) b!1242622))

(declare-fun m!1145321 () Bool)

(assert (=> b!1242622 m!1145321))

(assert (=> d!136589 d!136831))

(declare-fun d!136833 () Bool)

(declare-fun res!828676 () Bool)

(declare-fun e!704425 () Bool)

(assert (=> d!136833 (=> res!828676 e!704425)))

(assert (=> d!136833 (= res!828676 (or (is-Nil!27369 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)) (is-Nil!27369 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)))))))

(assert (=> d!136833 (= (isStrictlySorted!765 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)) e!704425)))

(declare-fun b!1242623 () Bool)

(declare-fun e!704426 () Bool)

(assert (=> b!1242623 (= e!704425 e!704426)))

(declare-fun res!828677 () Bool)

(assert (=> b!1242623 (=> (not res!828677) (not e!704426))))

(assert (=> b!1242623 (= res!828677 (bvslt (_1!10154 (h!28577 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))) (_1!10154 (h!28577 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))))))))

(declare-fun b!1242624 () Bool)

(assert (=> b!1242624 (= e!704426 (isStrictlySorted!765 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))))))

(assert (= (and d!136833 (not res!828676)) b!1242623))

(assert (= (and b!1242623 res!828677) b!1242624))

(declare-fun m!1145323 () Bool)

(assert (=> b!1242624 m!1145323))

(assert (=> d!136589 d!136833))

(declare-fun call!61348 () List!27372)

(declare-fun c!121675 () Bool)

(declare-fun bm!61343 () Bool)

(declare-fun e!704427 () List!27372)

(assert (=> bm!61343 (= call!61348 ($colon$colon!627 e!704427 (ite c!121675 (h!28577 (t!40835 (t!40835 l!644))) (tuple2!20287 key1!25 v1!20))))))

(declare-fun c!121672 () Bool)

(assert (=> bm!61343 (= c!121672 c!121675)))

(declare-fun b!1242625 () Bool)

(declare-fun e!704431 () List!27372)

(declare-fun call!61346 () List!27372)

(assert (=> b!1242625 (= e!704431 call!61346)))

(declare-fun b!1242626 () Bool)

(declare-fun e!704429 () List!27372)

(declare-fun call!61347 () List!27372)

(assert (=> b!1242626 (= e!704429 call!61347)))

(declare-fun b!1242627 () Bool)

(declare-fun c!121673 () Bool)

(assert (=> b!1242627 (= c!121673 (and (is-Cons!27368 (t!40835 (t!40835 l!644))) (bvsgt (_1!10154 (h!28577 (t!40835 (t!40835 l!644)))) key1!25)))))

(assert (=> b!1242627 (= e!704431 e!704429)))

(declare-fun d!136835 () Bool)

(declare-fun e!704430 () Bool)

(assert (=> d!136835 e!704430))

(declare-fun res!828679 () Bool)

(assert (=> d!136835 (=> (not res!828679) (not e!704430))))

(declare-fun lt!562264 () List!27372)

(assert (=> d!136835 (= res!828679 (isStrictlySorted!765 lt!562264))))

(declare-fun e!704428 () List!27372)

(assert (=> d!136835 (= lt!562264 e!704428)))

(assert (=> d!136835 (= c!121675 (and (is-Cons!27368 (t!40835 (t!40835 l!644))) (bvslt (_1!10154 (h!28577 (t!40835 (t!40835 l!644)))) key1!25)))))

(assert (=> d!136835 (isStrictlySorted!765 (t!40835 (t!40835 l!644)))))

(assert (=> d!136835 (= (insertStrictlySorted!439 (t!40835 (t!40835 l!644)) key1!25 v1!20) lt!562264)))

(declare-fun b!1242628 () Bool)

(assert (=> b!1242628 (= e!704429 call!61347)))

(declare-fun bm!61344 () Bool)

(assert (=> bm!61344 (= call!61346 call!61348)))

(declare-fun b!1242629 () Bool)

(assert (=> b!1242629 (= e!704428 call!61348)))

(declare-fun b!1242630 () Bool)

(assert (=> b!1242630 (= e!704427 (insertStrictlySorted!439 (t!40835 (t!40835 (t!40835 l!644))) key1!25 v1!20))))

(declare-fun b!1242631 () Bool)

(declare-fun c!121674 () Bool)

(assert (=> b!1242631 (= e!704427 (ite c!121674 (t!40835 (t!40835 (t!40835 l!644))) (ite c!121673 (Cons!27368 (h!28577 (t!40835 (t!40835 l!644))) (t!40835 (t!40835 (t!40835 l!644)))) Nil!27369)))))

(declare-fun b!1242632 () Bool)

(assert (=> b!1242632 (= e!704428 e!704431)))

(assert (=> b!1242632 (= c!121674 (and (is-Cons!27368 (t!40835 (t!40835 l!644))) (= (_1!10154 (h!28577 (t!40835 (t!40835 l!644)))) key1!25)))))

(declare-fun bm!61345 () Bool)

(assert (=> bm!61345 (= call!61347 call!61346)))

(declare-fun b!1242633 () Bool)

(assert (=> b!1242633 (= e!704430 (contains!7394 lt!562264 (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242634 () Bool)

(declare-fun res!828678 () Bool)

(assert (=> b!1242634 (=> (not res!828678) (not e!704430))))

(assert (=> b!1242634 (= res!828678 (containsKey!613 lt!562264 key1!25))))

(assert (= (and d!136835 c!121675) b!1242629))

(assert (= (and d!136835 (not c!121675)) b!1242632))

(assert (= (and b!1242632 c!121674) b!1242625))

(assert (= (and b!1242632 (not c!121674)) b!1242627))

(assert (= (and b!1242627 c!121673) b!1242628))

(assert (= (and b!1242627 (not c!121673)) b!1242626))

(assert (= (or b!1242628 b!1242626) bm!61345))

(assert (= (or b!1242625 bm!61345) bm!61344))

(assert (= (or b!1242629 bm!61344) bm!61343))

(assert (= (and bm!61343 c!121672) b!1242630))

(assert (= (and bm!61343 (not c!121672)) b!1242631))

(assert (= (and d!136835 res!828679) b!1242634))

(assert (= (and b!1242634 res!828678) b!1242633))

(declare-fun m!1145325 () Bool)

(assert (=> b!1242630 m!1145325))

(declare-fun m!1145327 () Bool)

(assert (=> bm!61343 m!1145327))

(declare-fun m!1145329 () Bool)

(assert (=> b!1242633 m!1145329))

(declare-fun m!1145331 () Bool)

(assert (=> d!136835 m!1145331))

(assert (=> d!136835 m!1144989))

(declare-fun m!1145333 () Bool)

(assert (=> b!1242634 m!1145333))

(assert (=> b!1242249 d!136835))

(declare-fun d!136837 () Bool)

(declare-fun res!828680 () Bool)

(declare-fun e!704432 () Bool)

(assert (=> d!136837 (=> res!828680 e!704432)))

(assert (=> d!136837 (= res!828680 (and (is-Cons!27368 lt!562209) (= (_1!10154 (h!28577 lt!562209)) key2!15)))))

(assert (=> d!136837 (= (containsKey!613 lt!562209 key2!15) e!704432)))

(declare-fun b!1242635 () Bool)

(declare-fun e!704433 () Bool)

(assert (=> b!1242635 (= e!704432 e!704433)))

(declare-fun res!828681 () Bool)

(assert (=> b!1242635 (=> (not res!828681) (not e!704433))))

(assert (=> b!1242635 (= res!828681 (and (or (not (is-Cons!27368 lt!562209)) (bvsle (_1!10154 (h!28577 lt!562209)) key2!15)) (is-Cons!27368 lt!562209) (bvslt (_1!10154 (h!28577 lt!562209)) key2!15)))))

(declare-fun b!1242636 () Bool)

(assert (=> b!1242636 (= e!704433 (containsKey!613 (t!40835 lt!562209) key2!15))))

(assert (= (and d!136837 (not res!828680)) b!1242635))

(assert (= (and b!1242635 res!828681) b!1242636))

(declare-fun m!1145335 () Bool)

(assert (=> b!1242636 m!1145335))

(assert (=> b!1242232 d!136837))

(assert (=> b!1242184 d!136619))

(declare-fun d!136839 () Bool)

(assert (=> d!136839 (= ($colon$colon!627 e!704105 (ite c!121557 (h!28577 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) (tuple2!20287 key1!25 v1!20))) (Cons!27368 (ite c!121557 (h!28577 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) (tuple2!20287 key1!25 v1!20)) e!704105))))

(assert (=> bm!61283 d!136839))

(declare-fun d!136841 () Bool)

(assert (=> d!136841 (= ($colon$colon!627 (removeStrictlySorted!132 (t!40835 l!644) key2!15) (h!28577 l!644)) (Cons!27368 (h!28577 l!644) (removeStrictlySorted!132 (t!40835 l!644) key2!15)))))

(assert (=> b!1242233 d!136841))

(assert (=> b!1242233 d!136629))

(declare-fun d!136843 () Bool)

(assert (=> d!136843 (= ($colon$colon!627 (removeStrictlySorted!132 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20)) key2!15) (h!28577 (insertStrictlySorted!439 l!644 key1!25 v1!20))) (Cons!27368 (h!28577 (insertStrictlySorted!439 l!644 key1!25 v1!20)) (removeStrictlySorted!132 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20)) key2!15)))))

(assert (=> b!1242268 d!136843))

(declare-fun b!1242637 () Bool)

(declare-fun e!704435 () List!27372)

(declare-fun e!704436 () List!27372)

(assert (=> b!1242637 (= e!704435 e!704436)))

(declare-fun c!121677 () Bool)

(assert (=> b!1242637 (= c!121677 (and (is-Cons!27368 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20))) (not (= (_1!10154 (h!28577 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20)))) key2!15))))))

(declare-fun b!1242638 () Bool)

(assert (=> b!1242638 (= e!704435 (t!40835 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20))))))

(declare-fun b!1242639 () Bool)

(assert (=> b!1242639 (= e!704436 Nil!27369)))

(declare-fun b!1242640 () Bool)

(declare-fun e!704434 () Bool)

(declare-fun lt!562265 () List!27372)

(assert (=> b!1242640 (= e!704434 (not (containsKey!613 lt!562265 key2!15)))))

(declare-fun b!1242641 () Bool)

(assert (=> b!1242641 (= e!704436 ($colon$colon!627 (removeStrictlySorted!132 (t!40835 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20))) key2!15) (h!28577 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20)))))))

(declare-fun d!136845 () Bool)

(assert (=> d!136845 e!704434))

(declare-fun res!828682 () Bool)

(assert (=> d!136845 (=> (not res!828682) (not e!704434))))

(assert (=> d!136845 (= res!828682 (isStrictlySorted!765 lt!562265))))

(assert (=> d!136845 (= lt!562265 e!704435)))

(declare-fun c!121676 () Bool)

(assert (=> d!136845 (= c!121676 (and (is-Cons!27368 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20))) (= (_1!10154 (h!28577 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20)))) key2!15)))))

(assert (=> d!136845 (isStrictlySorted!765 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20)))))

(assert (=> d!136845 (= (removeStrictlySorted!132 (t!40835 (insertStrictlySorted!439 l!644 key1!25 v1!20)) key2!15) lt!562265)))

(assert (= (and d!136845 c!121676) b!1242638))

(assert (= (and d!136845 (not c!121676)) b!1242637))

(assert (= (and b!1242637 c!121677) b!1242641))

(assert (= (and b!1242637 (not c!121677)) b!1242639))

(assert (= (and d!136845 res!828682) b!1242640))

(declare-fun m!1145337 () Bool)

(assert (=> b!1242640 m!1145337))

(declare-fun m!1145339 () Bool)

(assert (=> b!1242641 m!1145339))

(assert (=> b!1242641 m!1145339))

(declare-fun m!1145341 () Bool)

(assert (=> b!1242641 m!1145341))

(declare-fun m!1145343 () Bool)

(assert (=> d!136845 m!1145343))

(assert (=> d!136845 m!1145307))

(assert (=> b!1242268 d!136845))

(declare-fun d!136847 () Bool)

(declare-fun res!828683 () Bool)

(declare-fun e!704437 () Bool)

(assert (=> d!136847 (=> res!828683 e!704437)))

(assert (=> d!136847 (= res!828683 (and (is-Cons!27368 lt!562220) (= (_1!10154 (h!28577 lt!562220)) key2!15)))))

(assert (=> d!136847 (= (containsKey!613 lt!562220 key2!15) e!704437)))

(declare-fun b!1242642 () Bool)

(declare-fun e!704438 () Bool)

(assert (=> b!1242642 (= e!704437 e!704438)))

(declare-fun res!828684 () Bool)

(assert (=> b!1242642 (=> (not res!828684) (not e!704438))))

(assert (=> b!1242642 (= res!828684 (and (or (not (is-Cons!27368 lt!562220)) (bvsle (_1!10154 (h!28577 lt!562220)) key2!15)) (is-Cons!27368 lt!562220) (bvslt (_1!10154 (h!28577 lt!562220)) key2!15)))))

(declare-fun b!1242643 () Bool)

(assert (=> b!1242643 (= e!704438 (containsKey!613 (t!40835 lt!562220) key2!15))))

(assert (= (and d!136847 (not res!828683)) b!1242642))

(assert (= (and b!1242642 res!828684) b!1242643))

(declare-fun m!1145345 () Bool)

(assert (=> b!1242643 m!1145345))

(assert (=> b!1242267 d!136847))

(declare-fun d!136849 () Bool)

(declare-fun lt!562266 () Bool)

(assert (=> d!136849 (= lt!562266 (member (tuple2!20287 key1!25 v1!20) (content!604 lt!562218)))))

(declare-fun e!704439 () Bool)

(assert (=> d!136849 (= lt!562266 e!704439)))

(declare-fun res!828686 () Bool)

(assert (=> d!136849 (=> (not res!828686) (not e!704439))))

(assert (=> d!136849 (= res!828686 (is-Cons!27368 lt!562218))))

(assert (=> d!136849 (= (contains!7394 lt!562218 (tuple2!20287 key1!25 v1!20)) lt!562266)))

(declare-fun b!1242644 () Bool)

(declare-fun e!704440 () Bool)

(assert (=> b!1242644 (= e!704439 e!704440)))

(declare-fun res!828685 () Bool)

(assert (=> b!1242644 (=> res!828685 e!704440)))

(assert (=> b!1242644 (= res!828685 (= (h!28577 lt!562218) (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242645 () Bool)

(assert (=> b!1242645 (= e!704440 (contains!7394 (t!40835 lt!562218) (tuple2!20287 key1!25 v1!20)))))

(assert (= (and d!136849 res!828686) b!1242644))

(assert (= (and b!1242644 (not res!828685)) b!1242645))

(declare-fun m!1145347 () Bool)

(assert (=> d!136849 m!1145347))

(declare-fun m!1145349 () Bool)

(assert (=> d!136849 m!1145349))

(declare-fun m!1145351 () Bool)

(assert (=> b!1242645 m!1145351))

(assert (=> b!1242252 d!136849))

(declare-fun d!136851 () Bool)

(declare-fun res!828687 () Bool)

(declare-fun e!704441 () Bool)

(assert (=> d!136851 (=> res!828687 e!704441)))

(assert (=> d!136851 (= res!828687 (and (is-Cons!27368 lt!562195) (= (_1!10154 (h!28577 lt!562195)) key2!15)))))

(assert (=> d!136851 (= (containsKey!613 lt!562195 key2!15) e!704441)))

(declare-fun b!1242646 () Bool)

(declare-fun e!704442 () Bool)

(assert (=> b!1242646 (= e!704441 e!704442)))

(declare-fun res!828688 () Bool)

(assert (=> b!1242646 (=> (not res!828688) (not e!704442))))

(assert (=> b!1242646 (= res!828688 (and (or (not (is-Cons!27368 lt!562195)) (bvsle (_1!10154 (h!28577 lt!562195)) key2!15)) (is-Cons!27368 lt!562195) (bvslt (_1!10154 (h!28577 lt!562195)) key2!15)))))

(declare-fun b!1242647 () Bool)

(assert (=> b!1242647 (= e!704442 (containsKey!613 (t!40835 lt!562195) key2!15))))

(assert (= (and d!136851 (not res!828687)) b!1242646))

(assert (= (and b!1242646 res!828688) b!1242647))

(declare-fun m!1145353 () Bool)

(assert (=> b!1242647 m!1145353))

(assert (=> b!1242104 d!136851))

(declare-fun d!136853 () Bool)

(assert (=> d!136853 (= ($colon$colon!627 e!704129 (ite c!121577 (h!28577 (removeStrictlySorted!132 l!644 key2!15)) (tuple2!20287 key1!25 v1!20))) (Cons!27368 (ite c!121577 (h!28577 (removeStrictlySorted!132 l!644 key2!15)) (tuple2!20287 key1!25 v1!20)) e!704129))))

(assert (=> bm!61295 d!136853))

(declare-fun d!136855 () Bool)

(declare-fun res!828689 () Bool)

(declare-fun e!704443 () Bool)

(assert (=> d!136855 (=> res!828689 e!704443)))

(assert (=> d!136855 (= res!828689 (and (is-Cons!27368 lt!562218) (= (_1!10154 (h!28577 lt!562218)) key1!25)))))

(assert (=> d!136855 (= (containsKey!613 lt!562218 key1!25) e!704443)))

(declare-fun b!1242648 () Bool)

(declare-fun e!704444 () Bool)

(assert (=> b!1242648 (= e!704443 e!704444)))

(declare-fun res!828690 () Bool)

(assert (=> b!1242648 (=> (not res!828690) (not e!704444))))

(assert (=> b!1242648 (= res!828690 (and (or (not (is-Cons!27368 lt!562218)) (bvsle (_1!10154 (h!28577 lt!562218)) key1!25)) (is-Cons!27368 lt!562218) (bvslt (_1!10154 (h!28577 lt!562218)) key1!25)))))

(declare-fun b!1242649 () Bool)

(assert (=> b!1242649 (= e!704444 (containsKey!613 (t!40835 lt!562218) key1!25))))

(assert (= (and d!136855 (not res!828689)) b!1242648))

(assert (= (and b!1242648 res!828690) b!1242649))

(declare-fun m!1145355 () Bool)

(assert (=> b!1242649 m!1145355))

(assert (=> b!1242253 d!136855))

(declare-fun d!136857 () Bool)

(declare-fun lt!562267 () Bool)

(assert (=> d!136857 (= lt!562267 (member (tuple2!20287 key1!25 v1!20) (content!604 lt!562203)))))

(declare-fun e!704445 () Bool)

(assert (=> d!136857 (= lt!562267 e!704445)))

(declare-fun res!828692 () Bool)

(assert (=> d!136857 (=> (not res!828692) (not e!704445))))

(assert (=> d!136857 (= res!828692 (is-Cons!27368 lt!562203))))

(assert (=> d!136857 (= (contains!7394 lt!562203 (tuple2!20287 key1!25 v1!20)) lt!562267)))

(declare-fun b!1242650 () Bool)

(declare-fun e!704446 () Bool)

(assert (=> b!1242650 (= e!704445 e!704446)))

(declare-fun res!828691 () Bool)

(assert (=> b!1242650 (=> res!828691 e!704446)))

(assert (=> b!1242650 (= res!828691 (= (h!28577 lt!562203) (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242651 () Bool)

(assert (=> b!1242651 (= e!704446 (contains!7394 (t!40835 lt!562203) (tuple2!20287 key1!25 v1!20)))))

(assert (= (and d!136857 res!828692) b!1242650))

(assert (= (and b!1242650 (not res!828691)) b!1242651))

(declare-fun m!1145357 () Bool)

(assert (=> d!136857 m!1145357))

(declare-fun m!1145359 () Bool)

(assert (=> d!136857 m!1145359))

(declare-fun m!1145361 () Bool)

(assert (=> b!1242651 m!1145361))

(assert (=> b!1242187 d!136857))

(declare-fun d!136859 () Bool)

(assert (=> d!136859 (= ($colon$colon!627 (removeStrictlySorted!132 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)) key2!15) (h!28577 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))) (Cons!27368 (h!28577 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)) (removeStrictlySorted!132 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)) key2!15)))))

(assert (=> b!1242105 d!136859))

(declare-fun b!1242652 () Bool)

(declare-fun e!704448 () List!27372)

(declare-fun e!704449 () List!27372)

(assert (=> b!1242652 (= e!704448 e!704449)))

(declare-fun c!121679 () Bool)

(assert (=> b!1242652 (= c!121679 (and (is-Cons!27368 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))) (not (= (_1!10154 (h!28577 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)))) key2!15))))))

(declare-fun b!1242653 () Bool)

(assert (=> b!1242653 (= e!704448 (t!40835 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))))))

(declare-fun b!1242654 () Bool)

(assert (=> b!1242654 (= e!704449 Nil!27369)))

(declare-fun b!1242655 () Bool)

(declare-fun e!704447 () Bool)

(declare-fun lt!562268 () List!27372)

(assert (=> b!1242655 (= e!704447 (not (containsKey!613 lt!562268 key2!15)))))

(declare-fun b!1242656 () Bool)

(assert (=> b!1242656 (= e!704449 ($colon$colon!627 (removeStrictlySorted!132 (t!40835 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))) key2!15) (h!28577 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)))))))

(declare-fun d!136861 () Bool)

(assert (=> d!136861 e!704447))

(declare-fun res!828693 () Bool)

(assert (=> d!136861 (=> (not res!828693) (not e!704447))))

(assert (=> d!136861 (= res!828693 (isStrictlySorted!765 lt!562268))))

(assert (=> d!136861 (= lt!562268 e!704448)))

(declare-fun c!121678 () Bool)

(assert (=> d!136861 (= c!121678 (and (is-Cons!27368 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20))) (= (_1!10154 (h!28577 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)))) key2!15)))))

(assert (=> d!136861 (isStrictlySorted!765 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)))))

(assert (=> d!136861 (= (removeStrictlySorted!132 (t!40835 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20)) key2!15) lt!562268)))

(assert (= (and d!136861 c!121678) b!1242653))

(assert (= (and d!136861 (not c!121678)) b!1242652))

(assert (= (and b!1242652 c!121679) b!1242656))

(assert (= (and b!1242652 (not c!121679)) b!1242654))

(assert (= (and d!136861 res!828693) b!1242655))

(declare-fun m!1145363 () Bool)

(assert (=> b!1242655 m!1145363))

(declare-fun m!1145365 () Bool)

(assert (=> b!1242656 m!1145365))

(assert (=> b!1242656 m!1145365))

(declare-fun m!1145367 () Bool)

(assert (=> b!1242656 m!1145367))

(declare-fun m!1145369 () Bool)

(assert (=> d!136861 m!1145369))

(assert (=> d!136861 m!1145323))

(assert (=> b!1242105 d!136861))

(declare-fun d!136863 () Bool)

(declare-fun res!828694 () Bool)

(declare-fun e!704450 () Bool)

(assert (=> d!136863 (=> res!828694 e!704450)))

(assert (=> d!136863 (= res!828694 (and (is-Cons!27368 lt!562203) (= (_1!10154 (h!28577 lt!562203)) key1!25)))))

(assert (=> d!136863 (= (containsKey!613 lt!562203 key1!25) e!704450)))

(declare-fun b!1242657 () Bool)

(declare-fun e!704451 () Bool)

(assert (=> b!1242657 (= e!704450 e!704451)))

(declare-fun res!828695 () Bool)

(assert (=> b!1242657 (=> (not res!828695) (not e!704451))))

(assert (=> b!1242657 (= res!828695 (and (or (not (is-Cons!27368 lt!562203)) (bvsle (_1!10154 (h!28577 lt!562203)) key1!25)) (is-Cons!27368 lt!562203) (bvslt (_1!10154 (h!28577 lt!562203)) key1!25)))))

(declare-fun b!1242658 () Bool)

(assert (=> b!1242658 (= e!704451 (containsKey!613 (t!40835 lt!562203) key1!25))))

(assert (= (and d!136863 (not res!828694)) b!1242657))

(assert (= (and b!1242657 res!828695) b!1242658))

(declare-fun m!1145371 () Bool)

(assert (=> b!1242658 m!1145371))

(assert (=> b!1242188 d!136863))

(assert (=> b!1242293 d!136637))

(declare-fun d!136865 () Bool)

(declare-fun res!828696 () Bool)

(declare-fun e!704452 () Bool)

(assert (=> d!136865 (=> res!828696 e!704452)))

(assert (=> d!136865 (= res!828696 (or (is-Nil!27369 lt!562207) (is-Nil!27369 (t!40835 lt!562207))))))

(assert (=> d!136865 (= (isStrictlySorted!765 lt!562207) e!704452)))

(declare-fun b!1242659 () Bool)

(declare-fun e!704453 () Bool)

(assert (=> b!1242659 (= e!704452 e!704453)))

(declare-fun res!828697 () Bool)

(assert (=> b!1242659 (=> (not res!828697) (not e!704453))))

(assert (=> b!1242659 (= res!828697 (bvslt (_1!10154 (h!28577 lt!562207)) (_1!10154 (h!28577 (t!40835 lt!562207)))))))

(declare-fun b!1242660 () Bool)

(assert (=> b!1242660 (= e!704453 (isStrictlySorted!765 (t!40835 lt!562207)))))

(assert (= (and d!136865 (not res!828696)) b!1242659))

(assert (= (and b!1242659 res!828697) b!1242660))

(declare-fun m!1145373 () Bool)

(assert (=> b!1242660 m!1145373))

(assert (=> d!136607 d!136865))

(declare-fun d!136867 () Bool)

(declare-fun res!828698 () Bool)

(declare-fun e!704454 () Bool)

(assert (=> d!136867 (=> res!828698 e!704454)))

(assert (=> d!136867 (= res!828698 (or (is-Nil!27369 (removeStrictlySorted!132 l!644 key2!15)) (is-Nil!27369 (t!40835 (removeStrictlySorted!132 l!644 key2!15)))))))

(assert (=> d!136867 (= (isStrictlySorted!765 (removeStrictlySorted!132 l!644 key2!15)) e!704454)))

(declare-fun b!1242661 () Bool)

(declare-fun e!704455 () Bool)

(assert (=> b!1242661 (= e!704454 e!704455)))

(declare-fun res!828699 () Bool)

(assert (=> b!1242661 (=> (not res!828699) (not e!704455))))

(assert (=> b!1242661 (= res!828699 (bvslt (_1!10154 (h!28577 (removeStrictlySorted!132 l!644 key2!15))) (_1!10154 (h!28577 (t!40835 (removeStrictlySorted!132 l!644 key2!15))))))))

(declare-fun b!1242662 () Bool)

(assert (=> b!1242662 (= e!704455 (isStrictlySorted!765 (t!40835 (removeStrictlySorted!132 l!644 key2!15))))))

(assert (= (and d!136867 (not res!828698)) b!1242661))

(assert (= (and b!1242661 res!828699) b!1242662))

(declare-fun m!1145375 () Bool)

(assert (=> b!1242662 m!1145375))

(assert (=> d!136607 d!136867))

(declare-fun d!136869 () Bool)

(declare-fun res!828700 () Bool)

(declare-fun e!704456 () Bool)

(assert (=> d!136869 (=> res!828700 e!704456)))

(assert (=> d!136869 (= res!828700 (or (is-Nil!27369 lt!562201) (is-Nil!27369 (t!40835 lt!562201))))))

(assert (=> d!136869 (= (isStrictlySorted!765 lt!562201) e!704456)))

(declare-fun b!1242663 () Bool)

(declare-fun e!704457 () Bool)

(assert (=> b!1242663 (= e!704456 e!704457)))

(declare-fun res!828701 () Bool)

(assert (=> b!1242663 (=> (not res!828701) (not e!704457))))

(assert (=> b!1242663 (= res!828701 (bvslt (_1!10154 (h!28577 lt!562201)) (_1!10154 (h!28577 (t!40835 lt!562201)))))))

(declare-fun b!1242664 () Bool)

(assert (=> b!1242664 (= e!704457 (isStrictlySorted!765 (t!40835 lt!562201)))))

(assert (= (and d!136869 (not res!828700)) b!1242663))

(assert (= (and b!1242663 res!828701) b!1242664))

(declare-fun m!1145377 () Bool)

(assert (=> b!1242664 m!1145377))

(assert (=> d!136593 d!136869))

(declare-fun d!136871 () Bool)

(declare-fun res!828702 () Bool)

(declare-fun e!704458 () Bool)

(assert (=> d!136871 (=> res!828702 e!704458)))

(assert (=> d!136871 (= res!828702 (or (is-Nil!27369 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) (is-Nil!27369 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15)))))))

(assert (=> d!136871 (= (isStrictlySorted!765 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) e!704458)))

(declare-fun b!1242665 () Bool)

(declare-fun e!704459 () Bool)

(assert (=> b!1242665 (= e!704458 e!704459)))

(declare-fun res!828703 () Bool)

(assert (=> b!1242665 (=> (not res!828703) (not e!704459))))

(assert (=> b!1242665 (= res!828703 (bvslt (_1!10154 (h!28577 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) (_1!10154 (h!28577 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15))))))))

(declare-fun b!1242666 () Bool)

(assert (=> b!1242666 (= e!704459 (isStrictlySorted!765 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15))))))

(assert (= (and d!136871 (not res!828702)) b!1242665))

(assert (= (and b!1242665 res!828703) b!1242666))

(declare-fun m!1145379 () Bool)

(assert (=> b!1242666 m!1145379))

(assert (=> d!136593 d!136871))

(declare-fun e!704460 () List!27372)

(declare-fun c!121683 () Bool)

(declare-fun call!61351 () List!27372)

(declare-fun bm!61346 () Bool)

(assert (=> bm!61346 (= call!61351 ($colon$colon!627 e!704460 (ite c!121683 (h!28577 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) (tuple2!20287 key1!25 v1!20))))))

(declare-fun c!121680 () Bool)

(assert (=> bm!61346 (= c!121680 c!121683)))

(declare-fun b!1242667 () Bool)

(declare-fun e!704464 () List!27372)

(declare-fun call!61349 () List!27372)

(assert (=> b!1242667 (= e!704464 call!61349)))

(declare-fun b!1242668 () Bool)

(declare-fun e!704462 () List!27372)

(declare-fun call!61350 () List!27372)

(assert (=> b!1242668 (= e!704462 call!61350)))

(declare-fun c!121681 () Bool)

(declare-fun b!1242669 () Bool)

(assert (=> b!1242669 (= c!121681 (and (is-Cons!27368 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) (bvsgt (_1!10154 (h!28577 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15)))) key1!25)))))

(assert (=> b!1242669 (= e!704464 e!704462)))

(declare-fun d!136873 () Bool)

(declare-fun e!704463 () Bool)

(assert (=> d!136873 e!704463))

(declare-fun res!828705 () Bool)

(assert (=> d!136873 (=> (not res!828705) (not e!704463))))

(declare-fun lt!562269 () List!27372)

(assert (=> d!136873 (= res!828705 (isStrictlySorted!765 lt!562269))))

(declare-fun e!704461 () List!27372)

(assert (=> d!136873 (= lt!562269 e!704461)))

(assert (=> d!136873 (= c!121683 (and (is-Cons!27368 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) (bvslt (_1!10154 (h!28577 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15)))) key1!25)))))

(assert (=> d!136873 (isStrictlySorted!765 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15)))))

(assert (=> d!136873 (= (insertStrictlySorted!439 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15)) key1!25 v1!20) lt!562269)))

(declare-fun b!1242670 () Bool)

(assert (=> b!1242670 (= e!704462 call!61350)))

(declare-fun bm!61347 () Bool)

(assert (=> bm!61347 (= call!61349 call!61351)))

(declare-fun b!1242671 () Bool)

(assert (=> b!1242671 (= e!704461 call!61351)))

(declare-fun b!1242672 () Bool)

(assert (=> b!1242672 (= e!704460 (insertStrictlySorted!439 (t!40835 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) key1!25 v1!20))))

(declare-fun c!121682 () Bool)

(declare-fun b!1242673 () Bool)

(assert (=> b!1242673 (= e!704460 (ite c!121682 (t!40835 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) (ite c!121681 (Cons!27368 (h!28577 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) (t!40835 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15)))) Nil!27369)))))

(declare-fun b!1242674 () Bool)

(assert (=> b!1242674 (= e!704461 e!704464)))

(assert (=> b!1242674 (= c!121682 (and (is-Cons!27368 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15))) (= (_1!10154 (h!28577 (t!40835 (removeStrictlySorted!132 (t!40835 l!644) key2!15)))) key1!25)))))

(declare-fun bm!61348 () Bool)

(assert (=> bm!61348 (= call!61350 call!61349)))

(declare-fun b!1242675 () Bool)

(assert (=> b!1242675 (= e!704463 (contains!7394 lt!562269 (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242676 () Bool)

(declare-fun res!828704 () Bool)

(assert (=> b!1242676 (=> (not res!828704) (not e!704463))))

(assert (=> b!1242676 (= res!828704 (containsKey!613 lt!562269 key1!25))))

(assert (= (and d!136873 c!121683) b!1242671))

(assert (= (and d!136873 (not c!121683)) b!1242674))

(assert (= (and b!1242674 c!121682) b!1242667))

(assert (= (and b!1242674 (not c!121682)) b!1242669))

(assert (= (and b!1242669 c!121681) b!1242670))

(assert (= (and b!1242669 (not c!121681)) b!1242668))

(assert (= (or b!1242670 b!1242668) bm!61348))

(assert (= (or b!1242667 bm!61348) bm!61347))

(assert (= (or b!1242671 bm!61347) bm!61346))

(assert (= (and bm!61346 c!121680) b!1242672))

(assert (= (and bm!61346 (not c!121680)) b!1242673))

(assert (= (and d!136873 res!828705) b!1242676))

(assert (= (and b!1242676 res!828704) b!1242675))

(declare-fun m!1145381 () Bool)

(assert (=> b!1242672 m!1145381))

(declare-fun m!1145383 () Bool)

(assert (=> bm!61346 m!1145383))

(declare-fun m!1145385 () Bool)

(assert (=> b!1242675 m!1145385))

(declare-fun m!1145387 () Bool)

(assert (=> d!136873 m!1145387))

(assert (=> d!136873 m!1145379))

(declare-fun m!1145389 () Bool)

(assert (=> b!1242676 m!1145389))

(assert (=> b!1242164 d!136873))

(declare-fun d!136875 () Bool)

(declare-fun res!828706 () Bool)

(declare-fun e!704465 () Bool)

(assert (=> d!136875 (=> res!828706 e!704465)))

(assert (=> d!136875 (= res!828706 (or (is-Nil!27369 lt!562209) (is-Nil!27369 (t!40835 lt!562209))))))

(assert (=> d!136875 (= (isStrictlySorted!765 lt!562209) e!704465)))

(declare-fun b!1242677 () Bool)

(declare-fun e!704466 () Bool)

(assert (=> b!1242677 (= e!704465 e!704466)))

(declare-fun res!828707 () Bool)

(assert (=> b!1242677 (=> (not res!828707) (not e!704466))))

(assert (=> b!1242677 (= res!828707 (bvslt (_1!10154 (h!28577 lt!562209)) (_1!10154 (h!28577 (t!40835 lt!562209)))))))

(declare-fun b!1242678 () Bool)

(assert (=> b!1242678 (= e!704466 (isStrictlySorted!765 (t!40835 lt!562209)))))

(assert (= (and d!136875 (not res!828706)) b!1242677))

(assert (= (and b!1242677 res!828707) b!1242678))

(declare-fun m!1145391 () Bool)

(assert (=> b!1242678 m!1145391))

(assert (=> d!136611 d!136875))

(assert (=> d!136611 d!136633))

(declare-fun call!61354 () List!27372)

(declare-fun e!704467 () List!27372)

(declare-fun bm!61349 () Bool)

(declare-fun c!121687 () Bool)

(assert (=> bm!61349 (= call!61354 ($colon$colon!627 e!704467 (ite c!121687 (h!28577 (t!40835 (removeStrictlySorted!132 l!644 key2!15))) (tuple2!20287 key1!25 v1!20))))))

(declare-fun c!121684 () Bool)

(assert (=> bm!61349 (= c!121684 c!121687)))

(declare-fun b!1242679 () Bool)

(declare-fun e!704471 () List!27372)

(declare-fun call!61352 () List!27372)

(assert (=> b!1242679 (= e!704471 call!61352)))

(declare-fun b!1242680 () Bool)

(declare-fun e!704469 () List!27372)

(declare-fun call!61353 () List!27372)

(assert (=> b!1242680 (= e!704469 call!61353)))

(declare-fun b!1242681 () Bool)

(declare-fun c!121685 () Bool)

(assert (=> b!1242681 (= c!121685 (and (is-Cons!27368 (t!40835 (removeStrictlySorted!132 l!644 key2!15))) (bvsgt (_1!10154 (h!28577 (t!40835 (removeStrictlySorted!132 l!644 key2!15)))) key1!25)))))

(assert (=> b!1242681 (= e!704471 e!704469)))

(declare-fun d!136877 () Bool)

(declare-fun e!704470 () Bool)

(assert (=> d!136877 e!704470))

(declare-fun res!828709 () Bool)

(assert (=> d!136877 (=> (not res!828709) (not e!704470))))

(declare-fun lt!562270 () List!27372)

(assert (=> d!136877 (= res!828709 (isStrictlySorted!765 lt!562270))))

(declare-fun e!704468 () List!27372)

(assert (=> d!136877 (= lt!562270 e!704468)))

(assert (=> d!136877 (= c!121687 (and (is-Cons!27368 (t!40835 (removeStrictlySorted!132 l!644 key2!15))) (bvslt (_1!10154 (h!28577 (t!40835 (removeStrictlySorted!132 l!644 key2!15)))) key1!25)))))

(assert (=> d!136877 (isStrictlySorted!765 (t!40835 (removeStrictlySorted!132 l!644 key2!15)))))

(assert (=> d!136877 (= (insertStrictlySorted!439 (t!40835 (removeStrictlySorted!132 l!644 key2!15)) key1!25 v1!20) lt!562270)))

(declare-fun b!1242682 () Bool)

(assert (=> b!1242682 (= e!704469 call!61353)))

(declare-fun bm!61350 () Bool)

(assert (=> bm!61350 (= call!61352 call!61354)))

(declare-fun b!1242683 () Bool)

(assert (=> b!1242683 (= e!704468 call!61354)))

(declare-fun b!1242684 () Bool)

(assert (=> b!1242684 (= e!704467 (insertStrictlySorted!439 (t!40835 (t!40835 (removeStrictlySorted!132 l!644 key2!15))) key1!25 v1!20))))

(declare-fun b!1242685 () Bool)

(declare-fun c!121686 () Bool)

(assert (=> b!1242685 (= e!704467 (ite c!121686 (t!40835 (t!40835 (removeStrictlySorted!132 l!644 key2!15))) (ite c!121685 (Cons!27368 (h!28577 (t!40835 (removeStrictlySorted!132 l!644 key2!15))) (t!40835 (t!40835 (removeStrictlySorted!132 l!644 key2!15)))) Nil!27369)))))

(declare-fun b!1242686 () Bool)

(assert (=> b!1242686 (= e!704468 e!704471)))

(assert (=> b!1242686 (= c!121686 (and (is-Cons!27368 (t!40835 (removeStrictlySorted!132 l!644 key2!15))) (= (_1!10154 (h!28577 (t!40835 (removeStrictlySorted!132 l!644 key2!15)))) key1!25)))))

(declare-fun bm!61351 () Bool)

(assert (=> bm!61351 (= call!61353 call!61352)))

(declare-fun b!1242687 () Bool)

(assert (=> b!1242687 (= e!704470 (contains!7394 lt!562270 (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242688 () Bool)

(declare-fun res!828708 () Bool)

(assert (=> b!1242688 (=> (not res!828708) (not e!704470))))

(assert (=> b!1242688 (= res!828708 (containsKey!613 lt!562270 key1!25))))

(assert (= (and d!136877 c!121687) b!1242683))

(assert (= (and d!136877 (not c!121687)) b!1242686))

(assert (= (and b!1242686 c!121686) b!1242679))

(assert (= (and b!1242686 (not c!121686)) b!1242681))

(assert (= (and b!1242681 c!121685) b!1242682))

(assert (= (and b!1242681 (not c!121685)) b!1242680))

(assert (= (or b!1242682 b!1242680) bm!61351))

(assert (= (or b!1242679 bm!61351) bm!61350))

(assert (= (or b!1242683 bm!61350) bm!61349))

(assert (= (and bm!61349 c!121684) b!1242684))

(assert (= (and bm!61349 (not c!121684)) b!1242685))

(assert (= (and d!136877 res!828709) b!1242688))

(assert (= (and b!1242688 res!828708) b!1242687))

(declare-fun m!1145393 () Bool)

(assert (=> b!1242684 m!1145393))

(declare-fun m!1145395 () Bool)

(assert (=> bm!61349 m!1145395))

(declare-fun m!1145397 () Bool)

(assert (=> b!1242687 m!1145397))

(declare-fun m!1145399 () Bool)

(assert (=> d!136877 m!1145399))

(assert (=> d!136877 m!1145375))

(declare-fun m!1145401 () Bool)

(assert (=> b!1242688 m!1145401))

(assert (=> b!1242212 d!136877))

(declare-fun d!136879 () Bool)

(assert (=> d!136879 (= (insertStrictlySorted!439 (removeStrictlySorted!132 (t!40835 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!132 (insertStrictlySorted!439 (t!40835 l!644) key1!25 v1!20) key2!15))))

(assert (=> d!136879 true))

(declare-fun _$3!76 () Unit!41265)

(assert (=> d!136879 (= (choose!1842 (t!40835 l!644) key1!25 v1!20 key2!15) _$3!76)))

(declare-fun bs!34981 () Bool)

(assert (= bs!34981 d!136879))

(assert (=> bs!34981 m!1144811))

(assert (=> bs!34981 m!1144811))

(assert (=> bs!34981 m!1144813))

(assert (=> bs!34981 m!1144807))

(assert (=> bs!34981 m!1144807))

(assert (=> bs!34981 m!1144809))

(assert (=> d!136615 d!136879))

(assert (=> d!136615 d!136589))

(assert (=> d!136615 d!136593))

(assert (=> d!136615 d!136619))

(assert (=> d!136615 d!136629))

(declare-fun d!136881 () Bool)

(assert (=> d!136881 (= ($colon$colon!627 e!704150 (ite c!121591 (h!28577 (t!40835 l!644)) (tuple2!20287 key1!25 v1!20))) (Cons!27368 (ite c!121591 (h!28577 (t!40835 l!644)) (tuple2!20287 key1!25 v1!20)) e!704150))))

(assert (=> bm!61301 d!136881))

(declare-fun lt!562271 () Bool)

(declare-fun d!136883 () Bool)

(assert (=> d!136883 (= lt!562271 (member (tuple2!20287 key1!25 v1!20) (content!604 lt!562201)))))

(declare-fun e!704472 () Bool)

(assert (=> d!136883 (= lt!562271 e!704472)))

(declare-fun res!828711 () Bool)

(assert (=> d!136883 (=> (not res!828711) (not e!704472))))

(assert (=> d!136883 (= res!828711 (is-Cons!27368 lt!562201))))

(assert (=> d!136883 (= (contains!7394 lt!562201 (tuple2!20287 key1!25 v1!20)) lt!562271)))

(declare-fun b!1242689 () Bool)

(declare-fun e!704473 () Bool)

(assert (=> b!1242689 (= e!704472 e!704473)))

(declare-fun res!828710 () Bool)

(assert (=> b!1242689 (=> res!828710 e!704473)))

(assert (=> b!1242689 (= res!828710 (= (h!28577 lt!562201) (tuple2!20287 key1!25 v1!20)))))

(declare-fun b!1242690 () Bool)

(assert (=> b!1242690 (= e!704473 (contains!7394 (t!40835 lt!562201) (tuple2!20287 key1!25 v1!20)))))

(assert (= (and d!136883 res!828711) b!1242689))

(assert (= (and b!1242689 (not res!828710)) b!1242690))

(declare-fun m!1145403 () Bool)

(assert (=> d!136883 m!1145403))

(declare-fun m!1145405 () Bool)

(assert (=> d!136883 m!1145405))

(declare-fun m!1145407 () Bool)

(assert (=> b!1242690 m!1145407))

(assert (=> b!1242167 d!136883))

(declare-fun d!136885 () Bool)

(declare-fun res!828712 () Bool)

(declare-fun e!704474 () Bool)

(assert (=> d!136885 (=> res!828712 e!704474)))

(assert (=> d!136885 (= res!828712 (or (is-Nil!27369 lt!562203) (is-Nil!27369 (t!40835 lt!562203))))))

(assert (=> d!136885 (= (isStrictlySorted!765 lt!562203) e!704474)))

(declare-fun b!1242691 () Bool)

(declare-fun e!704475 () Bool)

(assert (=> b!1242691 (= e!704474 e!704475)))

(declare-fun res!828713 () Bool)

(assert (=> b!1242691 (=> (not res!828713) (not e!704475))))

(assert (=> b!1242691 (= res!828713 (bvslt (_1!10154 (h!28577 lt!562203)) (_1!10154 (h!28577 (t!40835 lt!562203)))))))

(declare-fun b!1242692 () Bool)

(assert (=> b!1242692 (= e!704475 (isStrictlySorted!765 (t!40835 lt!562203)))))

(assert (= (and d!136885 (not res!828712)) b!1242691))

(assert (= (and b!1242691 res!828713) b!1242692))

(declare-fun m!1145409 () Bool)

(assert (=> b!1242692 m!1145409))

(assert (=> d!136603 d!136885))

(assert (=> d!136603 d!136633))

(declare-fun d!136887 () Bool)

(declare-fun res!828714 () Bool)

(declare-fun e!704476 () Bool)

(assert (=> d!136887 (=> res!828714 e!704476)))

(assert (=> d!136887 (= res!828714 (or (is-Nil!27369 lt!562222) (is-Nil!27369 (t!40835 lt!562222))))))

(assert (=> d!136887 (= (isStrictlySorted!765 lt!562222) e!704476)))

(declare-fun b!1242693 () Bool)

(declare-fun e!704477 () Bool)

(assert (=> b!1242693 (= e!704476 e!704477)))

(declare-fun res!828715 () Bool)

(assert (=> b!1242693 (=> (not res!828715) (not e!704477))))

(assert (=> b!1242693 (= res!828715 (bvslt (_1!10154 (h!28577 lt!562222)) (_1!10154 (h!28577 (t!40835 lt!562222)))))))

(declare-fun b!1242694 () Bool)

(assert (=> b!1242694 (= e!704477 (isStrictlySorted!765 (t!40835 lt!562222)))))

(assert (= (and d!136887 (not res!828714)) b!1242693))

(assert (= (and b!1242693 res!828715) b!1242694))

(declare-fun m!1145411 () Bool)

(assert (=> b!1242694 m!1145411))

(assert (=> d!136629 d!136887))

(assert (=> d!136629 d!136637))

(declare-fun d!136889 () Bool)

(declare-fun res!828716 () Bool)

(declare-fun e!704478 () Bool)

(assert (=> d!136889 (=> res!828716 e!704478)))

(assert (=> d!136889 (= res!828716 (and (is-Cons!27368 lt!562201) (= (_1!10154 (h!28577 lt!562201)) key1!25)))))

(assert (=> d!136889 (= (containsKey!613 lt!562201 key1!25) e!704478)))

(declare-fun b!1242695 () Bool)

(declare-fun e!704479 () Bool)

(assert (=> b!1242695 (= e!704478 e!704479)))

(declare-fun res!828717 () Bool)

(assert (=> b!1242695 (=> (not res!828717) (not e!704479))))

(assert (=> b!1242695 (= res!828717 (and (or (not (is-Cons!27368 lt!562201)) (bvsle (_1!10154 (h!28577 lt!562201)) key1!25)) (is-Cons!27368 lt!562201) (bvslt (_1!10154 (h!28577 lt!562201)) key1!25)))))

(declare-fun b!1242696 () Bool)

(assert (=> b!1242696 (= e!704479 (containsKey!613 (t!40835 lt!562201) key1!25))))

(assert (= (and d!136889 (not res!828716)) b!1242695))

(assert (= (and b!1242695 res!828717) b!1242696))

(declare-fun m!1145413 () Bool)

(assert (=> b!1242696 m!1145413))

(assert (=> b!1242168 d!136889))

(declare-fun d!136891 () Bool)

(declare-fun res!828718 () Bool)

(declare-fun e!704480 () Bool)

(assert (=> d!136891 (=> res!828718 e!704480)))

(assert (=> d!136891 (= res!828718 (or (is-Nil!27369 (t!40835 (t!40835 l!644))) (is-Nil!27369 (t!40835 (t!40835 (t!40835 l!644))))))))

(assert (=> d!136891 (= (isStrictlySorted!765 (t!40835 (t!40835 l!644))) e!704480)))

(declare-fun b!1242697 () Bool)

(declare-fun e!704481 () Bool)

(assert (=> b!1242697 (= e!704480 e!704481)))

(declare-fun res!828719 () Bool)

(assert (=> b!1242697 (=> (not res!828719) (not e!704481))))

(assert (=> b!1242697 (= res!828719 (bvslt (_1!10154 (h!28577 (t!40835 (t!40835 l!644)))) (_1!10154 (h!28577 (t!40835 (t!40835 (t!40835 l!644)))))))))

(declare-fun b!1242698 () Bool)

(assert (=> b!1242698 (= e!704481 (isStrictlySorted!765 (t!40835 (t!40835 (t!40835 l!644)))))))

(assert (= (and d!136891 (not res!828718)) b!1242697))

(assert (= (and b!1242697 res!828719) b!1242698))

(declare-fun m!1145415 () Bool)

(assert (=> b!1242698 m!1145415))

(assert (=> b!1242297 d!136891))

(declare-fun d!136893 () Bool)

(declare-fun res!828720 () Bool)

(declare-fun e!704482 () Bool)

(assert (=> d!136893 (=> res!828720 e!704482)))

(assert (=> d!136893 (= res!828720 (or (is-Nil!27369 lt!562218) (is-Nil!27369 (t!40835 lt!562218))))))

(assert (=> d!136893 (= (isStrictlySorted!765 lt!562218) e!704482)))

(declare-fun b!1242699 () Bool)

(declare-fun e!704483 () Bool)

(assert (=> b!1242699 (= e!704482 e!704483)))

(declare-fun res!828721 () Bool)

(assert (=> b!1242699 (=> (not res!828721) (not e!704483))))

(assert (=> b!1242699 (= res!828721 (bvslt (_1!10154 (h!28577 lt!562218)) (_1!10154 (h!28577 (t!40835 lt!562218)))))))

(declare-fun b!1242700 () Bool)

(assert (=> b!1242700 (= e!704483 (isStrictlySorted!765 (t!40835 lt!562218)))))

(assert (= (and d!136893 (not res!828720)) b!1242699))

(assert (= (and b!1242699 res!828721) b!1242700))

(declare-fun m!1145417 () Bool)

(assert (=> b!1242700 m!1145417))

(assert (=> d!136619 d!136893))

(assert (=> d!136619 d!136637))

(declare-fun b!1242701 () Bool)

(declare-fun e!704484 () Bool)

(declare-fun tp!92762 () Bool)

(assert (=> b!1242701 (= e!704484 (and tp_is_empty!31289 tp!92762))))

(assert (=> b!1242308 (= tp!92755 e!704484)))

(assert (= (and b!1242308 (is-Cons!27368 (t!40835 (t!40835 l!644)))) b!1242701))

(push 1)

(assert (not b!1242634))

(assert (not b!1242603))

(assert (not b!1242700))

(assert (not d!136845))

(assert (not bm!61349))

(assert (not b!1242630))

(assert (not b!1242617))

(assert (not b!1242676))

(assert (not b!1242640))

(assert (not b!1242687))

(assert (not b!1242672))

(assert (not b!1242684))

(assert (not b!1242694))

(assert (not b!1242647))

(assert (not bm!61346))

(assert (not b!1242607))

(assert (not b!1242678))

(assert (not b!1242701))

(assert (not d!136873))

(assert (not b!1242649))

(assert (not b!1242690))

(assert (not d!136827))

(assert (not d!136849))

(assert (not d!136879))

(assert (not b!1242643))

(assert (not b!1242645))

(assert (not b!1242613))

(assert (not b!1242688))

(assert (not b!1242664))

(assert (not d!136877))

(assert (not b!1242605))

(assert (not b!1242660))

(assert (not b!1242662))

(assert (not b!1242675))

(assert (not d!136861))

(assert (not b!1242658))

(assert (not b!1242624))

(assert (not b!1242618))

(assert (not b!1242651))

(assert (not b!1242620))

(assert (not bm!61343))

(assert (not b!1242622))

(assert (not d!136817))

(assert (not d!136883))

(assert tp_is_empty!31289)

(assert (not b!1242698))

(assert (not b!1242633))

(assert (not b!1242655))

(assert (not b!1242666))

(assert (not b!1242641))

(assert (not b!1242696))

(assert (not b!1242636))

(assert (not d!136835))

(assert (not d!136857))

(assert (not b!1242692))

(assert (not b!1242656))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

