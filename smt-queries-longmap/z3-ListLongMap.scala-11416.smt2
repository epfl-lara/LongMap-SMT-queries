; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132978 () Bool)

(assert start!132978)

(declare-fun res!1065052 () Bool)

(declare-fun e!867241 () Bool)

(assert (=> start!132978 (=> (not res!1065052) (not e!867241))))

(declare-datatypes ((B!2372 0))(
  ( (B!2373 (val!19272 Int)) )
))
(declare-datatypes ((tuple2!24992 0))(
  ( (tuple2!24993 (_1!12507 (_ BitVec 64)) (_2!12507 B!2372)) )
))
(declare-datatypes ((List!36351 0))(
  ( (Nil!36348) (Cons!36347 (h!37794 tuple2!24992) (t!51070 List!36351)) )
))
(declare-datatypes ((ListLongMap!22493 0))(
  ( (ListLongMap!22494 (toList!11262 List!36351)) )
))
(declare-fun lm!250 () ListLongMap!22493)

(declare-fun a0!50 () (_ BitVec 64))

(declare-fun contains!10152 (ListLongMap!22493 (_ BitVec 64)) Bool)

(assert (=> start!132978 (= res!1065052 (contains!10152 lm!250 a0!50))))

(assert (=> start!132978 e!867241))

(declare-fun e!867242 () Bool)

(declare-fun inv!57465 (ListLongMap!22493) Bool)

(assert (=> start!132978 (and (inv!57465 lm!250) e!867242)))

(assert (=> start!132978 true))

(declare-fun tp_is_empty!38377 () Bool)

(assert (=> start!132978 tp_is_empty!38377))

(declare-fun b!1556933 () Bool)

(declare-fun res!1065055 () Bool)

(assert (=> b!1556933 (=> (not res!1065055) (not e!867241))))

(declare-fun containsKey!816 (List!36351 (_ BitVec 64)) Bool)

(assert (=> b!1556933 (= res!1065055 (containsKey!816 (toList!11262 lm!250) a0!50))))

(declare-fun b!1556934 () Bool)

(declare-fun res!1065054 () Bool)

(assert (=> b!1556934 (=> (not res!1065054) (not e!867241))))

(declare-fun a!524 () (_ BitVec 64))

(assert (=> b!1556934 (= res!1065054 (not (= a0!50 a!524)))))

(declare-fun b!97 () B!2372)

(declare-fun b!1556935 () Bool)

(declare-fun +!5049 (ListLongMap!22493 tuple2!24992) ListLongMap!22493)

(assert (=> b!1556935 (= e!867241 (not (contains!10152 (+!5049 lm!250 (tuple2!24993 a!524 b!97)) a0!50)))))

(declare-fun insertStrictlySorted!556 (List!36351 (_ BitVec 64) B!2372) List!36351)

(assert (=> b!1556935 (containsKey!816 (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97) a0!50)))

(declare-datatypes ((Unit!51669 0))(
  ( (Unit!51670) )
))
(declare-fun lt!670237 () Unit!51669)

(declare-fun lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!1 (List!36351 (_ BitVec 64) B!2372 (_ BitVec 64)) Unit!51669)

(assert (=> b!1556935 (= lt!670237 (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!1 (toList!11262 lm!250) a!524 b!97 a0!50))))

(declare-fun b!1556936 () Bool)

(declare-fun res!1065051 () Bool)

(assert (=> b!1556936 (=> (not res!1065051) (not e!867241))))

(declare-fun isStrictlySorted!954 (List!36351) Bool)

(assert (=> b!1556936 (= res!1065051 (isStrictlySorted!954 (toList!11262 lm!250)))))

(declare-fun b!1556937 () Bool)

(declare-fun tp!112495 () Bool)

(assert (=> b!1556937 (= e!867242 tp!112495)))

(declare-fun b!1556938 () Bool)

(declare-fun res!1065053 () Bool)

(assert (=> b!1556938 (=> (not res!1065053) (not e!867241))))

