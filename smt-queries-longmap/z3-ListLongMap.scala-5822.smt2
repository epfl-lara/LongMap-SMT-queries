; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75262 () Bool)

(assert start!75262)

(declare-fun b!886204 () Bool)

(declare-fun res!601639 () Bool)

(declare-fun e!493290 () Bool)

(assert (=> b!886204 (=> (not res!601639) (not e!493290))))

(declare-datatypes ((B!1250 0))(
  ( (B!1251 (val!8931 Int)) )
))
(declare-datatypes ((tuple2!11786 0))(
  ( (tuple2!11787 (_1!5904 (_ BitVec 64)) (_2!5904 B!1250)) )
))
(declare-datatypes ((List!17602 0))(
  ( (Nil!17599) (Cons!17598 (h!18735 tuple2!11786) (t!24871 List!17602)) )
))
(declare-fun l!906 () List!17602)

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!886204 (= res!601639 (and ((_ is Cons!17598) l!906) (bvslt (_1!5904 (h!18735 l!906)) key1!49)))))

(declare-fun b!886206 () Bool)

(declare-fun v1!38 () B!1250)

(declare-fun isStrictlySorted!459 (List!17602) Bool)

(declare-fun insertStrictlySorted!289 (List!17602 (_ BitVec 64) B!1250) List!17602)

(assert (=> b!886206 (= e!493290 (not (isStrictlySorted!459 (insertStrictlySorted!289 l!906 key1!49 v1!38))))))

(declare-fun v2!16 () B!1250)

(assert (=> b!886206 (= (insertStrictlySorted!289 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!289 (t!24871 l!906) key1!49 v2!16))))

(declare-datatypes ((Unit!30208 0))(
  ( (Unit!30209) )
))
(declare-fun lt!401354 () Unit!30208)

(declare-fun lemmaInsertStrictlySortedErasesIfSameKey!7 (List!17602 (_ BitVec 64) B!1250 B!1250) Unit!30208)

(assert (=> b!886206 (= lt!401354 (lemmaInsertStrictlySortedErasesIfSameKey!7 (t!24871 l!906) key1!49 v1!38 v2!16))))

(declare-fun b!886207 () Bool)

(declare-fun e!493289 () Bool)

(declare-fun tp_is_empty!17761 () Bool)

(declare-fun tp!54249 () Bool)

(assert (=> b!886207 (= e!493289 (and tp_is_empty!17761 tp!54249))))

(declare-fun res!601641 () Bool)

(assert (=> start!75262 (=> (not res!601641) (not e!493290))))

(assert (=> start!75262 (= res!601641 (isStrictlySorted!459 l!906))))

(assert (=> start!75262 e!493290))

(assert (=> start!75262 e!493289))

(assert (=> start!75262 true))

(assert (=> start!75262 tp_is_empty!17761))

(declare-fun b!886205 () Bool)

(declare-fun res!601640 () Bool)

(assert (=> b!886205 (=> (not res!601640) (not e!493290))))

(assert (=> b!886205 (= res!601640 (isStrictlySorted!459 (t!24871 l!906)))))

(assert (= (and start!75262 res!601641) b!886204))

(assert (= (and b!886204 res!601639) b!886205))

(assert (= (and b!886205 res!601640) b!886206))

(assert (= (and start!75262 ((_ is Cons!17598) l!906)) b!886207))

(declare-fun m!826853 () Bool)

(assert (=> b!886206 m!826853))

(declare-fun m!826855 () Bool)

(assert (=> b!886206 m!826855))

(declare-fun m!826857 () Bool)

(assert (=> b!886206 m!826857))

(declare-fun m!826859 () Bool)

(assert (=> b!886206 m!826859))

(declare-fun m!826861 () Bool)

(assert (=> b!886206 m!826861))

(assert (=> b!886206 m!826859))

(declare-fun m!826863 () Bool)

(assert (=> b!886206 m!826863))

