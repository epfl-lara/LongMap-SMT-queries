; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106620 () Bool)

(assert start!106620)

(declare-fun b!1266640 () Bool)

(declare-fun res!843031 () Bool)

(declare-fun e!721430 () Bool)

(assert (=> b!1266640 (=> (not res!843031) (not e!721430))))

(declare-datatypes ((B!1964 0))(
  ( (B!1965 (val!16317 Int)) )
))
(declare-datatypes ((tuple2!21162 0))(
  ( (tuple2!21163 (_1!10592 (_ BitVec 64)) (_2!10592 B!1964)) )
))
(declare-datatypes ((List!28345 0))(
  ( (Nil!28342) (Cons!28341 (h!29559 tuple2!21162) (t!41858 List!28345)) )
))
(declare-fun l!706 () List!28345)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun containsKey!643 (List!28345 (_ BitVec 64)) Bool)

(assert (=> b!1266640 (= res!843031 (not (containsKey!643 l!706 key1!31)))))

(declare-fun res!843032 () Bool)

(assert (=> start!106620 (=> (not res!843032) (not e!721430))))

(declare-fun isStrictlySorted!772 (List!28345) Bool)

(assert (=> start!106620 (= res!843032 (isStrictlySorted!772 l!706))))

(assert (=> start!106620 e!721430))

(declare-fun e!721431 () Bool)

(assert (=> start!106620 e!721431))

(assert (=> start!106620 true))

(declare-fun tp_is_empty!32497 () Bool)

(assert (=> start!106620 tp_is_empty!32497))

(declare-fun b!1266643 () Bool)

(declare-fun tp!96320 () Bool)

(assert (=> b!1266643 (= e!721431 (and tp_is_empty!32497 tp!96320))))

(declare-fun b!1266641 () Bool)

(declare-fun res!843030 () Bool)

(assert (=> b!1266641 (=> (not res!843030) (not e!721430))))

(get-info :version)

(assert (=> b!1266641 (= res!843030 (not ((_ is Cons!28341) l!706)))))

(declare-fun v1!26 () B!1964)

(declare-fun b!1266642 () Bool)

(declare-fun insertStrictlySorted!463 (List!28345 (_ BitVec 64) B!1964) List!28345)

(assert (=> b!1266642 (= e!721430 (not (isStrictlySorted!772 (insertStrictlySorted!463 l!706 key1!31 v1!26))))))

(assert (= (and start!106620 res!843032) b!1266640))

(assert (= (and b!1266640 res!843031) b!1266641))

(assert (= (and b!1266641 res!843030) b!1266642))

(assert (= (and start!106620 ((_ is Cons!28341) l!706)) b!1266643))

(declare-fun m!1167187 () Bool)

(assert (=> b!1266640 m!1167187))

(declare-fun m!1167189 () Bool)

(assert (=> start!106620 m!1167189))

(declare-fun m!1167191 () Bool)

(assert (=> b!1266642 m!1167191))

(assert (=> b!1266642 m!1167191))

(declare-fun m!1167193 () Bool)

(assert (=> b!1266642 m!1167193))

(check-sat tp_is_empty!32497 (not start!106620) (not b!1266642) (not b!1266643) (not b!1266640))
(check-sat)
(get-model)

(declare-fun d!139349 () Bool)

(declare-fun res!843064 () Bool)

(declare-fun e!721457 () Bool)

(assert (=> d!139349 (=> res!843064 e!721457)))

(assert (=> d!139349 (= res!843064 (or ((_ is Nil!28342) l!706) ((_ is Nil!28342) (t!41858 l!706))))))

(assert (=> d!139349 (= (isStrictlySorted!772 l!706) e!721457)))

(declare-fun b!1266682 () Bool)

(declare-fun e!721459 () Bool)

(assert (=> b!1266682 (= e!721457 e!721459)))

(declare-fun res!843066 () Bool)

(assert (=> b!1266682 (=> (not res!843066) (not e!721459))))

(assert (=> b!1266682 (= res!843066 (bvslt (_1!10592 (h!29559 l!706)) (_1!10592 (h!29559 (t!41858 l!706)))))))

(declare-fun b!1266683 () Bool)

(assert (=> b!1266683 (= e!721459 (isStrictlySorted!772 (t!41858 l!706)))))

(assert (= (and d!139349 (not res!843064)) b!1266682))

(assert (= (and b!1266682 res!843066) b!1266683))

(declare-fun m!1167212 () Bool)

(assert (=> b!1266683 m!1167212))

(assert (=> start!106620 d!139349))

