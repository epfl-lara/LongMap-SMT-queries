; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134898 () Bool)

(assert start!134898)

(declare-fun b!1572338 () Bool)

(declare-fun res!1073696 () Bool)

(declare-fun e!876704 () Bool)

(assert (=> b!1572338 (=> (not res!1073696) (not e!876704))))

(declare-datatypes ((B!2546 0))(
  ( (B!2547 (val!19635 Int)) )
))
(declare-datatypes ((tuple2!25432 0))(
  ( (tuple2!25433 (_1!12727 (_ BitVec 64)) (_2!12727 B!2546)) )
))
(declare-datatypes ((List!36787 0))(
  ( (Nil!36784) (Cons!36783 (h!38248 tuple2!25432) (t!51687 List!36787)) )
))
(declare-fun l!750 () List!36787)

(declare-fun isStrictlySorted!1007 (List!36787) Bool)

(assert (=> b!1572338 (= res!1073696 (isStrictlySorted!1007 l!750))))

(declare-fun b!1572339 () Bool)

(declare-fun res!1073693 () Bool)

(assert (=> b!1572339 (=> (not res!1073693) (not e!876704))))

(assert (=> b!1572339 (= res!1073693 (isStrictlySorted!1007 (t!51687 l!750)))))

(declare-fun b!1572340 () Bool)

(declare-fun res!1073695 () Bool)

(assert (=> b!1572340 (=> (not res!1073695) (not e!876704))))

(declare-fun key2!21 () (_ BitVec 64))

(declare-fun key1!37 () (_ BitVec 64))

(get-info :version)

(assert (=> b!1572340 (= res!1073695 (and ((_ is Cons!36783) l!750) (bvslt (_1!12727 (h!38248 l!750)) key1!37) (bvslt (_1!12727 (h!38248 l!750)) key2!21)))))

(declare-fun b!1572341 () Bool)

(declare-fun e!876703 () Bool)

(declare-fun tp_is_empty!39097 () Bool)

(declare-fun tp!114210 () Bool)

(assert (=> b!1572341 (= e!876703 (and tp_is_empty!39097 tp!114210))))

(declare-fun v1!32 () B!2546)

(declare-fun v2!10 () B!2546)

(declare-fun b!1572342 () Bool)

(declare-fun insertStrictlySorted!597 (List!36787 (_ BitVec 64) B!2546) List!36787)

(assert (=> b!1572342 (= e!876704 (not (= (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key2!21 v2!10) key1!37 v1!32))))))