(assert (=> b!886206 m!826853))

(declare-fun m!826865 () Bool)

(assert (=> start!75262 m!826865))

(declare-fun m!826867 () Bool)

(assert (=> b!886205 m!826867))

(check-sat (not b!886205) (not b!886206) tp_is_empty!17761 (not start!75262) (not b!886207))
(check-sat)
(get-model)

(declare-fun d!109689 () Bool)

(declare-fun res!601664 () Bool)

(declare-fun e!493307 () Bool)

(assert (=> d!109689 (=> res!601664 e!493307)))

(assert (=> d!109689 (= res!601664 (or ((_ is Nil!17599) (t!24871 l!906)) ((_ is Nil!17599) (t!24871 (t!24871 l!906)))))))

(assert (=> d!109689 (= (isStrictlySorted!459 (t!24871 l!906)) e!493307)))

(declare-fun b!886236 () Bool)

(declare-fun e!493308 () Bool)

(assert (=> b!886236 (= e!493307 e!493308)))

(declare-fun res!601665 () Bool)

(assert (=> b!886236 (=> (not res!601665) (not e!493308))))

(assert (=> b!886236 (= res!601665 (bvslt (_1!5904 (h!18735 (t!24871 l!906))) (_1!5904 (h!18735 (t!24871 (t!24871 l!906))))))))

(declare-fun b!886237 () Bool)

(assert (=> b!886237 (= e!493308 (isStrictlySorted!459 (t!24871 (t!24871 l!906))))))

(assert (= (and d!109689 (not res!601664)) b!886236))

(assert (= (and b!886236 res!601665) b!886237))

(declare-fun m!826901 () Bool)

(assert (=> b!886237 m!826901))

(assert (=> b!886205 d!109689))

(declare-fun d!109693 () Bool)

(declare-fun res!601666 () Bool)

(declare-fun e!493309 () Bool)

(assert (=> d!109693 (=> res!601666 e!493309)))

(assert (=> d!109693 (= res!601666 (or ((_ is Nil!17599) l!906) ((_ is Nil!17599) (t!24871 l!906))))))

(assert (=> d!109693 (= (isStrictlySorted!459 l!906) e!493309)))

(declare-fun b!886238 () Bool)

(declare-fun e!493310 () Bool)

(assert (=> b!886238 (= e!493309 e!493310)))

(declare-fun res!601667 () Bool)

(assert (=> b!886238 (=> (not res!601667) (not e!493310))))

(assert (=> b!886238 (= res!601667 (bvslt (_1!5904 (h!18735 l!906)) (_1!5904 (h!18735 (t!24871 l!906)))))))

(declare-fun b!886239 () Bool)

(assert (=> b!886239 (= e!493310 (isStrictlySorted!459 (t!24871 l!906)))))

(assert (= (and d!109693 (not res!601666)) b!886238))

(assert (= (and b!886238 res!601667) b!886239))

(assert (=> b!886239 m!826867))

(assert (=> start!75262 d!109693))

(declare-fun d!109695 () Bool)

(assert (=> d!109695 (= (insertStrictlySorted!289 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38) key1!49 v2!16) (insertStrictlySorted!289 (t!24871 l!906) key1!49 v2!16))))

(declare-fun lt!401366 () Unit!30208)

(declare-fun choose!1454 (List!17602 (_ BitVec 64) B!1250 B!1250) Unit!30208)

(assert (=> d!109695 (= lt!401366 (choose!1454 (t!24871 l!906) key1!49 v1!38 v2!16))))

(assert (=> d!109695 (isStrictlySorted!459 (t!24871 l!906))))

(assert (=> d!109695 (= (lemmaInsertStrictlySortedErasesIfSameKey!7 (t!24871 l!906) key1!49 v1!38 v2!16) lt!401366)))

(declare-fun bs!24836 () Bool)

(assert (= bs!24836 d!109695))

(assert (=> bs!24836 m!826853))