(declare-fun d!139357 () Bool)

(declare-fun res!843068 () Bool)

(declare-fun e!721461 () Bool)

(assert (=> d!139357 (=> res!843068 e!721461)))

(assert (=> d!139357 (= res!843068 (or ((_ is Nil!28342) (insertStrictlySorted!463 l!706 key1!31 v1!26)) ((_ is Nil!28342) (t!41858 (insertStrictlySorted!463 l!706 key1!31 v1!26)))))))

(assert (=> d!139357 (= (isStrictlySorted!772 (insertStrictlySorted!463 l!706 key1!31 v1!26)) e!721461)))

(declare-fun b!1266685 () Bool)

(declare-fun e!721463 () Bool)

(assert (=> b!1266685 (= e!721461 e!721463)))

(declare-fun res!843070 () Bool)

(assert (=> b!1266685 (=> (not res!843070) (not e!721463))))

(assert (=> b!1266685 (= res!843070 (bvslt (_1!10592 (h!29559 (insertStrictlySorted!463 l!706 key1!31 v1!26))) (_1!10592 (h!29559 (t!41858 (insertStrictlySorted!463 l!706 key1!31 v1!26))))))))

(declare-fun b!1266687 () Bool)

(assert (=> b!1266687 (= e!721463 (isStrictlySorted!772 (t!41858 (insertStrictlySorted!463 l!706 key1!31 v1!26))))))

(assert (= (and d!139357 (not res!843068)) b!1266685))

(assert (= (and b!1266685 res!843070) b!1266687))

(declare-fun m!1167216 () Bool)

(assert (=> b!1266687 m!1167216))

(assert (=> b!1266642 d!139357))

(declare-fun b!1266766 () Bool)

(declare-fun e!721512 () List!28345)

(declare-fun call!62482 () List!28345)

(assert (=> b!1266766 (= e!721512 call!62482)))

(declare-fun bm!62479 () Bool)

(declare-fun call!62484 () List!28345)

(assert (=> bm!62479 (= call!62484 call!62482)))

(declare-fun e!721511 () List!28345)

(declare-fun b!1266767 () Bool)

(assert (=> b!1266767 (= e!721511 (insertStrictlySorted!463 (t!41858 l!706) key1!31 v1!26))))

(declare-fun bm!62480 () Bool)

(declare-fun c!123713 () Bool)

(declare-fun $colon$colon!637 (List!28345 tuple2!21162) List!28345)

(assert (=> bm!62480 (= call!62482 ($colon$colon!637 e!721511 (ite c!123713 (h!29559 l!706) (tuple2!21163 key1!31 v1!26))))))

(declare-fun c!123714 () Bool)

(assert (=> bm!62480 (= c!123714 c!123713)))

(declare-fun b!1266768 () Bool)

(declare-fun c!123715 () Bool)

(declare-fun c!123712 () Bool)

(assert (=> b!1266768 (= e!721511 (ite c!123712 (t!41858 l!706) (ite c!123715 (Cons!28341 (h!29559 l!706) (t!41858 l!706)) Nil!28342)))))

(declare-fun b!1266769 () Bool)

(declare-fun e!721509 () List!28345)

(assert (=> b!1266769 (= e!721509 call!62484)))

(declare-fun b!1266770 () Bool)

(declare-fun res!843093 () Bool)

(declare-fun e!721513 () Bool)

(assert (=> b!1266770 (=> (not res!843093) (not e!721513))))

(declare-fun lt!574533 () List!28345)

(assert (=> b!1266770 (= res!843093 (containsKey!643 lt!574533 key1!31))))

(declare-fun d!139361 () Bool)

(assert (=> d!139361 e!721513))

(declare-fun res!843094 () Bool)

(assert (=> d!139361 (=> (not res!843094) (not e!721513))))

(assert (=> d!139361 (= res!843094 (isStrictlySorted!772 lt!574533))))

(assert (=> d!139361 (= lt!574533 e!721512)))

(assert (=> d!139361 (= c!123713 (and ((_ is Cons!28341) l!706) (bvslt (_1!10592 (h!29559 l!706)) key1!31)))))

(assert (=> d!139361 (isStrictlySorted!772 l!706)))

(assert (=> d!139361 (= (insertStrictlySorted!463 l!706 key1!31 v1!26) lt!574533)))

(declare-fun b!1266771 () Bool)

(declare-fun e!721510 () List!28345)

(declare-fun call!62483 () List!28345)

(assert (=> b!1266771 (= e!721510 call!62483)))

