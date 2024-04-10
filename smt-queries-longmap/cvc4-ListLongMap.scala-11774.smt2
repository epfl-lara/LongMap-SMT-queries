; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138234 () Bool)

(assert start!138234)

(declare-fun b!1585426 () Bool)

(declare-fun e!885165 () Bool)

(declare-fun e!885164 () Bool)

(assert (=> b!1585426 (= e!885165 e!885164)))

(declare-fun res!1082786 () Bool)

(assert (=> b!1585426 (=> res!1082786 e!885164)))

(declare-datatypes ((B!2988 0))(
  ( (B!2989 (val!19856 Int)) )
))
(declare-datatypes ((tuple2!25880 0))(
  ( (tuple2!25881 (_1!12951 (_ BitVec 64)) (_2!12951 B!2988)) )
))
(declare-datatypes ((List!36976 0))(
  ( (Nil!36973) (Cons!36972 (h!38515 tuple2!25880) (t!51894 List!36976)) )
))
(declare-fun lt!677379 () List!36976)

(declare-fun isStrictlySorted!1198 (List!36976) Bool)

(assert (=> b!1585426 (= res!1082786 (not (isStrictlySorted!1198 lt!677379)))))

(declare-fun newValue!21 () B!2988)

(declare-fun l!556 () List!36976)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun $colon$colon!1042 (List!36976 tuple2!25880) List!36976)

(declare-fun insertStrictlySorted!637 (List!36976 (_ BitVec 64) B!2988) List!36976)

(assert (=> b!1585426 (= lt!677379 ($colon$colon!1042 (insertStrictlySorted!637 (t!51894 l!556) newKey!21 newValue!21) (h!38515 l!556)))))

(declare-fun b!1585427 () Bool)

(declare-fun res!1082784 () Bool)

(assert (=> b!1585427 (=> res!1082784 e!885164)))

(declare-fun containsKey!1011 (List!36976 (_ BitVec 64)) Bool)

(assert (=> b!1585427 (= res!1082784 (not (containsKey!1011 lt!677379 newKey!21)))))

(declare-fun b!1585428 () Bool)

(declare-fun contains!10534 (List!36976 tuple2!25880) Bool)

(assert (=> b!1585428 (= e!885164 (not (contains!10534 lt!677379 (tuple2!25881 newKey!21 newValue!21))))))

(declare-fun b!1585429 () Bool)

(declare-fun res!1082783 () Bool)

(assert (=> b!1585429 (=> (not res!1082783) (not e!885165))))

(assert (=> b!1585429 (= res!1082783 (and (is-Cons!36972 l!556) (bvslt (_1!12951 (h!38515 l!556)) newKey!21)))))

(declare-fun res!1082785 () Bool)

(assert (=> start!138234 (=> (not res!1082785) (not e!885165))))

(assert (=> start!138234 (= res!1082785 (isStrictlySorted!1198 l!556))))

(assert (=> start!138234 e!885165))

(declare-fun e!885163 () Bool)

(assert (=> start!138234 e!885163))

(assert (=> start!138234 true))

(declare-fun tp_is_empty!39521 () Bool)

(assert (=> start!138234 tp_is_empty!39521))

(declare-fun b!1585430 () Bool)

(declare-fun tp!115266 () Bool)

(assert (=> b!1585430 (= e!885163 (and tp_is_empty!39521 tp!115266))))

(assert (= (and start!138234 res!1082785) b!1585429))

(assert (= (and b!1585429 res!1082783) b!1585426))

(assert (= (and b!1585426 (not res!1082786)) b!1585427))

(assert (= (and b!1585427 (not res!1082784)) b!1585428))

(assert (= (and start!138234 (is-Cons!36972 l!556)) b!1585430))

(declare-fun m!1454253 () Bool)

(assert (=> b!1585426 m!1454253))

(declare-fun m!1454255 () Bool)

(assert (=> b!1585426 m!1454255))

(assert (=> b!1585426 m!1454255))

(declare-fun m!1454257 () Bool)

(assert (=> b!1585426 m!1454257))

(declare-fun m!1454259 () Bool)

(assert (=> b!1585427 m!1454259))

(declare-fun m!1454261 () Bool)

(assert (=> b!1585428 m!1454261))

(declare-fun m!1454263 () Bool)

(assert (=> start!138234 m!1454263))

(push 1)

(assert tp_is_empty!39521)

(assert (not start!138234))

(assert (not b!1585430))

