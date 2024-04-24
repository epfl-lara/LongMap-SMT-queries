; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75298 () Bool)

(assert start!75298)

(declare-fun res!601758 () Bool)

(declare-fun e!493464 () Bool)

(assert (=> start!75298 (=> (not res!601758) (not e!493464))))

(declare-datatypes ((B!1268 0))(
  ( (B!1269 (val!8940 Int)) )
))
(declare-datatypes ((tuple2!11804 0))(
  ( (tuple2!11805 (_1!5913 (_ BitVec 64)) (_2!5913 B!1268)) )
))
(declare-datatypes ((List!17611 0))(
  ( (Nil!17608) (Cons!17607 (h!18744 tuple2!11804) (t!24880 List!17611)) )
))
(declare-fun l!906 () List!17611)

(declare-fun isStrictlySorted!465 (List!17611) Bool)

(assert (=> start!75298 (= res!601758 (isStrictlySorted!465 l!906))))

(assert (=> start!75298 e!493464))

(declare-fun e!493463 () Bool)

(assert (=> start!75298 e!493463))

(assert (=> start!75298 true))

(declare-fun tp_is_empty!17779 () Bool)

(assert (=> start!75298 tp_is_empty!17779))

(declare-fun b!886508 () Bool)

(declare-fun res!601757 () Bool)

(assert (=> b!886508 (=> (not res!601757) (not e!493464))))

(declare-fun key1!49 () (_ BitVec 64))

(get-info :version)

(assert (=> b!886508 (= res!601757 (or (not ((_ is Cons!17607) l!906)) (bvsge (_1!5913 (h!18744 l!906)) key1!49)))))

(declare-fun b!886509 () Bool)

(declare-fun v1!38 () B!1268)

(declare-fun insertStrictlySorted!295 (List!17611 (_ BitVec 64) B!1268) List!17611)

(assert (=> b!886509 (= e!493464 (not (isStrictlySorted!465 (insertStrictlySorted!295 l!906 key1!49 v1!38))))))

(declare-fun b!886510 () Bool)

(declare-fun tp!54285 () Bool)

(assert (=> b!886510 (= e!493463 (and tp_is_empty!17779 tp!54285))))

(assert (= (and start!75298 res!601758) b!886508))

(assert (= (and b!886508 res!601757) b!886509))

(assert (= (and start!75298 ((_ is Cons!17607) l!906)) b!886510))

(declare-fun m!827075 () Bool)

(assert (=> start!75298 m!827075))

(declare-fun m!827077 () Bool)

(assert (=> b!886509 m!827077))

(assert (=> b!886509 m!827077))

(declare-fun m!827079 () Bool)

(assert (=> b!886509 m!827079))

(check-sat (not start!75298) (not b!886509) (not b!886510) tp_is_empty!17779)
(check-sat)
(get-model)

(declare-fun d!109743 () Bool)

(declare-fun res!601783 () Bool)

(declare-fun e!493489 () Bool)

(assert (=> d!109743 (=> res!601783 e!493489)))

(assert (=> d!109743 (= res!601783 (or ((_ is Nil!17608) l!906) ((_ is Nil!17608) (t!24880 l!906))))))

(assert (=> d!109743 (= (isStrictlySorted!465 l!906) e!493489)))

(declare-fun b!886541 () Bool)

(declare-fun e!493490 () Bool)

(assert (=> b!886541 (= e!493489 e!493490)))

(declare-fun res!601784 () Bool)

(assert (=> b!886541 (=> (not res!601784) (not e!493490))))

(assert (=> b!886541 (= res!601784 (bvslt (_1!5913 (h!18744 l!906)) (_1!5913 (h!18744 (t!24880 l!906)))))))

(declare-fun b!886542 () Bool)

(assert (=> b!886542 (= e!493490 (isStrictlySorted!465 (t!24880 l!906)))))

(assert (= (and d!109743 (not res!601783)) b!886541))

(assert (= (and b!886541 res!601784) b!886542))

(declare-fun m!827093 () Bool)

(assert (=> b!886542 m!827093))

(assert (=> start!75298 d!109743))

(declare-fun d!109749 () Bool)

(declare-fun res!601785 () Bool)

(declare-fun e!493491 () Bool)

(assert (=> d!109749 (=> res!601785 e!493491)))

(assert (=> d!109749 (= res!601785 (or ((_ is Nil!17608) (insertStrictlySorted!295 l!906 key1!49 v1!38)) ((_ is Nil!17608) (t!24880 (insertStrictlySorted!295 l!906 key1!49 v1!38)))))))

(assert (=> d!109749 (= (isStrictlySorted!465 (insertStrictlySorted!295 l!906 key1!49 v1!38)) e!493491)))

(declare-fun b!886543 () Bool)

(declare-fun e!493492 () Bool)

(assert (=> b!886543 (= e!493491 e!493492)))

(declare-fun res!601786 () Bool)

(assert (=> b!886543 (=> (not res!601786) (not e!493492))))

(assert (=> b!886543 (= res!601786 (bvslt (_1!5913 (h!18744 (insertStrictlySorted!295 l!906 key1!49 v1!38))) (_1!5913 (h!18744 (t!24880 (insertStrictlySorted!295 l!906 key1!49 v1!38))))))))

(declare-fun b!886544 () Bool)

(assert (=> b!886544 (= e!493492 (isStrictlySorted!465 (t!24880 (insertStrictlySorted!295 l!906 key1!49 v1!38))))))

(assert (= (and d!109749 (not res!601785)) b!886543))

(assert (= (and b!886543 res!601786) b!886544))

(declare-fun m!827095 () Bool)

(assert (=> b!886544 m!827095))

(assert (=> b!886509 d!109749))

(declare-fun bm!39182 () Bool)