(assert (=> bs!24836 m!826867))

(declare-fun m!826905 () Bool)

(assert (=> bs!24836 m!826905))

(assert (=> bs!24836 m!826863))

(assert (=> bs!24836 m!826853))

(assert (=> bs!24836 m!826855))

(assert (=> b!886206 d!109695))

(declare-fun b!886320 () Bool)

(declare-fun e!493355 () List!17602)

(declare-fun call!39138 () List!17602)

(assert (=> b!886320 (= e!493355 call!39138)))

(declare-fun b!886321 () Bool)

(declare-fun e!493354 () List!17602)

(declare-fun call!39139 () List!17602)

(assert (=> b!886321 (= e!493354 call!39139)))

(declare-fun b!886322 () Bool)

(declare-fun res!601684 () Bool)

(declare-fun e!493353 () Bool)

(assert (=> b!886322 (=> (not res!601684) (not e!493353))))

(declare-fun lt!401378 () List!17602)

(declare-fun containsKey!407 (List!17602 (_ BitVec 64)) Bool)

(assert (=> b!886322 (= res!601684 (containsKey!407 lt!401378 key1!49))))

(declare-fun b!886323 () Bool)

(declare-fun c!93562 () Bool)

(assert (=> b!886323 (= c!93562 (and ((_ is Cons!17598) (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38)) (bvsgt (_1!5904 (h!18735 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun e!493352 () List!17602)

(assert (=> b!886323 (= e!493352 e!493355)))

(declare-fun bm!39134 () Bool)

(declare-fun call!39137 () List!17602)

(assert (=> bm!39134 (= call!39138 call!39137)))

(declare-fun b!886324 () Bool)

(assert (=> b!886324 (= e!493352 call!39137)))

(declare-fun e!493351 () List!17602)

(declare-fun b!886325 () Bool)

(assert (=> b!886325 (= e!493351 (insertStrictlySorted!289 (t!24871 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38)) key1!49 v2!16))))

(declare-fun d!109701 () Bool)

(assert (=> d!109701 e!493353))

(declare-fun res!601685 () Bool)

(assert (=> d!109701 (=> (not res!601685) (not e!493353))))

(assert (=> d!109701 (= res!601685 (isStrictlySorted!459 lt!401378))))

(assert (=> d!109701 (= lt!401378 e!493354)))

(declare-fun c!93561 () Bool)

(assert (=> d!109701 (= c!93561 (and ((_ is Cons!17598) (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38)) (bvslt (_1!5904 (h!18735 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38))) key1!49)))))

(assert (=> d!109701 (isStrictlySorted!459 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38))))

(assert (=> d!109701 (= (insertStrictlySorted!289 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38) key1!49 v2!16) lt!401378)))

(declare-fun b!886326 () Bool)

(assert (=> b!886326 (= e!493354 e!493352)))

(declare-fun c!93560 () Bool)

(assert (=> b!886326 (= c!93560 (and ((_ is Cons!17598) (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38)) (= (_1!5904 (h!18735 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38))) key1!49)))))

(declare-fun bm!39135 () Bool)

(assert (=> bm!39135 (= call!39137 call!39139)))

(declare-fun b!886327 () Bool)

(declare-fun contains!4270 (List!17602 tuple2!11786) Bool)

(assert (=> b!886327 (= e!493353 (contains!4270 lt!401378 (tuple2!11787 key1!49 v2!16)))))

(declare-fun b!886328 () Bool)

(assert (=> b!886328 (= e!493355 call!39138)))

(declare-fun bm!39136 () Bool)

(declare-fun $colon$colon!540 (List!17602 tuple2!11786) List!17602)

(assert (=> bm!39136 (= call!39139 ($colon$colon!540 e!493351 (ite c!93561 (h!18735 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38)) (tuple2!11787 key1!49 v2!16))))))

(declare-fun c!93563 () Bool)