(assert (not b!1585428))

(assert (not b!1585426))

(assert (not b!1585427))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167681 () Bool)

(declare-fun res!1082823 () Bool)

(declare-fun e!885202 () Bool)

(assert (=> d!167681 (=> res!1082823 e!885202)))

(assert (=> d!167681 (= res!1082823 (or (is-Nil!36973 l!556) (is-Nil!36973 (t!51894 l!556))))))

(assert (=> d!167681 (= (isStrictlySorted!1198 l!556) e!885202)))

(declare-fun b!1585467 () Bool)

(declare-fun e!885203 () Bool)

(assert (=> b!1585467 (= e!885202 e!885203)))

(declare-fun res!1082824 () Bool)

(assert (=> b!1585467 (=> (not res!1082824) (not e!885203))))

(assert (=> b!1585467 (= res!1082824 (bvslt (_1!12951 (h!38515 l!556)) (_1!12951 (h!38515 (t!51894 l!556)))))))

(declare-fun b!1585468 () Bool)

(assert (=> b!1585468 (= e!885203 (isStrictlySorted!1198 (t!51894 l!556)))))

(assert (= (and d!167681 (not res!1082823)) b!1585467))

(assert (= (and b!1585467 res!1082824) b!1585468))

(declare-fun m!1454285 () Bool)

(assert (=> b!1585468 m!1454285))

(assert (=> start!138234 d!167681))

(declare-fun d!167691 () Bool)

(declare-fun res!1082825 () Bool)

(declare-fun e!885204 () Bool)

(assert (=> d!167691 (=> res!1082825 e!885204)))

(assert (=> d!167691 (= res!1082825 (or (is-Nil!36973 lt!677379) (is-Nil!36973 (t!51894 lt!677379))))))

(assert (=> d!167691 (= (isStrictlySorted!1198 lt!677379) e!885204)))

(declare-fun b!1585469 () Bool)

(declare-fun e!885205 () Bool)

(assert (=> b!1585469 (= e!885204 e!885205)))

(declare-fun res!1082826 () Bool)

(assert (=> b!1585469 (=> (not res!1082826) (not e!885205))))

(assert (=> b!1585469 (= res!1082826 (bvslt (_1!12951 (h!38515 lt!677379)) (_1!12951 (h!38515 (t!51894 lt!677379)))))))

(declare-fun b!1585470 () Bool)

(assert (=> b!1585470 (= e!885205 (isStrictlySorted!1198 (t!51894 lt!677379)))))

(assert (= (and d!167691 (not res!1082825)) b!1585469))

(assert (= (and b!1585469 res!1082826) b!1585470))

(declare-fun m!1454287 () Bool)

(assert (=> b!1585470 m!1454287))

(assert (=> b!1585426 d!167691))

(declare-fun d!167693 () Bool)

(assert (=> d!167693 (= ($colon$colon!1042 (insertStrictlySorted!637 (t!51894 l!556) newKey!21 newValue!21) (h!38515 l!556)) (Cons!36972 (h!38515 l!556) (insertStrictlySorted!637 (t!51894 l!556) newKey!21 newValue!21)))))

(assert (=> b!1585426 d!167693))

(declare-fun b!1585549 () Bool)

(declare-fun res!1082848 () Bool)

(declare-fun e!885251 () Bool)

(assert (=> b!1585549 (=> (not res!1082848) (not e!885251))))

(declare-fun lt!677393 () List!36976)

(assert (=> b!1585549 (= res!1082848 (containsKey!1011 lt!677393 newKey!21))))

(declare-fun d!167695 () Bool)

(assert (=> d!167695 e!885251))

(declare-fun res!1082847 () Bool)

(assert (=> d!167695 (=> (not res!1082847) (not e!885251))))

(assert (=> d!167695 (= res!1082847 (isStrictlySorted!1198 lt!677393))))

(declare-fun e!885249 () List!36976)

(assert (=> d!167695 (= lt!677393 e!885249)))

(declare-fun c!147007 () Bool)

(assert (=> d!167695 (= c!147007 (and (is-Cons!36972 (t!51894 l!556)) (bvslt (_1!12951 (h!38515 (t!51894 l!556))) newKey!21)))))

(assert (=> d!167695 (isStrictlySorted!1198 (t!51894 l!556))))

(assert (=> d!167695 (= (insertStrictlySorted!637 (t!51894 l!556) newKey!21 newValue!21) lt!677393)))

(declare-fun b!1585550 () Bool)

