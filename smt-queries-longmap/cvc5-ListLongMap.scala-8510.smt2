; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!103986 () Bool)

(assert start!103986)

(declare-fun b!1243400 () Bool)

(declare-fun res!828973 () Bool)

(declare-fun e!704921 () Bool)

(assert (=> b!1243400 (=> (not res!828973) (not e!704921))))

(declare-datatypes ((B!1890 0))(
  ( (B!1891 (val!15707 Int)) )
))
(declare-datatypes ((tuple2!20302 0))(
  ( (tuple2!20303 (_1!10162 (_ BitVec 64)) (_2!10162 B!1890)) )
))
(declare-datatypes ((List!27397 0))(
  ( (Nil!27394) (Cons!27393 (h!28611 tuple2!20302) (t!40852 List!27397)) )
))
(declare-fun l!644 () List!27397)

(declare-fun isStrictlySorted!753 (List!27397) Bool)

(assert (=> b!1243400 (= res!828973 (isStrictlySorted!753 l!644))))

(declare-fun b!1243401 () Bool)

(declare-fun res!828972 () Bool)

(assert (=> b!1243401 (=> (not res!828972) (not e!704921))))

(assert (=> b!1243401 (= res!828972 (isStrictlySorted!753 (t!40852 l!644)))))

(declare-fun res!828975 () Bool)

(assert (=> start!103986 (=> (not res!828975) (not e!704921))))

(declare-fun key1!25 () (_ BitVec 64))

(declare-fun key2!15 () (_ BitVec 64))

(assert (=> start!103986 (= res!828975 (not (= key1!25 key2!15)))))

(assert (=> start!103986 e!704921))

(assert (=> start!103986 true))

(declare-fun e!704920 () Bool)

(assert (=> start!103986 e!704920))

(declare-fun tp_is_empty!31289 () Bool)

(assert (=> start!103986 tp_is_empty!31289))

(declare-fun b!1243402 () Bool)

(declare-fun res!828974 () Bool)

(assert (=> b!1243402 (=> (not res!828974) (not e!704921))))

(assert (=> b!1243402 (= res!828974 (is-Cons!27393 l!644))))

(declare-fun b!1243403 () Bool)

(declare-fun tp!92750 () Bool)

(assert (=> b!1243403 (= e!704920 (and tp_is_empty!31289 tp!92750))))

(declare-fun b!1243404 () Bool)

(declare-fun v1!20 () B!1890)

(declare-fun insertStrictlySorted!440 (List!27397 (_ BitVec 64) B!1890) List!27397)

(declare-fun removeStrictlySorted!131 (List!27397 (_ BitVec 64)) List!27397)

(assert (=> b!1243404 (= e!704921 (not (= (insertStrictlySorted!440 (removeStrictlySorted!131 l!644 key2!15) key1!25 v1!20) (removeStrictlySorted!131 (insertStrictlySorted!440 l!644 key1!25 v1!20) key2!15))))))

(assert (=> b!1243404 (= (insertStrictlySorted!440 (removeStrictlySorted!131 (t!40852 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!131 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20) key2!15))))

(declare-datatypes ((Unit!41238 0))(
  ( (Unit!41239) )
))
(declare-fun lt!562676 () Unit!41238)

(declare-fun lemmaInsertAndRemoveStrictlySortedCommutative!18 (List!27397 (_ BitVec 64) B!1890 (_ BitVec 64)) Unit!41238)

(assert (=> b!1243404 (= lt!562676 (lemmaInsertAndRemoveStrictlySortedCommutative!18 (t!40852 l!644) key1!25 v1!20 key2!15))))

(assert (= (and start!103986 res!828975) b!1243400))

(assert (= (and b!1243400 res!828973) b!1243402))

(assert (= (and b!1243402 res!828974) b!1243401))

(assert (= (and b!1243401 res!828972) b!1243404))

(assert (= (and start!103986 (is-Cons!27393 l!644)) b!1243403))

(declare-fun m!1146437 () Bool)

(assert (=> b!1243400 m!1146437))

(declare-fun m!1146439 () Bool)

(assert (=> b!1243401 m!1146439))

(declare-fun m!1146441 () Bool)

(assert (=> b!1243404 m!1146441))

(declare-fun m!1146443 () Bool)

(assert (=> b!1243404 m!1146443))

(assert (=> b!1243404 m!1146441))

(declare-fun m!1146445 () Bool)

(assert (=> b!1243404 m!1146445))

(declare-fun m!1146447 () Bool)

(assert (=> b!1243404 m!1146447))

(declare-fun m!1146449 () Bool)

(assert (=> b!1243404 m!1146449))

(assert (=> b!1243404 m!1146447))

(declare-fun m!1146451 () Bool)

(assert (=> b!1243404 m!1146451))

(declare-fun m!1146453 () Bool)

(assert (=> b!1243404 m!1146453))

(assert (=> b!1243404 m!1146451))

(assert (=> b!1243404 m!1146445))

(declare-fun m!1146455 () Bool)

(assert (=> b!1243404 m!1146455))

(declare-fun m!1146457 () Bool)

(assert (=> b!1243404 m!1146457))

(push 1)

(assert (not b!1243400))

(assert (not b!1243403))

(assert tp_is_empty!31289)

(assert (not b!1243404))

(assert (not b!1243401))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137065 () Bool)

(declare-fun res!828996 () Bool)

(declare-fun e!704946 () Bool)

(assert (=> d!137065 (=> res!828996 e!704946)))

(assert (=> d!137065 (= res!828996 (or (is-Nil!27394 l!644) (is-Nil!27394 (t!40852 l!644))))))

(assert (=> d!137065 (= (isStrictlySorted!753 l!644) e!704946)))

(declare-fun b!1243433 () Bool)

(declare-fun e!704947 () Bool)

(assert (=> b!1243433 (= e!704946 e!704947)))

(declare-fun res!828997 () Bool)

(assert (=> b!1243433 (=> (not res!828997) (not e!704947))))

(assert (=> b!1243433 (= res!828997 (bvslt (_1!10162 (h!28611 l!644)) (_1!10162 (h!28611 (t!40852 l!644)))))))

(declare-fun b!1243434 () Bool)

(assert (=> b!1243434 (= e!704947 (isStrictlySorted!753 (t!40852 l!644)))))

(assert (= (and d!137065 (not res!828996)) b!1243433))

(assert (= (and b!1243433 res!828997) b!1243434))

(assert (=> b!1243434 m!1146439))

(assert (=> b!1243400 d!137065))

(declare-fun d!137067 () Bool)

(declare-fun res!829000 () Bool)

(declare-fun e!704950 () Bool)

(assert (=> d!137067 (=> res!829000 e!704950)))

(assert (=> d!137067 (= res!829000 (or (is-Nil!27394 (t!40852 l!644)) (is-Nil!27394 (t!40852 (t!40852 l!644)))))))

(assert (=> d!137067 (= (isStrictlySorted!753 (t!40852 l!644)) e!704950)))

(declare-fun b!1243439 () Bool)

(declare-fun e!704951 () Bool)

(assert (=> b!1243439 (= e!704950 e!704951)))

(declare-fun res!829001 () Bool)

(assert (=> b!1243439 (=> (not res!829001) (not e!704951))))

(assert (=> b!1243439 (= res!829001 (bvslt (_1!10162 (h!28611 (t!40852 l!644))) (_1!10162 (h!28611 (t!40852 (t!40852 l!644))))))))

(declare-fun b!1243440 () Bool)

(assert (=> b!1243440 (= e!704951 (isStrictlySorted!753 (t!40852 (t!40852 l!644))))))

(assert (= (and d!137067 (not res!829000)) b!1243439))

(assert (= (and b!1243439 res!829001) b!1243440))

(declare-fun m!1146463 () Bool)

(assert (=> b!1243440 m!1146463))

(assert (=> b!1243401 d!137067))

(declare-fun d!137069 () Bool)

(declare-fun e!704970 () Bool)

(assert (=> d!137069 e!704970))

(declare-fun res!829008 () Bool)

(assert (=> d!137069 (=> (not res!829008) (not e!704970))))

(declare-fun lt!562685 () List!27397)

(assert (=> d!137069 (= res!829008 (isStrictlySorted!753 lt!562685))))

(declare-fun e!704972 () List!27397)

(assert (=> d!137069 (= lt!562685 e!704972)))

(declare-fun c!121945 () Bool)

(assert (=> d!137069 (= c!121945 (and (is-Cons!27393 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)) (= (_1!10162 (h!28611 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))) key2!15)))))

(assert (=> d!137069 (isStrictlySorted!753 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))))

(assert (=> d!137069 (= (removeStrictlySorted!131 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20) key2!15) lt!562685)))

(declare-fun b!1243469 () Bool)

(declare-fun containsKey!613 (List!27397 (_ BitVec 64)) Bool)

(assert (=> b!1243469 (= e!704970 (not (containsKey!613 lt!562685 key2!15)))))

(declare-fun b!1243470 () Bool)

(assert (=> b!1243470 (= e!704972 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)))))

(declare-fun b!1243471 () Bool)

(declare-fun e!704971 () List!27397)

(assert (=> b!1243471 (= e!704971 Nil!27394)))

(declare-fun b!1243472 () Bool)

(declare-fun $colon$colon!626 (List!27397 tuple2!20302) List!27397)

(assert (=> b!1243472 (= e!704971 ($colon$colon!626 (removeStrictlySorted!131 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)) key2!15) (h!28611 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))))))

(declare-fun b!1243473 () Bool)

(assert (=> b!1243473 (= e!704972 e!704971)))

(declare-fun c!121946 () Bool)

(assert (=> b!1243473 (= c!121946 (and (is-Cons!27393 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)) (not (= (_1!10162 (h!28611 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))) key2!15))))))

(assert (= (and d!137069 c!121945) b!1243470))

(assert (= (and d!137069 (not c!121945)) b!1243473))

(assert (= (and b!1243473 c!121946) b!1243472))

(assert (= (and b!1243473 (not c!121946)) b!1243471))

(assert (= (and d!137069 res!829008) b!1243469))

(declare-fun m!1146485 () Bool)

(assert (=> d!137069 m!1146485))

(assert (=> d!137069 m!1146447))

(declare-fun m!1146487 () Bool)

(assert (=> d!137069 m!1146487))

(declare-fun m!1146489 () Bool)

(assert (=> b!1243469 m!1146489))

(declare-fun m!1146491 () Bool)

(assert (=> b!1243472 m!1146491))

(assert (=> b!1243472 m!1146491))

(declare-fun m!1146493 () Bool)

(assert (=> b!1243472 m!1146493))

(assert (=> b!1243404 d!137069))

(declare-fun bm!61375 () Bool)

(declare-fun call!61378 () List!27397)

(declare-fun call!61379 () List!27397)

(assert (=> bm!61375 (= call!61378 call!61379)))

(declare-fun e!705039 () List!27397)

(declare-fun b!1243599 () Bool)

(assert (=> b!1243599 (= e!705039 (insertStrictlySorted!440 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) key1!25 v1!20))))

(declare-fun b!1243600 () Bool)

(declare-fun c!122000 () Bool)