(assert (=> bm!39136 (= c!93563 c!93561)))

(declare-fun b!886329 () Bool)

(assert (=> b!886329 (= e!493351 (ite c!93560 (t!24871 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38)) (ite c!93562 (Cons!17598 (h!18735 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38)) (t!24871 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38))) Nil!17599)))))

(assert (= (and d!109701 c!93561) b!886321))

(assert (= (and d!109701 (not c!93561)) b!886326))

(assert (= (and b!886326 c!93560) b!886324))

(assert (= (and b!886326 (not c!93560)) b!886323))

(assert (= (and b!886323 c!93562) b!886328))

(assert (= (and b!886323 (not c!93562)) b!886320))

(assert (= (or b!886328 b!886320) bm!39134))

(assert (= (or b!886324 bm!39134) bm!39135))

(assert (= (or b!886321 bm!39135) bm!39136))

(assert (= (and bm!39136 c!93563) b!886325))

(assert (= (and bm!39136 (not c!93563)) b!886329))

(assert (= (and d!109701 res!601685) b!886322))

(assert (= (and b!886322 res!601684) b!886327))

(declare-fun m!826931 () Bool)

(assert (=> b!886325 m!826931))

(declare-fun m!826933 () Bool)

(assert (=> b!886322 m!826933))

(declare-fun m!826935 () Bool)

(assert (=> bm!39136 m!826935))

(declare-fun m!826937 () Bool)

(assert (=> b!886327 m!826937))

(declare-fun m!826939 () Bool)

(assert (=> d!109701 m!826939))

(assert (=> d!109701 m!826853))

(declare-fun m!826941 () Bool)

(assert (=> d!109701 m!826941))

(assert (=> b!886206 d!109701))

(declare-fun b!886340 () Bool)

(declare-fun e!493365 () List!17602)

(declare-fun call!39144 () List!17602)

(assert (=> b!886340 (= e!493365 call!39144)))

(declare-fun b!886341 () Bool)

(declare-fun e!493364 () List!17602)

(declare-fun call!39145 () List!17602)

(assert (=> b!886341 (= e!493364 call!39145)))

(declare-fun b!886342 () Bool)

(declare-fun res!601688 () Bool)

(declare-fun e!493363 () Bool)

(assert (=> b!886342 (=> (not res!601688) (not e!493363))))

(declare-fun lt!401380 () List!17602)

(assert (=> b!886342 (= res!601688 (containsKey!407 lt!401380 key1!49))))

(declare-fun b!886343 () Bool)

(declare-fun c!93570 () Bool)

(assert (=> b!886343 (= c!93570 (and ((_ is Cons!17598) (t!24871 l!906)) (bvsgt (_1!5904 (h!18735 (t!24871 l!906))) key1!49)))))

(declare-fun e!493362 () List!17602)

(assert (=> b!886343 (= e!493362 e!493365)))

(declare-fun bm!39140 () Bool)

(declare-fun call!39143 () List!17602)

(assert (=> bm!39140 (= call!39144 call!39143)))

(declare-fun b!886344 () Bool)

(assert (=> b!886344 (= e!493362 call!39143)))

(declare-fun e!493361 () List!17602)

(declare-fun b!886345 () Bool)

(assert (=> b!886345 (= e!493361 (insertStrictlySorted!289 (t!24871 (t!24871 l!906)) key1!49 v2!16))))

(declare-fun d!109709 () Bool)

(assert (=> d!109709 e!493363))

(declare-fun res!601689 () Bool)

(assert (=> d!109709 (=> (not res!601689) (not e!493363))))

(assert (=> d!109709 (= res!601689 (isStrictlySorted!459 lt!401380))))

(assert (=> d!109709 (= lt!401380 e!493364)))

(declare-fun c!93569 () Bool)

(assert (=> d!109709 (= c!93569 (and ((_ is Cons!17598) (t!24871 l!906)) (bvslt (_1!5904 (h!18735 (t!24871 l!906))) key1!49)))))