(assert (=> b!1556938 (= res!1065053 (not (= a!524 a0!50)))))

(assert (= (and start!132978 res!1065052) b!1556938))

(assert (= (and b!1556938 res!1065053) b!1556936))

(assert (= (and b!1556936 res!1065051) b!1556933))

(assert (= (and b!1556933 res!1065055) b!1556934))

(assert (= (and b!1556934 res!1065054) b!1556935))

(assert (= start!132978 b!1556937))

(declare-fun m!1433525 () Bool)

(assert (=> start!132978 m!1433525))

(declare-fun m!1433527 () Bool)

(assert (=> start!132978 m!1433527))

(declare-fun m!1433529 () Bool)

(assert (=> b!1556933 m!1433529))

(declare-fun m!1433531 () Bool)

(assert (=> b!1556935 m!1433531))

(declare-fun m!1433533 () Bool)

(assert (=> b!1556935 m!1433533))

(declare-fun m!1433535 () Bool)

(assert (=> b!1556935 m!1433535))

(assert (=> b!1556935 m!1433533))

(assert (=> b!1556935 m!1433531))

(declare-fun m!1433537 () Bool)

(assert (=> b!1556935 m!1433537))

(declare-fun m!1433539 () Bool)

(assert (=> b!1556935 m!1433539))

(declare-fun m!1433541 () Bool)

(assert (=> b!1556936 m!1433541))

(check-sat (not b!1556935) tp_is_empty!38377 (not b!1556936) (not b!1556933) (not b!1556937) (not start!132978))
(check-sat)
(get-model)

(declare-fun d!162169 () Bool)

(declare-fun res!1065090 () Bool)

(declare-fun e!867259 () Bool)

(assert (=> d!162169 (=> res!1065090 e!867259)))

(get-info :version)

(assert (=> d!162169 (= res!1065090 (or ((_ is Nil!36348) (toList!11262 lm!250)) ((_ is Nil!36348) (t!51070 (toList!11262 lm!250)))))))

(assert (=> d!162169 (= (isStrictlySorted!954 (toList!11262 lm!250)) e!867259)))

(declare-fun b!1556979 () Bool)

(declare-fun e!867260 () Bool)

(assert (=> b!1556979 (= e!867259 e!867260)))

(declare-fun res!1065091 () Bool)

(assert (=> b!1556979 (=> (not res!1065091) (not e!867260))))

(assert (=> b!1556979 (= res!1065091 (bvslt (_1!12507 (h!37794 (toList!11262 lm!250))) (_1!12507 (h!37794 (t!51070 (toList!11262 lm!250))))))))

(declare-fun b!1556980 () Bool)

(assert (=> b!1556980 (= e!867260 (isStrictlySorted!954 (t!51070 (toList!11262 lm!250))))))

(assert (= (and d!162169 (not res!1065090)) b!1556979))

(assert (= (and b!1556979 res!1065091) b!1556980))

(declare-fun m!1433579 () Bool)

(assert (=> b!1556980 m!1433579))

(assert (=> b!1556936 d!162169))

(declare-fun d!162173 () Bool)

(declare-fun res!1065106 () Bool)

(declare-fun e!867275 () Bool)

(assert (=> d!162173 (=> res!1065106 e!867275)))

(assert (=> d!162173 (= res!1065106 (and ((_ is Cons!36347) (toList!11262 lm!250)) (= (_1!12507 (h!37794 (toList!11262 lm!250))) a0!50)))))

(assert (=> d!162173 (= (containsKey!816 (toList!11262 lm!250) a0!50) e!867275)))

(declare-fun b!1556993 () Bool)

(declare-fun e!867276 () Bool)

(assert (=> b!1556993 (= e!867275 e!867276)))

(declare-fun res!1065107 () Bool)

(assert (=> b!1556993 (=> (not res!1065107) (not e!867276))))