(declare-fun e!885247 () List!36976)

(assert (=> b!1585550 (= e!885249 e!885247)))

(declare-fun c!147005 () Bool)

(assert (=> b!1585550 (= c!147005 (and (is-Cons!36972 (t!51894 l!556)) (= (_1!12951 (h!38515 (t!51894 l!556))) newKey!21)))))

(declare-fun b!1585551 () Bool)

(declare-fun c!147006 () Bool)

(assert (=> b!1585551 (= c!147006 (and (is-Cons!36972 (t!51894 l!556)) (bvsgt (_1!12951 (h!38515 (t!51894 l!556))) newKey!21)))))

(declare-fun e!885250 () List!36976)

(assert (=> b!1585551 (= e!885247 e!885250)))

(declare-fun b!1585552 () Bool)

(declare-fun call!72640 () List!36976)

(assert (=> b!1585552 (= e!885250 call!72640)))

(declare-fun bm!72636 () Bool)

(declare-fun call!72639 () List!36976)

(declare-fun call!72641 () List!36976)

(assert (=> bm!72636 (= call!72639 call!72641)))

(declare-fun b!1585553 () Bool)

(assert (=> b!1585553 (= e!885250 call!72640)))

(declare-fun e!885248 () List!36976)

(declare-fun bm!72637 () Bool)

(assert (=> bm!72637 (= call!72641 ($colon$colon!1042 e!885248 (ite c!147007 (h!38515 (t!51894 l!556)) (tuple2!25881 newKey!21 newValue!21))))))

(declare-fun c!147008 () Bool)

(assert (=> bm!72637 (= c!147008 c!147007)))

(declare-fun b!1585554 () Bool)

(assert (=> b!1585554 (= e!885249 call!72641)))

(declare-fun bm!72638 () Bool)

(assert (=> bm!72638 (= call!72640 call!72639)))

(declare-fun b!1585555 () Bool)

(assert (=> b!1585555 (= e!885247 call!72639)))

(declare-fun b!1585556 () Bool)

(assert (=> b!1585556 (= e!885248 (insertStrictlySorted!637 (t!51894 (t!51894 l!556)) newKey!21 newValue!21))))

(declare-fun b!1585557 () Bool)

(assert (=> b!1585557 (= e!885251 (contains!10534 lt!677393 (tuple2!25881 newKey!21 newValue!21)))))

(declare-fun b!1585558 () Bool)

(assert (=> b!1585558 (= e!885248 (ite c!147005 (t!51894 (t!51894 l!556)) (ite c!147006 (Cons!36972 (h!38515 (t!51894 l!556)) (t!51894 (t!51894 l!556))) Nil!36973)))))

(assert (= (and d!167695 c!147007) b!1585554))

(assert (= (and d!167695 (not c!147007)) b!1585550))

(assert (= (and b!1585550 c!147005) b!1585555))

(assert (= (and b!1585550 (not c!147005)) b!1585551))

(assert (= (and b!1585551 c!147006) b!1585552))

(assert (= (and b!1585551 (not c!147006)) b!1585553))

(assert (= (or b!1585552 b!1585553) bm!72638))

(assert (= (or b!1585555 bm!72638) bm!72636))

(assert (= (or b!1585554 bm!72636) bm!72637))

(assert (= (and bm!72637 c!147008) b!1585556))

(assert (= (and bm!72637 (not c!147008)) b!1585558))

(assert (= (and d!167695 res!1082847) b!1585549))

(assert (= (and b!1585549 res!1082848) b!1585557))

(declare-fun m!1454301 () Bool)

(assert (=> b!1585556 m!1454301))

(declare-fun m!1454303 () Bool)

(assert (=> bm!72637 m!1454303))

(declare-fun m!1454305 () Bool)

(assert (=> d!167695 m!1454305))

(assert (=> d!167695 m!1454285))

(declare-fun m!1454307 () Bool)

(assert (=> b!1585557 m!1454307))

(declare-fun m!1454309 () Bool)

(assert (=> b!1585549 m!1454309))

(assert (=> b!1585426 d!167695))

(declare-fun d!167701 () Bool)

(declare-fun lt!677397 () Bool)

(declare-fun content!866 (List!36976) (Set tuple2!25880))

(assert (=> d!167701 (= lt!677397 (member (tuple2!25881 newKey!21 newValue!21) (content!866 lt!677379)))))

(declare-fun e!885268 () Bool)

(assert (=> d!167701 (= lt!677397 e!885268)))