(assert (=> d!109709 (isStrictlySorted!459 (t!24871 l!906))))

(assert (=> d!109709 (= (insertStrictlySorted!289 (t!24871 l!906) key1!49 v2!16) lt!401380)))

(declare-fun b!886346 () Bool)

(assert (=> b!886346 (= e!493364 e!493362)))

(declare-fun c!93568 () Bool)

(assert (=> b!886346 (= c!93568 (and ((_ is Cons!17598) (t!24871 l!906)) (= (_1!5904 (h!18735 (t!24871 l!906))) key1!49)))))

(declare-fun bm!39141 () Bool)

(assert (=> bm!39141 (= call!39143 call!39145)))

(declare-fun b!886347 () Bool)

(assert (=> b!886347 (= e!493363 (contains!4270 lt!401380 (tuple2!11787 key1!49 v2!16)))))

(declare-fun b!886348 () Bool)

(assert (=> b!886348 (= e!493365 call!39144)))

(declare-fun bm!39142 () Bool)

(assert (=> bm!39142 (= call!39145 ($colon$colon!540 e!493361 (ite c!93569 (h!18735 (t!24871 l!906)) (tuple2!11787 key1!49 v2!16))))))

(declare-fun c!93571 () Bool)

(assert (=> bm!39142 (= c!93571 c!93569)))

(declare-fun b!886349 () Bool)

(assert (=> b!886349 (= e!493361 (ite c!93568 (t!24871 (t!24871 l!906)) (ite c!93570 (Cons!17598 (h!18735 (t!24871 l!906)) (t!24871 (t!24871 l!906))) Nil!17599)))))

(assert (= (and d!109709 c!93569) b!886341))

(assert (= (and d!109709 (not c!93569)) b!886346))

(assert (= (and b!886346 c!93568) b!886344))

(assert (= (and b!886346 (not c!93568)) b!886343))

(assert (= (and b!886343 c!93570) b!886348))

(assert (= (and b!886343 (not c!93570)) b!886340))

(assert (= (or b!886348 b!886340) bm!39140))

(assert (= (or b!886344 bm!39140) bm!39141))

(assert (= (or b!886341 bm!39141) bm!39142))

(assert (= (and bm!39142 c!93571) b!886345))

(assert (= (and bm!39142 (not c!93571)) b!886349))

(assert (= (and d!109709 res!601689) b!886342))

(assert (= (and b!886342 res!601688) b!886347))

(declare-fun m!826953 () Bool)

(assert (=> b!886345 m!826953))

(declare-fun m!826955 () Bool)

(assert (=> b!886342 m!826955))

(declare-fun m!826957 () Bool)

(assert (=> bm!39142 m!826957))

(declare-fun m!826959 () Bool)

(assert (=> b!886347 m!826959))

(declare-fun m!826961 () Bool)

(assert (=> d!109709 m!826961))

(assert (=> d!109709 m!826867))

(assert (=> b!886206 d!109709))

(declare-fun b!886370 () Bool)

(declare-fun e!493380 () List!17602)

(declare-fun call!39153 () List!17602)

(assert (=> b!886370 (= e!493380 call!39153)))

(declare-fun b!886371 () Bool)

(declare-fun e!493379 () List!17602)

(declare-fun call!39154 () List!17602)

(assert (=> b!886371 (= e!493379 call!39154)))

(declare-fun b!886372 () Bool)

(declare-fun res!601694 () Bool)

(declare-fun e!493378 () Bool)

(assert (=> b!886372 (=> (not res!601694) (not e!493378))))

(declare-fun lt!401383 () List!17602)

(assert (=> b!886372 (= res!601694 (containsKey!407 lt!401383 key1!49))))

(declare-fun b!886373 () Bool)

(declare-fun c!93582 () Bool)