(declare-fun call!39187 () List!17611)

(declare-fun call!39186 () List!17611)

(assert (=> bm!39182 (= call!39187 call!39186)))

(declare-fun b!886613 () Bool)

(declare-fun e!493531 () List!17611)

(assert (=> b!886613 (= e!493531 (insertStrictlySorted!295 (t!24880 l!906) key1!49 v1!38))))

(declare-fun d!109751 () Bool)

(declare-fun e!493535 () Bool)

(assert (=> d!109751 e!493535))

(declare-fun res!601807 () Bool)

(assert (=> d!109751 (=> (not res!601807) (not e!493535))))

(declare-fun lt!401403 () List!17611)

(assert (=> d!109751 (= res!601807 (isStrictlySorted!465 lt!401403))))

(declare-fun e!493532 () List!17611)

(assert (=> d!109751 (= lt!401403 e!493532)))

(declare-fun c!93624 () Bool)

(assert (=> d!109751 (= c!93624 (and ((_ is Cons!17607) l!906) (bvslt (_1!5913 (h!18744 l!906)) key1!49)))))

(assert (=> d!109751 (isStrictlySorted!465 l!906)))

(assert (=> d!109751 (= (insertStrictlySorted!295 l!906 key1!49 v1!38) lt!401403)))

(declare-fun bm!39183 () Bool)

(declare-fun $colon$colon!542 (List!17611 tuple2!11804) List!17611)

(assert (=> bm!39183 (= call!39186 ($colon$colon!542 e!493531 (ite c!93624 (h!18744 l!906) (tuple2!11805 key1!49 v1!38))))))

(declare-fun c!93627 () Bool)

(assert (=> bm!39183 (= c!93627 c!93624)))

(declare-fun b!886614 () Bool)

(declare-fun e!493534 () List!17611)

(assert (=> b!886614 (= e!493534 call!39187)))

(declare-fun b!886615 () Bool)

(declare-fun c!93625 () Bool)

(assert (=> b!886615 (= c!93625 (and ((_ is Cons!17607) l!906) (bvsgt (_1!5913 (h!18744 l!906)) key1!49)))))

(declare-fun e!493533 () List!17611)

(assert (=> b!886615 (= e!493534 e!493533)))

(declare-fun c!93626 () Bool)

(declare-fun b!886616 () Bool)

(assert (=> b!886616 (= e!493531 (ite c!93626 (t!24880 l!906) (ite c!93625 (Cons!17607 (h!18744 l!906) (t!24880 l!906)) Nil!17608)))))

(declare-fun b!886617 () Bool)

(declare-fun contains!4274 (List!17611 tuple2!11804) Bool)

(assert (=> b!886617 (= e!493535 (contains!4274 lt!401403 (tuple2!11805 key1!49 v1!38)))))

(declare-fun b!886618 () Bool)

(declare-fun call!39185 () List!17611)

(assert (=> b!886618 (= e!493533 call!39185)))

(declare-fun b!886619 () Bool)

(declare-fun res!601808 () Bool)

(assert (=> b!886619 (=> (not res!601808) (not e!493535))))

(declare-fun containsKey!411 (List!17611 (_ BitVec 64)) Bool)

(assert (=> b!886619 (= res!601808 (containsKey!411 lt!401403 key1!49))))

(declare-fun b!886620 () Bool)

(assert (=> b!886620 (= e!493533 call!39185)))

(declare-fun b!886621 () Bool)

(assert (=> b!886621 (= e!493532 e!493534)))

(assert (=> b!886621 (= c!93626 (and ((_ is Cons!17607) l!906) (= (_1!5913 (h!18744 l!906)) key1!49)))))

(declare-fun b!886622 () Bool)

(assert (=> b!886622 (= e!493532 call!39186)))

(declare-fun bm!39184 () Bool)

(assert (=> bm!39184 (= call!39185 call!39187)))

(assert (= (and d!109751 c!93624) b!886622))

(assert (= (and d!109751 (not c!93624)) b!886621))

(assert (= (and b!886621 c!93626) b!886614))

(assert (= (and b!886621 (not c!93626)) b!886615))

(assert (= (and b!886615 c!93625) b!886620))

(assert (= (and b!886615 (not c!93625)) b!886618))

(assert (= (or b!886620 b!886618) bm!39184))

(assert (= (or b!886614 bm!39184) bm!39182))

(assert (= (or b!886622 bm!39182) bm!39183))

(assert (= (and bm!39183 c!93627) b!886613))

(assert (= (and bm!39183 (not c!93627)) b!886616))

(assert (= (and d!109751 res!601807) b!886619))

(assert (= (and b!886619 res!601808) b!886617))

(declare-fun m!827105 () Bool)

(assert (=> b!886617 m!827105))

(declare-fun m!827107 () Bool)

(assert (=> b!886619 m!827107))

(declare-fun m!827109 () Bool)

(assert (=> d!109751 m!827109))

(assert (=> d!109751 m!827075))

(declare-fun m!827111 () Bool)

(assert (=> bm!39183 m!827111))

(declare-fun m!827113 () Bool)

(assert (=> b!886613 m!827113))

(assert (=> b!886509 d!109751))

(declare-fun b!886651 () Bool)

(declare-fun e!493550 () Bool)

(declare-fun tp!54296 () Bool)

(assert (=> b!886651 (= e!493550 (and tp_is_empty!17779 tp!54296))))

(assert (=> b!886510 (= tp!54285 e!493550)))

(assert (= (and b!886510 ((_ is Cons!17607) (t!24880 l!906))) b!886651))

(check-sat (not b!886544) (not b!886617) (not b!886542) tp_is_empty!17779 (not b!886619) (not bm!39183) (not b!886613) (not d!109751) (not b!886651))
(check-sat)