(assert (=> b!1243600 (= c!122000 (and (is-Cons!27393 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) (bvsgt (_1!10162 (h!28611 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) key1!25)))))

(declare-fun e!705038 () List!27397)

(declare-fun e!705036 () List!27397)

(assert (=> b!1243600 (= e!705038 e!705036)))

(declare-fun b!1243601 () Bool)

(declare-fun res!829035 () Bool)

(declare-fun e!705040 () Bool)

(assert (=> b!1243601 (=> (not res!829035) (not e!705040))))

(declare-fun lt!562699 () List!27397)

(assert (=> b!1243601 (= res!829035 (containsKey!613 lt!562699 key1!25))))

(declare-fun b!1243602 () Bool)

(declare-fun e!705037 () List!27397)

(declare-fun call!61380 () List!27397)

(assert (=> b!1243602 (= e!705037 call!61380)))

(declare-fun d!137075 () Bool)

(assert (=> d!137075 e!705040))

(declare-fun res!829034 () Bool)

(assert (=> d!137075 (=> (not res!829034) (not e!705040))))

(assert (=> d!137075 (= res!829034 (isStrictlySorted!753 lt!562699))))

(assert (=> d!137075 (= lt!562699 e!705037)))

(declare-fun c!121999 () Bool)

(assert (=> d!137075 (= c!121999 (and (is-Cons!27393 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) (bvslt (_1!10162 (h!28611 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) key1!25)))))

(assert (=> d!137075 (isStrictlySorted!753 (removeStrictlySorted!131 (t!40852 l!644) key2!15))))

(assert (=> d!137075 (= (insertStrictlySorted!440 (removeStrictlySorted!131 (t!40852 l!644) key2!15) key1!25 v1!20) lt!562699)))

(declare-fun b!1243603 () Bool)

(declare-fun contains!7428 (List!27397 tuple2!20302) Bool)

(assert (=> b!1243603 (= e!705040 (contains!7428 lt!562699 (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243604 () Bool)

(assert (=> b!1243604 (= e!705037 e!705038)))

(declare-fun c!121998 () Bool)

(assert (=> b!1243604 (= c!121998 (and (is-Cons!27393 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) (= (_1!10162 (h!28611 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) key1!25)))))

(declare-fun b!1243605 () Bool)

(assert (=> b!1243605 (= e!705038 call!61379)))

(declare-fun bm!61376 () Bool)

(assert (=> bm!61376 (= call!61380 ($colon$colon!626 e!705039 (ite c!121999 (h!28611 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) (tuple2!20303 key1!25 v1!20))))))

(declare-fun c!121997 () Bool)

(assert (=> bm!61376 (= c!121997 c!121999)))

(declare-fun b!1243607 () Bool)

(assert (=> b!1243607 (= e!705036 call!61378)))

(declare-fun b!1243609 () Bool)

(assert (=> b!1243609 (= e!705039 (ite c!121998 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) (ite c!122000 (Cons!27393 (h!28611 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) Nil!27394)))))

(declare-fun bm!61377 () Bool)

(assert (=> bm!61377 (= call!61379 call!61380)))

(declare-fun b!1243612 () Bool)

(assert (=> b!1243612 (= e!705036 call!61378)))

(assert (= (and d!137075 c!121999) b!1243602))

(assert (= (and d!137075 (not c!121999)) b!1243604))

(assert (= (and b!1243604 c!121998) b!1243605))

(assert (= (and b!1243604 (not c!121998)) b!1243600))

(assert (= (and b!1243600 c!122000) b!1243612))

(assert (= (and b!1243600 (not c!122000)) b!1243607))

(assert (= (or b!1243612 b!1243607) bm!61375))

(assert (= (or b!1243605 bm!61375) bm!61377))

(assert (= (or b!1243602 bm!61377) bm!61376))

(assert (= (and bm!61376 c!121997) b!1243599))

(assert (= (and bm!61376 (not c!121997)) b!1243609))

(assert (= (and d!137075 res!829034) b!1243601))

(assert (= (and b!1243601 res!829035) b!1243603))

(declare-fun m!1146571 () Bool)

(assert (=> d!137075 m!1146571))

(assert (=> d!137075 m!1146451))

(declare-fun m!1146573 () Bool)

(assert (=> d!137075 m!1146573))

(declare-fun m!1146575 () Bool)

(assert (=> b!1243603 m!1146575))

(declare-fun m!1146577 () Bool)

(assert (=> b!1243601 m!1146577))

(declare-fun m!1146579 () Bool)

(assert (=> bm!61376 m!1146579))

(declare-fun m!1146581 () Bool)

(assert (=> b!1243599 m!1146581))

(assert (=> b!1243404 d!137075))

(declare-fun bm!61378 () Bool)

(declare-fun call!61381 () List!27397)

(declare-fun call!61382 () List!27397)

(assert (=> bm!61378 (= call!61381 call!61382)))

(declare-fun b!1243614 () Bool)

(declare-fun e!705047 () List!27397)

(assert (=> b!1243614 (= e!705047 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))))

(declare-fun b!1243615 () Bool)

(declare-fun c!122006 () Bool)

(assert (=> b!1243615 (= c!122006 (and (is-Cons!27393 l!644) (bvsgt (_1!10162 (h!28611 l!644)) key1!25)))))

(declare-fun e!705046 () List!27397)

(declare-fun e!705044 () List!27397)

(assert (=> b!1243615 (= e!705046 e!705044)))

(declare-fun b!1243616 () Bool)

(declare-fun res!829038 () Bool)

(declare-fun e!705048 () Bool)

(assert (=> b!1243616 (=> (not res!829038) (not e!705048))))

(declare-fun lt!562701 () List!27397)

(assert (=> b!1243616 (= res!829038 (containsKey!613 lt!562701 key1!25))))

(declare-fun b!1243617 () Bool)

(declare-fun e!705045 () List!27397)

(declare-fun call!61383 () List!27397)

(assert (=> b!1243617 (= e!705045 call!61383)))

(declare-fun d!137093 () Bool)

(assert (=> d!137093 e!705048))

(declare-fun res!829037 () Bool)

(assert (=> d!137093 (=> (not res!829037) (not e!705048))))

(assert (=> d!137093 (= res!829037 (isStrictlySorted!753 lt!562701))))

(assert (=> d!137093 (= lt!562701 e!705045)))

(declare-fun c!122005 () Bool)

(assert (=> d!137093 (= c!122005 (and (is-Cons!27393 l!644) (bvslt (_1!10162 (h!28611 l!644)) key1!25)))))

(assert (=> d!137093 (isStrictlySorted!753 l!644)))

(assert (=> d!137093 (= (insertStrictlySorted!440 l!644 key1!25 v1!20) lt!562701)))

(declare-fun b!1243618 () Bool)

(assert (=> b!1243618 (= e!705048 (contains!7428 lt!562701 (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243619 () Bool)

(assert (=> b!1243619 (= e!705045 e!705046)))

(declare-fun c!122004 () Bool)

(assert (=> b!1243619 (= c!122004 (and (is-Cons!27393 l!644) (= (_1!10162 (h!28611 l!644)) key1!25)))))

(declare-fun b!1243620 () Bool)

(assert (=> b!1243620 (= e!705046 call!61382)))

(declare-fun bm!61379 () Bool)

(assert (=> bm!61379 (= call!61383 ($colon$colon!626 e!705047 (ite c!122005 (h!28611 l!644) (tuple2!20303 key1!25 v1!20))))))

(declare-fun c!122003 () Bool)

(assert (=> bm!61379 (= c!122003 c!122005)))

(declare-fun b!1243621 () Bool)

(assert (=> b!1243621 (= e!705044 call!61381)))

(declare-fun b!1243622 () Bool)

(assert (=> b!1243622 (= e!705047 (ite c!122004 (t!40852 l!644) (ite c!122006 (Cons!27393 (h!28611 l!644) (t!40852 l!644)) Nil!27394)))))

(declare-fun bm!61380 () Bool)

(assert (=> bm!61380 (= call!61382 call!61383)))

(declare-fun b!1243623 () Bool)

(assert (=> b!1243623 (= e!705044 call!61381)))

(assert (= (and d!137093 c!122005) b!1243617))

(assert (= (and d!137093 (not c!122005)) b!1243619))

(assert (= (and b!1243619 c!122004) b!1243620))

(assert (= (and b!1243619 (not c!122004)) b!1243615))

(assert (= (and b!1243615 c!122006) b!1243623))

(assert (= (and b!1243615 (not c!122006)) b!1243621))

(assert (= (or b!1243623 b!1243621) bm!61378))

(assert (= (or b!1243620 bm!61378) bm!61380))

(assert (= (or b!1243617 bm!61380) bm!61379))

(assert (= (and bm!61379 c!122003) b!1243614))

(assert (= (and bm!61379 (not c!122003)) b!1243622))

(assert (= (and d!137093 res!829037) b!1243616))

(assert (= (and b!1243616 res!829038) b!1243618))

(declare-fun m!1146583 () Bool)

(assert (=> d!137093 m!1146583))

(assert (=> d!137093 m!1146437))

(declare-fun m!1146585 () Bool)

(assert (=> b!1243618 m!1146585))

(declare-fun m!1146587 () Bool)

(assert (=> b!1243616 m!1146587))

(declare-fun m!1146589 () Bool)

(assert (=> bm!61379 m!1146589))

(assert (=> b!1243614 m!1146447))

(assert (=> b!1243404 d!137093))

(declare-fun bm!61381 () Bool)

(declare-fun call!61384 () List!27397)

(declare-fun call!61385 () List!27397)

(assert (=> bm!61381 (= call!61384 call!61385)))

(declare-fun b!1243624 () Bool)

(declare-fun e!705052 () List!27397)

(assert (=> b!1243624 (= e!705052 (insertStrictlySorted!440 (t!40852 (removeStrictlySorted!131 l!644 key2!15)) key1!25 v1!20))))

(declare-fun c!122010 () Bool)

(declare-fun b!1243625 () Bool)

(assert (=> b!1243625 (= c!122010 (and (is-Cons!27393 (removeStrictlySorted!131 l!644 key2!15)) (bvsgt (_1!10162 (h!28611 (removeStrictlySorted!131 l!644 key2!15))) key1!25)))))

(declare-fun e!705051 () List!27397)

(declare-fun e!705049 () List!27397)

(assert (=> b!1243625 (= e!705051 e!705049)))

(declare-fun b!1243626 () Bool)

(declare-fun res!829040 () Bool)

(declare-fun e!705053 () Bool)

(assert (=> b!1243626 (=> (not res!829040) (not e!705053))))

(declare-fun lt!562702 () List!27397)

(assert (=> b!1243626 (= res!829040 (containsKey!613 lt!562702 key1!25))))

(declare-fun b!1243627 () Bool)

(declare-fun e!705050 () List!27397)

(declare-fun call!61386 () List!27397)

(assert (=> b!1243627 (= e!705050 call!61386)))

(declare-fun d!137095 () Bool)

(assert (=> d!137095 e!705053))

(declare-fun res!829039 () Bool)

(assert (=> d!137095 (=> (not res!829039) (not e!705053))))

(assert (=> d!137095 (= res!829039 (isStrictlySorted!753 lt!562702))))

(assert (=> d!137095 (= lt!562702 e!705050)))

(declare-fun c!122009 () Bool)

(assert (=> d!137095 (= c!122009 (and (is-Cons!27393 (removeStrictlySorted!131 l!644 key2!15)) (bvslt (_1!10162 (h!28611 (removeStrictlySorted!131 l!644 key2!15))) key1!25)))))

(assert (=> d!137095 (isStrictlySorted!753 (removeStrictlySorted!131 l!644 key2!15))))

(assert (=> d!137095 (= (insertStrictlySorted!440 (removeStrictlySorted!131 l!644 key2!15) key1!25 v1!20) lt!562702)))

(declare-fun b!1243628 () Bool)

(assert (=> b!1243628 (= e!705053 (contains!7428 lt!562702 (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243629 () Bool)

(assert (=> b!1243629 (= e!705050 e!705051)))

(declare-fun c!122008 () Bool)

(assert (=> b!1243629 (= c!122008 (and (is-Cons!27393 (removeStrictlySorted!131 l!644 key2!15)) (= (_1!10162 (h!28611 (removeStrictlySorted!131 l!644 key2!15))) key1!25)))))

(declare-fun b!1243630 () Bool)

(assert (=> b!1243630 (= e!705051 call!61385)))

(declare-fun bm!61382 () Bool)

(assert (=> bm!61382 (= call!61386 ($colon$colon!626 e!705052 (ite c!122009 (h!28611 (removeStrictlySorted!131 l!644 key2!15)) (tuple2!20303 key1!25 v1!20))))))

(declare-fun c!122007 () Bool)

(assert (=> bm!61382 (= c!122007 c!122009)))

(declare-fun b!1243631 () Bool)

(assert (=> b!1243631 (= e!705049 call!61384)))

(declare-fun b!1243632 () Bool)

(assert (=> b!1243632 (= e!705052 (ite c!122008 (t!40852 (removeStrictlySorted!131 l!644 key2!15)) (ite c!122010 (Cons!27393 (h!28611 (removeStrictlySorted!131 l!644 key2!15)) (t!40852 (removeStrictlySorted!131 l!644 key2!15))) Nil!27394)))))

(declare-fun bm!61383 () Bool)

(assert (=> bm!61383 (= call!61385 call!61386)))

(declare-fun b!1243633 () Bool)

(assert (=> b!1243633 (= e!705049 call!61384)))

(assert (= (and d!137095 c!122009) b!1243627))

(assert (= (and d!137095 (not c!122009)) b!1243629))

(assert (= (and b!1243629 c!122008) b!1243630))

(assert (= (and b!1243629 (not c!122008)) b!1243625))

(assert (= (and b!1243625 c!122010) b!1243633))

(assert (= (and b!1243625 (not c!122010)) b!1243631))

(assert (= (or b!1243633 b!1243631) bm!61381))

(assert (= (or b!1243630 bm!61381) bm!61383))

(assert (= (or b!1243627 bm!61383) bm!61382))

(assert (= (and bm!61382 c!122007) b!1243624))

(assert (= (and bm!61382 (not c!122007)) b!1243632))

(assert (= (and d!137095 res!829039) b!1243626))

(assert (= (and b!1243626 res!829040) b!1243628))

(declare-fun m!1146591 () Bool)

(assert (=> d!137095 m!1146591))

(assert (=> d!137095 m!1146441))

(declare-fun m!1146593 () Bool)

(assert (=> d!137095 m!1146593))

(declare-fun m!1146595 () Bool)

(assert (=> b!1243628 m!1146595))

(declare-fun m!1146597 () Bool)

(assert (=> b!1243626 m!1146597))

(declare-fun m!1146599 () Bool)

(assert (=> bm!61382 m!1146599))

(declare-fun m!1146601 () Bool)

(assert (=> b!1243624 m!1146601))

(assert (=> b!1243404 d!137095))

(declare-fun d!137097 () Bool)

(declare-fun e!705054 () Bool)

(assert (=> d!137097 e!705054))

(declare-fun res!829041 () Bool)

(assert (=> d!137097 (=> (not res!829041) (not e!705054))))

(declare-fun lt!562703 () List!27397)

(assert (=> d!137097 (= res!829041 (isStrictlySorted!753 lt!562703))))

(declare-fun e!705056 () List!27397)

(assert (=> d!137097 (= lt!562703 e!705056)))

(declare-fun c!122011 () Bool)

(assert (=> d!137097 (= c!122011 (and (is-Cons!27393 l!644) (= (_1!10162 (h!28611 l!644)) key2!15)))))

(assert (=> d!137097 (isStrictlySorted!753 l!644)))

(assert (=> d!137097 (= (removeStrictlySorted!131 l!644 key2!15) lt!562703)))

(declare-fun b!1243634 () Bool)

(assert (=> b!1243634 (= e!705054 (not (containsKey!613 lt!562703 key2!15)))))

(declare-fun b!1243635 () Bool)

(assert (=> b!1243635 (= e!705056 (t!40852 l!644))))

(declare-fun b!1243636 () Bool)

(declare-fun e!705055 () List!27397)

(assert (=> b!1243636 (= e!705055 Nil!27394)))

(declare-fun b!1243637 () Bool)

(assert (=> b!1243637 (= e!705055 ($colon$colon!626 (removeStrictlySorted!131 (t!40852 l!644) key2!15) (h!28611 l!644)))))

(declare-fun b!1243638 () Bool)

(assert (=> b!1243638 (= e!705056 e!705055)))

(declare-fun c!122012 () Bool)

(assert (=> b!1243638 (= c!122012 (and (is-Cons!27393 l!644) (not (= (_1!10162 (h!28611 l!644)) key2!15))))))

(assert (= (and d!137097 c!122011) b!1243635))

(assert (= (and d!137097 (not c!122011)) b!1243638))

(assert (= (and b!1243638 c!122012) b!1243637))

(assert (= (and b!1243638 (not c!122012)) b!1243636))

(assert (= (and d!137097 res!829041) b!1243634))

(declare-fun m!1146603 () Bool)

(assert (=> d!137097 m!1146603))

(assert (=> d!137097 m!1146437))

(declare-fun m!1146605 () Bool)

(assert (=> b!1243634 m!1146605))

(assert (=> b!1243637 m!1146451))

(assert (=> b!1243637 m!1146451))

(declare-fun m!1146607 () Bool)

(assert (=> b!1243637 m!1146607))

(assert (=> b!1243404 d!137097))

(declare-fun d!137099 () Bool)

(assert (=> d!137099 (= (insertStrictlySorted!440 (removeStrictlySorted!131 (t!40852 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!131 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20) key2!15))))

(declare-fun lt!562716 () Unit!41238)

(declare-fun choose!1845 (List!27397 (_ BitVec 64) B!1890 (_ BitVec 64)) Unit!41238)

(assert (=> d!137099 (= lt!562716 (choose!1845 (t!40852 l!644) key1!25 v1!20 key2!15))))

(assert (=> d!137099 (not (= key1!25 key2!15))))

(assert (=> d!137099 (= (lemmaInsertAndRemoveStrictlySortedCommutative!18 (t!40852 l!644) key1!25 v1!20 key2!15) lt!562716)))

(declare-fun bs!34996 () Bool)

(assert (= bs!34996 d!137099))

(assert (=> bs!34996 m!1146451))

(assert (=> bs!34996 m!1146453))

(assert (=> bs!34996 m!1146447))

(assert (=> bs!34996 m!1146449))

(assert (=> bs!34996 m!1146451))

(declare-fun m!1146649 () Bool)

(assert (=> bs!34996 m!1146649))

(assert (=> bs!34996 m!1146447))

(assert (=> b!1243404 d!137099))

(declare-fun bm!61390 () Bool)

(declare-fun call!61393 () List!27397)

(declare-fun call!61394 () List!27397)

(assert (=> bm!61390 (= call!61393 call!61394)))

(declare-fun e!705079 () List!27397)

(declare-fun b!1243675 () Bool)

(assert (=> b!1243675 (= e!705079 (insertStrictlySorted!440 (t!40852 (t!40852 l!644)) key1!25 v1!20))))

(declare-fun b!1243677 () Bool)

(declare-fun c!122032 () Bool)

(assert (=> b!1243677 (= c!122032 (and (is-Cons!27393 (t!40852 l!644)) (bvsgt (_1!10162 (h!28611 (t!40852 l!644))) key1!25)))))

(declare-fun e!705078 () List!27397)

(declare-fun e!705076 () List!27397)

(assert (=> b!1243677 (= e!705078 e!705076)))

(declare-fun b!1243679 () Bool)

(declare-fun res!829051 () Bool)

(declare-fun e!705080 () Bool)

(assert (=> b!1243679 (=> (not res!829051) (not e!705080))))

(declare-fun lt!562718 () List!27397)

(assert (=> b!1243679 (= res!829051 (containsKey!613 lt!562718 key1!25))))

(declare-fun b!1243681 () Bool)

(declare-fun e!705077 () List!27397)

(declare-fun call!61395 () List!27397)

(assert (=> b!1243681 (= e!705077 call!61395)))

(declare-fun d!137111 () Bool)

(assert (=> d!137111 e!705080))

(declare-fun res!829050 () Bool)

(assert (=> d!137111 (=> (not res!829050) (not e!705080))))

(assert (=> d!137111 (= res!829050 (isStrictlySorted!753 lt!562718))))

(assert (=> d!137111 (= lt!562718 e!705077)))

(declare-fun c!122030 () Bool)

(assert (=> d!137111 (= c!122030 (and (is-Cons!27393 (t!40852 l!644)) (bvslt (_1!10162 (h!28611 (t!40852 l!644))) key1!25)))))

(assert (=> d!137111 (isStrictlySorted!753 (t!40852 l!644))))

(assert (=> d!137111 (= (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20) lt!562718)))

(declare-fun b!1243683 () Bool)

(assert (=> b!1243683 (= e!705080 (contains!7428 lt!562718 (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243684 () Bool)

(assert (=> b!1243684 (= e!705077 e!705078)))

(declare-fun c!122028 () Bool)

(assert (=> b!1243684 (= c!122028 (and (is-Cons!27393 (t!40852 l!644)) (= (_1!10162 (h!28611 (t!40852 l!644))) key1!25)))))

(declare-fun b!1243685 () Bool)

(assert (=> b!1243685 (= e!705078 call!61394)))

(declare-fun bm!61391 () Bool)

(assert (=> bm!61391 (= call!61395 ($colon$colon!626 e!705079 (ite c!122030 (h!28611 (t!40852 l!644)) (tuple2!20303 key1!25 v1!20))))))

(declare-fun c!122027 () Bool)

(assert (=> bm!61391 (= c!122027 c!122030)))

(declare-fun b!1243686 () Bool)

(assert (=> b!1243686 (= e!705076 call!61393)))

(declare-fun b!1243687 () Bool)

(assert (=> b!1243687 (= e!705079 (ite c!122028 (t!40852 (t!40852 l!644)) (ite c!122032 (Cons!27393 (h!28611 (t!40852 l!644)) (t!40852 (t!40852 l!644))) Nil!27394)))))

(declare-fun bm!61392 () Bool)

(assert (=> bm!61392 (= call!61394 call!61395)))

(declare-fun b!1243688 () Bool)

(assert (=> b!1243688 (= e!705076 call!61393)))

(assert (= (and d!137111 c!122030) b!1243681))

(assert (= (and d!137111 (not c!122030)) b!1243684))

(assert (= (and b!1243684 c!122028) b!1243685))

(assert (= (and b!1243684 (not c!122028)) b!1243677))

(assert (= (and b!1243677 c!122032) b!1243688))

(assert (= (and b!1243677 (not c!122032)) b!1243686))

(assert (= (or b!1243688 b!1243686) bm!61390))

(assert (= (or b!1243685 bm!61390) bm!61392))

(assert (= (or b!1243681 bm!61392) bm!61391))

(assert (= (and bm!61391 c!122027) b!1243675))

(assert (= (and bm!61391 (not c!122027)) b!1243687))

(assert (= (and d!137111 res!829050) b!1243679))

(assert (= (and b!1243679 res!829051) b!1243683))

(declare-fun m!1146671 () Bool)

(assert (=> d!137111 m!1146671))

(assert (=> d!137111 m!1146439))

(declare-fun m!1146673 () Bool)

(assert (=> b!1243683 m!1146673))

(declare-fun m!1146675 () Bool)

(assert (=> b!1243679 m!1146675))

(declare-fun m!1146677 () Bool)

(assert (=> bm!61391 m!1146677))

(declare-fun m!1146679 () Bool)

(assert (=> b!1243675 m!1146679))

(assert (=> b!1243404 d!137111))

(declare-fun d!137115 () Bool)

(declare-fun e!705089 () Bool)

(assert (=> d!137115 e!705089))

(declare-fun res!829052 () Bool)

(assert (=> d!137115 (=> (not res!829052) (not e!705089))))

(declare-fun lt!562720 () List!27397)

(assert (=> d!137115 (= res!829052 (isStrictlySorted!753 lt!562720))))

(declare-fun e!705091 () List!27397)

(assert (=> d!137115 (= lt!562720 e!705091)))

(declare-fun c!122033 () Bool)

(assert (=> d!137115 (= c!122033 (and (is-Cons!27393 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (= (_1!10162 (h!28611 (insertStrictlySorted!440 l!644 key1!25 v1!20))) key2!15)))))

(assert (=> d!137115 (isStrictlySorted!753 (insertStrictlySorted!440 l!644 key1!25 v1!20))))

(assert (=> d!137115 (= (removeStrictlySorted!131 (insertStrictlySorted!440 l!644 key1!25 v1!20) key2!15) lt!562720)))

(declare-fun b!1243698 () Bool)

(assert (=> b!1243698 (= e!705089 (not (containsKey!613 lt!562720 key2!15)))))

(declare-fun b!1243699 () Bool)

(assert (=> b!1243699 (= e!705091 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))

(declare-fun b!1243700 () Bool)

(declare-fun e!705090 () List!27397)

(assert (=> b!1243700 (= e!705090 Nil!27394)))

(declare-fun b!1243701 () Bool)

(assert (=> b!1243701 (= e!705090 ($colon$colon!626 (removeStrictlySorted!131 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15) (h!28611 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))

(declare-fun b!1243702 () Bool)

(assert (=> b!1243702 (= e!705091 e!705090)))

(declare-fun c!122034 () Bool)

(assert (=> b!1243702 (= c!122034 (and (is-Cons!27393 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (not (= (_1!10162 (h!28611 (insertStrictlySorted!440 l!644 key1!25 v1!20))) key2!15))))))

(assert (= (and d!137115 c!122033) b!1243699))

(assert (= (and d!137115 (not c!122033)) b!1243702))

(assert (= (and b!1243702 c!122034) b!1243701))

(assert (= (and b!1243702 (not c!122034)) b!1243700))

(assert (= (and d!137115 res!829052) b!1243698))

(declare-fun m!1146681 () Bool)

(assert (=> d!137115 m!1146681))

(assert (=> d!137115 m!1146445))

(declare-fun m!1146683 () Bool)

(assert (=> d!137115 m!1146683))

(declare-fun m!1146685 () Bool)

(assert (=> b!1243698 m!1146685))

(declare-fun m!1146687 () Bool)

(assert (=> b!1243701 m!1146687))

(assert (=> b!1243701 m!1146687))

(declare-fun m!1146689 () Bool)

(assert (=> b!1243701 m!1146689))

(assert (=> b!1243404 d!137115))

(declare-fun d!137117 () Bool)

(declare-fun e!705093 () Bool)

(assert (=> d!137117 e!705093))

(declare-fun res!829053 () Bool)

(assert (=> d!137117 (=> (not res!829053) (not e!705093))))

(declare-fun lt!562721 () List!27397)

(assert (=> d!137117 (= res!829053 (isStrictlySorted!753 lt!562721))))

(declare-fun e!705095 () List!27397)

(assert (=> d!137117 (= lt!562721 e!705095)))

(declare-fun c!122035 () Bool)

(assert (=> d!137117 (= c!122035 (and (is-Cons!27393 (t!40852 l!644)) (= (_1!10162 (h!28611 (t!40852 l!644))) key2!15)))))

(assert (=> d!137117 (isStrictlySorted!753 (t!40852 l!644))))

(assert (=> d!137117 (= (removeStrictlySorted!131 (t!40852 l!644) key2!15) lt!562721)))

(declare-fun b!1243704 () Bool)

(assert (=> b!1243704 (= e!705093 (not (containsKey!613 lt!562721 key2!15)))))

(declare-fun b!1243705 () Bool)

(assert (=> b!1243705 (= e!705095 (t!40852 (t!40852 l!644)))))

(declare-fun b!1243706 () Bool)

(declare-fun e!705094 () List!27397)

(assert (=> b!1243706 (= e!705094 Nil!27394)))

(declare-fun b!1243707 () Bool)

(assert (=> b!1243707 (= e!705094 ($colon$colon!626 (removeStrictlySorted!131 (t!40852 (t!40852 l!644)) key2!15) (h!28611 (t!40852 l!644))))))

(declare-fun b!1243708 () Bool)

(assert (=> b!1243708 (= e!705095 e!705094)))

(declare-fun c!122036 () Bool)

(assert (=> b!1243708 (= c!122036 (and (is-Cons!27393 (t!40852 l!644)) (not (= (_1!10162 (h!28611 (t!40852 l!644))) key2!15))))))

(assert (= (and d!137117 c!122035) b!1243705))

(assert (= (and d!137117 (not c!122035)) b!1243708))

(assert (= (and b!1243708 c!122036) b!1243707))

(assert (= (and b!1243708 (not c!122036)) b!1243706))

(assert (= (and d!137117 res!829053) b!1243704))

(declare-fun m!1146691 () Bool)

(assert (=> d!137117 m!1146691))

(assert (=> d!137117 m!1146439))

(declare-fun m!1146693 () Bool)

(assert (=> b!1243704 m!1146693))

(declare-fun m!1146695 () Bool)

(assert (=> b!1243707 m!1146695))

(assert (=> b!1243707 m!1146695))

(declare-fun m!1146697 () Bool)

(assert (=> b!1243707 m!1146697))

(assert (=> b!1243404 d!137117))

(declare-fun b!1243713 () Bool)

(declare-fun e!705098 () Bool)

(declare-fun tp!92759 () Bool)

(assert (=> b!1243713 (= e!705098 (and tp_is_empty!31289 tp!92759))))

(assert (=> b!1243403 (= tp!92750 e!705098)))

(assert (= (and b!1243403 (is-Cons!27393 (t!40852 l!644))) b!1243713))

(push 1)

(assert (not d!137117))

(assert (not b!1243440))

(assert (not b!1243614))

(assert (not bm!61379))

(assert (not b!1243675))

(assert (not d!137097))

(assert (not d!137111))

(assert (not b!1243628))

(assert (not bm!61382))

(assert (not b!1243618))

(assert (not d!137093))

(assert (not d!137069))

(assert (not d!137115))

(assert (not b!1243698))

(assert (not b!1243624))

(assert (not b!1243469))

(assert (not bm!61391))

(assert (not b!1243701))

(assert (not b!1243713))

(assert (not b!1243472))

(assert (not d!137099))

(assert (not b!1243634))

(assert (not b!1243683))

(assert (not b!1243599))

(assert (not b!1243679))

(assert (not d!137095))

(assert (not b!1243603))

(assert (not b!1243434))

(assert tp_is_empty!31289)

(assert (not b!1243707))

(assert (not b!1243704))

(assert (not b!1243601))

(assert (not b!1243626))

(assert (not b!1243637))

(assert (not bm!61376))

(assert (not d!137075))

(assert (not b!1243616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137119 () Bool)

(declare-fun lt!562724 () Bool)

(declare-fun content!601 (List!27397) (Set tuple2!20302))

(assert (=> d!137119 (= lt!562724 (set.member (tuple2!20303 key1!25 v1!20) (content!601 lt!562699)))))

(declare-fun e!705104 () Bool)

(assert (=> d!137119 (= lt!562724 e!705104)))

(declare-fun res!829058 () Bool)

(assert (=> d!137119 (=> (not res!829058) (not e!705104))))

(assert (=> d!137119 (= res!829058 (is-Cons!27393 lt!562699))))

(assert (=> d!137119 (= (contains!7428 lt!562699 (tuple2!20303 key1!25 v1!20)) lt!562724)))

(declare-fun b!1243718 () Bool)

(declare-fun e!705103 () Bool)

(assert (=> b!1243718 (= e!705104 e!705103)))

(declare-fun res!829059 () Bool)

(assert (=> b!1243718 (=> res!829059 e!705103)))

(assert (=> b!1243718 (= res!829059 (= (h!28611 lt!562699) (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243719 () Bool)

(assert (=> b!1243719 (= e!705103 (contains!7428 (t!40852 lt!562699) (tuple2!20303 key1!25 v1!20)))))

(assert (= (and d!137119 res!829058) b!1243718))

(assert (= (and b!1243718 (not res!829059)) b!1243719))

(declare-fun m!1146699 () Bool)

(assert (=> d!137119 m!1146699))

(declare-fun m!1146701 () Bool)

(assert (=> d!137119 m!1146701))

(declare-fun m!1146703 () Bool)

(assert (=> b!1243719 m!1146703))

(assert (=> b!1243603 d!137119))

(declare-fun d!137121 () Bool)

(assert (=> d!137121 (= (insertStrictlySorted!440 (removeStrictlySorted!131 (t!40852 l!644) key2!15) key1!25 v1!20) (removeStrictlySorted!131 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20) key2!15))))

(assert (=> d!137121 true))

(declare-fun _$3!70 () Unit!41238)

(assert (=> d!137121 (= (choose!1845 (t!40852 l!644) key1!25 v1!20 key2!15) _$3!70)))

(declare-fun bs!34997 () Bool)

(assert (= bs!34997 d!137121))

(assert (=> bs!34997 m!1146451))

(assert (=> bs!34997 m!1146451))

(assert (=> bs!34997 m!1146453))

(assert (=> bs!34997 m!1146447))

(assert (=> bs!34997 m!1146447))

(assert (=> bs!34997 m!1146449))

(assert (=> d!137099 d!137121))

(assert (=> d!137099 d!137069))

(assert (=> d!137099 d!137075))

(assert (=> d!137099 d!137111))

(assert (=> d!137099 d!137117))

(declare-fun d!137123 () Bool)

(declare-fun res!829060 () Bool)

(declare-fun e!705105 () Bool)

(assert (=> d!137123 (=> res!829060 e!705105)))

(assert (=> d!137123 (= res!829060 (or (is-Nil!27394 lt!562685) (is-Nil!27394 (t!40852 lt!562685))))))

(assert (=> d!137123 (= (isStrictlySorted!753 lt!562685) e!705105)))

(declare-fun b!1243720 () Bool)

(declare-fun e!705106 () Bool)

(assert (=> b!1243720 (= e!705105 e!705106)))

(declare-fun res!829061 () Bool)

(assert (=> b!1243720 (=> (not res!829061) (not e!705106))))

(assert (=> b!1243720 (= res!829061 (bvslt (_1!10162 (h!28611 lt!562685)) (_1!10162 (h!28611 (t!40852 lt!562685)))))))

(declare-fun b!1243721 () Bool)

(assert (=> b!1243721 (= e!705106 (isStrictlySorted!753 (t!40852 lt!562685)))))

(assert (= (and d!137123 (not res!829060)) b!1243720))

(assert (= (and b!1243720 res!829061) b!1243721))

(declare-fun m!1146705 () Bool)

(assert (=> b!1243721 m!1146705))

(assert (=> d!137069 d!137123))

(declare-fun d!137125 () Bool)

(declare-fun res!829062 () Bool)

(declare-fun e!705107 () Bool)

(assert (=> d!137125 (=> res!829062 e!705107)))

(assert (=> d!137125 (= res!829062 (or (is-Nil!27394 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)) (is-Nil!27394 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)))))))

(assert (=> d!137125 (= (isStrictlySorted!753 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)) e!705107)))

(declare-fun b!1243722 () Bool)

(declare-fun e!705108 () Bool)

(assert (=> b!1243722 (= e!705107 e!705108)))

(declare-fun res!829063 () Bool)

(assert (=> b!1243722 (=> (not res!829063) (not e!705108))))

(assert (=> b!1243722 (= res!829063 (bvslt (_1!10162 (h!28611 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))) (_1!10162 (h!28611 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))))))))

(declare-fun b!1243723 () Bool)

(assert (=> b!1243723 (= e!705108 (isStrictlySorted!753 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))))))

(assert (= (and d!137125 (not res!829062)) b!1243722))

(assert (= (and b!1243722 res!829063) b!1243723))

(declare-fun m!1146707 () Bool)

(assert (=> b!1243723 m!1146707))

(assert (=> d!137069 d!137125))

(declare-fun d!137127 () Bool)

(assert (=> d!137127 (= ($colon$colon!626 e!705047 (ite c!122005 (h!28611 l!644) (tuple2!20303 key1!25 v1!20))) (Cons!27393 (ite c!122005 (h!28611 l!644) (tuple2!20303 key1!25 v1!20)) e!705047))))

(assert (=> bm!61379 d!137127))

(declare-fun d!137129 () Bool)

(declare-fun res!829068 () Bool)

(declare-fun e!705113 () Bool)

(assert (=> d!137129 (=> res!829068 e!705113)))

(assert (=> d!137129 (= res!829068 (and (is-Cons!27393 lt!562703) (= (_1!10162 (h!28611 lt!562703)) key2!15)))))

(assert (=> d!137129 (= (containsKey!613 lt!562703 key2!15) e!705113)))

(declare-fun b!1243728 () Bool)

(declare-fun e!705114 () Bool)

(assert (=> b!1243728 (= e!705113 e!705114)))

(declare-fun res!829069 () Bool)

(assert (=> b!1243728 (=> (not res!829069) (not e!705114))))

(assert (=> b!1243728 (= res!829069 (and (or (not (is-Cons!27393 lt!562703)) (bvsle (_1!10162 (h!28611 lt!562703)) key2!15)) (is-Cons!27393 lt!562703) (bvslt (_1!10162 (h!28611 lt!562703)) key2!15)))))

(declare-fun b!1243729 () Bool)

(assert (=> b!1243729 (= e!705114 (containsKey!613 (t!40852 lt!562703) key2!15))))

(assert (= (and d!137129 (not res!829068)) b!1243728))

(assert (= (and b!1243728 res!829069) b!1243729))

(declare-fun m!1146709 () Bool)

(assert (=> b!1243729 m!1146709))

(assert (=> b!1243634 d!137129))

(declare-fun d!137131 () Bool)

(declare-fun res!829070 () Bool)

(declare-fun e!705115 () Bool)

(assert (=> d!137131 (=> res!829070 e!705115)))

(assert (=> d!137131 (= res!829070 (or (is-Nil!27394 lt!562718) (is-Nil!27394 (t!40852 lt!562718))))))

(assert (=> d!137131 (= (isStrictlySorted!753 lt!562718) e!705115)))

(declare-fun b!1243730 () Bool)

(declare-fun e!705116 () Bool)

(assert (=> b!1243730 (= e!705115 e!705116)))

(declare-fun res!829071 () Bool)

(assert (=> b!1243730 (=> (not res!829071) (not e!705116))))

(assert (=> b!1243730 (= res!829071 (bvslt (_1!10162 (h!28611 lt!562718)) (_1!10162 (h!28611 (t!40852 lt!562718)))))))

(declare-fun b!1243731 () Bool)

(assert (=> b!1243731 (= e!705116 (isStrictlySorted!753 (t!40852 lt!562718)))))

(assert (= (and d!137131 (not res!829070)) b!1243730))

(assert (= (and b!1243730 res!829071) b!1243731))

(declare-fun m!1146711 () Bool)

(assert (=> b!1243731 m!1146711))

(assert (=> d!137111 d!137131))

(assert (=> d!137111 d!137067))

(declare-fun d!137133 () Bool)

(declare-fun res!829072 () Bool)

(declare-fun e!705117 () Bool)

(assert (=> d!137133 (=> res!829072 e!705117)))

(assert (=> d!137133 (= res!829072 (or (is-Nil!27394 lt!562699) (is-Nil!27394 (t!40852 lt!562699))))))

(assert (=> d!137133 (= (isStrictlySorted!753 lt!562699) e!705117)))

(declare-fun b!1243732 () Bool)

(declare-fun e!705118 () Bool)

(assert (=> b!1243732 (= e!705117 e!705118)))

(declare-fun res!829073 () Bool)

(assert (=> b!1243732 (=> (not res!829073) (not e!705118))))

(assert (=> b!1243732 (= res!829073 (bvslt (_1!10162 (h!28611 lt!562699)) (_1!10162 (h!28611 (t!40852 lt!562699)))))))

(declare-fun b!1243733 () Bool)

(assert (=> b!1243733 (= e!705118 (isStrictlySorted!753 (t!40852 lt!562699)))))

(assert (= (and d!137133 (not res!829072)) b!1243732))

(assert (= (and b!1243732 res!829073) b!1243733))

(declare-fun m!1146713 () Bool)

(assert (=> b!1243733 m!1146713))

(assert (=> d!137075 d!137133))

(declare-fun d!137135 () Bool)

(declare-fun res!829074 () Bool)

(declare-fun e!705119 () Bool)

(assert (=> d!137135 (=> res!829074 e!705119)))

(assert (=> d!137135 (= res!829074 (or (is-Nil!27394 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) (is-Nil!27394 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15)))))))

(assert (=> d!137135 (= (isStrictlySorted!753 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) e!705119)))

(declare-fun b!1243734 () Bool)

(declare-fun e!705120 () Bool)

(assert (=> b!1243734 (= e!705119 e!705120)))

(declare-fun res!829075 () Bool)

(assert (=> b!1243734 (=> (not res!829075) (not e!705120))))

(assert (=> b!1243734 (= res!829075 (bvslt (_1!10162 (h!28611 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) (_1!10162 (h!28611 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15))))))))

(declare-fun b!1243735 () Bool)

(assert (=> b!1243735 (= e!705120 (isStrictlySorted!753 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15))))))

(assert (= (and d!137135 (not res!829074)) b!1243734))

(assert (= (and b!1243734 res!829075) b!1243735))

(declare-fun m!1146715 () Bool)

(assert (=> b!1243735 m!1146715))

(assert (=> d!137075 d!137135))

(declare-fun d!137137 () Bool)

(declare-fun res!829076 () Bool)

(declare-fun e!705121 () Bool)

(assert (=> d!137137 (=> res!829076 e!705121)))

(assert (=> d!137137 (= res!829076 (or (is-Nil!27394 lt!562721) (is-Nil!27394 (t!40852 lt!562721))))))

(assert (=> d!137137 (= (isStrictlySorted!753 lt!562721) e!705121)))

(declare-fun b!1243736 () Bool)

(declare-fun e!705122 () Bool)

(assert (=> b!1243736 (= e!705121 e!705122)))

(declare-fun res!829077 () Bool)

(assert (=> b!1243736 (=> (not res!829077) (not e!705122))))

(assert (=> b!1243736 (= res!829077 (bvslt (_1!10162 (h!28611 lt!562721)) (_1!10162 (h!28611 (t!40852 lt!562721)))))))

(declare-fun b!1243737 () Bool)

(assert (=> b!1243737 (= e!705122 (isStrictlySorted!753 (t!40852 lt!562721)))))

(assert (= (and d!137137 (not res!829076)) b!1243736))

(assert (= (and b!1243736 res!829077) b!1243737))

(declare-fun m!1146717 () Bool)

(assert (=> b!1243737 m!1146717))

(assert (=> d!137117 d!137137))

(assert (=> d!137117 d!137067))

(declare-fun lt!562725 () Bool)

(declare-fun d!137139 () Bool)

(assert (=> d!137139 (= lt!562725 (set.member (tuple2!20303 key1!25 v1!20) (content!601 lt!562701)))))

(declare-fun e!705124 () Bool)

(assert (=> d!137139 (= lt!562725 e!705124)))

(declare-fun res!829078 () Bool)

(assert (=> d!137139 (=> (not res!829078) (not e!705124))))

(assert (=> d!137139 (= res!829078 (is-Cons!27393 lt!562701))))

(assert (=> d!137139 (= (contains!7428 lt!562701 (tuple2!20303 key1!25 v1!20)) lt!562725)))

(declare-fun b!1243738 () Bool)

(declare-fun e!705123 () Bool)

(assert (=> b!1243738 (= e!705124 e!705123)))

(declare-fun res!829079 () Bool)

(assert (=> b!1243738 (=> res!829079 e!705123)))

(assert (=> b!1243738 (= res!829079 (= (h!28611 lt!562701) (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243739 () Bool)

(assert (=> b!1243739 (= e!705123 (contains!7428 (t!40852 lt!562701) (tuple2!20303 key1!25 v1!20)))))

(assert (= (and d!137139 res!829078) b!1243738))

(assert (= (and b!1243738 (not res!829079)) b!1243739))

(declare-fun m!1146719 () Bool)

(assert (=> d!137139 m!1146719))

(declare-fun m!1146721 () Bool)

(assert (=> d!137139 m!1146721))

(declare-fun m!1146723 () Bool)

(assert (=> b!1243739 m!1146723))

(assert (=> b!1243618 d!137139))

(declare-fun d!137141 () Bool)

(declare-fun res!829080 () Bool)

(declare-fun e!705125 () Bool)

(assert (=> d!137141 (=> res!829080 e!705125)))

(assert (=> d!137141 (= res!829080 (or (is-Nil!27394 lt!562701) (is-Nil!27394 (t!40852 lt!562701))))))

(assert (=> d!137141 (= (isStrictlySorted!753 lt!562701) e!705125)))

(declare-fun b!1243740 () Bool)

(declare-fun e!705126 () Bool)

(assert (=> b!1243740 (= e!705125 e!705126)))

(declare-fun res!829081 () Bool)

(assert (=> b!1243740 (=> (not res!829081) (not e!705126))))

(assert (=> b!1243740 (= res!829081 (bvslt (_1!10162 (h!28611 lt!562701)) (_1!10162 (h!28611 (t!40852 lt!562701)))))))

(declare-fun b!1243741 () Bool)

(assert (=> b!1243741 (= e!705126 (isStrictlySorted!753 (t!40852 lt!562701)))))

(assert (= (and d!137141 (not res!829080)) b!1243740))

(assert (= (and b!1243740 res!829081) b!1243741))

(declare-fun m!1146725 () Bool)

(assert (=> b!1243741 m!1146725))

(assert (=> d!137093 d!137141))

(assert (=> d!137093 d!137065))

(declare-fun d!137143 () Bool)

(assert (=> d!137143 (= ($colon$colon!626 e!705079 (ite c!122030 (h!28611 (t!40852 l!644)) (tuple2!20303 key1!25 v1!20))) (Cons!27393 (ite c!122030 (h!28611 (t!40852 l!644)) (tuple2!20303 key1!25 v1!20)) e!705079))))

(assert (=> bm!61391 d!137143))

(declare-fun d!137145 () Bool)

(declare-fun res!829082 () Bool)

(declare-fun e!705127 () Bool)

(assert (=> d!137145 (=> res!829082 e!705127)))

(assert (=> d!137145 (= res!829082 (and (is-Cons!27393 lt!562720) (= (_1!10162 (h!28611 lt!562720)) key2!15)))))

(assert (=> d!137145 (= (containsKey!613 lt!562720 key2!15) e!705127)))

(declare-fun b!1243742 () Bool)

(declare-fun e!705128 () Bool)

(assert (=> b!1243742 (= e!705127 e!705128)))

(declare-fun res!829083 () Bool)

(assert (=> b!1243742 (=> (not res!829083) (not e!705128))))

(assert (=> b!1243742 (= res!829083 (and (or (not (is-Cons!27393 lt!562720)) (bvsle (_1!10162 (h!28611 lt!562720)) key2!15)) (is-Cons!27393 lt!562720) (bvslt (_1!10162 (h!28611 lt!562720)) key2!15)))))

(declare-fun b!1243743 () Bool)

(assert (=> b!1243743 (= e!705128 (containsKey!613 (t!40852 lt!562720) key2!15))))

(assert (= (and d!137145 (not res!829082)) b!1243742))

(assert (= (and b!1243742 res!829083) b!1243743))

(declare-fun m!1146727 () Bool)

(assert (=> b!1243743 m!1146727))

(assert (=> b!1243698 d!137145))

(declare-fun d!137147 () Bool)

(declare-fun lt!562726 () Bool)

(assert (=> d!137147 (= lt!562726 (set.member (tuple2!20303 key1!25 v1!20) (content!601 lt!562718)))))

(declare-fun e!705130 () Bool)

(assert (=> d!137147 (= lt!562726 e!705130)))

(declare-fun res!829084 () Bool)

(assert (=> d!137147 (=> (not res!829084) (not e!705130))))

(assert (=> d!137147 (= res!829084 (is-Cons!27393 lt!562718))))

(assert (=> d!137147 (= (contains!7428 lt!562718 (tuple2!20303 key1!25 v1!20)) lt!562726)))

(declare-fun b!1243744 () Bool)

(declare-fun e!705129 () Bool)

(assert (=> b!1243744 (= e!705130 e!705129)))

(declare-fun res!829085 () Bool)

(assert (=> b!1243744 (=> res!829085 e!705129)))

(assert (=> b!1243744 (= res!829085 (= (h!28611 lt!562718) (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243745 () Bool)

(assert (=> b!1243745 (= e!705129 (contains!7428 (t!40852 lt!562718) (tuple2!20303 key1!25 v1!20)))))

(assert (= (and d!137147 res!829084) b!1243744))

(assert (= (and b!1243744 (not res!829085)) b!1243745))

(declare-fun m!1146729 () Bool)

(assert (=> d!137147 m!1146729))

(declare-fun m!1146731 () Bool)

(assert (=> d!137147 m!1146731))

(declare-fun m!1146733 () Bool)

(assert (=> b!1243745 m!1146733))

(assert (=> b!1243683 d!137147))

(declare-fun d!137149 () Bool)

(declare-fun res!829086 () Bool)

(declare-fun e!705131 () Bool)

(assert (=> d!137149 (=> res!829086 e!705131)))

(assert (=> d!137149 (= res!829086 (and (is-Cons!27393 lt!562699) (= (_1!10162 (h!28611 lt!562699)) key1!25)))))

(assert (=> d!137149 (= (containsKey!613 lt!562699 key1!25) e!705131)))

(declare-fun b!1243746 () Bool)

(declare-fun e!705132 () Bool)

(assert (=> b!1243746 (= e!705131 e!705132)))

(declare-fun res!829087 () Bool)

(assert (=> b!1243746 (=> (not res!829087) (not e!705132))))

(assert (=> b!1243746 (= res!829087 (and (or (not (is-Cons!27393 lt!562699)) (bvsle (_1!10162 (h!28611 lt!562699)) key1!25)) (is-Cons!27393 lt!562699) (bvslt (_1!10162 (h!28611 lt!562699)) key1!25)))))

(declare-fun b!1243747 () Bool)

(assert (=> b!1243747 (= e!705132 (containsKey!613 (t!40852 lt!562699) key1!25))))

(assert (= (and d!137149 (not res!829086)) b!1243746))

(assert (= (and b!1243746 res!829087) b!1243747))

(declare-fun m!1146735 () Bool)

(assert (=> b!1243747 m!1146735))

(assert (=> b!1243601 d!137149))

(declare-fun d!137151 () Bool)

(declare-fun res!829088 () Bool)

(declare-fun e!705133 () Bool)

(assert (=> d!137151 (=> res!829088 e!705133)))

(assert (=> d!137151 (= res!829088 (and (is-Cons!27393 lt!562701) (= (_1!10162 (h!28611 lt!562701)) key1!25)))))

(assert (=> d!137151 (= (containsKey!613 lt!562701 key1!25) e!705133)))

(declare-fun b!1243748 () Bool)

(declare-fun e!705134 () Bool)

(assert (=> b!1243748 (= e!705133 e!705134)))

(declare-fun res!829089 () Bool)

(assert (=> b!1243748 (=> (not res!829089) (not e!705134))))

(assert (=> b!1243748 (= res!829089 (and (or (not (is-Cons!27393 lt!562701)) (bvsle (_1!10162 (h!28611 lt!562701)) key1!25)) (is-Cons!27393 lt!562701) (bvslt (_1!10162 (h!28611 lt!562701)) key1!25)))))

(declare-fun b!1243749 () Bool)

(assert (=> b!1243749 (= e!705134 (containsKey!613 (t!40852 lt!562701) key1!25))))

(assert (= (and d!137151 (not res!829088)) b!1243748))

(assert (= (and b!1243748 res!829089) b!1243749))

(declare-fun m!1146737 () Bool)

(assert (=> b!1243749 m!1146737))

(assert (=> b!1243616 d!137151))

(declare-fun d!137153 () Bool)

(assert (=> d!137153 (= ($colon$colon!626 e!705052 (ite c!122009 (h!28611 (removeStrictlySorted!131 l!644 key2!15)) (tuple2!20303 key1!25 v1!20))) (Cons!27393 (ite c!122009 (h!28611 (removeStrictlySorted!131 l!644 key2!15)) (tuple2!20303 key1!25 v1!20)) e!705052))))

(assert (=> bm!61382 d!137153))

(declare-fun lt!562727 () Bool)

(declare-fun d!137155 () Bool)

(assert (=> d!137155 (= lt!562727 (set.member (tuple2!20303 key1!25 v1!20) (content!601 lt!562702)))))

(declare-fun e!705136 () Bool)

(assert (=> d!137155 (= lt!562727 e!705136)))

(declare-fun res!829090 () Bool)

(assert (=> d!137155 (=> (not res!829090) (not e!705136))))

(assert (=> d!137155 (= res!829090 (is-Cons!27393 lt!562702))))

(assert (=> d!137155 (= (contains!7428 lt!562702 (tuple2!20303 key1!25 v1!20)) lt!562727)))

(declare-fun b!1243750 () Bool)

(declare-fun e!705135 () Bool)

(assert (=> b!1243750 (= e!705136 e!705135)))

(declare-fun res!829091 () Bool)

(assert (=> b!1243750 (=> res!829091 e!705135)))

(assert (=> b!1243750 (= res!829091 (= (h!28611 lt!562702) (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243751 () Bool)

(assert (=> b!1243751 (= e!705135 (contains!7428 (t!40852 lt!562702) (tuple2!20303 key1!25 v1!20)))))

(assert (= (and d!137155 res!829090) b!1243750))

(assert (= (and b!1243750 (not res!829091)) b!1243751))

(declare-fun m!1146739 () Bool)

(assert (=> d!137155 m!1146739))

(declare-fun m!1146741 () Bool)

(assert (=> d!137155 m!1146741))

(declare-fun m!1146743 () Bool)

(assert (=> b!1243751 m!1146743))

(assert (=> b!1243628 d!137155))

(declare-fun bm!61393 () Bool)

(declare-fun call!61396 () List!27397)

(declare-fun call!61397 () List!27397)

(assert (=> bm!61393 (= call!61396 call!61397)))

(declare-fun e!705140 () List!27397)

(declare-fun b!1243752 () Bool)

(assert (=> b!1243752 (= e!705140 (insertStrictlySorted!440 (t!40852 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) key1!25 v1!20))))

(declare-fun c!122040 () Bool)

(declare-fun b!1243753 () Bool)

(assert (=> b!1243753 (= c!122040 (and (is-Cons!27393 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) (bvsgt (_1!10162 (h!28611 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15)))) key1!25)))))

(declare-fun e!705139 () List!27397)

(declare-fun e!705137 () List!27397)

(assert (=> b!1243753 (= e!705139 e!705137)))

(declare-fun b!1243754 () Bool)

(declare-fun res!829093 () Bool)

(declare-fun e!705141 () Bool)

(assert (=> b!1243754 (=> (not res!829093) (not e!705141))))

(declare-fun lt!562728 () List!27397)

(assert (=> b!1243754 (= res!829093 (containsKey!613 lt!562728 key1!25))))

(declare-fun b!1243755 () Bool)

(declare-fun e!705138 () List!27397)

(declare-fun call!61398 () List!27397)

(assert (=> b!1243755 (= e!705138 call!61398)))

(declare-fun d!137157 () Bool)

(assert (=> d!137157 e!705141))

(declare-fun res!829092 () Bool)

(assert (=> d!137157 (=> (not res!829092) (not e!705141))))

(assert (=> d!137157 (= res!829092 (isStrictlySorted!753 lt!562728))))

(assert (=> d!137157 (= lt!562728 e!705138)))

(declare-fun c!122039 () Bool)

(assert (=> d!137157 (= c!122039 (and (is-Cons!27393 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) (bvslt (_1!10162 (h!28611 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15)))) key1!25)))))

(assert (=> d!137157 (isStrictlySorted!753 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15)))))

(assert (=> d!137157 (= (insertStrictlySorted!440 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) key1!25 v1!20) lt!562728)))

(declare-fun b!1243756 () Bool)

(assert (=> b!1243756 (= e!705141 (contains!7428 lt!562728 (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243757 () Bool)

(assert (=> b!1243757 (= e!705138 e!705139)))

(declare-fun c!122038 () Bool)

(assert (=> b!1243757 (= c!122038 (and (is-Cons!27393 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) (= (_1!10162 (h!28611 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15)))) key1!25)))))

(declare-fun b!1243758 () Bool)

(assert (=> b!1243758 (= e!705139 call!61397)))

(declare-fun bm!61394 () Bool)

(assert (=> bm!61394 (= call!61398 ($colon$colon!626 e!705140 (ite c!122039 (h!28611 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) (tuple2!20303 key1!25 v1!20))))))

(declare-fun c!122037 () Bool)

(assert (=> bm!61394 (= c!122037 c!122039)))

(declare-fun b!1243759 () Bool)

(assert (=> b!1243759 (= e!705137 call!61396)))

(declare-fun b!1243760 () Bool)

(assert (=> b!1243760 (= e!705140 (ite c!122038 (t!40852 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) (ite c!122040 (Cons!27393 (h!28611 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15))) (t!40852 (t!40852 (removeStrictlySorted!131 (t!40852 l!644) key2!15)))) Nil!27394)))))

(declare-fun bm!61395 () Bool)

(assert (=> bm!61395 (= call!61397 call!61398)))

(declare-fun b!1243761 () Bool)

(assert (=> b!1243761 (= e!705137 call!61396)))

(assert (= (and d!137157 c!122039) b!1243755))

(assert (= (and d!137157 (not c!122039)) b!1243757))

(assert (= (and b!1243757 c!122038) b!1243758))

(assert (= (and b!1243757 (not c!122038)) b!1243753))

(assert (= (and b!1243753 c!122040) b!1243761))

(assert (= (and b!1243753 (not c!122040)) b!1243759))

(assert (= (or b!1243761 b!1243759) bm!61393))

(assert (= (or b!1243758 bm!61393) bm!61395))

(assert (= (or b!1243755 bm!61395) bm!61394))

(assert (= (and bm!61394 c!122037) b!1243752))

(assert (= (and bm!61394 (not c!122037)) b!1243760))

(assert (= (and d!137157 res!829092) b!1243754))

(assert (= (and b!1243754 res!829093) b!1243756))

(declare-fun m!1146745 () Bool)

(assert (=> d!137157 m!1146745))

(assert (=> d!137157 m!1146715))

(declare-fun m!1146747 () Bool)

(assert (=> b!1243756 m!1146747))

(declare-fun m!1146749 () Bool)

(assert (=> b!1243754 m!1146749))

(declare-fun m!1146751 () Bool)

(assert (=> bm!61394 m!1146751))

(declare-fun m!1146753 () Bool)

(assert (=> b!1243752 m!1146753))

(assert (=> b!1243599 d!137157))

(declare-fun d!137159 () Bool)

(declare-fun res!829094 () Bool)

(declare-fun e!705142 () Bool)

(assert (=> d!137159 (=> res!829094 e!705142)))

(assert (=> d!137159 (= res!829094 (or (is-Nil!27394 lt!562703) (is-Nil!27394 (t!40852 lt!562703))))))

(assert (=> d!137159 (= (isStrictlySorted!753 lt!562703) e!705142)))

(declare-fun b!1243762 () Bool)

(declare-fun e!705143 () Bool)

(assert (=> b!1243762 (= e!705142 e!705143)))

(declare-fun res!829095 () Bool)

(assert (=> b!1243762 (=> (not res!829095) (not e!705143))))

(assert (=> b!1243762 (= res!829095 (bvslt (_1!10162 (h!28611 lt!562703)) (_1!10162 (h!28611 (t!40852 lt!562703)))))))

(declare-fun b!1243763 () Bool)

(assert (=> b!1243763 (= e!705143 (isStrictlySorted!753 (t!40852 lt!562703)))))

(assert (= (and d!137159 (not res!829094)) b!1243762))

(assert (= (and b!1243762 res!829095) b!1243763))

(declare-fun m!1146755 () Bool)

(assert (=> b!1243763 m!1146755))

(assert (=> d!137097 d!137159))

(assert (=> d!137097 d!137065))

(assert (=> b!1243614 d!137111))

(declare-fun d!137161 () Bool)

(declare-fun res!829096 () Bool)

(declare-fun e!705144 () Bool)

(assert (=> d!137161 (=> res!829096 e!705144)))

(assert (=> d!137161 (= res!829096 (or (is-Nil!27394 lt!562702) (is-Nil!27394 (t!40852 lt!562702))))))

(assert (=> d!137161 (= (isStrictlySorted!753 lt!562702) e!705144)))

(declare-fun b!1243764 () Bool)

(declare-fun e!705145 () Bool)

(assert (=> b!1243764 (= e!705144 e!705145)))

(declare-fun res!829097 () Bool)

(assert (=> b!1243764 (=> (not res!829097) (not e!705145))))

(assert (=> b!1243764 (= res!829097 (bvslt (_1!10162 (h!28611 lt!562702)) (_1!10162 (h!28611 (t!40852 lt!562702)))))))

(declare-fun b!1243765 () Bool)

(assert (=> b!1243765 (= e!705145 (isStrictlySorted!753 (t!40852 lt!562702)))))

(assert (= (and d!137161 (not res!829096)) b!1243764))

(assert (= (and b!1243764 res!829097) b!1243765))

(declare-fun m!1146757 () Bool)

(assert (=> b!1243765 m!1146757))

(assert (=> d!137095 d!137161))

(declare-fun d!137163 () Bool)

(declare-fun res!829098 () Bool)

(declare-fun e!705146 () Bool)

(assert (=> d!137163 (=> res!829098 e!705146)))

(assert (=> d!137163 (= res!829098 (or (is-Nil!27394 (removeStrictlySorted!131 l!644 key2!15)) (is-Nil!27394 (t!40852 (removeStrictlySorted!131 l!644 key2!15)))))))

(assert (=> d!137163 (= (isStrictlySorted!753 (removeStrictlySorted!131 l!644 key2!15)) e!705146)))

(declare-fun b!1243766 () Bool)

(declare-fun e!705147 () Bool)

(assert (=> b!1243766 (= e!705146 e!705147)))

(declare-fun res!829099 () Bool)

(assert (=> b!1243766 (=> (not res!829099) (not e!705147))))

(assert (=> b!1243766 (= res!829099 (bvslt (_1!10162 (h!28611 (removeStrictlySorted!131 l!644 key2!15))) (_1!10162 (h!28611 (t!40852 (removeStrictlySorted!131 l!644 key2!15))))))))

(declare-fun b!1243767 () Bool)

(assert (=> b!1243767 (= e!705147 (isStrictlySorted!753 (t!40852 (removeStrictlySorted!131 l!644 key2!15))))))

(assert (= (and d!137163 (not res!829098)) b!1243766))

(assert (= (and b!1243766 res!829099) b!1243767))

(declare-fun m!1146759 () Bool)

(assert (=> b!1243767 m!1146759))

(assert (=> d!137095 d!137163))

(declare-fun bm!61396 () Bool)

(declare-fun call!61399 () List!27397)

(declare-fun call!61400 () List!27397)

(assert (=> bm!61396 (= call!61399 call!61400)))

(declare-fun e!705151 () List!27397)

(declare-fun b!1243768 () Bool)

(assert (=> b!1243768 (= e!705151 (insertStrictlySorted!440 (t!40852 (t!40852 (removeStrictlySorted!131 l!644 key2!15))) key1!25 v1!20))))

(declare-fun c!122044 () Bool)

(declare-fun b!1243769 () Bool)

(assert (=> b!1243769 (= c!122044 (and (is-Cons!27393 (t!40852 (removeStrictlySorted!131 l!644 key2!15))) (bvsgt (_1!10162 (h!28611 (t!40852 (removeStrictlySorted!131 l!644 key2!15)))) key1!25)))))

(declare-fun e!705150 () List!27397)

(declare-fun e!705148 () List!27397)

(assert (=> b!1243769 (= e!705150 e!705148)))

(declare-fun b!1243770 () Bool)

(declare-fun res!829101 () Bool)

(declare-fun e!705152 () Bool)

(assert (=> b!1243770 (=> (not res!829101) (not e!705152))))

(declare-fun lt!562729 () List!27397)

(assert (=> b!1243770 (= res!829101 (containsKey!613 lt!562729 key1!25))))

(declare-fun b!1243771 () Bool)

(declare-fun e!705149 () List!27397)

(declare-fun call!61401 () List!27397)

(assert (=> b!1243771 (= e!705149 call!61401)))

(declare-fun d!137165 () Bool)

(assert (=> d!137165 e!705152))

(declare-fun res!829100 () Bool)

(assert (=> d!137165 (=> (not res!829100) (not e!705152))))

(assert (=> d!137165 (= res!829100 (isStrictlySorted!753 lt!562729))))

(assert (=> d!137165 (= lt!562729 e!705149)))

(declare-fun c!122043 () Bool)

(assert (=> d!137165 (= c!122043 (and (is-Cons!27393 (t!40852 (removeStrictlySorted!131 l!644 key2!15))) (bvslt (_1!10162 (h!28611 (t!40852 (removeStrictlySorted!131 l!644 key2!15)))) key1!25)))))

(assert (=> d!137165 (isStrictlySorted!753 (t!40852 (removeStrictlySorted!131 l!644 key2!15)))))

(assert (=> d!137165 (= (insertStrictlySorted!440 (t!40852 (removeStrictlySorted!131 l!644 key2!15)) key1!25 v1!20) lt!562729)))

(declare-fun b!1243772 () Bool)

(assert (=> b!1243772 (= e!705152 (contains!7428 lt!562729 (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243773 () Bool)

(assert (=> b!1243773 (= e!705149 e!705150)))

(declare-fun c!122042 () Bool)

(assert (=> b!1243773 (= c!122042 (and (is-Cons!27393 (t!40852 (removeStrictlySorted!131 l!644 key2!15))) (= (_1!10162 (h!28611 (t!40852 (removeStrictlySorted!131 l!644 key2!15)))) key1!25)))))

(declare-fun b!1243774 () Bool)

(assert (=> b!1243774 (= e!705150 call!61400)))

(declare-fun bm!61397 () Bool)

(assert (=> bm!61397 (= call!61401 ($colon$colon!626 e!705151 (ite c!122043 (h!28611 (t!40852 (removeStrictlySorted!131 l!644 key2!15))) (tuple2!20303 key1!25 v1!20))))))

(declare-fun c!122041 () Bool)

(assert (=> bm!61397 (= c!122041 c!122043)))

(declare-fun b!1243775 () Bool)

(assert (=> b!1243775 (= e!705148 call!61399)))

(declare-fun b!1243776 () Bool)

(assert (=> b!1243776 (= e!705151 (ite c!122042 (t!40852 (t!40852 (removeStrictlySorted!131 l!644 key2!15))) (ite c!122044 (Cons!27393 (h!28611 (t!40852 (removeStrictlySorted!131 l!644 key2!15))) (t!40852 (t!40852 (removeStrictlySorted!131 l!644 key2!15)))) Nil!27394)))))

(declare-fun bm!61398 () Bool)

(assert (=> bm!61398 (= call!61400 call!61401)))

(declare-fun b!1243777 () Bool)

(assert (=> b!1243777 (= e!705148 call!61399)))

(assert (= (and d!137165 c!122043) b!1243771))

(assert (= (and d!137165 (not c!122043)) b!1243773))

(assert (= (and b!1243773 c!122042) b!1243774))

(assert (= (and b!1243773 (not c!122042)) b!1243769))

(assert (= (and b!1243769 c!122044) b!1243777))

(assert (= (and b!1243769 (not c!122044)) b!1243775))

(assert (= (or b!1243777 b!1243775) bm!61396))

(assert (= (or b!1243774 bm!61396) bm!61398))

(assert (= (or b!1243771 bm!61398) bm!61397))

(assert (= (and bm!61397 c!122041) b!1243768))

(assert (= (and bm!61397 (not c!122041)) b!1243776))

(assert (= (and d!137165 res!829100) b!1243770))

(assert (= (and b!1243770 res!829101) b!1243772))

(declare-fun m!1146761 () Bool)

(assert (=> d!137165 m!1146761))

(assert (=> d!137165 m!1146759))

(declare-fun m!1146763 () Bool)

(assert (=> b!1243772 m!1146763))

(declare-fun m!1146765 () Bool)

(assert (=> b!1243770 m!1146765))

(declare-fun m!1146767 () Bool)

(assert (=> bm!61397 m!1146767))

(declare-fun m!1146769 () Bool)

(assert (=> b!1243768 m!1146769))

(assert (=> b!1243624 d!137165))

(declare-fun d!137167 () Bool)

(declare-fun res!829102 () Bool)

(declare-fun e!705153 () Bool)

(assert (=> d!137167 (=> res!829102 e!705153)))

(assert (=> d!137167 (= res!829102 (and (is-Cons!27393 lt!562718) (= (_1!10162 (h!28611 lt!562718)) key1!25)))))

(assert (=> d!137167 (= (containsKey!613 lt!562718 key1!25) e!705153)))

(declare-fun b!1243778 () Bool)

(declare-fun e!705154 () Bool)

(assert (=> b!1243778 (= e!705153 e!705154)))

(declare-fun res!829103 () Bool)

(assert (=> b!1243778 (=> (not res!829103) (not e!705154))))

(assert (=> b!1243778 (= res!829103 (and (or (not (is-Cons!27393 lt!562718)) (bvsle (_1!10162 (h!28611 lt!562718)) key1!25)) (is-Cons!27393 lt!562718) (bvslt (_1!10162 (h!28611 lt!562718)) key1!25)))))

(declare-fun b!1243779 () Bool)

(assert (=> b!1243779 (= e!705154 (containsKey!613 (t!40852 lt!562718) key1!25))))

(assert (= (and d!137167 (not res!829102)) b!1243778))

(assert (= (and b!1243778 res!829103) b!1243779))

(declare-fun m!1146771 () Bool)

(assert (=> b!1243779 m!1146771))

(assert (=> b!1243679 d!137167))

(declare-fun d!137169 () Bool)

(declare-fun res!829104 () Bool)

(declare-fun e!705155 () Bool)

(assert (=> d!137169 (=> res!829104 e!705155)))

(assert (=> d!137169 (= res!829104 (and (is-Cons!27393 lt!562702) (= (_1!10162 (h!28611 lt!562702)) key1!25)))))

(assert (=> d!137169 (= (containsKey!613 lt!562702 key1!25) e!705155)))

(declare-fun b!1243780 () Bool)

(declare-fun e!705156 () Bool)

(assert (=> b!1243780 (= e!705155 e!705156)))

(declare-fun res!829105 () Bool)

(assert (=> b!1243780 (=> (not res!829105) (not e!705156))))

(assert (=> b!1243780 (= res!829105 (and (or (not (is-Cons!27393 lt!562702)) (bvsle (_1!10162 (h!28611 lt!562702)) key1!25)) (is-Cons!27393 lt!562702) (bvslt (_1!10162 (h!28611 lt!562702)) key1!25)))))

(declare-fun b!1243781 () Bool)

(assert (=> b!1243781 (= e!705156 (containsKey!613 (t!40852 lt!562702) key1!25))))

(assert (= (and d!137169 (not res!829104)) b!1243780))

(assert (= (and b!1243780 res!829105) b!1243781))

(declare-fun m!1146773 () Bool)

(assert (=> b!1243781 m!1146773))

(assert (=> b!1243626 d!137169))

(declare-fun d!137171 () Bool)

(declare-fun res!829106 () Bool)

(declare-fun e!705157 () Bool)

(assert (=> d!137171 (=> res!829106 e!705157)))

(assert (=> d!137171 (= res!829106 (or (is-Nil!27394 lt!562720) (is-Nil!27394 (t!40852 lt!562720))))))

(assert (=> d!137171 (= (isStrictlySorted!753 lt!562720) e!705157)))

(declare-fun b!1243782 () Bool)

(declare-fun e!705158 () Bool)

(assert (=> b!1243782 (= e!705157 e!705158)))

(declare-fun res!829107 () Bool)

(assert (=> b!1243782 (=> (not res!829107) (not e!705158))))

(assert (=> b!1243782 (= res!829107 (bvslt (_1!10162 (h!28611 lt!562720)) (_1!10162 (h!28611 (t!40852 lt!562720)))))))

(declare-fun b!1243783 () Bool)

(assert (=> b!1243783 (= e!705158 (isStrictlySorted!753 (t!40852 lt!562720)))))

(assert (= (and d!137171 (not res!829106)) b!1243782))

(assert (= (and b!1243782 res!829107) b!1243783))

(declare-fun m!1146775 () Bool)

(assert (=> b!1243783 m!1146775))

(assert (=> d!137115 d!137171))

(declare-fun d!137173 () Bool)

(declare-fun res!829108 () Bool)

(declare-fun e!705159 () Bool)

(assert (=> d!137173 (=> res!829108 e!705159)))

(assert (=> d!137173 (= res!829108 (or (is-Nil!27394 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (is-Nil!27394 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))))

(assert (=> d!137173 (= (isStrictlySorted!753 (insertStrictlySorted!440 l!644 key1!25 v1!20)) e!705159)))

(declare-fun b!1243784 () Bool)

(declare-fun e!705160 () Bool)

(assert (=> b!1243784 (= e!705159 e!705160)))

(declare-fun res!829109 () Bool)

(assert (=> b!1243784 (=> (not res!829109) (not e!705160))))

(assert (=> b!1243784 (= res!829109 (bvslt (_1!10162 (h!28611 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (_1!10162 (h!28611 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))))

(declare-fun b!1243785 () Bool)

(assert (=> b!1243785 (= e!705160 (isStrictlySorted!753 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))

(assert (= (and d!137173 (not res!829108)) b!1243784))

(assert (= (and b!1243784 res!829109) b!1243785))

(declare-fun m!1146777 () Bool)

(assert (=> b!1243785 m!1146777))

(assert (=> d!137115 d!137173))

(declare-fun d!137175 () Bool)

(assert (=> d!137175 (= ($colon$colon!626 (removeStrictlySorted!131 (t!40852 (t!40852 l!644)) key2!15) (h!28611 (t!40852 l!644))) (Cons!27393 (h!28611 (t!40852 l!644)) (removeStrictlySorted!131 (t!40852 (t!40852 l!644)) key2!15)))))

(assert (=> b!1243707 d!137175))

(declare-fun d!137177 () Bool)

(declare-fun e!705161 () Bool)

(assert (=> d!137177 e!705161))

(declare-fun res!829110 () Bool)

(assert (=> d!137177 (=> (not res!829110) (not e!705161))))

(declare-fun lt!562730 () List!27397)

(assert (=> d!137177 (= res!829110 (isStrictlySorted!753 lt!562730))))

(declare-fun e!705163 () List!27397)

(assert (=> d!137177 (= lt!562730 e!705163)))

(declare-fun c!122045 () Bool)

(assert (=> d!137177 (= c!122045 (and (is-Cons!27393 (t!40852 (t!40852 l!644))) (= (_1!10162 (h!28611 (t!40852 (t!40852 l!644)))) key2!15)))))

(assert (=> d!137177 (isStrictlySorted!753 (t!40852 (t!40852 l!644)))))

(assert (=> d!137177 (= (removeStrictlySorted!131 (t!40852 (t!40852 l!644)) key2!15) lt!562730)))

(declare-fun b!1243786 () Bool)

(assert (=> b!1243786 (= e!705161 (not (containsKey!613 lt!562730 key2!15)))))

(declare-fun b!1243787 () Bool)

(assert (=> b!1243787 (= e!705163 (t!40852 (t!40852 (t!40852 l!644))))))

(declare-fun b!1243788 () Bool)

(declare-fun e!705162 () List!27397)

(assert (=> b!1243788 (= e!705162 Nil!27394)))

(declare-fun b!1243789 () Bool)

(assert (=> b!1243789 (= e!705162 ($colon$colon!626 (removeStrictlySorted!131 (t!40852 (t!40852 (t!40852 l!644))) key2!15) (h!28611 (t!40852 (t!40852 l!644)))))))

(declare-fun b!1243790 () Bool)

(assert (=> b!1243790 (= e!705163 e!705162)))

(declare-fun c!122046 () Bool)

(assert (=> b!1243790 (= c!122046 (and (is-Cons!27393 (t!40852 (t!40852 l!644))) (not (= (_1!10162 (h!28611 (t!40852 (t!40852 l!644)))) key2!15))))))

(assert (= (and d!137177 c!122045) b!1243787))

(assert (= (and d!137177 (not c!122045)) b!1243790))

(assert (= (and b!1243790 c!122046) b!1243789))

(assert (= (and b!1243790 (not c!122046)) b!1243788))

(assert (= (and d!137177 res!829110) b!1243786))

(declare-fun m!1146779 () Bool)

(assert (=> d!137177 m!1146779))

(assert (=> d!137177 m!1146463))

(declare-fun m!1146781 () Bool)

(assert (=> b!1243786 m!1146781))

(declare-fun m!1146783 () Bool)

(assert (=> b!1243789 m!1146783))

(assert (=> b!1243789 m!1146783))

(declare-fun m!1146785 () Bool)

(assert (=> b!1243789 m!1146785))

(assert (=> b!1243707 d!137177))

(declare-fun d!137179 () Bool)

(assert (=> d!137179 (= ($colon$colon!626 (removeStrictlySorted!131 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)) key2!15) (h!28611 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))) (Cons!27393 (h!28611 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)) (removeStrictlySorted!131 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)) key2!15)))))

(assert (=> b!1243472 d!137179))

(declare-fun d!137181 () Bool)

(declare-fun e!705164 () Bool)

(assert (=> d!137181 e!705164))

(declare-fun res!829111 () Bool)

(assert (=> d!137181 (=> (not res!829111) (not e!705164))))

(declare-fun lt!562731 () List!27397)

(assert (=> d!137181 (= res!829111 (isStrictlySorted!753 lt!562731))))

(declare-fun e!705166 () List!27397)

(assert (=> d!137181 (= lt!562731 e!705166)))

(declare-fun c!122047 () Bool)

(assert (=> d!137181 (= c!122047 (and (is-Cons!27393 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))) (= (_1!10162 (h!28611 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)))) key2!15)))))

(assert (=> d!137181 (isStrictlySorted!753 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)))))

(assert (=> d!137181 (= (removeStrictlySorted!131 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)) key2!15) lt!562731)))

(declare-fun b!1243791 () Bool)

(assert (=> b!1243791 (= e!705164 (not (containsKey!613 lt!562731 key2!15)))))

(declare-fun b!1243792 () Bool)

(assert (=> b!1243792 (= e!705166 (t!40852 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))))))

(declare-fun b!1243793 () Bool)

(declare-fun e!705165 () List!27397)

(assert (=> b!1243793 (= e!705165 Nil!27394)))

(declare-fun b!1243794 () Bool)

(assert (=> b!1243794 (= e!705165 ($colon$colon!626 (removeStrictlySorted!131 (t!40852 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))) key2!15) (h!28611 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)))))))

(declare-fun b!1243795 () Bool)

(assert (=> b!1243795 (= e!705166 e!705165)))

(declare-fun c!122048 () Bool)

(assert (=> b!1243795 (= c!122048 (and (is-Cons!27393 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20))) (not (= (_1!10162 (h!28611 (t!40852 (insertStrictlySorted!440 (t!40852 l!644) key1!25 v1!20)))) key2!15))))))

(assert (= (and d!137181 c!122047) b!1243792))

(assert (= (and d!137181 (not c!122047)) b!1243795))

(assert (= (and b!1243795 c!122048) b!1243794))

(assert (= (and b!1243795 (not c!122048)) b!1243793))

(assert (= (and d!137181 res!829111) b!1243791))

(declare-fun m!1146787 () Bool)

(assert (=> d!137181 m!1146787))

(assert (=> d!137181 m!1146707))

(declare-fun m!1146789 () Bool)

(assert (=> b!1243791 m!1146789))

(declare-fun m!1146791 () Bool)

(assert (=> b!1243794 m!1146791))

(assert (=> b!1243794 m!1146791))

(declare-fun m!1146793 () Bool)

(assert (=> b!1243794 m!1146793))

(assert (=> b!1243472 d!137181))

(declare-fun d!137183 () Bool)

(assert (=> d!137183 (= ($colon$colon!626 e!705039 (ite c!121999 (h!28611 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) (tuple2!20303 key1!25 v1!20))) (Cons!27393 (ite c!121999 (h!28611 (removeStrictlySorted!131 (t!40852 l!644) key2!15)) (tuple2!20303 key1!25 v1!20)) e!705039))))

(assert (=> bm!61376 d!137183))

(declare-fun d!137185 () Bool)

(declare-fun res!829112 () Bool)

(declare-fun e!705167 () Bool)

(assert (=> d!137185 (=> res!829112 e!705167)))

(assert (=> d!137185 (= res!829112 (and (is-Cons!27393 lt!562721) (= (_1!10162 (h!28611 lt!562721)) key2!15)))))

(assert (=> d!137185 (= (containsKey!613 lt!562721 key2!15) e!705167)))

(declare-fun b!1243796 () Bool)

(declare-fun e!705168 () Bool)

(assert (=> b!1243796 (= e!705167 e!705168)))

(declare-fun res!829113 () Bool)

(assert (=> b!1243796 (=> (not res!829113) (not e!705168))))

(assert (=> b!1243796 (= res!829113 (and (or (not (is-Cons!27393 lt!562721)) (bvsle (_1!10162 (h!28611 lt!562721)) key2!15)) (is-Cons!27393 lt!562721) (bvslt (_1!10162 (h!28611 lt!562721)) key2!15)))))

(declare-fun b!1243797 () Bool)

(assert (=> b!1243797 (= e!705168 (containsKey!613 (t!40852 lt!562721) key2!15))))

(assert (= (and d!137185 (not res!829112)) b!1243796))

(assert (= (and b!1243796 res!829113) b!1243797))

(declare-fun m!1146795 () Bool)

(assert (=> b!1243797 m!1146795))

(assert (=> b!1243704 d!137185))

(declare-fun d!137187 () Bool)

(declare-fun res!829114 () Bool)

(declare-fun e!705169 () Bool)

(assert (=> d!137187 (=> res!829114 e!705169)))

(assert (=> d!137187 (= res!829114 (or (is-Nil!27394 (t!40852 (t!40852 l!644))) (is-Nil!27394 (t!40852 (t!40852 (t!40852 l!644))))))))

(assert (=> d!137187 (= (isStrictlySorted!753 (t!40852 (t!40852 l!644))) e!705169)))

(declare-fun b!1243798 () Bool)

(declare-fun e!705170 () Bool)

(assert (=> b!1243798 (= e!705169 e!705170)))

(declare-fun res!829115 () Bool)

(assert (=> b!1243798 (=> (not res!829115) (not e!705170))))

(assert (=> b!1243798 (= res!829115 (bvslt (_1!10162 (h!28611 (t!40852 (t!40852 l!644)))) (_1!10162 (h!28611 (t!40852 (t!40852 (t!40852 l!644)))))))))

(declare-fun b!1243799 () Bool)

(assert (=> b!1243799 (= e!705170 (isStrictlySorted!753 (t!40852 (t!40852 (t!40852 l!644)))))))

(assert (= (and d!137187 (not res!829114)) b!1243798))

(assert (= (and b!1243798 res!829115) b!1243799))

(declare-fun m!1146797 () Bool)

(assert (=> b!1243799 m!1146797))

(assert (=> b!1243440 d!137187))

(declare-fun bm!61399 () Bool)

(declare-fun call!61402 () List!27397)

(declare-fun call!61403 () List!27397)

(assert (=> bm!61399 (= call!61402 call!61403)))

(declare-fun b!1243800 () Bool)

(declare-fun e!705174 () List!27397)

(assert (=> b!1243800 (= e!705174 (insertStrictlySorted!440 (t!40852 (t!40852 (t!40852 l!644))) key1!25 v1!20))))

(declare-fun b!1243801 () Bool)

(declare-fun c!122052 () Bool)

(assert (=> b!1243801 (= c!122052 (and (is-Cons!27393 (t!40852 (t!40852 l!644))) (bvsgt (_1!10162 (h!28611 (t!40852 (t!40852 l!644)))) key1!25)))))

(declare-fun e!705173 () List!27397)

(declare-fun e!705171 () List!27397)

(assert (=> b!1243801 (= e!705173 e!705171)))

(declare-fun b!1243802 () Bool)

(declare-fun res!829117 () Bool)

(declare-fun e!705175 () Bool)

(assert (=> b!1243802 (=> (not res!829117) (not e!705175))))

(declare-fun lt!562732 () List!27397)

(assert (=> b!1243802 (= res!829117 (containsKey!613 lt!562732 key1!25))))

(declare-fun b!1243803 () Bool)

(declare-fun e!705172 () List!27397)

(declare-fun call!61404 () List!27397)

(assert (=> b!1243803 (= e!705172 call!61404)))

(declare-fun d!137189 () Bool)

(assert (=> d!137189 e!705175))

(declare-fun res!829116 () Bool)

(assert (=> d!137189 (=> (not res!829116) (not e!705175))))

(assert (=> d!137189 (= res!829116 (isStrictlySorted!753 lt!562732))))

(assert (=> d!137189 (= lt!562732 e!705172)))

(declare-fun c!122051 () Bool)

(assert (=> d!137189 (= c!122051 (and (is-Cons!27393 (t!40852 (t!40852 l!644))) (bvslt (_1!10162 (h!28611 (t!40852 (t!40852 l!644)))) key1!25)))))

(assert (=> d!137189 (isStrictlySorted!753 (t!40852 (t!40852 l!644)))))

(assert (=> d!137189 (= (insertStrictlySorted!440 (t!40852 (t!40852 l!644)) key1!25 v1!20) lt!562732)))

(declare-fun b!1243804 () Bool)

(assert (=> b!1243804 (= e!705175 (contains!7428 lt!562732 (tuple2!20303 key1!25 v1!20)))))

(declare-fun b!1243805 () Bool)

(assert (=> b!1243805 (= e!705172 e!705173)))

(declare-fun c!122050 () Bool)

(assert (=> b!1243805 (= c!122050 (and (is-Cons!27393 (t!40852 (t!40852 l!644))) (= (_1!10162 (h!28611 (t!40852 (t!40852 l!644)))) key1!25)))))

(declare-fun b!1243806 () Bool)

(assert (=> b!1243806 (= e!705173 call!61403)))

(declare-fun bm!61400 () Bool)

(assert (=> bm!61400 (= call!61404 ($colon$colon!626 e!705174 (ite c!122051 (h!28611 (t!40852 (t!40852 l!644))) (tuple2!20303 key1!25 v1!20))))))

(declare-fun c!122049 () Bool)

(assert (=> bm!61400 (= c!122049 c!122051)))

(declare-fun b!1243807 () Bool)

(assert (=> b!1243807 (= e!705171 call!61402)))

(declare-fun b!1243808 () Bool)

(assert (=> b!1243808 (= e!705174 (ite c!122050 (t!40852 (t!40852 (t!40852 l!644))) (ite c!122052 (Cons!27393 (h!28611 (t!40852 (t!40852 l!644))) (t!40852 (t!40852 (t!40852 l!644)))) Nil!27394)))))

(declare-fun bm!61401 () Bool)

(assert (=> bm!61401 (= call!61403 call!61404)))

(declare-fun b!1243809 () Bool)

(assert (=> b!1243809 (= e!705171 call!61402)))

(assert (= (and d!137189 c!122051) b!1243803))

(assert (= (and d!137189 (not c!122051)) b!1243805))

(assert (= (and b!1243805 c!122050) b!1243806))

(assert (= (and b!1243805 (not c!122050)) b!1243801))

(assert (= (and b!1243801 c!122052) b!1243809))

(assert (= (and b!1243801 (not c!122052)) b!1243807))

(assert (= (or b!1243809 b!1243807) bm!61399))

(assert (= (or b!1243806 bm!61399) bm!61401))

(assert (= (or b!1243803 bm!61401) bm!61400))

(assert (= (and bm!61400 c!122049) b!1243800))

(assert (= (and bm!61400 (not c!122049)) b!1243808))

(assert (= (and d!137189 res!829116) b!1243802))

(assert (= (and b!1243802 res!829117) b!1243804))

(declare-fun m!1146799 () Bool)

(assert (=> d!137189 m!1146799))

(assert (=> d!137189 m!1146463))

(declare-fun m!1146801 () Bool)

(assert (=> b!1243804 m!1146801))

(declare-fun m!1146803 () Bool)

(assert (=> b!1243802 m!1146803))

(declare-fun m!1146805 () Bool)

(assert (=> bm!61400 m!1146805))

(declare-fun m!1146807 () Bool)

(assert (=> b!1243800 m!1146807))

(assert (=> b!1243675 d!137189))

(declare-fun d!137191 () Bool)

(declare-fun res!829118 () Bool)

(declare-fun e!705176 () Bool)

(assert (=> d!137191 (=> res!829118 e!705176)))

(assert (=> d!137191 (= res!829118 (and (is-Cons!27393 lt!562685) (= (_1!10162 (h!28611 lt!562685)) key2!15)))))

(assert (=> d!137191 (= (containsKey!613 lt!562685 key2!15) e!705176)))

(declare-fun b!1243810 () Bool)

(declare-fun e!705177 () Bool)

(assert (=> b!1243810 (= e!705176 e!705177)))

(declare-fun res!829119 () Bool)

(assert (=> b!1243810 (=> (not res!829119) (not e!705177))))

(assert (=> b!1243810 (= res!829119 (and (or (not (is-Cons!27393 lt!562685)) (bvsle (_1!10162 (h!28611 lt!562685)) key2!15)) (is-Cons!27393 lt!562685) (bvslt (_1!10162 (h!28611 lt!562685)) key2!15)))))

(declare-fun b!1243811 () Bool)

(assert (=> b!1243811 (= e!705177 (containsKey!613 (t!40852 lt!562685) key2!15))))

(assert (= (and d!137191 (not res!829118)) b!1243810))

(assert (= (and b!1243810 res!829119) b!1243811))

(declare-fun m!1146809 () Bool)

(assert (=> b!1243811 m!1146809))

(assert (=> b!1243469 d!137191))

(declare-fun d!137193 () Bool)

(assert (=> d!137193 (= ($colon$colon!626 (removeStrictlySorted!131 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15) (h!28611 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (Cons!27393 (h!28611 (insertStrictlySorted!440 l!644 key1!25 v1!20)) (removeStrictlySorted!131 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15)))))

(assert (=> b!1243701 d!137193))

(declare-fun d!137195 () Bool)

(declare-fun e!705178 () Bool)

(assert (=> d!137195 e!705178))

(declare-fun res!829120 () Bool)

(assert (=> d!137195 (=> (not res!829120) (not e!705178))))

(declare-fun lt!562733 () List!27397)

(assert (=> d!137195 (= res!829120 (isStrictlySorted!753 lt!562733))))

(declare-fun e!705180 () List!27397)

(assert (=> d!137195 (= lt!562733 e!705180)))

(declare-fun c!122053 () Bool)

(assert (=> d!137195 (= c!122053 (and (is-Cons!27393 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (= (_1!10162 (h!28611 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20)))) key2!15)))))

(assert (=> d!137195 (isStrictlySorted!753 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))

(assert (=> d!137195 (= (removeStrictlySorted!131 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20)) key2!15) lt!562733)))

(declare-fun b!1243812 () Bool)

(assert (=> b!1243812 (= e!705178 (not (containsKey!613 lt!562733 key2!15)))))

(declare-fun b!1243813 () Bool)

(assert (=> b!1243813 (= e!705180 (t!40852 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20))))))

(declare-fun b!1243814 () Bool)

(declare-fun e!705179 () List!27397)

(assert (=> b!1243814 (= e!705179 Nil!27394)))

(declare-fun b!1243815 () Bool)

(assert (=> b!1243815 (= e!705179 ($colon$colon!626 (removeStrictlySorted!131 (t!40852 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20))) key2!15) (h!28611 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20)))))))

(declare-fun b!1243816 () Bool)

(assert (=> b!1243816 (= e!705180 e!705179)))

(declare-fun c!122054 () Bool)

(assert (=> b!1243816 (= c!122054 (and (is-Cons!27393 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20))) (not (= (_1!10162 (h!28611 (t!40852 (insertStrictlySorted!440 l!644 key1!25 v1!20)))) key2!15))))))

(assert (= (and d!137195 c!122053) b!1243813))

(assert (= (and d!137195 (not c!122053)) b!1243816))

(assert (= (and b!1243816 c!122054) b!1243815))

(assert (= (and b!1243816 (not c!122054)) b!1243814))

(assert (= (and d!137195 res!829120) b!1243812))

(declare-fun m!1146811 () Bool)

(assert (=> d!137195 m!1146811))

(assert (=> d!137195 m!1146777))

(declare-fun m!1146813 () Bool)

(assert (=> b!1243812 m!1146813))

(declare-fun m!1146815 () Bool)

(assert (=> b!1243815 m!1146815))

(assert (=> b!1243815 m!1146815))

(declare-fun m!1146817 () Bool)

(assert (=> b!1243815 m!1146817))

(assert (=> b!1243701 d!137195))

(declare-fun d!137197 () Bool)

(assert (=> d!137197 (= ($colon$colon!626 (removeStrictlySorted!131 (t!40852 l!644) key2!15) (h!28611 l!644)) (Cons!27393 (h!28611 l!644) (removeStrictlySorted!131 (t!40852 l!644) key2!15)))))

(assert (=> b!1243637 d!137197))

(assert (=> b!1243637 d!137117))

(assert (=> b!1243434 d!137067))

(declare-fun b!1243817 () Bool)

(declare-fun e!705181 () Bool)

(declare-fun tp!92760 () Bool)

(assert (=> b!1243817 (= e!705181 (and tp_is_empty!31289 tp!92760))))

(assert (=> b!1243713 (= tp!92759 e!705181)))

(assert (= (and b!1243713 (is-Cons!27393 (t!40852 (t!40852 l!644)))) b!1243817))

(push 1)

(assert (not d!137195))

(assert (not b!1243817))

(assert (not b!1243811))

(assert (not b!1243767))

(assert (not b!1243802))

(assert (not b!1243733))

(assert (not b!1243765))

(assert (not b!1243737))

(assert (not d!137121))

(assert (not b!1243804))

(assert (not b!1243741))

(assert (not b!1243747))

(assert (not b!1243756))

(assert (not b!1243768))

(assert (not b!1243729))

(assert (not d!137157))

(assert (not b!1243745))

(assert (not bm!61394))

(assert (not b!1243723))

(assert (not b!1243751))

(assert (not b!1243779))

(assert (not b!1243783))

(assert (not b!1243785))

(assert (not b!1243789))

(assert (not b!1243735))

(assert (not b!1243786))

(assert (not d!137155))

(assert (not d!137139))

(assert (not d!137147))

(assert (not b!1243752))

(assert tp_is_empty!31289)

(assert (not bm!61400))

(assert (not b!1243815))

(assert (not d!137181))

(assert (not b!1243754))

(assert (not b!1243731))

(assert (not b!1243721))

(assert (not b!1243763))

(assert (not b!1243799))

(assert (not b!1243739))

(assert (not b!1243749))

(assert (not b!1243791))

(assert (not b!1243772))

(assert (not b!1243812))

(assert (not b!1243719))

(assert (not d!137189))

(assert (not d!137165))

(assert (not bm!61397))

(assert (not b!1243794))

(assert (not d!137177))

(assert (not b!1243743))

(assert (not b!1243781))

(assert (not b!1243770))

(assert (not b!1243797))

(assert (not d!137119))

(assert (not b!1243800))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