(declare-fun b!1266772 () Bool)

(assert (=> b!1266772 (= c!123715 (and ((_ is Cons!28341) l!706) (bvsgt (_1!10592 (h!29559 l!706)) key1!31)))))

(assert (=> b!1266772 (= e!721509 e!721510)))

(declare-fun b!1266773 () Bool)

(assert (=> b!1266773 (= e!721510 call!62483)))

(declare-fun b!1266774 () Bool)

(assert (=> b!1266774 (= e!721512 e!721509)))

(assert (=> b!1266774 (= c!123712 (and ((_ is Cons!28341) l!706) (= (_1!10592 (h!29559 l!706)) key1!31)))))

(declare-fun b!1266775 () Bool)

(declare-fun contains!7662 (List!28345 tuple2!21162) Bool)

(assert (=> b!1266775 (= e!721513 (contains!7662 lt!574533 (tuple2!21163 key1!31 v1!26)))))

(declare-fun bm!62481 () Bool)

(assert (=> bm!62481 (= call!62483 call!62484)))

(assert (= (and d!139361 c!123713) b!1266766))

(assert (= (and d!139361 (not c!123713)) b!1266774))

(assert (= (and b!1266774 c!123712) b!1266769))

(assert (= (and b!1266774 (not c!123712)) b!1266772))

(assert (= (and b!1266772 c!123715) b!1266771))

(assert (= (and b!1266772 (not c!123715)) b!1266773))

(assert (= (or b!1266771 b!1266773) bm!62481))

(assert (= (or b!1266769 bm!62481) bm!62479))

(assert (= (or b!1266766 bm!62479) bm!62480))

(assert (= (and bm!62480 c!123714) b!1266767))

(assert (= (and bm!62480 (not c!123714)) b!1266768))

(assert (= (and d!139361 res!843094) b!1266770))

(assert (= (and b!1266770 res!843093) b!1266775))

(declare-fun m!1167229 () Bool)

(assert (=> b!1266767 m!1167229))

(declare-fun m!1167231 () Bool)

(assert (=> b!1266770 m!1167231))

(declare-fun m!1167237 () Bool)

(assert (=> bm!62480 m!1167237))

(declare-fun m!1167241 () Bool)

(assert (=> b!1266775 m!1167241))

(declare-fun m!1167243 () Bool)

(assert (=> d!139361 m!1167243))

(assert (=> d!139361 m!1167189))

(assert (=> b!1266642 d!139361))

(declare-fun d!139371 () Bool)

(declare-fun res!843109 () Bool)

(declare-fun e!721529 () Bool)

(assert (=> d!139371 (=> res!843109 e!721529)))

(assert (=> d!139371 (= res!843109 (and ((_ is Cons!28341) l!706) (= (_1!10592 (h!29559 l!706)) key1!31)))))

(assert (=> d!139371 (= (containsKey!643 l!706 key1!31) e!721529)))

(declare-fun b!1266798 () Bool)

(declare-fun e!721530 () Bool)

(assert (=> b!1266798 (= e!721529 e!721530)))

(declare-fun res!843110 () Bool)

(assert (=> b!1266798 (=> (not res!843110) (not e!721530))))

(assert (=> b!1266798 (= res!843110 (and (or (not ((_ is Cons!28341) l!706)) (bvsle (_1!10592 (h!29559 l!706)) key1!31)) ((_ is Cons!28341) l!706) (bvslt (_1!10592 (h!29559 l!706)) key1!31)))))

(declare-fun b!1266799 () Bool)

(assert (=> b!1266799 (= e!721530 (containsKey!643 (t!41858 l!706) key1!31))))

(assert (= (and d!139371 (not res!843109)) b!1266798))

(assert (= (and b!1266798 res!843110) b!1266799))

(declare-fun m!1167257 () Bool)

(assert (=> b!1266799 m!1167257))

(assert (=> b!1266640 d!139371))

(declare-fun b!1266814 () Bool)

(declare-fun e!721539 () Bool)

(declare-fun tp!96335 () Bool)

(assert (=> b!1266814 (= e!721539 (and tp_is_empty!32497 tp!96335))))

(assert (=> b!1266643 (= tp!96320 e!721539)))

(assert (= (and b!1266643 ((_ is Cons!28341) (t!41858 l!706))) b!1266814))

(check-sat tp_is_empty!32497 (not b!1266814) (not b!1266770) (not b!1266775) (not b!1266767) (not d!139361) (not b!1266799) (not bm!62480) (not b!1266683) (not b!1266687))
(check-sat)