(declare-fun res!1082858 () Bool)

(assert (=> d!167701 (=> (not res!1082858) (not e!885268))))

(assert (=> d!167701 (= res!1082858 (is-Cons!36972 lt!677379))))

(assert (=> d!167701 (= (contains!10534 lt!677379 (tuple2!25881 newKey!21 newValue!21)) lt!677397)))

(declare-fun b!1585582 () Bool)

(declare-fun e!885269 () Bool)

(assert (=> b!1585582 (= e!885268 e!885269)))

(declare-fun res!1082857 () Bool)

(assert (=> b!1585582 (=> res!1082857 e!885269)))

(assert (=> b!1585582 (= res!1082857 (= (h!38515 lt!677379) (tuple2!25881 newKey!21 newValue!21)))))

(declare-fun b!1585583 () Bool)

(assert (=> b!1585583 (= e!885269 (contains!10534 (t!51894 lt!677379) (tuple2!25881 newKey!21 newValue!21)))))

(assert (= (and d!167701 res!1082858) b!1585582))

(assert (= (and b!1585582 (not res!1082857)) b!1585583))

(declare-fun m!1454323 () Bool)

(assert (=> d!167701 m!1454323))

(declare-fun m!1454325 () Bool)

(assert (=> d!167701 m!1454325))

(declare-fun m!1454327 () Bool)

(assert (=> b!1585583 m!1454327))

(assert (=> b!1585428 d!167701))

(declare-fun d!167705 () Bool)

(declare-fun res!1082863 () Bool)

(declare-fun e!885275 () Bool)

(assert (=> d!167705 (=> res!1082863 e!885275)))

(assert (=> d!167705 (= res!1082863 (and (is-Cons!36972 lt!677379) (= (_1!12951 (h!38515 lt!677379)) newKey!21)))))

(assert (=> d!167705 (= (containsKey!1011 lt!677379 newKey!21) e!885275)))

(declare-fun b!1585589 () Bool)

(declare-fun e!885276 () Bool)

(assert (=> b!1585589 (= e!885275 e!885276)))

(declare-fun res!1082864 () Bool)

(assert (=> b!1585589 (=> (not res!1082864) (not e!885276))))

(assert (=> b!1585589 (= res!1082864 (and (or (not (is-Cons!36972 lt!677379)) (bvsle (_1!12951 (h!38515 lt!677379)) newKey!21)) (is-Cons!36972 lt!677379) (bvslt (_1!12951 (h!38515 lt!677379)) newKey!21)))))

(declare-fun b!1585590 () Bool)

(assert (=> b!1585590 (= e!885276 (containsKey!1011 (t!51894 lt!677379) newKey!21))))

(assert (= (and d!167705 (not res!1082863)) b!1585589))

(assert (= (and b!1585589 res!1082864) b!1585590))

(declare-fun m!1454329 () Bool)

(assert (=> b!1585590 m!1454329))

(assert (=> b!1585427 d!167705))

(declare-fun b!1585595 () Bool)

(declare-fun e!885279 () Bool)

(declare-fun tp!115275 () Bool)

(assert (=> b!1585595 (= e!885279 (and tp_is_empty!39521 tp!115275))))

(assert (=> b!1585430 (= tp!115266 e!885279)))

(assert (= (and b!1585430 (is-Cons!36972 (t!51894 l!556))) b!1585595))

(push 1)

(assert tp_is_empty!39521)

(assert (not b!1585556))

(assert (not bm!72637))

(assert (not b!1585590))

(assert (not b!1585595))

(assert (not b!1585557))

(assert (not b!1585470))

(assert (not d!167695))

(assert (not b!1585549))

(assert (not b!1585583))

(assert (not d!167701))