(assert (=> b!1572342 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-datatypes ((Unit!52005 0))(
  ( (Unit!52006) )
))
(declare-fun lt!674247 () Unit!52005)

(declare-fun lemmaInsertStrictlySortedCommutative!16 (List!36787 (_ BitVec 64) B!2546 (_ BitVec 64) B!2546) Unit!52005)

(assert (=> b!1572342 (= lt!674247 (lemmaInsertStrictlySortedCommutative!16 (t!51687 l!750) key1!37 v1!32 key2!21 v2!10))))

(declare-fun res!1073694 () Bool)

(assert (=> start!134898 (=> (not res!1073694) (not e!876704))))

(assert (=> start!134898 (= res!1073694 (not (= key1!37 key2!21)))))

(assert (=> start!134898 e!876704))

(assert (=> start!134898 tp_is_empty!39097))

(assert (=> start!134898 e!876703))

(assert (=> start!134898 true))

(assert (= (and start!134898 res!1073694) b!1572338))

(assert (= (and b!1572338 res!1073696) b!1572340))

(assert (= (and b!1572340 res!1073695) b!1572339))

(assert (= (and b!1572339 res!1073693) b!1572342))

(assert (= (and start!134898 ((_ is Cons!36783) l!750)) b!1572341))

(declare-fun m!1446195 () Bool)

(assert (=> b!1572338 m!1446195))

(declare-fun m!1446197 () Bool)

(assert (=> b!1572339 m!1446197))

(declare-fun m!1446199 () Bool)

(assert (=> b!1572342 m!1446199))

(declare-fun m!1446201 () Bool)

(assert (=> b!1572342 m!1446201))

(declare-fun m!1446203 () Bool)

(assert (=> b!1572342 m!1446203))

(declare-fun m!1446205 () Bool)

(assert (=> b!1572342 m!1446205))

(declare-fun m!1446207 () Bool)

(assert (=> b!1572342 m!1446207))

(assert (=> b!1572342 m!1446201))

(declare-fun m!1446209 () Bool)

(assert (=> b!1572342 m!1446209))

(assert (=> b!1572342 m!1446205))

(declare-fun m!1446211 () Bool)

(assert (=> b!1572342 m!1446211))

(declare-fun m!1446213 () Bool)

(assert (=> b!1572342 m!1446213))

(assert (=> b!1572342 m!1446211))

(assert (=> b!1572342 m!1446199))

(declare-fun m!1446215 () Bool)

(assert (=> b!1572342 m!1446215))

(check-sat tp_is_empty!39097 (not b!1572339) (not b!1572342) (not b!1572341) (not b!1572338))
(check-sat)
(get-model)

(declare-fun d!164675 () Bool)

(declare-fun res!1073725 () Bool)

(declare-fun e!876721 () Bool)

(assert (=> d!164675 (=> res!1073725 e!876721)))

(assert (=> d!164675 (= res!1073725 (or ((_ is Nil!36784) l!750) ((_ is Nil!36784) (t!51687 l!750))))))

(assert (=> d!164675 (= (isStrictlySorted!1007 l!750) e!876721)))

(declare-fun b!1572377 () Bool)

(declare-fun e!876722 () Bool)

(assert (=> b!1572377 (= e!876721 e!876722)))

(declare-fun res!1073726 () Bool)

(assert (=> b!1572377 (=> (not res!1073726) (not e!876722))))

(assert (=> b!1572377 (= res!1073726 (bvslt (_1!12727 (h!38248 l!750)) (_1!12727 (h!38248 (t!51687 l!750)))))))

(declare-fun b!1572378 () Bool)

(assert (=> b!1572378 (= e!876722 (isStrictlySorted!1007 (t!51687 l!750)))))

(assert (= (and d!164675 (not res!1073725)) b!1572377))

(assert (= (and b!1572377 res!1073726) b!1572378))

(assert (=> b!1572378 m!1446197))

(assert (=> b!1572338 d!164675))

(declare-fun d!164677 () Bool)

(declare-fun res!1073727 () Bool)

(declare-fun e!876723 () Bool)

(assert (=> d!164677 (=> res!1073727 e!876723)))

(assert (=> d!164677 (= res!1073727 (or ((_ is Nil!36784) (t!51687 l!750)) ((_ is Nil!36784) (t!51687 (t!51687 l!750)))))))

(assert (=> d!164677 (= (isStrictlySorted!1007 (t!51687 l!750)) e!876723)))

(declare-fun b!1572379 () Bool)

(declare-fun e!876724 () Bool)

(assert (=> b!1572379 (= e!876723 e!876724)))

(declare-fun res!1073728 () Bool)

(assert (=> b!1572379 (=> (not res!1073728) (not e!876724))))

(assert (=> b!1572379 (= res!1073728 (bvslt (_1!12727 (h!38248 (t!51687 l!750))) (_1!12727 (h!38248 (t!51687 (t!51687 l!750))))))))

(declare-fun b!1572380 () Bool)

(assert (=> b!1572380 (= e!876724 (isStrictlySorted!1007 (t!51687 (t!51687 l!750))))))

(assert (= (and d!164677 (not res!1073727)) b!1572379))

(assert (= (and b!1572379 res!1073728) b!1572380))

(declare-fun m!1446261 () Bool)

(assert (=> b!1572380 m!1446261))

(assert (=> b!1572339 d!164677))

(declare-fun b!1572427 () Bool)

(declare-fun e!876754 () List!36787)

(declare-fun e!876753 () List!36787)

(assert (=> b!1572427 (= e!876754 e!876753)))

(declare-fun c!145615 () Bool)

(assert (=> b!1572427 (= c!145615 (and ((_ is Cons!36783) (insertStrictlySorted!597 l!750 key2!21 v2!10)) (= (_1!12727 (h!38248 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37)))))

(declare-fun b!1572428 () Bool)

(declare-fun call!72282 () List!36787)

(assert (=> b!1572428 (= e!876754 call!72282)))

(declare-fun bm!72279 () Bool)

(declare-fun call!72284 () List!36787)

(assert (=> bm!72279 (= call!72284 call!72282)))

(declare-fun e!876752 () Bool)

(declare-fun b!1572429 () Bool)

(declare-fun lt!674258 () List!36787)

(declare-fun contains!10472 (List!36787 tuple2!25432) Bool)

(assert (=> b!1572429 (= e!876752 (contains!10472 lt!674258 (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572430 () Bool)

(declare-fun e!876755 () List!36787)

(declare-fun call!72283 () List!36787)

(assert (=> b!1572430 (= e!876755 call!72283)))

(declare-fun d!164679 () Bool)

(assert (=> d!164679 e!876752))

(declare-fun res!1073743 () Bool)

(assert (=> d!164679 (=> (not res!1073743) (not e!876752))))

(assert (=> d!164679 (= res!1073743 (isStrictlySorted!1007 lt!674258))))

(assert (=> d!164679 (= lt!674258 e!876754)))

(declare-fun c!145612 () Bool)

(assert (=> d!164679 (= c!145612 (and ((_ is Cons!36783) (insertStrictlySorted!597 l!750 key2!21 v2!10)) (bvslt (_1!12727 (h!38248 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> d!164679 (isStrictlySorted!1007 (insertStrictlySorted!597 l!750 key2!21 v2!10))))

(assert (=> d!164679 (= (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key2!21 v2!10) key1!37 v1!32) lt!674258)))

(declare-fun c!145614 () Bool)

(declare-fun b!1572431 () Bool)

(assert (=> b!1572431 (= c!145614 (and ((_ is Cons!36783) (insertStrictlySorted!597 l!750 key2!21 v2!10)) (bvsgt (_1!12727 (h!38248 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37)))))

(assert (=> b!1572431 (= e!876753 e!876755)))

(declare-fun bm!72280 () Bool)

(declare-fun e!876751 () List!36787)

(declare-fun $colon$colon!997 (List!36787 tuple2!25432) List!36787)

(assert (=> bm!72280 (= call!72282 ($colon$colon!997 e!876751 (ite c!145612 (h!38248 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (tuple2!25433 key1!37 v1!32))))))

(declare-fun c!145613 () Bool)

(assert (=> bm!72280 (= c!145613 c!145612)))

(declare-fun b!1572432 () Bool)

(assert (=> b!1572432 (= e!876751 (insertStrictlySorted!597 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1572433 () Bool)

(assert (=> b!1572433 (= e!876753 call!72284)))

(declare-fun b!1572434 () Bool)

(assert (=> b!1572434 (= e!876755 call!72283)))

(declare-fun b!1572435 () Bool)

(declare-fun res!1073744 () Bool)

(assert (=> b!1572435 (=> (not res!1073744) (not e!876752))))

(declare-fun containsKey!869 (List!36787 (_ BitVec 64)) Bool)

(assert (=> b!1572435 (= res!1073744 (containsKey!869 lt!674258 key1!37))))

(declare-fun b!1572436 () Bool)

(assert (=> b!1572436 (= e!876751 (ite c!145615 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (ite c!145614 (Cons!36783 (h!38248 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10))) Nil!36784)))))

(declare-fun bm!72281 () Bool)

(assert (=> bm!72281 (= call!72283 call!72284)))

(assert (= (and d!164679 c!145612) b!1572428))

(assert (= (and d!164679 (not c!145612)) b!1572427))

(assert (= (and b!1572427 c!145615) b!1572433))

(assert (= (and b!1572427 (not c!145615)) b!1572431))

(assert (= (and b!1572431 c!145614) b!1572430))

(assert (= (and b!1572431 (not c!145614)) b!1572434))

(assert (= (or b!1572430 b!1572434) bm!72281))

(assert (= (or b!1572433 bm!72281) bm!72279))

(assert (= (or b!1572428 bm!72279) bm!72280))

(assert (= (and bm!72280 c!145613) b!1572432))

(assert (= (and bm!72280 (not c!145613)) b!1572436))

(assert (= (and d!164679 res!1073743) b!1572435))

(assert (= (and b!1572435 res!1073744) b!1572429))

(declare-fun m!1446263 () Bool)

(assert (=> d!164679 m!1446263))

(assert (=> d!164679 m!1446211))

(declare-fun m!1446265 () Bool)

(assert (=> d!164679 m!1446265))

(declare-fun m!1446267 () Bool)

(assert (=> b!1572435 m!1446267))

(declare-fun m!1446269 () Bool)

(assert (=> b!1572429 m!1446269))

(declare-fun m!1446271 () Bool)

(assert (=> bm!72280 m!1446271))

(declare-fun m!1446273 () Bool)

(assert (=> b!1572432 m!1446273))

(assert (=> b!1572342 d!164679))

(declare-fun d!164687 () Bool)

(assert (=> d!164687 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10) key1!37 v1!32))))

(declare-fun lt!674264 () Unit!52005)

(declare-fun choose!2077 (List!36787 (_ BitVec 64) B!2546 (_ BitVec 64) B!2546) Unit!52005)

(assert (=> d!164687 (= lt!674264 (choose!2077 (t!51687 l!750) key1!37 v1!32 key2!21 v2!10))))

(assert (=> d!164687 (not (= key1!37 key2!21))))

(assert (=> d!164687 (= (lemmaInsertStrictlySortedCommutative!16 (t!51687 l!750) key1!37 v1!32 key2!21 v2!10) lt!674264)))

(declare-fun bs!45244 () Bool)

(assert (= bs!45244 d!164687))

(assert (=> bs!45244 m!1446199))

(assert (=> bs!45244 m!1446201))

(assert (=> bs!45244 m!1446203))

(assert (=> bs!45244 m!1446201))

(declare-fun m!1446287 () Bool)

(assert (=> bs!45244 m!1446287))

(assert (=> bs!45244 m!1446199))

(assert (=> bs!45244 m!1446215))

(assert (=> b!1572342 d!164687))

(declare-fun b!1572467 () Bool)

(declare-fun e!876774 () List!36787)

(declare-fun e!876773 () List!36787)

(assert (=> b!1572467 (= e!876774 e!876773)))

(declare-fun c!145631 () Bool)

(assert (=> b!1572467 (= c!145631 (and ((_ is Cons!36783) (insertStrictlySorted!597 l!750 key1!37 v1!32)) (= (_1!12727 (h!38248 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21)))))

(declare-fun b!1572468 () Bool)

(declare-fun call!72294 () List!36787)

(assert (=> b!1572468 (= e!876774 call!72294)))

(declare-fun bm!72291 () Bool)

(declare-fun call!72296 () List!36787)

(assert (=> bm!72291 (= call!72296 call!72294)))

(declare-fun b!1572469 () Bool)

(declare-fun lt!674265 () List!36787)

(declare-fun e!876772 () Bool)

(assert (=> b!1572469 (= e!876772 (contains!10472 lt!674265 (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572470 () Bool)

(declare-fun e!876775 () List!36787)

(declare-fun call!72295 () List!36787)

(assert (=> b!1572470 (= e!876775 call!72295)))

(declare-fun d!164691 () Bool)

(assert (=> d!164691 e!876772))

(declare-fun res!1073751 () Bool)

(assert (=> d!164691 (=> (not res!1073751) (not e!876772))))

(assert (=> d!164691 (= res!1073751 (isStrictlySorted!1007 lt!674265))))

(assert (=> d!164691 (= lt!674265 e!876774)))

(declare-fun c!145628 () Bool)

(assert (=> d!164691 (= c!145628 (and ((_ is Cons!36783) (insertStrictlySorted!597 l!750 key1!37 v1!32)) (bvslt (_1!12727 (h!38248 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> d!164691 (isStrictlySorted!1007 (insertStrictlySorted!597 l!750 key1!37 v1!32))))

(assert (=> d!164691 (= (insertStrictlySorted!597 (insertStrictlySorted!597 l!750 key1!37 v1!32) key2!21 v2!10) lt!674265)))

(declare-fun c!145630 () Bool)

(declare-fun b!1572471 () Bool)

(assert (=> b!1572471 (= c!145630 (and ((_ is Cons!36783) (insertStrictlySorted!597 l!750 key1!37 v1!32)) (bvsgt (_1!12727 (h!38248 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21)))))

(assert (=> b!1572471 (= e!876773 e!876775)))

(declare-fun e!876771 () List!36787)

(declare-fun bm!72292 () Bool)

(assert (=> bm!72292 (= call!72294 ($colon$colon!997 e!876771 (ite c!145628 (h!38248 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (tuple2!25433 key2!21 v2!10))))))

(declare-fun c!145629 () Bool)

(assert (=> bm!72292 (= c!145629 c!145628)))

(declare-fun b!1572472 () Bool)

(assert (=> b!1572472 (= e!876771 (insertStrictlySorted!597 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1572473 () Bool)

(assert (=> b!1572473 (= e!876773 call!72296)))

(declare-fun b!1572474 () Bool)

(assert (=> b!1572474 (= e!876775 call!72295)))

(declare-fun b!1572475 () Bool)

(declare-fun res!1073752 () Bool)

(assert (=> b!1572475 (=> (not res!1073752) (not e!876772))))

(assert (=> b!1572475 (= res!1073752 (containsKey!869 lt!674265 key2!21))))

(declare-fun b!1572476 () Bool)

(assert (=> b!1572476 (= e!876771 (ite c!145631 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (ite c!145630 (Cons!36783 (h!38248 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32))) Nil!36784)))))

(declare-fun bm!72293 () Bool)

(assert (=> bm!72293 (= call!72295 call!72296)))

(assert (= (and d!164691 c!145628) b!1572468))

(assert (= (and d!164691 (not c!145628)) b!1572467))

(assert (= (and b!1572467 c!145631) b!1572473))

(assert (= (and b!1572467 (not c!145631)) b!1572471))

(assert (= (and b!1572471 c!145630) b!1572470))

(assert (= (and b!1572471 (not c!145630)) b!1572474))

(assert (= (or b!1572470 b!1572474) bm!72293))

(assert (= (or b!1572473 bm!72293) bm!72291))

(assert (= (or b!1572468 bm!72291) bm!72292))

(assert (= (and bm!72292 c!145629) b!1572472))

(assert (= (and bm!72292 (not c!145629)) b!1572476))

(assert (= (and d!164691 res!1073751) b!1572475))

(assert (= (and b!1572475 res!1073752) b!1572469))

(declare-fun m!1446289 () Bool)

(assert (=> d!164691 m!1446289))

(assert (=> d!164691 m!1446205))

(declare-fun m!1446291 () Bool)

(assert (=> d!164691 m!1446291))

(declare-fun m!1446293 () Bool)

(assert (=> b!1572475 m!1446293))

(declare-fun m!1446295 () Bool)

(assert (=> b!1572469 m!1446295))

(declare-fun m!1446297 () Bool)

(assert (=> bm!72292 m!1446297))

(declare-fun m!1446299 () Bool)

(assert (=> b!1572472 m!1446299))

(assert (=> b!1572342 d!164691))

(declare-fun b!1572477 () Bool)

(declare-fun e!876779 () List!36787)

(declare-fun e!876778 () List!36787)

(assert (=> b!1572477 (= e!876779 e!876778)))

(declare-fun c!145635 () Bool)

(assert (=> b!1572477 (= c!145635 (and ((_ is Cons!36783) l!750) (= (_1!12727 (h!38248 l!750)) key2!21)))))

(declare-fun b!1572478 () Bool)

(declare-fun call!72297 () List!36787)

(assert (=> b!1572478 (= e!876779 call!72297)))

(declare-fun bm!72294 () Bool)

(declare-fun call!72299 () List!36787)

(assert (=> bm!72294 (= call!72299 call!72297)))

(declare-fun e!876777 () Bool)

(declare-fun lt!674266 () List!36787)

(declare-fun b!1572479 () Bool)

(assert (=> b!1572479 (= e!876777 (contains!10472 lt!674266 (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572480 () Bool)

(declare-fun e!876780 () List!36787)

(declare-fun call!72298 () List!36787)

(assert (=> b!1572480 (= e!876780 call!72298)))

(declare-fun d!164693 () Bool)

(assert (=> d!164693 e!876777))

(declare-fun res!1073753 () Bool)

(assert (=> d!164693 (=> (not res!1073753) (not e!876777))))

(assert (=> d!164693 (= res!1073753 (isStrictlySorted!1007 lt!674266))))

(assert (=> d!164693 (= lt!674266 e!876779)))

(declare-fun c!145632 () Bool)

(assert (=> d!164693 (= c!145632 (and ((_ is Cons!36783) l!750) (bvslt (_1!12727 (h!38248 l!750)) key2!21)))))

(assert (=> d!164693 (isStrictlySorted!1007 l!750)))

(assert (=> d!164693 (= (insertStrictlySorted!597 l!750 key2!21 v2!10) lt!674266)))

(declare-fun b!1572481 () Bool)

(declare-fun c!145634 () Bool)

(assert (=> b!1572481 (= c!145634 (and ((_ is Cons!36783) l!750) (bvsgt (_1!12727 (h!38248 l!750)) key2!21)))))

(assert (=> b!1572481 (= e!876778 e!876780)))

(declare-fun bm!72295 () Bool)

(declare-fun e!876776 () List!36787)

(assert (=> bm!72295 (= call!72297 ($colon$colon!997 e!876776 (ite c!145632 (h!38248 l!750) (tuple2!25433 key2!21 v2!10))))))

(declare-fun c!145633 () Bool)

(assert (=> bm!72295 (= c!145633 c!145632)))

(declare-fun b!1572482 () Bool)

(assert (=> b!1572482 (= e!876776 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))))

(declare-fun b!1572483 () Bool)

(assert (=> b!1572483 (= e!876778 call!72299)))

(declare-fun b!1572484 () Bool)

(assert (=> b!1572484 (= e!876780 call!72298)))

(declare-fun b!1572485 () Bool)

(declare-fun res!1073754 () Bool)

(assert (=> b!1572485 (=> (not res!1073754) (not e!876777))))

(assert (=> b!1572485 (= res!1073754 (containsKey!869 lt!674266 key2!21))))

(declare-fun b!1572486 () Bool)

(assert (=> b!1572486 (= e!876776 (ite c!145635 (t!51687 l!750) (ite c!145634 (Cons!36783 (h!38248 l!750) (t!51687 l!750)) Nil!36784)))))

(declare-fun bm!72296 () Bool)

(assert (=> bm!72296 (= call!72298 call!72299)))

(assert (= (and d!164693 c!145632) b!1572478))

(assert (= (and d!164693 (not c!145632)) b!1572477))

(assert (= (and b!1572477 c!145635) b!1572483))

(assert (= (and b!1572477 (not c!145635)) b!1572481))

(assert (= (and b!1572481 c!145634) b!1572480))

(assert (= (and b!1572481 (not c!145634)) b!1572484))

(assert (= (or b!1572480 b!1572484) bm!72296))

(assert (= (or b!1572483 bm!72296) bm!72294))

(assert (= (or b!1572478 bm!72294) bm!72295))

(assert (= (and bm!72295 c!145633) b!1572482))

(assert (= (and bm!72295 (not c!145633)) b!1572486))

(assert (= (and d!164693 res!1073753) b!1572485))

(assert (= (and b!1572485 res!1073754) b!1572479))

(declare-fun m!1446301 () Bool)

(assert (=> d!164693 m!1446301))

(assert (=> d!164693 m!1446195))

(declare-fun m!1446303 () Bool)

(assert (=> b!1572485 m!1446303))

(declare-fun m!1446305 () Bool)

(assert (=> b!1572479 m!1446305))

(declare-fun m!1446307 () Bool)

(assert (=> bm!72295 m!1446307))

(assert (=> b!1572482 m!1446199))

(assert (=> b!1572342 d!164693))

(declare-fun b!1572497 () Bool)

(declare-fun e!876789 () List!36787)

(declare-fun e!876788 () List!36787)

(assert (=> b!1572497 (= e!876789 e!876788)))

(declare-fun c!145643 () Bool)

(assert (=> b!1572497 (= c!145643 (and ((_ is Cons!36783) l!750) (= (_1!12727 (h!38248 l!750)) key1!37)))))

(declare-fun b!1572498 () Bool)

(declare-fun call!72303 () List!36787)

(assert (=> b!1572498 (= e!876789 call!72303)))

(declare-fun bm!72300 () Bool)

(declare-fun call!72305 () List!36787)

(assert (=> bm!72300 (= call!72305 call!72303)))

(declare-fun lt!674270 () List!36787)

(declare-fun e!876787 () Bool)

(declare-fun b!1572499 () Bool)

(assert (=> b!1572499 (= e!876787 (contains!10472 lt!674270 (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572500 () Bool)

(declare-fun e!876790 () List!36787)

(declare-fun call!72304 () List!36787)

(assert (=> b!1572500 (= e!876790 call!72304)))

(declare-fun d!164695 () Bool)

(assert (=> d!164695 e!876787))

(declare-fun res!1073757 () Bool)

(assert (=> d!164695 (=> (not res!1073757) (not e!876787))))

(assert (=> d!164695 (= res!1073757 (isStrictlySorted!1007 lt!674270))))

(assert (=> d!164695 (= lt!674270 e!876789)))

(declare-fun c!145640 () Bool)

(assert (=> d!164695 (= c!145640 (and ((_ is Cons!36783) l!750) (bvslt (_1!12727 (h!38248 l!750)) key1!37)))))

(assert (=> d!164695 (isStrictlySorted!1007 l!750)))

(assert (=> d!164695 (= (insertStrictlySorted!597 l!750 key1!37 v1!32) lt!674270)))

(declare-fun b!1572501 () Bool)

(declare-fun c!145642 () Bool)

(assert (=> b!1572501 (= c!145642 (and ((_ is Cons!36783) l!750) (bvsgt (_1!12727 (h!38248 l!750)) key1!37)))))

(assert (=> b!1572501 (= e!876788 e!876790)))

(declare-fun bm!72301 () Bool)

(declare-fun e!876786 () List!36787)

(assert (=> bm!72301 (= call!72303 ($colon$colon!997 e!876786 (ite c!145640 (h!38248 l!750) (tuple2!25433 key1!37 v1!32))))))

(declare-fun c!145641 () Bool)

(assert (=> bm!72301 (= c!145641 c!145640)))

(declare-fun b!1572502 () Bool)

(assert (=> b!1572502 (= e!876786 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))))

(declare-fun b!1572503 () Bool)

(assert (=> b!1572503 (= e!876788 call!72305)))

(declare-fun b!1572504 () Bool)

(assert (=> b!1572504 (= e!876790 call!72304)))

(declare-fun b!1572505 () Bool)

(declare-fun res!1073758 () Bool)

(assert (=> b!1572505 (=> (not res!1073758) (not e!876787))))

(assert (=> b!1572505 (= res!1073758 (containsKey!869 lt!674270 key1!37))))

(declare-fun b!1572506 () Bool)

(assert (=> b!1572506 (= e!876786 (ite c!145643 (t!51687 l!750) (ite c!145642 (Cons!36783 (h!38248 l!750) (t!51687 l!750)) Nil!36784)))))

(declare-fun bm!72302 () Bool)

(assert (=> bm!72302 (= call!72304 call!72305)))

(assert (= (and d!164695 c!145640) b!1572498))

(assert (= (and d!164695 (not c!145640)) b!1572497))

(assert (= (and b!1572497 c!145643) b!1572503))

(assert (= (and b!1572497 (not c!145643)) b!1572501))

(assert (= (and b!1572501 c!145642) b!1572500))

(assert (= (and b!1572501 (not c!145642)) b!1572504))

(assert (= (or b!1572500 b!1572504) bm!72302))

(assert (= (or b!1572503 bm!72302) bm!72300))

(assert (= (or b!1572498 bm!72300) bm!72301))

(assert (= (and bm!72301 c!145641) b!1572502))

(assert (= (and bm!72301 (not c!145641)) b!1572506))

(assert (= (and d!164695 res!1073757) b!1572505))

(assert (= (and b!1572505 res!1073758) b!1572499))

(declare-fun m!1446317 () Bool)

(assert (=> d!164695 m!1446317))

(assert (=> d!164695 m!1446195))

(declare-fun m!1446321 () Bool)

(assert (=> b!1572505 m!1446321))

(declare-fun m!1446323 () Bool)

(assert (=> b!1572499 m!1446323))

(declare-fun m!1446329 () Bool)

(assert (=> bm!72301 m!1446329))

(assert (=> b!1572502 m!1446201))

(assert (=> b!1572342 d!164695))

(declare-fun b!1572517 () Bool)

(declare-fun e!876799 () List!36787)

(declare-fun e!876798 () List!36787)

(assert (=> b!1572517 (= e!876799 e!876798)))

(declare-fun c!145651 () Bool)

(assert (=> b!1572517 (= c!145651 (and ((_ is Cons!36783) (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) (= (_1!12727 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) key2!21)))))

(declare-fun b!1572518 () Bool)

(declare-fun call!72309 () List!36787)

(assert (=> b!1572518 (= e!876799 call!72309)))

(declare-fun bm!72306 () Bool)

(declare-fun call!72311 () List!36787)

(assert (=> bm!72306 (= call!72311 call!72309)))

(declare-fun b!1572519 () Bool)

(declare-fun e!876797 () Bool)

(declare-fun lt!674273 () List!36787)

(assert (=> b!1572519 (= e!876797 (contains!10472 lt!674273 (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572520 () Bool)

(declare-fun e!876800 () List!36787)

(declare-fun call!72310 () List!36787)

(assert (=> b!1572520 (= e!876800 call!72310)))

(declare-fun d!164701 () Bool)

(assert (=> d!164701 e!876797))

(declare-fun res!1073761 () Bool)

(assert (=> d!164701 (=> (not res!1073761) (not e!876797))))

(assert (=> d!164701 (= res!1073761 (isStrictlySorted!1007 lt!674273))))

(assert (=> d!164701 (= lt!674273 e!876799)))

(declare-fun c!145648 () Bool)

(assert (=> d!164701 (= c!145648 (and ((_ is Cons!36783) (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) (bvslt (_1!12727 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> d!164701 (isStrictlySorted!1007 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))))

(assert (=> d!164701 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32) key2!21 v2!10) lt!674273)))

(declare-fun c!145650 () Bool)

(declare-fun b!1572521 () Bool)

(assert (=> b!1572521 (= c!145650 (and ((_ is Cons!36783) (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) (bvsgt (_1!12727 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) key2!21)))))

(assert (=> b!1572521 (= e!876798 e!876800)))

(declare-fun e!876796 () List!36787)

(declare-fun bm!72307 () Bool)

(assert (=> bm!72307 (= call!72309 ($colon$colon!997 e!876796 (ite c!145648 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) (tuple2!25433 key2!21 v2!10))))))

(declare-fun c!145649 () Bool)

(assert (=> bm!72307 (= c!145649 c!145648)))

(declare-fun b!1572522 () Bool)

(assert (=> b!1572522 (= e!876796 (insertStrictlySorted!597 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) key2!21 v2!10))))

(declare-fun b!1572523 () Bool)

(assert (=> b!1572523 (= e!876798 call!72311)))

(declare-fun b!1572524 () Bool)

(assert (=> b!1572524 (= e!876800 call!72310)))

(declare-fun b!1572525 () Bool)

(declare-fun res!1073762 () Bool)

(assert (=> b!1572525 (=> (not res!1073762) (not e!876797))))

(assert (=> b!1572525 (= res!1073762 (containsKey!869 lt!674273 key2!21))))

(declare-fun b!1572526 () Bool)

(assert (=> b!1572526 (= e!876796 (ite c!145651 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) (ite c!145650 (Cons!36783 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) Nil!36784)))))

(declare-fun bm!72308 () Bool)

(assert (=> bm!72308 (= call!72310 call!72311)))

(assert (= (and d!164701 c!145648) b!1572518))

(assert (= (and d!164701 (not c!145648)) b!1572517))

(assert (= (and b!1572517 c!145651) b!1572523))

(assert (= (and b!1572517 (not c!145651)) b!1572521))

(assert (= (and b!1572521 c!145650) b!1572520))

(assert (= (and b!1572521 (not c!145650)) b!1572524))

(assert (= (or b!1572520 b!1572524) bm!72308))

(assert (= (or b!1572523 bm!72308) bm!72306))

(assert (= (or b!1572518 bm!72306) bm!72307))

(assert (= (and bm!72307 c!145649) b!1572522))

(assert (= (and bm!72307 (not c!145649)) b!1572526))

(assert (= (and d!164701 res!1073761) b!1572525))

(assert (= (and b!1572525 res!1073762) b!1572519))

(declare-fun m!1446343 () Bool)

(assert (=> d!164701 m!1446343))

(assert (=> d!164701 m!1446201))

(declare-fun m!1446345 () Bool)

(assert (=> d!164701 m!1446345))

(declare-fun m!1446347 () Bool)

(assert (=> b!1572525 m!1446347))

(declare-fun m!1446349 () Bool)

(assert (=> b!1572519 m!1446349))

(declare-fun m!1446351 () Bool)

(assert (=> bm!72307 m!1446351))

(declare-fun m!1446353 () Bool)

(assert (=> b!1572522 m!1446353))

(assert (=> b!1572342 d!164701))

(declare-fun b!1572537 () Bool)

(declare-fun e!876809 () List!36787)

(declare-fun e!876808 () List!36787)

(assert (=> b!1572537 (= e!876809 e!876808)))

(declare-fun c!145659 () Bool)

(assert (=> b!1572537 (= c!145659 (and ((_ is Cons!36783) (t!51687 l!750)) (= (_1!12727 (h!38248 (t!51687 l!750))) key2!21)))))

(declare-fun b!1572538 () Bool)

(declare-fun call!72315 () List!36787)

(assert (=> b!1572538 (= e!876809 call!72315)))

(declare-fun bm!72312 () Bool)

(declare-fun call!72317 () List!36787)

(assert (=> bm!72312 (= call!72317 call!72315)))

(declare-fun e!876807 () Bool)

(declare-fun lt!674275 () List!36787)

(declare-fun b!1572539 () Bool)

(assert (=> b!1572539 (= e!876807 (contains!10472 lt!674275 (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572540 () Bool)

(declare-fun e!876810 () List!36787)

(declare-fun call!72316 () List!36787)

(assert (=> b!1572540 (= e!876810 call!72316)))

(declare-fun d!164705 () Bool)

(assert (=> d!164705 e!876807))

(declare-fun res!1073765 () Bool)

(assert (=> d!164705 (=> (not res!1073765) (not e!876807))))

(assert (=> d!164705 (= res!1073765 (isStrictlySorted!1007 lt!674275))))

(assert (=> d!164705 (= lt!674275 e!876809)))

(declare-fun c!145656 () Bool)

(assert (=> d!164705 (= c!145656 (and ((_ is Cons!36783) (t!51687 l!750)) (bvslt (_1!12727 (h!38248 (t!51687 l!750))) key2!21)))))

(assert (=> d!164705 (isStrictlySorted!1007 (t!51687 l!750))))

(assert (=> d!164705 (= (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10) lt!674275)))

(declare-fun b!1572541 () Bool)

(declare-fun c!145658 () Bool)

(assert (=> b!1572541 (= c!145658 (and ((_ is Cons!36783) (t!51687 l!750)) (bvsgt (_1!12727 (h!38248 (t!51687 l!750))) key2!21)))))

(assert (=> b!1572541 (= e!876808 e!876810)))

(declare-fun e!876806 () List!36787)

(declare-fun bm!72313 () Bool)

(assert (=> bm!72313 (= call!72315 ($colon$colon!997 e!876806 (ite c!145656 (h!38248 (t!51687 l!750)) (tuple2!25433 key2!21 v2!10))))))

(declare-fun c!145657 () Bool)

(assert (=> bm!72313 (= c!145657 c!145656)))

(declare-fun b!1572542 () Bool)

(assert (=> b!1572542 (= e!876806 (insertStrictlySorted!597 (t!51687 (t!51687 l!750)) key2!21 v2!10))))

(declare-fun b!1572543 () Bool)

(assert (=> b!1572543 (= e!876808 call!72317)))

(declare-fun b!1572544 () Bool)

(assert (=> b!1572544 (= e!876810 call!72316)))

(declare-fun b!1572545 () Bool)

(declare-fun res!1073766 () Bool)

(assert (=> b!1572545 (=> (not res!1073766) (not e!876807))))

(assert (=> b!1572545 (= res!1073766 (containsKey!869 lt!674275 key2!21))))

(declare-fun b!1572546 () Bool)

(assert (=> b!1572546 (= e!876806 (ite c!145659 (t!51687 (t!51687 l!750)) (ite c!145658 (Cons!36783 (h!38248 (t!51687 l!750)) (t!51687 (t!51687 l!750))) Nil!36784)))))

(declare-fun bm!72314 () Bool)

(assert (=> bm!72314 (= call!72316 call!72317)))

(assert (= (and d!164705 c!145656) b!1572538))

(assert (= (and d!164705 (not c!145656)) b!1572537))

(assert (= (and b!1572537 c!145659) b!1572543))

(assert (= (and b!1572537 (not c!145659)) b!1572541))

(assert (= (and b!1572541 c!145658) b!1572540))

(assert (= (and b!1572541 (not c!145658)) b!1572544))

(assert (= (or b!1572540 b!1572544) bm!72314))

(assert (= (or b!1572543 bm!72314) bm!72312))

(assert (= (or b!1572538 bm!72312) bm!72313))

(assert (= (and bm!72313 c!145657) b!1572542))

(assert (= (and bm!72313 (not c!145657)) b!1572546))

(assert (= (and d!164705 res!1073765) b!1572545))

(assert (= (and b!1572545 res!1073766) b!1572539))

(declare-fun m!1446363 () Bool)

(assert (=> d!164705 m!1446363))

(assert (=> d!164705 m!1446197))

(declare-fun m!1446365 () Bool)

(assert (=> b!1572545 m!1446365))

(declare-fun m!1446367 () Bool)

(assert (=> b!1572539 m!1446367))

(declare-fun m!1446369 () Bool)

(assert (=> bm!72313 m!1446369))

(declare-fun m!1446371 () Bool)

(assert (=> b!1572542 m!1446371))

(assert (=> b!1572342 d!164705))

(declare-fun b!1572557 () Bool)

(declare-fun e!876819 () List!36787)

(declare-fun e!876818 () List!36787)

(assert (=> b!1572557 (= e!876819 e!876818)))

(declare-fun c!145667 () Bool)

(assert (=> b!1572557 (= c!145667 (and ((_ is Cons!36783) (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) (= (_1!12727 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) key1!37)))))

(declare-fun b!1572558 () Bool)

(declare-fun call!72321 () List!36787)

(assert (=> b!1572558 (= e!876819 call!72321)))

(declare-fun bm!72318 () Bool)

(declare-fun call!72323 () List!36787)

(assert (=> bm!72318 (= call!72323 call!72321)))

(declare-fun e!876817 () Bool)

(declare-fun lt!674277 () List!36787)

(declare-fun b!1572559 () Bool)

(assert (=> b!1572559 (= e!876817 (contains!10472 lt!674277 (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572560 () Bool)

(declare-fun e!876820 () List!36787)

(declare-fun call!72322 () List!36787)

(assert (=> b!1572560 (= e!876820 call!72322)))

(declare-fun d!164709 () Bool)

(assert (=> d!164709 e!876817))

(declare-fun res!1073769 () Bool)

(assert (=> d!164709 (=> (not res!1073769) (not e!876817))))

(assert (=> d!164709 (= res!1073769 (isStrictlySorted!1007 lt!674277))))

(assert (=> d!164709 (= lt!674277 e!876819)))

(declare-fun c!145664 () Bool)

(assert (=> d!164709 (= c!145664 (and ((_ is Cons!36783) (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) (bvslt (_1!12727 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> d!164709 (isStrictlySorted!1007 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))))

(assert (=> d!164709 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10) key1!37 v1!32) lt!674277)))

(declare-fun b!1572561 () Bool)

(declare-fun c!145666 () Bool)

(assert (=> b!1572561 (= c!145666 (and ((_ is Cons!36783) (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) (bvsgt (_1!12727 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) key1!37)))))

(assert (=> b!1572561 (= e!876818 e!876820)))

(declare-fun e!876816 () List!36787)

(declare-fun bm!72319 () Bool)

(assert (=> bm!72319 (= call!72321 ($colon$colon!997 e!876816 (ite c!145664 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) (tuple2!25433 key1!37 v1!32))))))

(declare-fun c!145665 () Bool)

(assert (=> bm!72319 (= c!145665 c!145664)))

(declare-fun b!1572562 () Bool)

(assert (=> b!1572562 (= e!876816 (insertStrictlySorted!597 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) key1!37 v1!32))))

(declare-fun b!1572563 () Bool)

(assert (=> b!1572563 (= e!876818 call!72323)))

(declare-fun b!1572564 () Bool)

(assert (=> b!1572564 (= e!876820 call!72322)))

(declare-fun b!1572565 () Bool)

(declare-fun res!1073770 () Bool)

(assert (=> b!1572565 (=> (not res!1073770) (not e!876817))))

(assert (=> b!1572565 (= res!1073770 (containsKey!869 lt!674277 key1!37))))

(declare-fun b!1572566 () Bool)

(assert (=> b!1572566 (= e!876816 (ite c!145667 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) (ite c!145666 (Cons!36783 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) Nil!36784)))))

(declare-fun bm!72320 () Bool)

(assert (=> bm!72320 (= call!72322 call!72323)))

(assert (= (and d!164709 c!145664) b!1572558))

(assert (= (and d!164709 (not c!145664)) b!1572557))

(assert (= (and b!1572557 c!145667) b!1572563))

(assert (= (and b!1572557 (not c!145667)) b!1572561))

(assert (= (and b!1572561 c!145666) b!1572560))

(assert (= (and b!1572561 (not c!145666)) b!1572564))

(assert (= (or b!1572560 b!1572564) bm!72320))

(assert (= (or b!1572563 bm!72320) bm!72318))

(assert (= (or b!1572558 bm!72318) bm!72319))

(assert (= (and bm!72319 c!145665) b!1572562))

(assert (= (and bm!72319 (not c!145665)) b!1572566))

(assert (= (and d!164709 res!1073769) b!1572565))

(assert (= (and b!1572565 res!1073770) b!1572559))

(declare-fun m!1446381 () Bool)

(assert (=> d!164709 m!1446381))

(assert (=> d!164709 m!1446199))

(declare-fun m!1446383 () Bool)

(assert (=> d!164709 m!1446383))

(declare-fun m!1446385 () Bool)

(assert (=> b!1572565 m!1446385))

(declare-fun m!1446387 () Bool)

(assert (=> b!1572559 m!1446387))

(declare-fun m!1446389 () Bool)

(assert (=> bm!72319 m!1446389))

(declare-fun m!1446391 () Bool)

(assert (=> b!1572562 m!1446391))

(assert (=> b!1572342 d!164709))

(declare-fun b!1572577 () Bool)

(declare-fun e!876829 () List!36787)

(declare-fun e!876828 () List!36787)

(assert (=> b!1572577 (= e!876829 e!876828)))

(declare-fun c!145675 () Bool)

(assert (=> b!1572577 (= c!145675 (and ((_ is Cons!36783) (t!51687 l!750)) (= (_1!12727 (h!38248 (t!51687 l!750))) key1!37)))))

(declare-fun b!1572578 () Bool)

(declare-fun call!72327 () List!36787)

(assert (=> b!1572578 (= e!876829 call!72327)))

(declare-fun bm!72324 () Bool)

(declare-fun call!72329 () List!36787)

(assert (=> bm!72324 (= call!72329 call!72327)))

(declare-fun e!876827 () Bool)

(declare-fun b!1572579 () Bool)

(declare-fun lt!674281 () List!36787)

(assert (=> b!1572579 (= e!876827 (contains!10472 lt!674281 (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572580 () Bool)

(declare-fun e!876830 () List!36787)

(declare-fun call!72328 () List!36787)

(assert (=> b!1572580 (= e!876830 call!72328)))

(declare-fun d!164713 () Bool)

(assert (=> d!164713 e!876827))

(declare-fun res!1073773 () Bool)

(assert (=> d!164713 (=> (not res!1073773) (not e!876827))))

(assert (=> d!164713 (= res!1073773 (isStrictlySorted!1007 lt!674281))))

(assert (=> d!164713 (= lt!674281 e!876829)))

(declare-fun c!145672 () Bool)

(assert (=> d!164713 (= c!145672 (and ((_ is Cons!36783) (t!51687 l!750)) (bvslt (_1!12727 (h!38248 (t!51687 l!750))) key1!37)))))

(assert (=> d!164713 (isStrictlySorted!1007 (t!51687 l!750))))

(assert (=> d!164713 (= (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32) lt!674281)))

(declare-fun b!1572581 () Bool)

(declare-fun c!145674 () Bool)

(assert (=> b!1572581 (= c!145674 (and ((_ is Cons!36783) (t!51687 l!750)) (bvsgt (_1!12727 (h!38248 (t!51687 l!750))) key1!37)))))

(assert (=> b!1572581 (= e!876828 e!876830)))

(declare-fun e!876826 () List!36787)

(declare-fun bm!72325 () Bool)

(assert (=> bm!72325 (= call!72327 ($colon$colon!997 e!876826 (ite c!145672 (h!38248 (t!51687 l!750)) (tuple2!25433 key1!37 v1!32))))))

(declare-fun c!145673 () Bool)

(assert (=> bm!72325 (= c!145673 c!145672)))

(declare-fun b!1572582 () Bool)

(assert (=> b!1572582 (= e!876826 (insertStrictlySorted!597 (t!51687 (t!51687 l!750)) key1!37 v1!32))))

(declare-fun b!1572583 () Bool)

(assert (=> b!1572583 (= e!876828 call!72329)))

(declare-fun b!1572584 () Bool)

(assert (=> b!1572584 (= e!876830 call!72328)))

(declare-fun b!1572585 () Bool)

(declare-fun res!1073774 () Bool)

(assert (=> b!1572585 (=> (not res!1073774) (not e!876827))))

(assert (=> b!1572585 (= res!1073774 (containsKey!869 lt!674281 key1!37))))

(declare-fun b!1572586 () Bool)

(assert (=> b!1572586 (= e!876826 (ite c!145675 (t!51687 (t!51687 l!750)) (ite c!145674 (Cons!36783 (h!38248 (t!51687 l!750)) (t!51687 (t!51687 l!750))) Nil!36784)))))

(declare-fun bm!72326 () Bool)

(assert (=> bm!72326 (= call!72328 call!72329)))

(assert (= (and d!164713 c!145672) b!1572578))

(assert (= (and d!164713 (not c!145672)) b!1572577))

(assert (= (and b!1572577 c!145675) b!1572583))

(assert (= (and b!1572577 (not c!145675)) b!1572581))

(assert (= (and b!1572581 c!145674) b!1572580))

(assert (= (and b!1572581 (not c!145674)) b!1572584))

(assert (= (or b!1572580 b!1572584) bm!72326))

(assert (= (or b!1572583 bm!72326) bm!72324))

(assert (= (or b!1572578 bm!72324) bm!72325))

(assert (= (and bm!72325 c!145673) b!1572582))

(assert (= (and bm!72325 (not c!145673)) b!1572586))

(assert (= (and d!164713 res!1073773) b!1572585))

(assert (= (and b!1572585 res!1073774) b!1572579))

(declare-fun m!1446407 () Bool)

(assert (=> d!164713 m!1446407))

(assert (=> d!164713 m!1446197))

(declare-fun m!1446409 () Bool)

(assert (=> b!1572585 m!1446409))

(declare-fun m!1446411 () Bool)

(assert (=> b!1572579 m!1446411))

(declare-fun m!1446413 () Bool)

(assert (=> bm!72325 m!1446413))

(declare-fun m!1446415 () Bool)

(assert (=> b!1572582 m!1446415))

(assert (=> b!1572342 d!164713))

(declare-fun b!1572611 () Bool)

(declare-fun e!876843 () Bool)

(declare-fun tp!114219 () Bool)

(assert (=> b!1572611 (= e!876843 (and tp_is_empty!39097 tp!114219))))

(assert (=> b!1572341 (= tp!114210 e!876843)))

(assert (= (and b!1572341 ((_ is Cons!36783) (t!51687 l!750))) b!1572611))

(check-sat (not b!1572559) (not b!1572502) (not bm!72319) (not b!1572378) (not b!1572519) (not d!164709) (not b!1572525) (not b!1572505) (not b!1572542) (not d!164693) (not bm!72292) (not bm!72301) (not b!1572522) tp_is_empty!39097 (not d!164695) (not b!1572472) (not b!1572545) (not b!1572475) (not d!164713) (not b!1572432) (not d!164705) (not b!1572429) (not b!1572579) (not b!1572435) (not b!1572562) (not bm!72325) (not d!164701) (not b!1572485) (not bm!72295) (not d!164687) (not bm!72307) (not b!1572380) (not bm!72280) (not b!1572499) (not bm!72313) (not b!1572611) (not b!1572565) (not b!1572482) (not b!1572585) (not b!1572469) (not d!164679) (not d!164691) (not b!1572539) (not b!1572479) (not b!1572582))
(check-sat)
(get-model)

(declare-fun d!164741 () Bool)

(declare-fun lt!674295 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!807 (List!36787) (InoxSet tuple2!25432))

(assert (=> d!164741 (= lt!674295 (select (content!807 lt!674265) (tuple2!25433 key2!21 v2!10)))))

(declare-fun e!876904 () Bool)

(assert (=> d!164741 (= lt!674295 e!876904)))

(declare-fun res!1073809 () Bool)

(assert (=> d!164741 (=> (not res!1073809) (not e!876904))))

(assert (=> d!164741 (= res!1073809 ((_ is Cons!36783) lt!674265))))

(assert (=> d!164741 (= (contains!10472 lt!674265 (tuple2!25433 key2!21 v2!10)) lt!674295)))

(declare-fun b!1572716 () Bool)

(declare-fun e!876905 () Bool)

(assert (=> b!1572716 (= e!876904 e!876905)))

(declare-fun res!1073810 () Bool)

(assert (=> b!1572716 (=> res!1073810 e!876905)))

(assert (=> b!1572716 (= res!1073810 (= (h!38248 lt!674265) (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572717 () Bool)

(assert (=> b!1572717 (= e!876905 (contains!10472 (t!51687 lt!674265) (tuple2!25433 key2!21 v2!10)))))

(assert (= (and d!164741 res!1073809) b!1572716))

(assert (= (and b!1572716 (not res!1073810)) b!1572717))

(declare-fun m!1446525 () Bool)

(assert (=> d!164741 m!1446525))

(declare-fun m!1446527 () Bool)

(assert (=> d!164741 m!1446527))

(declare-fun m!1446529 () Bool)

(assert (=> b!1572717 m!1446529))

(assert (=> b!1572469 d!164741))

(declare-fun d!164743 () Bool)

(declare-fun res!1073811 () Bool)

(declare-fun e!876906 () Bool)

(assert (=> d!164743 (=> res!1073811 e!876906)))

(assert (=> d!164743 (= res!1073811 (or ((_ is Nil!36784) lt!674266) ((_ is Nil!36784) (t!51687 lt!674266))))))

(assert (=> d!164743 (= (isStrictlySorted!1007 lt!674266) e!876906)))

(declare-fun b!1572718 () Bool)

(declare-fun e!876907 () Bool)

(assert (=> b!1572718 (= e!876906 e!876907)))

(declare-fun res!1073812 () Bool)

(assert (=> b!1572718 (=> (not res!1073812) (not e!876907))))

(assert (=> b!1572718 (= res!1073812 (bvslt (_1!12727 (h!38248 lt!674266)) (_1!12727 (h!38248 (t!51687 lt!674266)))))))

(declare-fun b!1572719 () Bool)

(assert (=> b!1572719 (= e!876907 (isStrictlySorted!1007 (t!51687 lt!674266)))))

(assert (= (and d!164743 (not res!1073811)) b!1572718))

(assert (= (and b!1572718 res!1073812) b!1572719))

(declare-fun m!1446531 () Bool)

(assert (=> b!1572719 m!1446531))

(assert (=> d!164693 d!164743))

(assert (=> d!164693 d!164675))

(assert (=> b!1572378 d!164677))

(declare-fun d!164745 () Bool)

(assert (=> d!164745 (= ($colon$colon!997 e!876771 (ite c!145628 (h!38248 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (tuple2!25433 key2!21 v2!10))) (Cons!36783 (ite c!145628 (h!38248 (insertStrictlySorted!597 l!750 key1!37 v1!32)) (tuple2!25433 key2!21 v2!10)) e!876771))))

(assert (=> bm!72292 d!164745))

(assert (=> b!1572482 d!164705))

(declare-fun d!164747 () Bool)

(declare-fun res!1073813 () Bool)

(declare-fun e!876908 () Bool)

(assert (=> d!164747 (=> res!1073813 e!876908)))

(assert (=> d!164747 (= res!1073813 (or ((_ is Nil!36784) lt!674265) ((_ is Nil!36784) (t!51687 lt!674265))))))

(assert (=> d!164747 (= (isStrictlySorted!1007 lt!674265) e!876908)))

(declare-fun b!1572720 () Bool)

(declare-fun e!876909 () Bool)

(assert (=> b!1572720 (= e!876908 e!876909)))

(declare-fun res!1073814 () Bool)

(assert (=> b!1572720 (=> (not res!1073814) (not e!876909))))

(assert (=> b!1572720 (= res!1073814 (bvslt (_1!12727 (h!38248 lt!674265)) (_1!12727 (h!38248 (t!51687 lt!674265)))))))

(declare-fun b!1572721 () Bool)

(assert (=> b!1572721 (= e!876909 (isStrictlySorted!1007 (t!51687 lt!674265)))))

(assert (= (and d!164747 (not res!1073813)) b!1572720))

(assert (= (and b!1572720 res!1073814) b!1572721))

(declare-fun m!1446533 () Bool)

(assert (=> b!1572721 m!1446533))

(assert (=> d!164691 d!164747))

(declare-fun d!164749 () Bool)

(declare-fun res!1073815 () Bool)

(declare-fun e!876910 () Bool)

(assert (=> d!164749 (=> res!1073815 e!876910)))

(assert (=> d!164749 (= res!1073815 (or ((_ is Nil!36784) (insertStrictlySorted!597 l!750 key1!37 v1!32)) ((_ is Nil!36784) (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32)))))))

(assert (=> d!164749 (= (isStrictlySorted!1007 (insertStrictlySorted!597 l!750 key1!37 v1!32)) e!876910)))

(declare-fun b!1572722 () Bool)

(declare-fun e!876911 () Bool)

(assert (=> b!1572722 (= e!876910 e!876911)))

(declare-fun res!1073816 () Bool)

(assert (=> b!1572722 (=> (not res!1073816) (not e!876911))))

(assert (=> b!1572722 (= res!1073816 (bvslt (_1!12727 (h!38248 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32))))))))

(declare-fun b!1572723 () Bool)

(assert (=> b!1572723 (= e!876911 (isStrictlySorted!1007 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32))))))

(assert (= (and d!164749 (not res!1073815)) b!1572722))

(assert (= (and b!1572722 res!1073816) b!1572723))

(declare-fun m!1446535 () Bool)

(assert (=> b!1572723 m!1446535))

(assert (=> d!164691 d!164749))

(declare-fun d!164751 () Bool)

(assert (=> d!164751 (= ($colon$colon!997 e!876776 (ite c!145632 (h!38248 l!750) (tuple2!25433 key2!21 v2!10))) (Cons!36783 (ite c!145632 (h!38248 l!750) (tuple2!25433 key2!21 v2!10)) e!876776))))

(assert (=> bm!72295 d!164751))

(declare-fun lt!674296 () Bool)

(declare-fun d!164753 () Bool)

(assert (=> d!164753 (= lt!674296 (select (content!807 lt!674277) (tuple2!25433 key1!37 v1!32)))))

(declare-fun e!876912 () Bool)

(assert (=> d!164753 (= lt!674296 e!876912)))

(declare-fun res!1073817 () Bool)

(assert (=> d!164753 (=> (not res!1073817) (not e!876912))))

(assert (=> d!164753 (= res!1073817 ((_ is Cons!36783) lt!674277))))

(assert (=> d!164753 (= (contains!10472 lt!674277 (tuple2!25433 key1!37 v1!32)) lt!674296)))

(declare-fun b!1572724 () Bool)

(declare-fun e!876913 () Bool)

(assert (=> b!1572724 (= e!876912 e!876913)))

(declare-fun res!1073818 () Bool)

(assert (=> b!1572724 (=> res!1073818 e!876913)))

(assert (=> b!1572724 (= res!1073818 (= (h!38248 lt!674277) (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572725 () Bool)

(assert (=> b!1572725 (= e!876913 (contains!10472 (t!51687 lt!674277) (tuple2!25433 key1!37 v1!32)))))

(assert (= (and d!164753 res!1073817) b!1572724))

(assert (= (and b!1572724 (not res!1073818)) b!1572725))

(declare-fun m!1446537 () Bool)

(assert (=> d!164753 m!1446537))

(declare-fun m!1446539 () Bool)

(assert (=> d!164753 m!1446539))

(declare-fun m!1446541 () Bool)

(assert (=> b!1572725 m!1446541))

(assert (=> b!1572559 d!164753))

(declare-fun d!164755 () Bool)

(declare-fun res!1073819 () Bool)

(declare-fun e!876914 () Bool)

(assert (=> d!164755 (=> res!1073819 e!876914)))

(assert (=> d!164755 (= res!1073819 (or ((_ is Nil!36784) lt!674277) ((_ is Nil!36784) (t!51687 lt!674277))))))

(assert (=> d!164755 (= (isStrictlySorted!1007 lt!674277) e!876914)))

(declare-fun b!1572726 () Bool)

(declare-fun e!876915 () Bool)

(assert (=> b!1572726 (= e!876914 e!876915)))

(declare-fun res!1073820 () Bool)

(assert (=> b!1572726 (=> (not res!1073820) (not e!876915))))

(assert (=> b!1572726 (= res!1073820 (bvslt (_1!12727 (h!38248 lt!674277)) (_1!12727 (h!38248 (t!51687 lt!674277)))))))

(declare-fun b!1572727 () Bool)

(assert (=> b!1572727 (= e!876915 (isStrictlySorted!1007 (t!51687 lt!674277)))))

(assert (= (and d!164755 (not res!1073819)) b!1572726))

(assert (= (and b!1572726 res!1073820) b!1572727))

(declare-fun m!1446543 () Bool)

(assert (=> b!1572727 m!1446543))

(assert (=> d!164709 d!164755))

(declare-fun d!164757 () Bool)

(declare-fun res!1073821 () Bool)

(declare-fun e!876916 () Bool)

(assert (=> d!164757 (=> res!1073821 e!876916)))

(assert (=> d!164757 (= res!1073821 (or ((_ is Nil!36784) (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) ((_ is Nil!36784) (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)))))))

(assert (=> d!164757 (= (isStrictlySorted!1007 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) e!876916)))

(declare-fun b!1572728 () Bool)

(declare-fun e!876917 () Bool)

(assert (=> b!1572728 (= e!876916 e!876917)))

(declare-fun res!1073822 () Bool)

(assert (=> b!1572728 (=> (not res!1073822) (not e!876917))))

(assert (=> b!1572728 (= res!1073822 (bvslt (_1!12727 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))))))))

(declare-fun b!1572729 () Bool)

(assert (=> b!1572729 (= e!876917 (isStrictlySorted!1007 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))))))

(assert (= (and d!164757 (not res!1073821)) b!1572728))

(assert (= (and b!1572728 res!1073822) b!1572729))

(declare-fun m!1446545 () Bool)

(assert (=> b!1572729 m!1446545))

(assert (=> d!164709 d!164757))

(declare-fun b!1572730 () Bool)

(declare-fun e!876921 () List!36787)

(declare-fun e!876920 () List!36787)

(assert (=> b!1572730 (= e!876921 e!876920)))

(declare-fun c!145719 () Bool)

(assert (=> b!1572730 (= c!145719 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (= (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) key2!21)))))

(declare-fun b!1572731 () Bool)

(declare-fun call!72360 () List!36787)

(assert (=> b!1572731 (= e!876921 call!72360)))

(declare-fun bm!72357 () Bool)

(declare-fun call!72362 () List!36787)

(assert (=> bm!72357 (= call!72362 call!72360)))

(declare-fun b!1572732 () Bool)

(declare-fun e!876919 () Bool)

(declare-fun lt!674297 () List!36787)

(assert (=> b!1572732 (= e!876919 (contains!10472 lt!674297 (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572733 () Bool)

(declare-fun e!876922 () List!36787)

(declare-fun call!72361 () List!36787)

(assert (=> b!1572733 (= e!876922 call!72361)))

(declare-fun d!164759 () Bool)

(assert (=> d!164759 e!876919))

(declare-fun res!1073823 () Bool)

(assert (=> d!164759 (=> (not res!1073823) (not e!876919))))

(assert (=> d!164759 (= res!1073823 (isStrictlySorted!1007 lt!674297))))

(assert (=> d!164759 (= lt!674297 e!876921)))

(declare-fun c!145716 () Bool)

(assert (=> d!164759 (= c!145716 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (bvslt (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> d!164759 (isStrictlySorted!1007 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32)))))

(assert (=> d!164759 (= (insertStrictlySorted!597 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32)) key2!21 v2!10) lt!674297)))

(declare-fun b!1572734 () Bool)

(declare-fun c!145718 () Bool)

(assert (=> b!1572734 (= c!145718 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (bvsgt (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) key2!21)))))

(assert (=> b!1572734 (= e!876920 e!876922)))

(declare-fun bm!72358 () Bool)

(declare-fun e!876918 () List!36787)

(assert (=> bm!72358 (= call!72360 ($colon$colon!997 e!876918 (ite c!145716 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (tuple2!25433 key2!21 v2!10))))))

(declare-fun c!145717 () Bool)

(assert (=> bm!72358 (= c!145717 c!145716)))

(declare-fun b!1572735 () Bool)

(assert (=> b!1572735 (= e!876918 (insertStrictlySorted!597 (t!51687 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32))) key2!21 v2!10))))

(declare-fun b!1572736 () Bool)

(assert (=> b!1572736 (= e!876920 call!72362)))

(declare-fun b!1572737 () Bool)

(assert (=> b!1572737 (= e!876922 call!72361)))

(declare-fun b!1572738 () Bool)

(declare-fun res!1073824 () Bool)

(assert (=> b!1572738 (=> (not res!1073824) (not e!876919))))

(assert (=> b!1572738 (= res!1073824 (containsKey!869 lt!674297 key2!21))))

(declare-fun b!1572739 () Bool)

(assert (=> b!1572739 (= e!876918 (ite c!145719 (t!51687 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (ite c!145718 (Cons!36783 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32))) (t!51687 (t!51687 (insertStrictlySorted!597 l!750 key1!37 v1!32)))) Nil!36784)))))

(declare-fun bm!72359 () Bool)

(assert (=> bm!72359 (= call!72361 call!72362)))

(assert (= (and d!164759 c!145716) b!1572731))

(assert (= (and d!164759 (not c!145716)) b!1572730))

(assert (= (and b!1572730 c!145719) b!1572736))

(assert (= (and b!1572730 (not c!145719)) b!1572734))

(assert (= (and b!1572734 c!145718) b!1572733))

(assert (= (and b!1572734 (not c!145718)) b!1572737))

(assert (= (or b!1572733 b!1572737) bm!72359))

(assert (= (or b!1572736 bm!72359) bm!72357))

(assert (= (or b!1572731 bm!72357) bm!72358))

(assert (= (and bm!72358 c!145717) b!1572735))

(assert (= (and bm!72358 (not c!145717)) b!1572739))

(assert (= (and d!164759 res!1073823) b!1572738))

(assert (= (and b!1572738 res!1073824) b!1572732))

(declare-fun m!1446547 () Bool)

(assert (=> d!164759 m!1446547))

(assert (=> d!164759 m!1446535))

(declare-fun m!1446549 () Bool)

(assert (=> b!1572738 m!1446549))

(declare-fun m!1446551 () Bool)

(assert (=> b!1572732 m!1446551))

(declare-fun m!1446553 () Bool)

(assert (=> bm!72358 m!1446553))

(declare-fun m!1446555 () Bool)

(assert (=> b!1572735 m!1446555))

(assert (=> b!1572472 d!164759))

(declare-fun d!164761 () Bool)

(declare-fun res!1073829 () Bool)

(declare-fun e!876927 () Bool)

(assert (=> d!164761 (=> res!1073829 e!876927)))

(assert (=> d!164761 (= res!1073829 (and ((_ is Cons!36783) lt!674275) (= (_1!12727 (h!38248 lt!674275)) key2!21)))))

(assert (=> d!164761 (= (containsKey!869 lt!674275 key2!21) e!876927)))

(declare-fun b!1572744 () Bool)

(declare-fun e!876928 () Bool)

(assert (=> b!1572744 (= e!876927 e!876928)))

(declare-fun res!1073830 () Bool)

(assert (=> b!1572744 (=> (not res!1073830) (not e!876928))))

(assert (=> b!1572744 (= res!1073830 (and (or (not ((_ is Cons!36783) lt!674275)) (bvsle (_1!12727 (h!38248 lt!674275)) key2!21)) ((_ is Cons!36783) lt!674275) (bvslt (_1!12727 (h!38248 lt!674275)) key2!21)))))

(declare-fun b!1572745 () Bool)

(assert (=> b!1572745 (= e!876928 (containsKey!869 (t!51687 lt!674275) key2!21))))

(assert (= (and d!164761 (not res!1073829)) b!1572744))

(assert (= (and b!1572744 res!1073830) b!1572745))

(declare-fun m!1446557 () Bool)

(assert (=> b!1572745 m!1446557))

(assert (=> b!1572545 d!164761))

(declare-fun d!164763 () Bool)

(declare-fun res!1073831 () Bool)

(declare-fun e!876929 () Bool)

(assert (=> d!164763 (=> res!1073831 e!876929)))

(assert (=> d!164763 (= res!1073831 (and ((_ is Cons!36783) lt!674258) (= (_1!12727 (h!38248 lt!674258)) key1!37)))))

(assert (=> d!164763 (= (containsKey!869 lt!674258 key1!37) e!876929)))

(declare-fun b!1572746 () Bool)

(declare-fun e!876930 () Bool)

(assert (=> b!1572746 (= e!876929 e!876930)))

(declare-fun res!1073832 () Bool)

(assert (=> b!1572746 (=> (not res!1073832) (not e!876930))))

(assert (=> b!1572746 (= res!1073832 (and (or (not ((_ is Cons!36783) lt!674258)) (bvsle (_1!12727 (h!38248 lt!674258)) key1!37)) ((_ is Cons!36783) lt!674258) (bvslt (_1!12727 (h!38248 lt!674258)) key1!37)))))

(declare-fun b!1572747 () Bool)

(assert (=> b!1572747 (= e!876930 (containsKey!869 (t!51687 lt!674258) key1!37))))

(assert (= (and d!164763 (not res!1073831)) b!1572746))

(assert (= (and b!1572746 res!1073832) b!1572747))

(declare-fun m!1446559 () Bool)

(assert (=> b!1572747 m!1446559))

(assert (=> b!1572435 d!164763))

(declare-fun d!164765 () Bool)

(declare-fun res!1073833 () Bool)

(declare-fun e!876931 () Bool)

(assert (=> d!164765 (=> res!1073833 e!876931)))

(assert (=> d!164765 (= res!1073833 (and ((_ is Cons!36783) lt!674273) (= (_1!12727 (h!38248 lt!674273)) key2!21)))))

(assert (=> d!164765 (= (containsKey!869 lt!674273 key2!21) e!876931)))

(declare-fun b!1572748 () Bool)

(declare-fun e!876932 () Bool)

(assert (=> b!1572748 (= e!876931 e!876932)))

(declare-fun res!1073834 () Bool)

(assert (=> b!1572748 (=> (not res!1073834) (not e!876932))))

(assert (=> b!1572748 (= res!1073834 (and (or (not ((_ is Cons!36783) lt!674273)) (bvsle (_1!12727 (h!38248 lt!674273)) key2!21)) ((_ is Cons!36783) lt!674273) (bvslt (_1!12727 (h!38248 lt!674273)) key2!21)))))

(declare-fun b!1572749 () Bool)

(assert (=> b!1572749 (= e!876932 (containsKey!869 (t!51687 lt!674273) key2!21))))

(assert (= (and d!164765 (not res!1073833)) b!1572748))

(assert (= (and b!1572748 res!1073834) b!1572749))

(declare-fun m!1446561 () Bool)

(assert (=> b!1572749 m!1446561))

(assert (=> b!1572525 d!164765))

(declare-fun d!164767 () Bool)

(declare-fun res!1073835 () Bool)

(declare-fun e!876933 () Bool)

(assert (=> d!164767 (=> res!1073835 e!876933)))

(assert (=> d!164767 (= res!1073835 (and ((_ is Cons!36783) lt!674270) (= (_1!12727 (h!38248 lt!674270)) key1!37)))))

(assert (=> d!164767 (= (containsKey!869 lt!674270 key1!37) e!876933)))

(declare-fun b!1572750 () Bool)

(declare-fun e!876934 () Bool)

(assert (=> b!1572750 (= e!876933 e!876934)))

(declare-fun res!1073836 () Bool)

(assert (=> b!1572750 (=> (not res!1073836) (not e!876934))))

(assert (=> b!1572750 (= res!1073836 (and (or (not ((_ is Cons!36783) lt!674270)) (bvsle (_1!12727 (h!38248 lt!674270)) key1!37)) ((_ is Cons!36783) lt!674270) (bvslt (_1!12727 (h!38248 lt!674270)) key1!37)))))

(declare-fun b!1572751 () Bool)

(assert (=> b!1572751 (= e!876934 (containsKey!869 (t!51687 lt!674270) key1!37))))

(assert (= (and d!164767 (not res!1073835)) b!1572750))

(assert (= (and b!1572750 res!1073836) b!1572751))

(declare-fun m!1446563 () Bool)

(assert (=> b!1572751 m!1446563))

(assert (=> b!1572505 d!164767))

(declare-fun lt!674298 () Bool)

(declare-fun d!164769 () Bool)

(assert (=> d!164769 (= lt!674298 (select (content!807 lt!674266) (tuple2!25433 key2!21 v2!10)))))

(declare-fun e!876935 () Bool)

(assert (=> d!164769 (= lt!674298 e!876935)))

(declare-fun res!1073837 () Bool)

(assert (=> d!164769 (=> (not res!1073837) (not e!876935))))

(assert (=> d!164769 (= res!1073837 ((_ is Cons!36783) lt!674266))))

(assert (=> d!164769 (= (contains!10472 lt!674266 (tuple2!25433 key2!21 v2!10)) lt!674298)))

(declare-fun b!1572752 () Bool)

(declare-fun e!876936 () Bool)

(assert (=> b!1572752 (= e!876935 e!876936)))

(declare-fun res!1073838 () Bool)

(assert (=> b!1572752 (=> res!1073838 e!876936)))

(assert (=> b!1572752 (= res!1073838 (= (h!38248 lt!674266) (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572753 () Bool)

(assert (=> b!1572753 (= e!876936 (contains!10472 (t!51687 lt!674266) (tuple2!25433 key2!21 v2!10)))))

(assert (= (and d!164769 res!1073837) b!1572752))

(assert (= (and b!1572752 (not res!1073838)) b!1572753))

(declare-fun m!1446565 () Bool)

(assert (=> d!164769 m!1446565))

(declare-fun m!1446567 () Bool)

(assert (=> d!164769 m!1446567))

(declare-fun m!1446569 () Bool)

(assert (=> b!1572753 m!1446569))

(assert (=> b!1572479 d!164769))

(declare-fun d!164771 () Bool)

(declare-fun lt!674299 () Bool)

(assert (=> d!164771 (= lt!674299 (select (content!807 lt!674273) (tuple2!25433 key2!21 v2!10)))))

(declare-fun e!876937 () Bool)

(assert (=> d!164771 (= lt!674299 e!876937)))

(declare-fun res!1073839 () Bool)

(assert (=> d!164771 (=> (not res!1073839) (not e!876937))))

(assert (=> d!164771 (= res!1073839 ((_ is Cons!36783) lt!674273))))

(assert (=> d!164771 (= (contains!10472 lt!674273 (tuple2!25433 key2!21 v2!10)) lt!674299)))

(declare-fun b!1572754 () Bool)

(declare-fun e!876938 () Bool)

(assert (=> b!1572754 (= e!876937 e!876938)))

(declare-fun res!1073840 () Bool)

(assert (=> b!1572754 (=> res!1073840 e!876938)))

(assert (=> b!1572754 (= res!1073840 (= (h!38248 lt!674273) (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572755 () Bool)

(assert (=> b!1572755 (= e!876938 (contains!10472 (t!51687 lt!674273) (tuple2!25433 key2!21 v2!10)))))

(assert (= (and d!164771 res!1073839) b!1572754))

(assert (= (and b!1572754 (not res!1073840)) b!1572755))

(declare-fun m!1446571 () Bool)

(assert (=> d!164771 m!1446571))

(declare-fun m!1446573 () Bool)

(assert (=> d!164771 m!1446573))

(declare-fun m!1446575 () Bool)

(assert (=> b!1572755 m!1446575))

(assert (=> b!1572519 d!164771))

(declare-fun lt!674300 () Bool)

(declare-fun d!164773 () Bool)

(assert (=> d!164773 (= lt!674300 (select (content!807 lt!674270) (tuple2!25433 key1!37 v1!32)))))

(declare-fun e!876939 () Bool)

(assert (=> d!164773 (= lt!674300 e!876939)))

(declare-fun res!1073841 () Bool)

(assert (=> d!164773 (=> (not res!1073841) (not e!876939))))

(assert (=> d!164773 (= res!1073841 ((_ is Cons!36783) lt!674270))))

(assert (=> d!164773 (= (contains!10472 lt!674270 (tuple2!25433 key1!37 v1!32)) lt!674300)))

(declare-fun b!1572756 () Bool)

(declare-fun e!876940 () Bool)

(assert (=> b!1572756 (= e!876939 e!876940)))

(declare-fun res!1073842 () Bool)

(assert (=> b!1572756 (=> res!1073842 e!876940)))

(assert (=> b!1572756 (= res!1073842 (= (h!38248 lt!674270) (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572757 () Bool)

(assert (=> b!1572757 (= e!876940 (contains!10472 (t!51687 lt!674270) (tuple2!25433 key1!37 v1!32)))))

(assert (= (and d!164773 res!1073841) b!1572756))

(assert (= (and b!1572756 (not res!1073842)) b!1572757))

(declare-fun m!1446577 () Bool)

(assert (=> d!164773 m!1446577))

(declare-fun m!1446579 () Bool)

(assert (=> d!164773 m!1446579))

(declare-fun m!1446581 () Bool)

(assert (=> b!1572757 m!1446581))

(assert (=> b!1572499 d!164773))

(declare-fun lt!674301 () Bool)

(declare-fun d!164775 () Bool)

(assert (=> d!164775 (= lt!674301 (select (content!807 lt!674258) (tuple2!25433 key1!37 v1!32)))))

(declare-fun e!876941 () Bool)

(assert (=> d!164775 (= lt!674301 e!876941)))

(declare-fun res!1073843 () Bool)

(assert (=> d!164775 (=> (not res!1073843) (not e!876941))))

(assert (=> d!164775 (= res!1073843 ((_ is Cons!36783) lt!674258))))

(assert (=> d!164775 (= (contains!10472 lt!674258 (tuple2!25433 key1!37 v1!32)) lt!674301)))

(declare-fun b!1572758 () Bool)

(declare-fun e!876942 () Bool)

(assert (=> b!1572758 (= e!876941 e!876942)))

(declare-fun res!1073844 () Bool)

(assert (=> b!1572758 (=> res!1073844 e!876942)))

(assert (=> b!1572758 (= res!1073844 (= (h!38248 lt!674258) (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572759 () Bool)

(assert (=> b!1572759 (= e!876942 (contains!10472 (t!51687 lt!674258) (tuple2!25433 key1!37 v1!32)))))

(assert (= (and d!164775 res!1073843) b!1572758))

(assert (= (and b!1572758 (not res!1073844)) b!1572759))

(declare-fun m!1446583 () Bool)

(assert (=> d!164775 m!1446583))

(declare-fun m!1446585 () Bool)

(assert (=> d!164775 m!1446585))

(declare-fun m!1446587 () Bool)

(assert (=> b!1572759 m!1446587))

(assert (=> b!1572429 d!164775))

(declare-fun d!164777 () Bool)

(assert (=> d!164777 (= (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32) key2!21 v2!10) (insertStrictlySorted!597 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10) key1!37 v1!32))))

(assert (=> d!164777 true))

(declare-fun _$5!161 () Unit!52005)

(assert (=> d!164777 (= (choose!2077 (t!51687 l!750) key1!37 v1!32 key2!21 v2!10) _$5!161)))

(declare-fun bs!45247 () Bool)

(assert (= bs!45247 d!164777))

(assert (=> bs!45247 m!1446201))

(assert (=> bs!45247 m!1446201))

(assert (=> bs!45247 m!1446203))

(assert (=> bs!45247 m!1446199))

(assert (=> bs!45247 m!1446199))

(assert (=> bs!45247 m!1446215))

(assert (=> d!164687 d!164777))

(assert (=> d!164687 d!164701))

(assert (=> d!164687 d!164705))

(assert (=> d!164687 d!164709))

(assert (=> d!164687 d!164713))

(declare-fun d!164779 () Bool)

(declare-fun res!1073845 () Bool)

(declare-fun e!876943 () Bool)

(assert (=> d!164779 (=> res!1073845 e!876943)))

(assert (=> d!164779 (= res!1073845 (or ((_ is Nil!36784) lt!674270) ((_ is Nil!36784) (t!51687 lt!674270))))))

(assert (=> d!164779 (= (isStrictlySorted!1007 lt!674270) e!876943)))

(declare-fun b!1572760 () Bool)

(declare-fun e!876944 () Bool)

(assert (=> b!1572760 (= e!876943 e!876944)))

(declare-fun res!1073846 () Bool)

(assert (=> b!1572760 (=> (not res!1073846) (not e!876944))))

(assert (=> b!1572760 (= res!1073846 (bvslt (_1!12727 (h!38248 lt!674270)) (_1!12727 (h!38248 (t!51687 lt!674270)))))))

(declare-fun b!1572761 () Bool)

(assert (=> b!1572761 (= e!876944 (isStrictlySorted!1007 (t!51687 lt!674270)))))

(assert (= (and d!164779 (not res!1073845)) b!1572760))

(assert (= (and b!1572760 res!1073846) b!1572761))

(declare-fun m!1446589 () Bool)

(assert (=> b!1572761 m!1446589))

(assert (=> d!164695 d!164779))

(assert (=> d!164695 d!164675))

(declare-fun d!164781 () Bool)

(assert (=> d!164781 (= ($colon$colon!997 e!876806 (ite c!145656 (h!38248 (t!51687 l!750)) (tuple2!25433 key2!21 v2!10))) (Cons!36783 (ite c!145656 (h!38248 (t!51687 l!750)) (tuple2!25433 key2!21 v2!10)) e!876806))))

(assert (=> bm!72313 d!164781))

(declare-fun d!164783 () Bool)

(declare-fun res!1073847 () Bool)

(declare-fun e!876945 () Bool)

(assert (=> d!164783 (=> res!1073847 e!876945)))

(assert (=> d!164783 (= res!1073847 (or ((_ is Nil!36784) lt!674275) ((_ is Nil!36784) (t!51687 lt!674275))))))

(assert (=> d!164783 (= (isStrictlySorted!1007 lt!674275) e!876945)))

(declare-fun b!1572762 () Bool)

(declare-fun e!876946 () Bool)

(assert (=> b!1572762 (= e!876945 e!876946)))

(declare-fun res!1073848 () Bool)

(assert (=> b!1572762 (=> (not res!1073848) (not e!876946))))

(assert (=> b!1572762 (= res!1073848 (bvslt (_1!12727 (h!38248 lt!674275)) (_1!12727 (h!38248 (t!51687 lt!674275)))))))

(declare-fun b!1572763 () Bool)

(assert (=> b!1572763 (= e!876946 (isStrictlySorted!1007 (t!51687 lt!674275)))))

(assert (= (and d!164783 (not res!1073847)) b!1572762))

(assert (= (and b!1572762 res!1073848) b!1572763))

(declare-fun m!1446591 () Bool)

(assert (=> b!1572763 m!1446591))

(assert (=> d!164705 d!164783))

(assert (=> d!164705 d!164677))

(declare-fun d!164785 () Bool)

(assert (=> d!164785 (= ($colon$colon!997 e!876751 (ite c!145612 (h!38248 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (tuple2!25433 key1!37 v1!32))) (Cons!36783 (ite c!145612 (h!38248 (insertStrictlySorted!597 l!750 key2!21 v2!10)) (tuple2!25433 key1!37 v1!32)) e!876751))))

(assert (=> bm!72280 d!164785))

(declare-fun b!1572764 () Bool)

(declare-fun e!876950 () List!36787)

(declare-fun e!876949 () List!36787)

(assert (=> b!1572764 (= e!876950 e!876949)))

(declare-fun c!145723 () Bool)

(assert (=> b!1572764 (= c!145723 (and ((_ is Cons!36783) (t!51687 (t!51687 l!750))) (= (_1!12727 (h!38248 (t!51687 (t!51687 l!750)))) key2!21)))))

(declare-fun b!1572765 () Bool)

(declare-fun call!72363 () List!36787)

(assert (=> b!1572765 (= e!876950 call!72363)))

(declare-fun bm!72360 () Bool)

(declare-fun call!72365 () List!36787)

(assert (=> bm!72360 (= call!72365 call!72363)))

(declare-fun e!876948 () Bool)

(declare-fun lt!674302 () List!36787)

(declare-fun b!1572766 () Bool)

(assert (=> b!1572766 (= e!876948 (contains!10472 lt!674302 (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572767 () Bool)

(declare-fun e!876951 () List!36787)

(declare-fun call!72364 () List!36787)

(assert (=> b!1572767 (= e!876951 call!72364)))

(declare-fun d!164787 () Bool)

(assert (=> d!164787 e!876948))

(declare-fun res!1073849 () Bool)

(assert (=> d!164787 (=> (not res!1073849) (not e!876948))))

(assert (=> d!164787 (= res!1073849 (isStrictlySorted!1007 lt!674302))))

(assert (=> d!164787 (= lt!674302 e!876950)))

(declare-fun c!145720 () Bool)

(assert (=> d!164787 (= c!145720 (and ((_ is Cons!36783) (t!51687 (t!51687 l!750))) (bvslt (_1!12727 (h!38248 (t!51687 (t!51687 l!750)))) key2!21)))))

(assert (=> d!164787 (isStrictlySorted!1007 (t!51687 (t!51687 l!750)))))

(assert (=> d!164787 (= (insertStrictlySorted!597 (t!51687 (t!51687 l!750)) key2!21 v2!10) lt!674302)))

(declare-fun b!1572768 () Bool)

(declare-fun c!145722 () Bool)

(assert (=> b!1572768 (= c!145722 (and ((_ is Cons!36783) (t!51687 (t!51687 l!750))) (bvsgt (_1!12727 (h!38248 (t!51687 (t!51687 l!750)))) key2!21)))))

(assert (=> b!1572768 (= e!876949 e!876951)))

(declare-fun e!876947 () List!36787)

(declare-fun bm!72361 () Bool)

(assert (=> bm!72361 (= call!72363 ($colon$colon!997 e!876947 (ite c!145720 (h!38248 (t!51687 (t!51687 l!750))) (tuple2!25433 key2!21 v2!10))))))

(declare-fun c!145721 () Bool)

(assert (=> bm!72361 (= c!145721 c!145720)))

(declare-fun b!1572769 () Bool)

(assert (=> b!1572769 (= e!876947 (insertStrictlySorted!597 (t!51687 (t!51687 (t!51687 l!750))) key2!21 v2!10))))

(declare-fun b!1572770 () Bool)

(assert (=> b!1572770 (= e!876949 call!72365)))

(declare-fun b!1572771 () Bool)

(assert (=> b!1572771 (= e!876951 call!72364)))

(declare-fun b!1572772 () Bool)

(declare-fun res!1073850 () Bool)

(assert (=> b!1572772 (=> (not res!1073850) (not e!876948))))

(assert (=> b!1572772 (= res!1073850 (containsKey!869 lt!674302 key2!21))))

(declare-fun b!1572773 () Bool)

(assert (=> b!1572773 (= e!876947 (ite c!145723 (t!51687 (t!51687 (t!51687 l!750))) (ite c!145722 (Cons!36783 (h!38248 (t!51687 (t!51687 l!750))) (t!51687 (t!51687 (t!51687 l!750)))) Nil!36784)))))

(declare-fun bm!72362 () Bool)

(assert (=> bm!72362 (= call!72364 call!72365)))

(assert (= (and d!164787 c!145720) b!1572765))

(assert (= (and d!164787 (not c!145720)) b!1572764))

(assert (= (and b!1572764 c!145723) b!1572770))

(assert (= (and b!1572764 (not c!145723)) b!1572768))

(assert (= (and b!1572768 c!145722) b!1572767))

(assert (= (and b!1572768 (not c!145722)) b!1572771))

(assert (= (or b!1572767 b!1572771) bm!72362))

(assert (= (or b!1572770 bm!72362) bm!72360))

(assert (= (or b!1572765 bm!72360) bm!72361))

(assert (= (and bm!72361 c!145721) b!1572769))

(assert (= (and bm!72361 (not c!145721)) b!1572773))

(assert (= (and d!164787 res!1073849) b!1572772))

(assert (= (and b!1572772 res!1073850) b!1572766))

(declare-fun m!1446593 () Bool)

(assert (=> d!164787 m!1446593))

(assert (=> d!164787 m!1446261))

(declare-fun m!1446595 () Bool)

(assert (=> b!1572772 m!1446595))

(declare-fun m!1446597 () Bool)

(assert (=> b!1572766 m!1446597))

(declare-fun m!1446599 () Bool)

(assert (=> bm!72361 m!1446599))

(declare-fun m!1446601 () Bool)

(assert (=> b!1572769 m!1446601))

(assert (=> b!1572542 d!164787))

(declare-fun d!164789 () Bool)

(assert (=> d!164789 (= ($colon$colon!997 e!876796 (ite c!145648 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) (tuple2!25433 key2!21 v2!10))) (Cons!36783 (ite c!145648 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) (tuple2!25433 key2!21 v2!10)) e!876796))))

(assert (=> bm!72307 d!164789))

(declare-fun d!164791 () Bool)

(declare-fun res!1073851 () Bool)

(declare-fun e!876952 () Bool)

(assert (=> d!164791 (=> res!1073851 e!876952)))

(assert (=> d!164791 (= res!1073851 (and ((_ is Cons!36783) lt!674281) (= (_1!12727 (h!38248 lt!674281)) key1!37)))))

(assert (=> d!164791 (= (containsKey!869 lt!674281 key1!37) e!876952)))

(declare-fun b!1572774 () Bool)

(declare-fun e!876953 () Bool)

(assert (=> b!1572774 (= e!876952 e!876953)))

(declare-fun res!1073852 () Bool)

(assert (=> b!1572774 (=> (not res!1073852) (not e!876953))))

(assert (=> b!1572774 (= res!1073852 (and (or (not ((_ is Cons!36783) lt!674281)) (bvsle (_1!12727 (h!38248 lt!674281)) key1!37)) ((_ is Cons!36783) lt!674281) (bvslt (_1!12727 (h!38248 lt!674281)) key1!37)))))

(declare-fun b!1572775 () Bool)

(assert (=> b!1572775 (= e!876953 (containsKey!869 (t!51687 lt!674281) key1!37))))

(assert (= (and d!164791 (not res!1073851)) b!1572774))

(assert (= (and b!1572774 res!1073852) b!1572775))

(declare-fun m!1446603 () Bool)

(assert (=> b!1572775 m!1446603))

(assert (=> b!1572585 d!164791))

(declare-fun d!164793 () Bool)

(declare-fun res!1073853 () Bool)

(declare-fun e!876954 () Bool)

(assert (=> d!164793 (=> res!1073853 e!876954)))

(assert (=> d!164793 (= res!1073853 (or ((_ is Nil!36784) lt!674258) ((_ is Nil!36784) (t!51687 lt!674258))))))

(assert (=> d!164793 (= (isStrictlySorted!1007 lt!674258) e!876954)))

(declare-fun b!1572776 () Bool)

(declare-fun e!876955 () Bool)

(assert (=> b!1572776 (= e!876954 e!876955)))

(declare-fun res!1073854 () Bool)

(assert (=> b!1572776 (=> (not res!1073854) (not e!876955))))

(assert (=> b!1572776 (= res!1073854 (bvslt (_1!12727 (h!38248 lt!674258)) (_1!12727 (h!38248 (t!51687 lt!674258)))))))

(declare-fun b!1572777 () Bool)

(assert (=> b!1572777 (= e!876955 (isStrictlySorted!1007 (t!51687 lt!674258)))))

(assert (= (and d!164793 (not res!1073853)) b!1572776))

(assert (= (and b!1572776 res!1073854) b!1572777))

(declare-fun m!1446605 () Bool)

(assert (=> b!1572777 m!1446605))

(assert (=> d!164679 d!164793))

(declare-fun d!164795 () Bool)

(declare-fun res!1073855 () Bool)

(declare-fun e!876956 () Bool)

(assert (=> d!164795 (=> res!1073855 e!876956)))

(assert (=> d!164795 (= res!1073855 (or ((_ is Nil!36784) (insertStrictlySorted!597 l!750 key2!21 v2!10)) ((_ is Nil!36784) (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10)))))))

(assert (=> d!164795 (= (isStrictlySorted!1007 (insertStrictlySorted!597 l!750 key2!21 v2!10)) e!876956)))

(declare-fun b!1572778 () Bool)

(declare-fun e!876957 () Bool)

(assert (=> b!1572778 (= e!876956 e!876957)))

(declare-fun res!1073856 () Bool)

(assert (=> b!1572778 (=> (not res!1073856) (not e!876957))))

(assert (=> b!1572778 (= res!1073856 (bvslt (_1!12727 (h!38248 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10))))))))

(declare-fun b!1572779 () Bool)

(assert (=> b!1572779 (= e!876957 (isStrictlySorted!1007 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10))))))

(assert (= (and d!164795 (not res!1073855)) b!1572778))

(assert (= (and b!1572778 res!1073856) b!1572779))

(declare-fun m!1446607 () Bool)

(assert (=> b!1572779 m!1446607))

(assert (=> d!164679 d!164795))

(declare-fun d!164797 () Bool)

(assert (=> d!164797 (= ($colon$colon!997 e!876786 (ite c!145640 (h!38248 l!750) (tuple2!25433 key1!37 v1!32))) (Cons!36783 (ite c!145640 (h!38248 l!750) (tuple2!25433 key1!37 v1!32)) e!876786))))

(assert (=> bm!72301 d!164797))

(declare-fun d!164799 () Bool)

(declare-fun res!1073857 () Bool)

(declare-fun e!876958 () Bool)

(assert (=> d!164799 (=> res!1073857 e!876958)))

(assert (=> d!164799 (= res!1073857 (or ((_ is Nil!36784) lt!674273) ((_ is Nil!36784) (t!51687 lt!674273))))))

(assert (=> d!164799 (= (isStrictlySorted!1007 lt!674273) e!876958)))

(declare-fun b!1572780 () Bool)

(declare-fun e!876959 () Bool)

(assert (=> b!1572780 (= e!876958 e!876959)))

(declare-fun res!1073858 () Bool)

(assert (=> b!1572780 (=> (not res!1073858) (not e!876959))))

(assert (=> b!1572780 (= res!1073858 (bvslt (_1!12727 (h!38248 lt!674273)) (_1!12727 (h!38248 (t!51687 lt!674273)))))))

(declare-fun b!1572781 () Bool)

(assert (=> b!1572781 (= e!876959 (isStrictlySorted!1007 (t!51687 lt!674273)))))

(assert (= (and d!164799 (not res!1073857)) b!1572780))

(assert (= (and b!1572780 res!1073858) b!1572781))

(declare-fun m!1446609 () Bool)

(assert (=> b!1572781 m!1446609))

(assert (=> d!164701 d!164799))

(declare-fun d!164801 () Bool)

(declare-fun res!1073859 () Bool)

(declare-fun e!876960 () Bool)

(assert (=> d!164801 (=> res!1073859 e!876960)))

(assert (=> d!164801 (= res!1073859 (or ((_ is Nil!36784) (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) ((_ is Nil!36784) (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)))))))

(assert (=> d!164801 (= (isStrictlySorted!1007 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) e!876960)))

(declare-fun b!1572782 () Bool)

(declare-fun e!876961 () Bool)

(assert (=> b!1572782 (= e!876960 e!876961)))

(declare-fun res!1073860 () Bool)

(assert (=> b!1572782 (=> (not res!1073860) (not e!876961))))

(assert (=> b!1572782 (= res!1073860 (bvslt (_1!12727 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))))))))

(declare-fun b!1572783 () Bool)

(assert (=> b!1572783 (= e!876961 (isStrictlySorted!1007 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))))))

(assert (= (and d!164801 (not res!1073859)) b!1572782))

(assert (= (and b!1572782 res!1073860) b!1572783))

(declare-fun m!1446611 () Bool)

(assert (=> b!1572783 m!1446611))

(assert (=> d!164701 d!164801))

(declare-fun b!1572784 () Bool)

(declare-fun e!876965 () List!36787)

(declare-fun e!876964 () List!36787)

(assert (=> b!1572784 (= e!876965 e!876964)))

(declare-fun c!145727 () Bool)

(assert (=> b!1572784 (= c!145727 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) (= (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)))) key2!21)))))

(declare-fun b!1572785 () Bool)

(declare-fun call!72366 () List!36787)

(assert (=> b!1572785 (= e!876965 call!72366)))

(declare-fun bm!72363 () Bool)

(declare-fun call!72368 () List!36787)

(assert (=> bm!72363 (= call!72368 call!72366)))

(declare-fun b!1572786 () Bool)

(declare-fun lt!674303 () List!36787)

(declare-fun e!876963 () Bool)

(assert (=> b!1572786 (= e!876963 (contains!10472 lt!674303 (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572787 () Bool)

(declare-fun e!876966 () List!36787)

(declare-fun call!72367 () List!36787)

(assert (=> b!1572787 (= e!876966 call!72367)))

(declare-fun d!164803 () Bool)

(assert (=> d!164803 e!876963))

(declare-fun res!1073861 () Bool)

(assert (=> d!164803 (=> (not res!1073861) (not e!876963))))

(assert (=> d!164803 (= res!1073861 (isStrictlySorted!1007 lt!674303))))

(assert (=> d!164803 (= lt!674303 e!876965)))

(declare-fun c!145724 () Bool)

(assert (=> d!164803 (= c!145724 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) (bvslt (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)))) key2!21)))))

(assert (=> d!164803 (isStrictlySorted!1007 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)))))

(assert (=> d!164803 (= (insertStrictlySorted!597 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)) key2!21 v2!10) lt!674303)))

(declare-fun b!1572788 () Bool)

(declare-fun c!145726 () Bool)

(assert (=> b!1572788 (= c!145726 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) (bvsgt (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)))) key2!21)))))

(assert (=> b!1572788 (= e!876964 e!876966)))

(declare-fun bm!72364 () Bool)

(declare-fun e!876962 () List!36787)

(assert (=> bm!72364 (= call!72366 ($colon$colon!997 e!876962 (ite c!145724 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) (tuple2!25433 key2!21 v2!10))))))

(declare-fun c!145725 () Bool)

(assert (=> bm!72364 (= c!145725 c!145724)))

(declare-fun b!1572789 () Bool)

(assert (=> b!1572789 (= e!876962 (insertStrictlySorted!597 (t!51687 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) key2!21 v2!10))))

(declare-fun b!1572790 () Bool)

(assert (=> b!1572790 (= e!876964 call!72368)))

(declare-fun b!1572791 () Bool)

(assert (=> b!1572791 (= e!876966 call!72367)))

(declare-fun b!1572792 () Bool)

(declare-fun res!1073862 () Bool)

(assert (=> b!1572792 (=> (not res!1073862) (not e!876963))))

(assert (=> b!1572792 (= res!1073862 (containsKey!869 lt!674303 key2!21))))

(declare-fun b!1572793 () Bool)

(assert (=> b!1572793 (= e!876962 (ite c!145727 (t!51687 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) (ite c!145726 (Cons!36783 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32))) (t!51687 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key1!37 v1!32)))) Nil!36784)))))

(declare-fun bm!72365 () Bool)

(assert (=> bm!72365 (= call!72367 call!72368)))

(assert (= (and d!164803 c!145724) b!1572785))

(assert (= (and d!164803 (not c!145724)) b!1572784))

(assert (= (and b!1572784 c!145727) b!1572790))

(assert (= (and b!1572784 (not c!145727)) b!1572788))

(assert (= (and b!1572788 c!145726) b!1572787))

(assert (= (and b!1572788 (not c!145726)) b!1572791))

(assert (= (or b!1572787 b!1572791) bm!72365))

(assert (= (or b!1572790 bm!72365) bm!72363))

(assert (= (or b!1572785 bm!72363) bm!72364))

(assert (= (and bm!72364 c!145725) b!1572789))

(assert (= (and bm!72364 (not c!145725)) b!1572793))

(assert (= (and d!164803 res!1073861) b!1572792))

(assert (= (and b!1572792 res!1073862) b!1572786))

(declare-fun m!1446613 () Bool)

(assert (=> d!164803 m!1446613))

(assert (=> d!164803 m!1446611))

(declare-fun m!1446615 () Bool)

(assert (=> b!1572792 m!1446615))

(declare-fun m!1446617 () Bool)

(assert (=> b!1572786 m!1446617))

(declare-fun m!1446619 () Bool)

(assert (=> bm!72364 m!1446619))

(declare-fun m!1446621 () Bool)

(assert (=> b!1572789 m!1446621))

(assert (=> b!1572522 d!164803))

(assert (=> b!1572502 d!164713))

(declare-fun b!1572794 () Bool)

(declare-fun e!876970 () List!36787)

(declare-fun e!876969 () List!36787)

(assert (=> b!1572794 (= e!876970 e!876969)))

(declare-fun c!145731 () Bool)

(assert (=> b!1572794 (= c!145731 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (= (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) key1!37)))))

(declare-fun b!1572795 () Bool)

(declare-fun call!72369 () List!36787)

(assert (=> b!1572795 (= e!876970 call!72369)))

(declare-fun bm!72366 () Bool)

(declare-fun call!72371 () List!36787)

(assert (=> bm!72366 (= call!72371 call!72369)))

(declare-fun b!1572796 () Bool)

(declare-fun lt!674304 () List!36787)

(declare-fun e!876968 () Bool)

(assert (=> b!1572796 (= e!876968 (contains!10472 lt!674304 (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572797 () Bool)

(declare-fun e!876971 () List!36787)

(declare-fun call!72370 () List!36787)

(assert (=> b!1572797 (= e!876971 call!72370)))

(declare-fun d!164805 () Bool)

(assert (=> d!164805 e!876968))

(declare-fun res!1073863 () Bool)

(assert (=> d!164805 (=> (not res!1073863) (not e!876968))))

(assert (=> d!164805 (= res!1073863 (isStrictlySorted!1007 lt!674304))))

(assert (=> d!164805 (= lt!674304 e!876970)))

(declare-fun c!145728 () Bool)

(assert (=> d!164805 (= c!145728 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (bvslt (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> d!164805 (isStrictlySorted!1007 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10)))))

(assert (=> d!164805 (= (insertStrictlySorted!597 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10)) key1!37 v1!32) lt!674304)))

(declare-fun b!1572798 () Bool)

(declare-fun c!145730 () Bool)

(assert (=> b!1572798 (= c!145730 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (bvsgt (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) key1!37)))))

(assert (=> b!1572798 (= e!876969 e!876971)))

(declare-fun bm!72367 () Bool)

(declare-fun e!876967 () List!36787)

(assert (=> bm!72367 (= call!72369 ($colon$colon!997 e!876967 (ite c!145728 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (tuple2!25433 key1!37 v1!32))))))

(declare-fun c!145729 () Bool)

(assert (=> bm!72367 (= c!145729 c!145728)))

(declare-fun b!1572799 () Bool)

(assert (=> b!1572799 (= e!876967 (insertStrictlySorted!597 (t!51687 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10))) key1!37 v1!32))))

(declare-fun b!1572800 () Bool)

(assert (=> b!1572800 (= e!876969 call!72371)))

(declare-fun b!1572801 () Bool)

(assert (=> b!1572801 (= e!876971 call!72370)))

(declare-fun b!1572802 () Bool)

(declare-fun res!1073864 () Bool)

(assert (=> b!1572802 (=> (not res!1073864) (not e!876968))))

(assert (=> b!1572802 (= res!1073864 (containsKey!869 lt!674304 key1!37))))

(declare-fun b!1572803 () Bool)

(assert (=> b!1572803 (= e!876967 (ite c!145731 (t!51687 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (ite c!145730 (Cons!36783 (h!38248 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10))) (t!51687 (t!51687 (insertStrictlySorted!597 l!750 key2!21 v2!10)))) Nil!36784)))))

(declare-fun bm!72368 () Bool)

(assert (=> bm!72368 (= call!72370 call!72371)))

(assert (= (and d!164805 c!145728) b!1572795))

(assert (= (and d!164805 (not c!145728)) b!1572794))

(assert (= (and b!1572794 c!145731) b!1572800))

(assert (= (and b!1572794 (not c!145731)) b!1572798))

(assert (= (and b!1572798 c!145730) b!1572797))

(assert (= (and b!1572798 (not c!145730)) b!1572801))

(assert (= (or b!1572797 b!1572801) bm!72368))

(assert (= (or b!1572800 bm!72368) bm!72366))

(assert (= (or b!1572795 bm!72366) bm!72367))

(assert (= (and bm!72367 c!145729) b!1572799))

(assert (= (and bm!72367 (not c!145729)) b!1572803))

(assert (= (and d!164805 res!1073863) b!1572802))

(assert (= (and b!1572802 res!1073864) b!1572796))

(declare-fun m!1446623 () Bool)

(assert (=> d!164805 m!1446623))

(assert (=> d!164805 m!1446607))

(declare-fun m!1446625 () Bool)

(assert (=> b!1572802 m!1446625))

(declare-fun m!1446627 () Bool)

(assert (=> b!1572796 m!1446627))

(declare-fun m!1446629 () Bool)

(assert (=> bm!72367 m!1446629))

(declare-fun m!1446631 () Bool)

(assert (=> b!1572799 m!1446631))

(assert (=> b!1572432 d!164805))

(declare-fun lt!674305 () Bool)

(declare-fun d!164807 () Bool)

(assert (=> d!164807 (= lt!674305 (select (content!807 lt!674281) (tuple2!25433 key1!37 v1!32)))))

(declare-fun e!876972 () Bool)

(assert (=> d!164807 (= lt!674305 e!876972)))

(declare-fun res!1073865 () Bool)

(assert (=> d!164807 (=> (not res!1073865) (not e!876972))))

(assert (=> d!164807 (= res!1073865 ((_ is Cons!36783) lt!674281))))

(assert (=> d!164807 (= (contains!10472 lt!674281 (tuple2!25433 key1!37 v1!32)) lt!674305)))

(declare-fun b!1572804 () Bool)

(declare-fun e!876973 () Bool)

(assert (=> b!1572804 (= e!876972 e!876973)))

(declare-fun res!1073866 () Bool)

(assert (=> b!1572804 (=> res!1073866 e!876973)))

(assert (=> b!1572804 (= res!1073866 (= (h!38248 lt!674281) (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572805 () Bool)

(assert (=> b!1572805 (= e!876973 (contains!10472 (t!51687 lt!674281) (tuple2!25433 key1!37 v1!32)))))

(assert (= (and d!164807 res!1073865) b!1572804))

(assert (= (and b!1572804 (not res!1073866)) b!1572805))

(declare-fun m!1446633 () Bool)

(assert (=> d!164807 m!1446633))

(declare-fun m!1446635 () Bool)

(assert (=> d!164807 m!1446635))

(declare-fun m!1446637 () Bool)

(assert (=> b!1572805 m!1446637))

(assert (=> b!1572579 d!164807))

(declare-fun d!164809 () Bool)

(assert (=> d!164809 (= ($colon$colon!997 e!876816 (ite c!145664 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) (tuple2!25433 key1!37 v1!32))) (Cons!36783 (ite c!145664 (h!38248 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) (tuple2!25433 key1!37 v1!32)) e!876816))))

(assert (=> bm!72319 d!164809))

(declare-fun d!164811 () Bool)

(declare-fun res!1073867 () Bool)

(declare-fun e!876974 () Bool)

(assert (=> d!164811 (=> res!1073867 e!876974)))

(assert (=> d!164811 (= res!1073867 (and ((_ is Cons!36783) lt!674265) (= (_1!12727 (h!38248 lt!674265)) key2!21)))))

(assert (=> d!164811 (= (containsKey!869 lt!674265 key2!21) e!876974)))

(declare-fun b!1572806 () Bool)

(declare-fun e!876975 () Bool)

(assert (=> b!1572806 (= e!876974 e!876975)))

(declare-fun res!1073868 () Bool)

(assert (=> b!1572806 (=> (not res!1073868) (not e!876975))))

(assert (=> b!1572806 (= res!1073868 (and (or (not ((_ is Cons!36783) lt!674265)) (bvsle (_1!12727 (h!38248 lt!674265)) key2!21)) ((_ is Cons!36783) lt!674265) (bvslt (_1!12727 (h!38248 lt!674265)) key2!21)))))

(declare-fun b!1572807 () Bool)

(assert (=> b!1572807 (= e!876975 (containsKey!869 (t!51687 lt!674265) key2!21))))

(assert (= (and d!164811 (not res!1073867)) b!1572806))

(assert (= (and b!1572806 res!1073868) b!1572807))

(declare-fun m!1446639 () Bool)

(assert (=> b!1572807 m!1446639))

(assert (=> b!1572475 d!164811))

(declare-fun d!164813 () Bool)

(declare-fun res!1073869 () Bool)

(declare-fun e!876976 () Bool)

(assert (=> d!164813 (=> res!1073869 e!876976)))

(assert (=> d!164813 (= res!1073869 (and ((_ is Cons!36783) lt!674266) (= (_1!12727 (h!38248 lt!674266)) key2!21)))))

(assert (=> d!164813 (= (containsKey!869 lt!674266 key2!21) e!876976)))

(declare-fun b!1572808 () Bool)

(declare-fun e!876977 () Bool)

(assert (=> b!1572808 (= e!876976 e!876977)))

(declare-fun res!1073870 () Bool)

(assert (=> b!1572808 (=> (not res!1073870) (not e!876977))))

(assert (=> b!1572808 (= res!1073870 (and (or (not ((_ is Cons!36783) lt!674266)) (bvsle (_1!12727 (h!38248 lt!674266)) key2!21)) ((_ is Cons!36783) lt!674266) (bvslt (_1!12727 (h!38248 lt!674266)) key2!21)))))

(declare-fun b!1572809 () Bool)

(assert (=> b!1572809 (= e!876977 (containsKey!869 (t!51687 lt!674266) key2!21))))

(assert (= (and d!164813 (not res!1073869)) b!1572808))

(assert (= (and b!1572808 res!1073870) b!1572809))

(declare-fun m!1446641 () Bool)

(assert (=> b!1572809 m!1446641))

(assert (=> b!1572485 d!164813))

(declare-fun b!1572810 () Bool)

(declare-fun e!876981 () List!36787)

(declare-fun e!876980 () List!36787)

(assert (=> b!1572810 (= e!876981 e!876980)))

(declare-fun c!145735 () Bool)

(assert (=> b!1572810 (= c!145735 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) (= (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)))) key1!37)))))

(declare-fun b!1572811 () Bool)

(declare-fun call!72372 () List!36787)

(assert (=> b!1572811 (= e!876981 call!72372)))

(declare-fun bm!72369 () Bool)

(declare-fun call!72374 () List!36787)

(assert (=> bm!72369 (= call!72374 call!72372)))

(declare-fun lt!674306 () List!36787)

(declare-fun e!876979 () Bool)

(declare-fun b!1572812 () Bool)

(assert (=> b!1572812 (= e!876979 (contains!10472 lt!674306 (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572813 () Bool)

(declare-fun e!876982 () List!36787)

(declare-fun call!72373 () List!36787)

(assert (=> b!1572813 (= e!876982 call!72373)))

(declare-fun d!164815 () Bool)

(assert (=> d!164815 e!876979))

(declare-fun res!1073871 () Bool)

(assert (=> d!164815 (=> (not res!1073871) (not e!876979))))

(assert (=> d!164815 (= res!1073871 (isStrictlySorted!1007 lt!674306))))

(assert (=> d!164815 (= lt!674306 e!876981)))

(declare-fun c!145732 () Bool)

(assert (=> d!164815 (= c!145732 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) (bvslt (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)))) key1!37)))))

(assert (=> d!164815 (isStrictlySorted!1007 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)))))

(assert (=> d!164815 (= (insertStrictlySorted!597 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)) key1!37 v1!32) lt!674306)))

(declare-fun b!1572814 () Bool)

(declare-fun c!145734 () Bool)

(assert (=> b!1572814 (= c!145734 (and ((_ is Cons!36783) (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) (bvsgt (_1!12727 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)))) key1!37)))))

(assert (=> b!1572814 (= e!876980 e!876982)))

(declare-fun bm!72370 () Bool)

(declare-fun e!876978 () List!36787)

(assert (=> bm!72370 (= call!72372 ($colon$colon!997 e!876978 (ite c!145732 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) (tuple2!25433 key1!37 v1!32))))))

(declare-fun c!145733 () Bool)

(assert (=> bm!72370 (= c!145733 c!145732)))

(declare-fun b!1572815 () Bool)

(assert (=> b!1572815 (= e!876978 (insertStrictlySorted!597 (t!51687 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) key1!37 v1!32))))

(declare-fun b!1572816 () Bool)

(assert (=> b!1572816 (= e!876980 call!72374)))

(declare-fun b!1572817 () Bool)

(assert (=> b!1572817 (= e!876982 call!72373)))

(declare-fun b!1572818 () Bool)

(declare-fun res!1073872 () Bool)

(assert (=> b!1572818 (=> (not res!1073872) (not e!876979))))

(assert (=> b!1572818 (= res!1073872 (containsKey!869 lt!674306 key1!37))))

(declare-fun b!1572819 () Bool)

(assert (=> b!1572819 (= e!876978 (ite c!145735 (t!51687 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) (ite c!145734 (Cons!36783 (h!38248 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10))) (t!51687 (t!51687 (insertStrictlySorted!597 (t!51687 l!750) key2!21 v2!10)))) Nil!36784)))))

(declare-fun bm!72371 () Bool)

(assert (=> bm!72371 (= call!72373 call!72374)))

(assert (= (and d!164815 c!145732) b!1572811))

(assert (= (and d!164815 (not c!145732)) b!1572810))

(assert (= (and b!1572810 c!145735) b!1572816))

(assert (= (and b!1572810 (not c!145735)) b!1572814))

(assert (= (and b!1572814 c!145734) b!1572813))

(assert (= (and b!1572814 (not c!145734)) b!1572817))

(assert (= (or b!1572813 b!1572817) bm!72371))

(assert (= (or b!1572816 bm!72371) bm!72369))

(assert (= (or b!1572811 bm!72369) bm!72370))

(assert (= (and bm!72370 c!145733) b!1572815))

(assert (= (and bm!72370 (not c!145733)) b!1572819))

(assert (= (and d!164815 res!1073871) b!1572818))

(assert (= (and b!1572818 res!1073872) b!1572812))

(declare-fun m!1446643 () Bool)

(assert (=> d!164815 m!1446643))

(assert (=> d!164815 m!1446545))

(declare-fun m!1446645 () Bool)

(assert (=> b!1572818 m!1446645))

(declare-fun m!1446647 () Bool)

(assert (=> b!1572812 m!1446647))

(declare-fun m!1446649 () Bool)

(assert (=> bm!72370 m!1446649))

(declare-fun m!1446651 () Bool)

(assert (=> b!1572815 m!1446651))

(assert (=> b!1572562 d!164815))

(declare-fun d!164817 () Bool)

(declare-fun res!1073873 () Bool)

(declare-fun e!876983 () Bool)

(assert (=> d!164817 (=> res!1073873 e!876983)))

(assert (=> d!164817 (= res!1073873 (or ((_ is Nil!36784) lt!674281) ((_ is Nil!36784) (t!51687 lt!674281))))))

(assert (=> d!164817 (= (isStrictlySorted!1007 lt!674281) e!876983)))

(declare-fun b!1572820 () Bool)

(declare-fun e!876984 () Bool)

(assert (=> b!1572820 (= e!876983 e!876984)))

(declare-fun res!1073874 () Bool)

(assert (=> b!1572820 (=> (not res!1073874) (not e!876984))))

(assert (=> b!1572820 (= res!1073874 (bvslt (_1!12727 (h!38248 lt!674281)) (_1!12727 (h!38248 (t!51687 lt!674281)))))))

(declare-fun b!1572821 () Bool)

(assert (=> b!1572821 (= e!876984 (isStrictlySorted!1007 (t!51687 lt!674281)))))

(assert (= (and d!164817 (not res!1073873)) b!1572820))

(assert (= (and b!1572820 res!1073874) b!1572821))

(declare-fun m!1446653 () Bool)

(assert (=> b!1572821 m!1446653))

(assert (=> d!164713 d!164817))

(assert (=> d!164713 d!164677))

(declare-fun lt!674307 () Bool)

(declare-fun d!164819 () Bool)

(assert (=> d!164819 (= lt!674307 (select (content!807 lt!674275) (tuple2!25433 key2!21 v2!10)))))

(declare-fun e!876985 () Bool)

(assert (=> d!164819 (= lt!674307 e!876985)))

(declare-fun res!1073875 () Bool)

(assert (=> d!164819 (=> (not res!1073875) (not e!876985))))

(assert (=> d!164819 (= res!1073875 ((_ is Cons!36783) lt!674275))))

(assert (=> d!164819 (= (contains!10472 lt!674275 (tuple2!25433 key2!21 v2!10)) lt!674307)))

(declare-fun b!1572822 () Bool)

(declare-fun e!876986 () Bool)

(assert (=> b!1572822 (= e!876985 e!876986)))

(declare-fun res!1073876 () Bool)

(assert (=> b!1572822 (=> res!1073876 e!876986)))

(assert (=> b!1572822 (= res!1073876 (= (h!38248 lt!674275) (tuple2!25433 key2!21 v2!10)))))

(declare-fun b!1572823 () Bool)

(assert (=> b!1572823 (= e!876986 (contains!10472 (t!51687 lt!674275) (tuple2!25433 key2!21 v2!10)))))

(assert (= (and d!164819 res!1073875) b!1572822))

(assert (= (and b!1572822 (not res!1073876)) b!1572823))

(declare-fun m!1446655 () Bool)

(assert (=> d!164819 m!1446655))

(declare-fun m!1446657 () Bool)

(assert (=> d!164819 m!1446657))

(declare-fun m!1446659 () Bool)

(assert (=> b!1572823 m!1446659))

(assert (=> b!1572539 d!164819))

(declare-fun b!1572824 () Bool)

(declare-fun e!876990 () List!36787)

(declare-fun e!876989 () List!36787)

(assert (=> b!1572824 (= e!876990 e!876989)))

(declare-fun c!145739 () Bool)

(assert (=> b!1572824 (= c!145739 (and ((_ is Cons!36783) (t!51687 (t!51687 l!750))) (= (_1!12727 (h!38248 (t!51687 (t!51687 l!750)))) key1!37)))))

(declare-fun b!1572825 () Bool)

(declare-fun call!72375 () List!36787)

(assert (=> b!1572825 (= e!876990 call!72375)))

(declare-fun bm!72372 () Bool)

(declare-fun call!72377 () List!36787)

(assert (=> bm!72372 (= call!72377 call!72375)))

(declare-fun e!876988 () Bool)

(declare-fun b!1572826 () Bool)

(declare-fun lt!674308 () List!36787)

(assert (=> b!1572826 (= e!876988 (contains!10472 lt!674308 (tuple2!25433 key1!37 v1!32)))))

(declare-fun b!1572827 () Bool)

(declare-fun e!876991 () List!36787)

(declare-fun call!72376 () List!36787)

(assert (=> b!1572827 (= e!876991 call!72376)))

(declare-fun d!164821 () Bool)

(assert (=> d!164821 e!876988))

(declare-fun res!1073877 () Bool)

(assert (=> d!164821 (=> (not res!1073877) (not e!876988))))

(assert (=> d!164821 (= res!1073877 (isStrictlySorted!1007 lt!674308))))

(assert (=> d!164821 (= lt!674308 e!876990)))

(declare-fun c!145736 () Bool)

(assert (=> d!164821 (= c!145736 (and ((_ is Cons!36783) (t!51687 (t!51687 l!750))) (bvslt (_1!12727 (h!38248 (t!51687 (t!51687 l!750)))) key1!37)))))

(assert (=> d!164821 (isStrictlySorted!1007 (t!51687 (t!51687 l!750)))))

(assert (=> d!164821 (= (insertStrictlySorted!597 (t!51687 (t!51687 l!750)) key1!37 v1!32) lt!674308)))

(declare-fun b!1572828 () Bool)

(declare-fun c!145738 () Bool)

(assert (=> b!1572828 (= c!145738 (and ((_ is Cons!36783) (t!51687 (t!51687 l!750))) (bvsgt (_1!12727 (h!38248 (t!51687 (t!51687 l!750)))) key1!37)))))

(assert (=> b!1572828 (= e!876989 e!876991)))

(declare-fun bm!72373 () Bool)

(declare-fun e!876987 () List!36787)

(assert (=> bm!72373 (= call!72375 ($colon$colon!997 e!876987 (ite c!145736 (h!38248 (t!51687 (t!51687 l!750))) (tuple2!25433 key1!37 v1!32))))))

(declare-fun c!145737 () Bool)

(assert (=> bm!72373 (= c!145737 c!145736)))

(declare-fun b!1572829 () Bool)

(assert (=> b!1572829 (= e!876987 (insertStrictlySorted!597 (t!51687 (t!51687 (t!51687 l!750))) key1!37 v1!32))))

(declare-fun b!1572830 () Bool)

(assert (=> b!1572830 (= e!876989 call!72377)))

(declare-fun b!1572831 () Bool)

(assert (=> b!1572831 (= e!876991 call!72376)))

(declare-fun b!1572832 () Bool)

(declare-fun res!1073878 () Bool)

(assert (=> b!1572832 (=> (not res!1073878) (not e!876988))))

(assert (=> b!1572832 (= res!1073878 (containsKey!869 lt!674308 key1!37))))

(declare-fun b!1572833 () Bool)

(assert (=> b!1572833 (= e!876987 (ite c!145739 (t!51687 (t!51687 (t!51687 l!750))) (ite c!145738 (Cons!36783 (h!38248 (t!51687 (t!51687 l!750))) (t!51687 (t!51687 (t!51687 l!750)))) Nil!36784)))))

(declare-fun bm!72374 () Bool)

(assert (=> bm!72374 (= call!72376 call!72377)))

(assert (= (and d!164821 c!145736) b!1572825))

(assert (= (and d!164821 (not c!145736)) b!1572824))

(assert (= (and b!1572824 c!145739) b!1572830))

(assert (= (and b!1572824 (not c!145739)) b!1572828))

(assert (= (and b!1572828 c!145738) b!1572827))

(assert (= (and b!1572828 (not c!145738)) b!1572831))

(assert (= (or b!1572827 b!1572831) bm!72374))

(assert (= (or b!1572830 bm!72374) bm!72372))

(assert (= (or b!1572825 bm!72372) bm!72373))

(assert (= (and bm!72373 c!145737) b!1572829))

(assert (= (and bm!72373 (not c!145737)) b!1572833))

(assert (= (and d!164821 res!1073877) b!1572832))

(assert (= (and b!1572832 res!1073878) b!1572826))

(declare-fun m!1446661 () Bool)

(assert (=> d!164821 m!1446661))

(assert (=> d!164821 m!1446261))

(declare-fun m!1446663 () Bool)

(assert (=> b!1572832 m!1446663))

(declare-fun m!1446665 () Bool)

(assert (=> b!1572826 m!1446665))

(declare-fun m!1446667 () Bool)

(assert (=> bm!72373 m!1446667))

(declare-fun m!1446669 () Bool)

(assert (=> b!1572829 m!1446669))

(assert (=> b!1572582 d!164821))

(declare-fun d!164823 () Bool)

(assert (=> d!164823 (= ($colon$colon!997 e!876826 (ite c!145672 (h!38248 (t!51687 l!750)) (tuple2!25433 key1!37 v1!32))) (Cons!36783 (ite c!145672 (h!38248 (t!51687 l!750)) (tuple2!25433 key1!37 v1!32)) e!876826))))

(assert (=> bm!72325 d!164823))

(declare-fun d!164825 () Bool)

(declare-fun res!1073879 () Bool)

(declare-fun e!876992 () Bool)

(assert (=> d!164825 (=> res!1073879 e!876992)))

(assert (=> d!164825 (= res!1073879 (or ((_ is Nil!36784) (t!51687 (t!51687 l!750))) ((_ is Nil!36784) (t!51687 (t!51687 (t!51687 l!750))))))))

(assert (=> d!164825 (= (isStrictlySorted!1007 (t!51687 (t!51687 l!750))) e!876992)))

(declare-fun b!1572834 () Bool)

(declare-fun e!876993 () Bool)

(assert (=> b!1572834 (= e!876992 e!876993)))

(declare-fun res!1073880 () Bool)

(assert (=> b!1572834 (=> (not res!1073880) (not e!876993))))

(assert (=> b!1572834 (= res!1073880 (bvslt (_1!12727 (h!38248 (t!51687 (t!51687 l!750)))) (_1!12727 (h!38248 (t!51687 (t!51687 (t!51687 l!750)))))))))

(declare-fun b!1572835 () Bool)

(assert (=> b!1572835 (= e!876993 (isStrictlySorted!1007 (t!51687 (t!51687 (t!51687 l!750)))))))

(assert (= (and d!164825 (not res!1073879)) b!1572834))

(assert (= (and b!1572834 res!1073880) b!1572835))

(declare-fun m!1446671 () Bool)

(assert (=> b!1572835 m!1446671))

(assert (=> b!1572380 d!164825))

(declare-fun d!164827 () Bool)

(declare-fun res!1073881 () Bool)

(declare-fun e!876994 () Bool)

(assert (=> d!164827 (=> res!1073881 e!876994)))

(assert (=> d!164827 (= res!1073881 (and ((_ is Cons!36783) lt!674277) (= (_1!12727 (h!38248 lt!674277)) key1!37)))))

(assert (=> d!164827 (= (containsKey!869 lt!674277 key1!37) e!876994)))

(declare-fun b!1572836 () Bool)

(declare-fun e!876995 () Bool)

(assert (=> b!1572836 (= e!876994 e!876995)))

(declare-fun res!1073882 () Bool)

(assert (=> b!1572836 (=> (not res!1073882) (not e!876995))))

(assert (=> b!1572836 (= res!1073882 (and (or (not ((_ is Cons!36783) lt!674277)) (bvsle (_1!12727 (h!38248 lt!674277)) key1!37)) ((_ is Cons!36783) lt!674277) (bvslt (_1!12727 (h!38248 lt!674277)) key1!37)))))

(declare-fun b!1572837 () Bool)

(assert (=> b!1572837 (= e!876995 (containsKey!869 (t!51687 lt!674277) key1!37))))

(assert (= (and d!164827 (not res!1073881)) b!1572836))

(assert (= (and b!1572836 res!1073882) b!1572837))

(declare-fun m!1446673 () Bool)

(assert (=> b!1572837 m!1446673))

(assert (=> b!1572565 d!164827))

(declare-fun b!1572838 () Bool)

(declare-fun e!876996 () Bool)

(declare-fun tp!114226 () Bool)

(assert (=> b!1572838 (= e!876996 (and tp_is_empty!39097 tp!114226))))

(assert (=> b!1572611 (= tp!114219 e!876996)))

(assert (= (and b!1572611 ((_ is Cons!36783) (t!51687 (t!51687 l!750)))) b!1572838))

(check-sat (not b!1572802) (not d!164741) (not b!1572757) (not d!164819) (not b!1572735) (not bm!72370) (not b!1572823) (not b!1572792) (not b!1572766) (not bm!72373) tp_is_empty!39097 (not d!164805) (not b!1572727) (not b!1572738) (not b!1572747) (not d!164753) (not b!1572818) (not b!1572807) (not b!1572835) (not d!164771) (not b!1572799) (not b!1572781) (not b!1572838) (not b!1572775) (not d!164777) (not b!1572783) (not bm!72358) (not b!1572745) (not b!1572759) (not b!1572837) (not b!1572761) (not b!1572821) (not b!1572829) (not b!1572721) (not bm!72367) (not d!164775) (not d!164787) (not b!1572772) (not b!1572763) (not d!164769) (not b!1572796) (not b!1572779) (not d!164815) (not d!164773) (not b!1572723) (not b!1572717) (not b!1572805) (not b!1572732) (not d!164759) (not b!1572751) (not b!1572769) (not d!164803) (not b!1572749) (not b!1572753) (not b!1572755) (not b!1572815) (not b!1572725) (not b!1572826) (not b!1572729) (not b!1572832) (not b!1572789) (not bm!72364) (not b!1572812) (not b!1572777) (not b!1572786) (not d!164821) (not bm!72361) (not d!164807) (not b!1572719) (not b!1572809))
(check-sat)