(assert (=> b!886373 (= c!93582 (and ((_ is Cons!17598) (t!24871 l!906)) (bvsgt (_1!5904 (h!18735 (t!24871 l!906))) key1!49)))))

(declare-fun e!493377 () List!17602)

(assert (=> b!886373 (= e!493377 e!493380)))

(declare-fun bm!39149 () Bool)

(declare-fun call!39152 () List!17602)

(assert (=> bm!39149 (= call!39153 call!39152)))

(declare-fun b!886374 () Bool)

(assert (=> b!886374 (= e!493377 call!39152)))

(declare-fun b!886375 () Bool)

(declare-fun e!493376 () List!17602)

(assert (=> b!886375 (= e!493376 (insertStrictlySorted!289 (t!24871 (t!24871 l!906)) key1!49 v1!38))))

(declare-fun d!109713 () Bool)

(assert (=> d!109713 e!493378))

(declare-fun res!601695 () Bool)

(assert (=> d!109713 (=> (not res!601695) (not e!493378))))

(assert (=> d!109713 (= res!601695 (isStrictlySorted!459 lt!401383))))

(assert (=> d!109713 (= lt!401383 e!493379)))

(declare-fun c!93581 () Bool)

(assert (=> d!109713 (= c!93581 (and ((_ is Cons!17598) (t!24871 l!906)) (bvslt (_1!5904 (h!18735 (t!24871 l!906))) key1!49)))))

(assert (=> d!109713 (isStrictlySorted!459 (t!24871 l!906))))

(assert (=> d!109713 (= (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38) lt!401383)))

(declare-fun b!886376 () Bool)

(assert (=> b!886376 (= e!493379 e!493377)))

(declare-fun c!93580 () Bool)

(assert (=> b!886376 (= c!93580 (and ((_ is Cons!17598) (t!24871 l!906)) (= (_1!5904 (h!18735 (t!24871 l!906))) key1!49)))))

(declare-fun bm!39150 () Bool)

(assert (=> bm!39150 (= call!39152 call!39154)))

(declare-fun b!886377 () Bool)

(assert (=> b!886377 (= e!493378 (contains!4270 lt!401383 (tuple2!11787 key1!49 v1!38)))))

(declare-fun b!886378 () Bool)

(assert (=> b!886378 (= e!493380 call!39153)))

(declare-fun bm!39151 () Bool)

(assert (=> bm!39151 (= call!39154 ($colon$colon!540 e!493376 (ite c!93581 (h!18735 (t!24871 l!906)) (tuple2!11787 key1!49 v1!38))))))

(declare-fun c!93583 () Bool)

(assert (=> bm!39151 (= c!93583 c!93581)))

(declare-fun b!886379 () Bool)

(assert (=> b!886379 (= e!493376 (ite c!93580 (t!24871 (t!24871 l!906)) (ite c!93582 (Cons!17598 (h!18735 (t!24871 l!906)) (t!24871 (t!24871 l!906))) Nil!17599)))))

(assert (= (and d!109713 c!93581) b!886371))

(assert (= (and d!109713 (not c!93581)) b!886376))

(assert (= (and b!886376 c!93580) b!886374))

(assert (= (and b!886376 (not c!93580)) b!886373))

(assert (= (and b!886373 c!93582) b!886378))

(assert (= (and b!886373 (not c!93582)) b!886370))

(assert (= (or b!886378 b!886370) bm!39149))

(assert (= (or b!886374 bm!39149) bm!39150))

(assert (= (or b!886371 bm!39150) bm!39151))

(assert (= (and bm!39151 c!93583) b!886375))

(assert (= (and bm!39151 (not c!93583)) b!886379))

(assert (= (and d!109713 res!601695) b!886372))

(assert (= (and b!886372 res!601694) b!886377))

(declare-fun m!826973 () Bool)

(assert (=> b!886375 m!826973))

(declare-fun m!826977 () Bool)

(assert (=> b!886372 m!826977))

(declare-fun m!826983 () Bool)