(assert (=> b!1556993 (= res!1065107 (and (or (not ((_ is Cons!36347) (toList!11262 lm!250))) (bvsle (_1!12507 (h!37794 (toList!11262 lm!250))) a0!50)) ((_ is Cons!36347) (toList!11262 lm!250)) (bvslt (_1!12507 (h!37794 (toList!11262 lm!250))) a0!50)))))

(declare-fun b!1556994 () Bool)

(assert (=> b!1556994 (= e!867276 (containsKey!816 (t!51070 (toList!11262 lm!250)) a0!50))))

(assert (= (and d!162173 (not res!1065106)) b!1556993))

(assert (= (and b!1556993 res!1065107) b!1556994))

(declare-fun m!1433583 () Bool)

(assert (=> b!1556994 m!1433583))

(assert (=> b!1556933 d!162173))

(declare-fun d!162179 () Bool)

(declare-fun e!867289 () Bool)

(assert (=> d!162179 e!867289))

(declare-fun res!1065118 () Bool)

(assert (=> d!162179 (=> res!1065118 e!867289)))

(declare-fun lt!670253 () Bool)

(assert (=> d!162179 (= res!1065118 (not lt!670253))))

(declare-fun lt!670255 () Bool)

(assert (=> d!162179 (= lt!670253 lt!670255)))

(declare-fun lt!670254 () Unit!51669)

(declare-fun e!867290 () Unit!51669)

(assert (=> d!162179 (= lt!670254 e!867290)))

(declare-fun c!143853 () Bool)

(assert (=> d!162179 (= c!143853 lt!670255)))

(assert (=> d!162179 (= lt!670255 (containsKey!816 (toList!11262 lm!250) a0!50))))

(assert (=> d!162179 (= (contains!10152 lm!250 a0!50) lt!670253)))

(declare-fun b!1557011 () Bool)

(declare-fun lt!670252 () Unit!51669)