(assert (not b!1585468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!167747 () Bool)

(declare-fun res!1082897 () Bool)

(declare-fun e!885326 () Bool)

(assert (=> d!167747 (=> res!1082897 e!885326)))

(assert (=> d!167747 (= res!1082897 (or (is-Nil!36973 (t!51894 l!556)) (is-Nil!36973 (t!51894 (t!51894 l!556)))))))

(assert (=> d!167747 (= (isStrictlySorted!1198 (t!51894 l!556)) e!885326)))

(declare-fun b!1585658 () Bool)

(declare-fun e!885327 () Bool)

(assert (=> b!1585658 (= e!885326 e!885327)))

(declare-fun res!1082898 () Bool)

(assert (=> b!1585658 (=> (not res!1082898) (not e!885327))))

(assert (=> b!1585658 (= res!1082898 (bvslt (_1!12951 (h!38515 (t!51894 l!556))) (_1!12951 (h!38515 (t!51894 (t!51894 l!556))))))))

(declare-fun b!1585659 () Bool)

(assert (=> b!1585659 (= e!885327 (isStrictlySorted!1198 (t!51894 (t!51894 l!556))))))

(assert (= (and d!167747 (not res!1082897)) b!1585658))

(assert (= (and b!1585658 res!1082898) b!1585659))

(declare-fun m!1454399 () Bool)

(assert (=> b!1585659 m!1454399))

(assert (=> b!1585468 d!167747))

(declare-fun d!167749 () Bool)

(declare-fun res!1082899 () Bool)

(declare-fun e!885328 () Bool)

(assert (=> d!167749 (=> res!1082899 e!885328)))

(assert (=> d!167749 (= res!1082899 (or (is-Nil!36973 lt!677393) (is-Nil!36973 (t!51894 lt!677393))))))

(assert (=> d!167749 (= (isStrictlySorted!1198 lt!677393) e!885328)))

(declare-fun b!1585660 () Bool)

(declare-fun e!885329 () Bool)

(assert (=> b!1585660 (= e!885328 e!885329)))

(declare-fun res!1082900 () Bool)

(assert (=> b!1585660 (=> (not res!1082900) (not e!885329))))

(assert (=> b!1585660 (= res!1082900 (bvslt (_1!12951 (h!38515 lt!677393)) (_1!12951 (h!38515 (t!51894 lt!677393)))))))

(declare-fun b!1585661 () Bool)

(assert (=> b!1585661 (= e!885329 (isStrictlySorted!1198 (t!51894 lt!677393)))))

(assert (= (and d!167749 (not res!1082899)) b!1585660))

(assert (= (and b!1585660 res!1082900) b!1585661))

(declare-fun m!1454401 () Bool)

(assert (=> b!1585661 m!1454401))

(assert (=> d!167695 d!167749))

(assert (=> d!167695 d!167747))

(declare-fun d!167751 () Bool)

(declare-fun res!1082901 () Bool)

(declare-fun e!885330 () Bool)

(assert (=> d!167751 (=> res!1082901 e!885330)))

(assert (=> d!167751 (= res!1082901 (and (is-Cons!36972 (t!51894 lt!677379)) (= (_1!12951 (h!38515 (t!51894 lt!677379))) newKey!21)))))

(assert (=> d!167751 (= (containsKey!1011 (t!51894 lt!677379) newKey!21) e!885330)))

(declare-fun b!1585662 () Bool)

(declare-fun e!885331 () Bool)

(assert (=> b!1585662 (= e!885330 e!885331)))

(declare-fun res!1082902 () Bool)

(assert (=> b!1585662 (=> (not res!1082902) (not e!885331))))

(assert (=> b!1585662 (= res!1082902 (and (or (not (is-Cons!36972 (t!51894 lt!677379))) (bvsle (_1!12951 (h!38515 (t!51894 lt!677379))) newKey!21)) (is-Cons!36972 (t!51894 lt!677379)) (bvslt (_1!12951 (h!38515 (t!51894 lt!677379))) newKey!21)))))

(declare-fun b!1585663 () Bool)

(assert (=> b!1585663 (= e!885331 (containsKey!1011 (t!51894 (t!51894 lt!677379)) newKey!21))))

(assert (= (and d!167751 (not res!1082901)) b!1585662))

(assert (= (and b!1585662 res!1082902) b!1585663))

(declare-fun m!1454403 () Bool)

(assert (=> b!1585663 m!1454403))

(assert (=> b!1585590 d!167751))

(declare-fun b!1585664 () Bool)

(declare-fun res!1082904 () Bool)

(declare-fun e!885336 () Bool)

(assert (=> b!1585664 (=> (not res!1082904) (not e!885336))))

(declare-fun lt!677404 () List!36976)

(assert (=> b!1585664 (= res!1082904 (containsKey!1011 lt!677404 newKey!21))))

(declare-fun d!167753 () Bool)

(assert (=> d!167753 e!885336))

(declare-fun res!1082903 () Bool)

(assert (=> d!167753 (=> (not res!1082903) (not e!885336))))

(assert (=> d!167753 (= res!1082903 (isStrictlySorted!1198 lt!677404))))

(declare-fun e!885334 () List!36976)

(assert (=> d!167753 (= lt!677404 e!885334)))

(declare-fun c!147029 () Bool)

(assert (=> d!167753 (= c!147029 (and (is-Cons!36972 (t!51894 (t!51894 l!556))) (bvslt (_1!12951 (h!38515 (t!51894 (t!51894 l!556)))) newKey!21)))))

(assert (=> d!167753 (isStrictlySorted!1198 (t!51894 (t!51894 l!556)))))

(assert (=> d!167753 (= (insertStrictlySorted!637 (t!51894 (t!51894 l!556)) newKey!21 newValue!21) lt!677404)))

(declare-fun b!1585665 () Bool)

(declare-fun e!885332 () List!36976)

(assert (=> b!1585665 (= e!885334 e!885332)))

(declare-fun c!147027 () Bool)

(assert (=> b!1585665 (= c!147027 (and (is-Cons!36972 (t!51894 (t!51894 l!556))) (= (_1!12951 (h!38515 (t!51894 (t!51894 l!556)))) newKey!21)))))

(declare-fun b!1585666 () Bool)

(declare-fun c!147028 () Bool)

(assert (=> b!1585666 (= c!147028 (and (is-Cons!36972 (t!51894 (t!51894 l!556))) (bvsgt (_1!12951 (h!38515 (t!51894 (t!51894 l!556)))) newKey!21)))))

(declare-fun e!885335 () List!36976)

(assert (=> b!1585666 (= e!885332 e!885335)))

(declare-fun b!1585667 () Bool)

(declare-fun call!72652 () List!36976)

(assert (=> b!1585667 (= e!885335 call!72652)))

(declare-fun bm!72648 () Bool)

(declare-fun call!72651 () List!36976)

(declare-fun call!72653 () List!36976)

(assert (=> bm!72648 (= call!72651 call!72653)))

(declare-fun b!1585668 () Bool)

(assert (=> b!1585668 (= e!885335 call!72652)))

(declare-fun e!885333 () List!36976)

(declare-fun bm!72649 () Bool)

(assert (=> bm!72649 (= call!72653 ($colon$colon!1042 e!885333 (ite c!147029 (h!38515 (t!51894 (t!51894 l!556))) (tuple2!25881 newKey!21 newValue!21))))))

(declare-fun c!147030 () Bool)

(assert (=> bm!72649 (= c!147030 c!147029)))

(declare-fun b!1585669 () Bool)

(assert (=> b!1585669 (= e!885334 call!72653)))

(declare-fun bm!72650 () Bool)

(assert (=> bm!72650 (= call!72652 call!72651)))

(declare-fun b!1585670 () Bool)

(assert (=> b!1585670 (= e!885332 call!72651)))

(declare-fun b!1585671 () Bool)

(assert (=> b!1585671 (= e!885333 (insertStrictlySorted!637 (t!51894 (t!51894 (t!51894 l!556))) newKey!21 newValue!21))))

(declare-fun b!1585672 () Bool)

(assert (=> b!1585672 (= e!885336 (contains!10534 lt!677404 (tuple2!25881 newKey!21 newValue!21)))))

(declare-fun b!1585673 () Bool)

(assert (=> b!1585673 (= e!885333 (ite c!147027 (t!51894 (t!51894 (t!51894 l!556))) (ite c!147028 (Cons!36972 (h!38515 (t!51894 (t!51894 l!556))) (t!51894 (t!51894 (t!51894 l!556)))) Nil!36973)))))

(assert (= (and d!167753 c!147029) b!1585669))

(assert (= (and d!167753 (not c!147029)) b!1585665))

(assert (= (and b!1585665 c!147027) b!1585670))

(assert (= (and b!1585665 (not c!147027)) b!1585666))

(assert (= (and b!1585666 c!147028) b!1585667))

(assert (= (and b!1585666 (not c!147028)) b!1585668))

(assert (= (or b!1585667 b!1585668) bm!72650))

(assert (= (or b!1585670 bm!72650) bm!72648))

(assert (= (or b!1585669 bm!72648) bm!72649))

(assert (= (and bm!72649 c!147030) b!1585671))

(assert (= (and bm!72649 (not c!147030)) b!1585673))

(assert (= (and d!167753 res!1082903) b!1585664))

(assert (= (and b!1585664 res!1082904) b!1585672))

(declare-fun m!1454405 () Bool)

(assert (=> b!1585671 m!1454405))

(declare-fun m!1454407 () Bool)

(assert (=> bm!72649 m!1454407))

(declare-fun m!1454409 () Bool)

(assert (=> d!167753 m!1454409))

(assert (=> d!167753 m!1454399))

(declare-fun m!1454411 () Bool)

(assert (=> b!1585672 m!1454411))

(declare-fun m!1454413 () Bool)

(assert (=> b!1585664 m!1454413))

(assert (=> b!1585556 d!167753))

(declare-fun d!167755 () Bool)

(declare-fun res!1082905 () Bool)

(declare-fun e!885337 () Bool)

(assert (=> d!167755 (=> res!1082905 e!885337)))

(assert (=> d!167755 (= res!1082905 (or (is-Nil!36973 (t!51894 lt!677379)) (is-Nil!36973 (t!51894 (t!51894 lt!677379)))))))

(assert (=> d!167755 (= (isStrictlySorted!1198 (t!51894 lt!677379)) e!885337)))

(declare-fun b!1585674 () Bool)

(declare-fun e!885338 () Bool)

(assert (=> b!1585674 (= e!885337 e!885338)))

(declare-fun res!1082906 () Bool)

(assert (=> b!1585674 (=> (not res!1082906) (not e!885338))))

(assert (=> b!1585674 (= res!1082906 (bvslt (_1!12951 (h!38515 (t!51894 lt!677379))) (_1!12951 (h!38515 (t!51894 (t!51894 lt!677379))))))))

(declare-fun b!1585675 () Bool)

(assert (=> b!1585675 (= e!885338 (isStrictlySorted!1198 (t!51894 (t!51894 lt!677379))))))

(assert (= (and d!167755 (not res!1082905)) b!1585674))

(assert (= (and b!1585674 res!1082906) b!1585675))

(declare-fun m!1454415 () Bool)

(assert (=> b!1585675 m!1454415))

(assert (=> b!1585470 d!167755))

(declare-fun d!167757 () Bool)

(declare-fun c!147033 () Bool)

(assert (=> d!167757 (= c!147033 (is-Nil!36973 lt!677379))))

(declare-fun e!885341 () (Set tuple2!25880))

(assert (=> d!167757 (= (content!866 lt!677379) e!885341)))

(declare-fun b!1585680 () Bool)

(assert (=> b!1585680 (= e!885341 (as emptyset (Set tuple2!25880)))))

(declare-fun b!1585681 () Bool)

(assert (=> b!1585681 (= e!885341 (union (insert (h!38515 lt!677379) (as emptyset (Set tuple2!25880))) (content!866 (t!51894 lt!677379))))))

(assert (= (and d!167757 c!147033) b!1585680))

(assert (= (and d!167757 (not c!147033)) b!1585681))

(declare-fun m!1454417 () Bool)

(assert (=> b!1585681 m!1454417))

(declare-fun m!1454419 () Bool)

(assert (=> b!1585681 m!1454419))

(assert (=> d!167701 d!167757))

(declare-fun d!167759 () Bool)

(assert (=> d!167759 (= ($colon$colon!1042 e!885248 (ite c!147007 (h!38515 (t!51894 l!556)) (tuple2!25881 newKey!21 newValue!21))) (Cons!36972 (ite c!147007 (h!38515 (t!51894 l!556)) (tuple2!25881 newKey!21 newValue!21)) e!885248))))

(assert (=> bm!72637 d!167759))

(declare-fun d!167761 () Bool)

(declare-fun lt!677405 () Bool)

(assert (=> d!167761 (= lt!677405 (member (tuple2!25881 newKey!21 newValue!21) (content!866 (t!51894 lt!677379))))))

(declare-fun e!885342 () Bool)

(assert (=> d!167761 (= lt!677405 e!885342)))

(declare-fun res!1082908 () Bool)

(assert (=> d!167761 (=> (not res!1082908) (not e!885342))))

(assert (=> d!167761 (= res!1082908 (is-Cons!36972 (t!51894 lt!677379)))))

(assert (=> d!167761 (= (contains!10534 (t!51894 lt!677379) (tuple2!25881 newKey!21 newValue!21)) lt!677405)))

(declare-fun b!1585682 () Bool)

(declare-fun e!885343 () Bool)

(assert (=> b!1585682 (= e!885342 e!885343)))

(declare-fun res!1082907 () Bool)

(assert (=> b!1585682 (=> res!1082907 e!885343)))

(assert (=> b!1585682 (= res!1082907 (= (h!38515 (t!51894 lt!677379)) (tuple2!25881 newKey!21 newValue!21)))))

(declare-fun b!1585683 () Bool)

(assert (=> b!1585683 (= e!885343 (contains!10534 (t!51894 (t!51894 lt!677379)) (tuple2!25881 newKey!21 newValue!21)))))

(assert (= (and d!167761 res!1082908) b!1585682))

(assert (= (and b!1585682 (not res!1082907)) b!1585683))

(assert (=> d!167761 m!1454419))

(declare-fun m!1454421 () Bool)

(assert (=> d!167761 m!1454421))

(declare-fun m!1454423 () Bool)

(assert (=> b!1585683 m!1454423))

(assert (=> b!1585583 d!167761))

(declare-fun d!167763 () Bool)

(declare-fun lt!677406 () Bool)

(assert (=> d!167763 (= lt!677406 (member (tuple2!25881 newKey!21 newValue!21) (content!866 lt!677393)))))

(declare-fun e!885344 () Bool)

(assert (=> d!167763 (= lt!677406 e!885344)))

(declare-fun res!1082910 () Bool)

(assert (=> d!167763 (=> (not res!1082910) (not e!885344))))

(assert (=> d!167763 (= res!1082910 (is-Cons!36972 lt!677393))))

(assert (=> d!167763 (= (contains!10534 lt!677393 (tuple2!25881 newKey!21 newValue!21)) lt!677406)))

(declare-fun b!1585684 () Bool)

(declare-fun e!885345 () Bool)

(assert (=> b!1585684 (= e!885344 e!885345)))

(declare-fun res!1082909 () Bool)

(assert (=> b!1585684 (=> res!1082909 e!885345)))

(assert (=> b!1585684 (= res!1082909 (= (h!38515 lt!677393) (tuple2!25881 newKey!21 newValue!21)))))

(declare-fun b!1585685 () Bool)

(assert (=> b!1585685 (= e!885345 (contains!10534 (t!51894 lt!677393) (tuple2!25881 newKey!21 newValue!21)))))

(assert (= (and d!167763 res!1082910) b!1585684))

(assert (= (and b!1585684 (not res!1082909)) b!1585685))

(declare-fun m!1454425 () Bool)

(assert (=> d!167763 m!1454425))

(declare-fun m!1454427 () Bool)

(assert (=> d!167763 m!1454427))

(declare-fun m!1454429 () Bool)

(assert (=> b!1585685 m!1454429))

(assert (=> b!1585557 d!167763))

(declare-fun d!167765 () Bool)

(declare-fun res!1082911 () Bool)

(declare-fun e!885346 () Bool)

(assert (=> d!167765 (=> res!1082911 e!885346)))

(assert (=> d!167765 (= res!1082911 (and (is-Cons!36972 lt!677393) (= (_1!12951 (h!38515 lt!677393)) newKey!21)))))

(assert (=> d!167765 (= (containsKey!1011 lt!677393 newKey!21) e!885346)))

(declare-fun b!1585686 () Bool)

(declare-fun e!885347 () Bool)

(assert (=> b!1585686 (= e!885346 e!885347)))

(declare-fun res!1082912 () Bool)

(assert (=> b!1585686 (=> (not res!1082912) (not e!885347))))

(assert (=> b!1585686 (= res!1082912 (and (or (not (is-Cons!36972 lt!677393)) (bvsle (_1!12951 (h!38515 lt!677393)) newKey!21)) (is-Cons!36972 lt!677393) (bvslt (_1!12951 (h!38515 lt!677393)) newKey!21)))))

(declare-fun b!1585687 () Bool)

(assert (=> b!1585687 (= e!885347 (containsKey!1011 (t!51894 lt!677393) newKey!21))))

(assert (= (and d!167765 (not res!1082911)) b!1585686))

(assert (= (and b!1585686 res!1082912) b!1585687))

(declare-fun m!1454431 () Bool)

(assert (=> b!1585687 m!1454431))

(assert (=> b!1585549 d!167765))

(declare-fun b!1585688 () Bool)

(declare-fun e!885348 () Bool)

(declare-fun tp!115278 () Bool)

(assert (=> b!1585688 (= e!885348 (and tp_is_empty!39521 tp!115278))))

(assert (=> b!1585595 (= tp!115275 e!885348)))

(assert (= (and b!1585595 (is-Cons!36972 (t!51894 (t!51894 l!556)))) b!1585688))

(push 1)