(assert (=> bm!39151 m!826983))

(declare-fun m!826987 () Bool)

(assert (=> b!886377 m!826987))

(declare-fun m!826991 () Bool)

(assert (=> d!109713 m!826991))

(assert (=> d!109713 m!826867))

(assert (=> b!886206 d!109713))

(declare-fun b!886388 () Bool)

(declare-fun e!493390 () List!17602)

(declare-fun call!39159 () List!17602)

(assert (=> b!886388 (= e!493390 call!39159)))

(declare-fun b!886390 () Bool)

(declare-fun e!493389 () List!17602)

(declare-fun call!39160 () List!17602)

(assert (=> b!886390 (= e!493389 call!39160)))

(declare-fun b!886391 () Bool)

(declare-fun res!601698 () Bool)

(declare-fun e!493388 () Bool)

(assert (=> b!886391 (=> (not res!601698) (not e!493388))))

(declare-fun lt!401384 () List!17602)

(assert (=> b!886391 (= res!601698 (containsKey!407 lt!401384 key1!49))))

(declare-fun b!886393 () Bool)

(declare-fun c!93590 () Bool)

(assert (=> b!886393 (= c!93590 (and ((_ is Cons!17598) l!906) (bvsgt (_1!5904 (h!18735 l!906)) key1!49)))))

(declare-fun e!493387 () List!17602)

(assert (=> b!886393 (= e!493387 e!493390)))

(declare-fun bm!39155 () Bool)

(declare-fun call!39156 () List!17602)

(assert (=> bm!39155 (= call!39159 call!39156)))

(declare-fun b!886394 () Bool)

(assert (=> b!886394 (= e!493387 call!39156)))

(declare-fun e!493385 () List!17602)

(declare-fun b!886395 () Bool)

(assert (=> b!886395 (= e!493385 (insertStrictlySorted!289 (t!24871 l!906) key1!49 v1!38))))

(declare-fun d!109719 () Bool)

(assert (=> d!109719 e!493388))

(declare-fun res!601699 () Bool)

(assert (=> d!109719 (=> (not res!601699) (not e!493388))))

(assert (=> d!109719 (= res!601699 (isStrictlySorted!459 lt!401384))))

(assert (=> d!109719 (= lt!401384 e!493389)))

(declare-fun c!93589 () Bool)

(assert (=> d!109719 (= c!93589 (and ((_ is Cons!17598) l!906) (bvslt (_1!5904 (h!18735 l!906)) key1!49)))))

(assert (=> d!109719 (isStrictlySorted!459 l!906)))

(assert (=> d!109719 (= (insertStrictlySorted!289 l!906 key1!49 v1!38) lt!401384)))

(declare-fun b!886396 () Bool)

(assert (=> b!886396 (= e!493389 e!493387)))

(declare-fun c!93588 () Bool)

(assert (=> b!886396 (= c!93588 (and ((_ is Cons!17598) l!906) (= (_1!5904 (h!18735 l!906)) key1!49)))))

(declare-fun bm!39156 () Bool)

(assert (=> bm!39156 (= call!39156 call!39160)))

(declare-fun b!886397 () Bool)

(assert (=> b!886397 (= e!493388 (contains!4270 lt!401384 (tuple2!11787 key1!49 v1!38)))))

(declare-fun b!886398 () Bool)

(assert (=> b!886398 (= e!493390 call!39159)))

(declare-fun bm!39157 () Bool)

(assert (=> bm!39157 (= call!39160 ($colon$colon!540 e!493385 (ite c!93589 (h!18735 l!906) (tuple2!11787 key1!49 v1!38))))))

(declare-fun c!93591 () Bool)

(assert (=> bm!39157 (= c!93591 c!93589)))

(declare-fun b!886399 () Bool)

(assert (=> b!886399 (= e!493385 (ite c!93588 (t!24871 l!906) (ite c!93590 (Cons!17598 (h!18735 l!906) (t!24871 l!906)) Nil!17599)))))