(assert (=> b!1557011 (= e!867290 lt!670252)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!524 (List!36351 (_ BitVec 64)) Unit!51669)

(assert (=> b!1557011 (= lt!670252 (lemmaContainsKeyImpliesGetValueByKeyDefined!524 (toList!11262 lm!250) a0!50))))

(declare-datatypes ((Option!862 0))(
  ( (Some!861 (v!22046 B!2372)) (None!860) )
))
(declare-fun isDefined!575 (Option!862) Bool)

(declare-fun getValueByKey!787 (List!36351 (_ BitVec 64)) Option!862)

(assert (=> b!1557011 (isDefined!575 (getValueByKey!787 (toList!11262 lm!250) a0!50))))

(declare-fun b!1557012 () Bool)

(declare-fun Unit!51675 () Unit!51669)

(assert (=> b!1557012 (= e!867290 Unit!51675)))

(declare-fun b!1557013 () Bool)

(assert (=> b!1557013 (= e!867289 (isDefined!575 (getValueByKey!787 (toList!11262 lm!250) a0!50)))))

(assert (= (and d!162179 c!143853) b!1557011))

(assert (= (and d!162179 (not c!143853)) b!1557012))

(assert (= (and d!162179 (not res!1065118)) b!1557013))

(assert (=> d!162179 m!1433529))

(declare-fun m!1433589 () Bool)

(assert (=> b!1557011 m!1433589))

(declare-fun m!1433591 () Bool)

(assert (=> b!1557011 m!1433591))

(assert (=> b!1557011 m!1433591))

(declare-fun m!1433593 () Bool)

(assert (=> b!1557011 m!1433593))

(assert (=> b!1557013 m!1433591))

(assert (=> b!1557013 m!1433591))

(assert (=> b!1557013 m!1433593))

(assert (=> start!132978 d!162179))

(declare-fun d!162185 () Bool)

(assert (=> d!162185 (= (inv!57465 lm!250) (isStrictlySorted!954 (toList!11262 lm!250)))))

(declare-fun bs!44719 () Bool)

(assert (= bs!44719 d!162185))

(assert (=> bs!44719 m!1433541))

(assert (=> start!132978 d!162185))

(declare-fun lt!670278 () List!36351)

(declare-fun e!867335 () Bool)

(declare-fun b!1557102 () Bool)

(declare-fun contains!10155 (List!36351 tuple2!24992) Bool)

(assert (=> b!1557102 (= e!867335 (contains!10155 lt!670278 (tuple2!24993 a!524 b!97)))))

(declare-fun b!1557103 () Bool)

(declare-fun e!867338 () List!36351)

(declare-fun e!867336 () List!36351)

(assert (=> b!1557103 (= e!867338 e!867336)))

(declare-fun c!143891 () Bool)

(assert (=> b!1557103 (= c!143891 (and ((_ is Cons!36347) (toList!11262 lm!250)) (= (_1!12507 (h!37794 (toList!11262 lm!250))) a!524)))))

(declare-fun e!867337 () List!36351)

(declare-fun b!1557104 () Bool)

(declare-fun c!143889 () Bool)

(assert (=> b!1557104 (= e!867337 (ite c!143891 (t!51070 (toList!11262 lm!250)) (ite c!143889 (Cons!36347 (h!37794 (toList!11262 lm!250)) (t!51070 (toList!11262 lm!250))) Nil!36348)))))

(declare-fun b!1557105 () Bool)

(declare-fun call!71651 () List!36351)

(assert (=> b!1557105 (= e!867338 call!71651)))

(declare-fun bm!71648 () Bool)

(declare-fun call!71653 () List!36351)

(declare-fun call!71652 () List!36351)

(assert (=> bm!71648 (= call!71653 call!71652)))

(declare-fun d!162187 () Bool)

(assert (=> d!162187 e!867335))

(declare-fun res!1065138 () Bool)

(assert (=> d!162187 (=> (not res!1065138) (not e!867335))))

(assert (=> d!162187 (= res!1065138 (isStrictlySorted!954 lt!670278))))

(assert (=> d!162187 (= lt!670278 e!867338)))

(declare-fun c!143888 () Bool)

(assert (=> d!162187 (= c!143888 (and ((_ is Cons!36347) (toList!11262 lm!250)) (bvslt (_1!12507 (h!37794 (toList!11262 lm!250))) a!524)))))

(assert (=> d!162187 (isStrictlySorted!954 (toList!11262 lm!250))))

(assert (=> d!162187 (= (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97) lt!670278)))

(declare-fun b!1557106 () Bool)

(assert (=> b!1557106 (= c!143889 (and ((_ is Cons!36347) (toList!11262 lm!250)) (bvsgt (_1!12507 (h!37794 (toList!11262 lm!250))) a!524)))))

(declare-fun e!867339 () List!36351)

(assert (=> b!1557106 (= e!867336 e!867339)))

(declare-fun b!1557107 () Bool)

(declare-fun res!1065137 () Bool)

(assert (=> b!1557107 (=> (not res!1065137) (not e!867335))))

(assert (=> b!1557107 (= res!1065137 (containsKey!816 lt!670278 a!524))))

(declare-fun b!1557108 () Bool)

(assert (=> b!1557108 (= e!867337 (insertStrictlySorted!556 (t!51070 (toList!11262 lm!250)) a!524 b!97))))

(declare-fun b!1557109 () Bool)

(assert (=> b!1557109 (= e!867339 call!71653)))

(declare-fun bm!71649 () Bool)

(declare-fun $colon$colon!976 (List!36351 tuple2!24992) List!36351)

(assert (=> bm!71649 (= call!71651 ($colon$colon!976 e!867337 (ite c!143888 (h!37794 (toList!11262 lm!250)) (tuple2!24993 a!524 b!97))))))

(declare-fun c!143890 () Bool)

(assert (=> bm!71649 (= c!143890 c!143888)))

(declare-fun bm!71650 () Bool)

(assert (=> bm!71650 (= call!71652 call!71651)))

(declare-fun b!1557110 () Bool)

(assert (=> b!1557110 (= e!867336 call!71652)))

(declare-fun b!1557111 () Bool)

(assert (=> b!1557111 (= e!867339 call!71653)))

(assert (= (and d!162187 c!143888) b!1557105))

(assert (= (and d!162187 (not c!143888)) b!1557103))

(assert (= (and b!1557103 c!143891) b!1557110))

(assert (= (and b!1557103 (not c!143891)) b!1557106))

(assert (= (and b!1557106 c!143889) b!1557109))

(assert (= (and b!1557106 (not c!143889)) b!1557111))

(assert (= (or b!1557109 b!1557111) bm!71648))

(assert (= (or b!1557110 bm!71648) bm!71650))

(assert (= (or b!1557105 bm!71650) bm!71649))

(assert (= (and bm!71649 c!143890) b!1557108))

(assert (= (and bm!71649 (not c!143890)) b!1557104))

(assert (= (and d!162187 res!1065138) b!1557107))

(assert (= (and b!1557107 res!1065137) b!1557102))

(declare-fun m!1433615 () Bool)

(assert (=> b!1557107 m!1433615))

(declare-fun m!1433617 () Bool)

(assert (=> b!1557102 m!1433617))

(declare-fun m!1433619 () Bool)

(assert (=> b!1557108 m!1433619))

(declare-fun m!1433621 () Bool)

(assert (=> bm!71649 m!1433621))

(declare-fun m!1433623 () Bool)

(assert (=> d!162187 m!1433623))

(assert (=> d!162187 m!1433541))

(assert (=> b!1556935 d!162187))

(declare-fun d!162193 () Bool)

(declare-fun e!867346 () Bool)

(assert (=> d!162193 e!867346))

(declare-fun res!1065142 () Bool)

(assert (=> d!162193 (=> res!1065142 e!867346)))

(declare-fun lt!670286 () Bool)

(assert (=> d!162193 (= res!1065142 (not lt!670286))))

(declare-fun lt!670288 () Bool)

(assert (=> d!162193 (= lt!670286 lt!670288)))

(declare-fun lt!670287 () Unit!51669)

(declare-fun e!867347 () Unit!51669)

(assert (=> d!162193 (= lt!670287 e!867347)))

(declare-fun c!143895 () Bool)

(assert (=> d!162193 (= c!143895 lt!670288)))

(assert (=> d!162193 (= lt!670288 (containsKey!816 (toList!11262 (+!5049 lm!250 (tuple2!24993 a!524 b!97))) a0!50))))

(assert (=> d!162193 (= (contains!10152 (+!5049 lm!250 (tuple2!24993 a!524 b!97)) a0!50) lt!670286)))

(declare-fun b!1557119 () Bool)

(declare-fun lt!670285 () Unit!51669)

(assert (=> b!1557119 (= e!867347 lt!670285)))

(assert (=> b!1557119 (= lt!670285 (lemmaContainsKeyImpliesGetValueByKeyDefined!524 (toList!11262 (+!5049 lm!250 (tuple2!24993 a!524 b!97))) a0!50))))

(assert (=> b!1557119 (isDefined!575 (getValueByKey!787 (toList!11262 (+!5049 lm!250 (tuple2!24993 a!524 b!97))) a0!50))))

(declare-fun b!1557120 () Bool)

(declare-fun Unit!51676 () Unit!51669)

(assert (=> b!1557120 (= e!867347 Unit!51676)))

(declare-fun b!1557121 () Bool)

(assert (=> b!1557121 (= e!867346 (isDefined!575 (getValueByKey!787 (toList!11262 (+!5049 lm!250 (tuple2!24993 a!524 b!97))) a0!50)))))

(assert (= (and d!162193 c!143895) b!1557119))

(assert (= (and d!162193 (not c!143895)) b!1557120))

(assert (= (and d!162193 (not res!1065142)) b!1557121))

(declare-fun m!1433629 () Bool)

(assert (=> d!162193 m!1433629))

(declare-fun m!1433633 () Bool)

(assert (=> b!1557119 m!1433633))

(declare-fun m!1433635 () Bool)

(assert (=> b!1557119 m!1433635))

(assert (=> b!1557119 m!1433635))

(declare-fun m!1433639 () Bool)

(assert (=> b!1557119 m!1433639))

(assert (=> b!1557121 m!1433635))

(assert (=> b!1557121 m!1433635))

(assert (=> b!1557121 m!1433639))

(assert (=> b!1556935 d!162193))

(declare-fun d!162197 () Bool)

(assert (=> d!162197 (containsKey!816 (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97) a0!50)))

(declare-fun lt!670300 () Unit!51669)

(declare-fun choose!2073 (List!36351 (_ BitVec 64) B!2372 (_ BitVec 64)) Unit!51669)

(assert (=> d!162197 (= lt!670300 (choose!2073 (toList!11262 lm!250) a!524 b!97 a0!50))))

(declare-fun e!867357 () Bool)

(assert (=> d!162197 e!867357))

(declare-fun res!1065158 () Bool)

(assert (=> d!162197 (=> (not res!1065158) (not e!867357))))

(assert (=> d!162197 (= res!1065158 (isStrictlySorted!954 (toList!11262 lm!250)))))

(assert (=> d!162197 (= (lemmaInsertStrictlySortedDoesNotModifyOtherKeysContained!1 (toList!11262 lm!250) a!524 b!97 a0!50) lt!670300)))

(declare-fun b!1557139 () Bool)

(declare-fun res!1065159 () Bool)

(assert (=> b!1557139 (=> (not res!1065159) (not e!867357))))

(assert (=> b!1557139 (= res!1065159 (containsKey!816 (toList!11262 lm!250) a0!50))))

(declare-fun b!1557140 () Bool)

(assert (=> b!1557140 (= e!867357 (not (= a0!50 a!524)))))

(assert (= (and d!162197 res!1065158) b!1557139))

(assert (= (and b!1557139 res!1065159) b!1557140))

(assert (=> d!162197 m!1433533))

(assert (=> d!162197 m!1433533))

(assert (=> d!162197 m!1433535))

(declare-fun m!1433651 () Bool)

(assert (=> d!162197 m!1433651))

(assert (=> d!162197 m!1433541))

(assert (=> b!1557139 m!1433529))

(assert (=> b!1556935 d!162197))

(declare-fun d!162202 () Bool)

(declare-fun res!1065160 () Bool)

(declare-fun e!867358 () Bool)

(assert (=> d!162202 (=> res!1065160 e!867358)))

(assert (=> d!162202 (= res!1065160 (and ((_ is Cons!36347) (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97)) (= (_1!12507 (h!37794 (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97))) a0!50)))))

(assert (=> d!162202 (= (containsKey!816 (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97) a0!50) e!867358)))

(declare-fun b!1557141 () Bool)

(declare-fun e!867360 () Bool)

(assert (=> b!1557141 (= e!867358 e!867360)))

(declare-fun res!1065162 () Bool)

(assert (=> b!1557141 (=> (not res!1065162) (not e!867360))))

(assert (=> b!1557141 (= res!1065162 (and (or (not ((_ is Cons!36347) (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97))) (bvsle (_1!12507 (h!37794 (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97))) a0!50)) ((_ is Cons!36347) (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97)) (bvslt (_1!12507 (h!37794 (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97))) a0!50)))))

(declare-fun b!1557143 () Bool)

(assert (=> b!1557143 (= e!867360 (containsKey!816 (t!51070 (insertStrictlySorted!556 (toList!11262 lm!250) a!524 b!97)) a0!50))))

(assert (= (and d!162202 (not res!1065160)) b!1557141))

(assert (= (and b!1557141 res!1065162) b!1557143))

(declare-fun m!1433653 () Bool)

(assert (=> b!1557143 m!1433653))

(assert (=> b!1556935 d!162202))

(declare-fun d!162205 () Bool)

(declare-fun e!867372 () Bool)

(assert (=> d!162205 e!867372))

(declare-fun res!1065183 () Bool)

(assert (=> d!162205 (=> (not res!1065183) (not e!867372))))

(declare-fun lt!670333 () ListLongMap!22493)

(assert (=> d!162205 (= res!1065183 (contains!10152 lt!670333 (_1!12507 (tuple2!24993 a!524 b!97))))))

(declare-fun lt!670332 () List!36351)

(assert (=> d!162205 (= lt!670333 (ListLongMap!22494 lt!670332))))

(declare-fun lt!670331 () Unit!51669)

(declare-fun lt!670330 () Unit!51669)

(assert (=> d!162205 (= lt!670331 lt!670330)))

(assert (=> d!162205 (= (getValueByKey!787 lt!670332 (_1!12507 (tuple2!24993 a!524 b!97))) (Some!861 (_2!12507 (tuple2!24993 a!524 b!97))))))

(declare-fun lemmaContainsTupThenGetReturnValue!382 (List!36351 (_ BitVec 64) B!2372) Unit!51669)

(assert (=> d!162205 (= lt!670330 (lemmaContainsTupThenGetReturnValue!382 lt!670332 (_1!12507 (tuple2!24993 a!524 b!97)) (_2!12507 (tuple2!24993 a!524 b!97))))))

(assert (=> d!162205 (= lt!670332 (insertStrictlySorted!556 (toList!11262 lm!250) (_1!12507 (tuple2!24993 a!524 b!97)) (_2!12507 (tuple2!24993 a!524 b!97))))))

(assert (=> d!162205 (= (+!5049 lm!250 (tuple2!24993 a!524 b!97)) lt!670333)))

(declare-fun b!1557163 () Bool)

(declare-fun res!1065182 () Bool)

(assert (=> b!1557163 (=> (not res!1065182) (not e!867372))))

(assert (=> b!1557163 (= res!1065182 (= (getValueByKey!787 (toList!11262 lt!670333) (_1!12507 (tuple2!24993 a!524 b!97))) (Some!861 (_2!12507 (tuple2!24993 a!524 b!97)))))))

(declare-fun b!1557164 () Bool)

(assert (=> b!1557164 (= e!867372 (contains!10155 (toList!11262 lt!670333) (tuple2!24993 a!524 b!97)))))

(assert (= (and d!162205 res!1065183) b!1557163))

(assert (= (and b!1557163 res!1065182) b!1557164))

(declare-fun m!1433663 () Bool)

(assert (=> d!162205 m!1433663))

(declare-fun m!1433667 () Bool)

(assert (=> d!162205 m!1433667))

(declare-fun m!1433671 () Bool)

(assert (=> d!162205 m!1433671))

(declare-fun m!1433675 () Bool)

(assert (=> d!162205 m!1433675))

(declare-fun m!1433679 () Bool)

(assert (=> b!1557163 m!1433679))

(declare-fun m!1433683 () Bool)

(assert (=> b!1557164 m!1433683))

(assert (=> b!1556935 d!162205))

(declare-fun b!1557174 () Bool)

(declare-fun e!867378 () Bool)

(declare-fun tp!112504 () Bool)

(assert (=> b!1557174 (= e!867378 (and tp_is_empty!38377 tp!112504))))

(assert (=> b!1556937 (= tp!112495 e!867378)))

(assert (= (and b!1556937 ((_ is Cons!36347) (toList!11262 lm!250))) b!1557174))

(check-sat (not b!1557013) (not d!162179) (not b!1557174) (not b!1557011) (not d!162197) (not d!162187) (not b!1557139) (not b!1557102) (not d!162193) (not b!1557163) (not d!162185) (not b!1556980) (not b!1557107) (not b!1557121) (not b!1557119) tp_is_empty!38377 (not b!1556994) (not d!162205) (not bm!71649) (not b!1557108) (not b!1557164) (not b!1557143))
(check-sat)