(assert (= (and d!109719 c!93589) b!886390))

(assert (= (and d!109719 (not c!93589)) b!886396))

(assert (= (and b!886396 c!93588) b!886394))

(assert (= (and b!886396 (not c!93588)) b!886393))

(assert (= (and b!886393 c!93590) b!886398))

(assert (= (and b!886393 (not c!93590)) b!886388))

(assert (= (or b!886398 b!886388) bm!39155))

(assert (= (or b!886394 bm!39155) bm!39156))

(assert (= (or b!886390 bm!39156) bm!39157))

(assert (= (and bm!39157 c!93591) b!886395))

(assert (= (and bm!39157 (not c!93591)) b!886399))

(assert (= (and d!109719 res!601699) b!886391))

(assert (= (and b!886391 res!601698) b!886397))

(assert (=> b!886395 m!826853))

(declare-fun m!826995 () Bool)

(assert (=> b!886391 m!826995))

(declare-fun m!826999 () Bool)

(assert (=> bm!39157 m!826999))

(declare-fun m!827003 () Bool)

(assert (=> b!886397 m!827003))

(declare-fun m!827007 () Bool)

(assert (=> d!109719 m!827007))

(assert (=> d!109719 m!826865))

(assert (=> b!886206 d!109719))

(declare-fun d!109723 () Bool)

(declare-fun res!601704 () Bool)

(declare-fun e!493397 () Bool)

(assert (=> d!109723 (=> res!601704 e!493397)))

(assert (=> d!109723 (= res!601704 (or ((_ is Nil!17599) (insertStrictlySorted!289 l!906 key1!49 v1!38)) ((_ is Nil!17599) (t!24871 (insertStrictlySorted!289 l!906 key1!49 v1!38)))))))

(assert (=> d!109723 (= (isStrictlySorted!459 (insertStrictlySorted!289 l!906 key1!49 v1!38)) e!493397)))

(declare-fun b!886404 () Bool)

(declare-fun e!493399 () Bool)

(assert (=> b!886404 (= e!493397 e!493399)))

(declare-fun res!601705 () Bool)

(assert (=> b!886404 (=> (not res!601705) (not e!493399))))

(assert (=> b!886404 (= res!601705 (bvslt (_1!5904 (h!18735 (insertStrictlySorted!289 l!906 key1!49 v1!38))) (_1!5904 (h!18735 (t!24871 (insertStrictlySorted!289 l!906 key1!49 v1!38))))))))

(declare-fun b!886405 () Bool)

(assert (=> b!886405 (= e!493399 (isStrictlySorted!459 (t!24871 (insertStrictlySorted!289 l!906 key1!49 v1!38))))))

(assert (= (and d!109723 (not res!601704)) b!886404))

(assert (= (and b!886404 res!601705) b!886405))

(declare-fun m!827011 () Bool)

(assert (=> b!886405 m!827011))

(assert (=> b!886206 d!109723))

(declare-fun b!886422 () Bool)

(declare-fun e!493406 () Bool)

(declare-fun tp!54258 () Bool)

(assert (=> b!886422 (= e!493406 (and tp_is_empty!17761 tp!54258))))

(assert (=> b!886207 (= tp!54249 e!493406)))

(assert (= (and b!886207 ((_ is Cons!17598) (t!24871 l!906))) b!886422))

(check-sat (not d!109719) (not b!886342) (not b!886405) (not b!886397) (not b!886237) (not bm!39151) (not b!886377) tp_is_empty!17761 (not d!109713) (not b!886391) (not b!886327) (not bm!39136) (not b!886372) (not b!886422) (not b!886325) (not bm!39157) (not b!886395) (not b!886322) (not d!109709) (not b!886347) (not d!109701) (not b!886239) (not bm!39142) (not b!886375) (not d!109695) (not b!886345))
(check-sat)
