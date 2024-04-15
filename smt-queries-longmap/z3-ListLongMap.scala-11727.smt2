; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137432 () Bool)

(assert start!137432)

(declare-fun key!405 () (_ BitVec 64))

(declare-fun b!1581372 () Bool)

(declare-datatypes ((B!2702 0))(
  ( (B!2703 (val!19713 Int)) )
))
(declare-datatypes ((tuple2!25656 0))(
  ( (tuple2!25657 (_1!12839 (_ BitVec 64)) (_2!12839 B!2702)) )
))
(declare-datatypes ((List!36874 0))(
  ( (Nil!36871) (Cons!36870 (h!38414 tuple2!25656) (t!51780 List!36874)) )
))
(declare-fun l!1390 () List!36874)

(declare-fun e!882383 () Bool)

(declare-fun value!194 () B!2702)

(declare-datatypes ((Option!931 0))(
  ( (Some!930 (v!22443 B!2702)) (None!929) )
))
(declare-fun getValueByKey!826 (List!36874 (_ BitVec 64)) Option!931)

(assert (=> b!1581372 (= e!882383 (not (= (getValueByKey!826 l!1390 key!405) (Some!930 value!194))))))

(declare-fun b!1581373 () Bool)

(declare-fun e!882384 () Bool)

(declare-datatypes ((tuple2!25658 0))(
  ( (tuple2!25659 (_1!12840 tuple2!25656) (_2!12840 List!36874)) )
))
(declare-datatypes ((Option!932 0))(
  ( (Some!931 (v!22444 tuple2!25658)) (None!930) )
))
(declare-fun lt!676718 () Option!932)

(get-info :version)

(declare-fun get!26820 (Option!932) tuple2!25658)

(assert (=> b!1581373 (= e!882384 (not ((_ is Nil!36871) (_2!12840 (get!26820 lt!676718)))))))

(declare-fun b!1581374 () Bool)

(declare-fun res!1080465 () Bool)

(declare-fun e!882385 () Bool)

(assert (=> b!1581374 (=> (not res!1080465) (not e!882385))))

(declare-fun contains!10460 (List!36874 tuple2!25656) Bool)

(assert (=> b!1581374 (= res!1080465 (contains!10460 l!1390 (tuple2!25657 key!405 value!194)))))

(declare-fun b!1581375 () Bool)

(declare-fun res!1080463 () Bool)

(assert (=> b!1581375 (=> (not res!1080463) (not e!882385))))

(declare-fun containsKey!935 (List!36874 (_ BitVec 64)) Bool)

(assert (=> b!1581375 (= res!1080463 (containsKey!935 l!1390 key!405))))

(declare-fun b!1581376 () Bool)

(declare-fun e!882386 () Bool)

(declare-fun tp_is_empty!39247 () Bool)

(declare-fun tp!114597 () Bool)

(assert (=> b!1581376 (= e!882386 (and tp_is_empty!39247 tp!114597))))

(declare-fun b!1581377 () Bool)

(declare-fun res!1080464 () Bool)

(assert (=> b!1581377 (=> (not res!1080464) (not e!882383))))

(assert (=> b!1581377 (= res!1080464 (not ((_ is Cons!36870) l!1390)))))

(declare-fun res!1080466 () Bool)

(assert (=> start!137432 (=> (not res!1080466) (not e!882385))))

(declare-fun isStrictlySorted!1089 (List!36874) Bool)

(assert (=> start!137432 (= res!1080466 (isStrictlySorted!1089 l!1390))))

(assert (=> start!137432 e!882385))

(assert (=> start!137432 e!882386))

(assert (=> start!137432 true))

(assert (=> start!137432 tp_is_empty!39247))

(declare-fun b!1581378 () Bool)

(assert (=> b!1581378 (= e!882385 e!882383)))

(declare-fun res!1080467 () Bool)

(assert (=> b!1581378 (=> (not res!1080467) (not e!882383))))

(assert (=> b!1581378 (= res!1080467 e!882384)))

(declare-fun res!1080468 () Bool)

(assert (=> b!1581378 (=> res!1080468 e!882384)))

(declare-fun isEmpty!1188 (Option!932) Bool)

(assert (=> b!1581378 (= res!1080468 (isEmpty!1188 lt!676718))))

(declare-fun unapply!100 (List!36874) Option!932)

(assert (=> b!1581378 (= lt!676718 (unapply!100 l!1390))))

(assert (= (and start!137432 res!1080466) b!1581375))

(assert (= (and b!1581375 res!1080463) b!1581374))

(assert (= (and b!1581374 res!1080465) b!1581378))

(assert (= (and b!1581378 (not res!1080468)) b!1581373))

(assert (= (and b!1581378 res!1080467) b!1581377))

(assert (= (and b!1581377 res!1080464) b!1581372))

(assert (= (and start!137432 ((_ is Cons!36870) l!1390)) b!1581376))

(declare-fun m!1451665 () Bool)

(assert (=> b!1581378 m!1451665))

(declare-fun m!1451667 () Bool)

(assert (=> b!1581378 m!1451667))

(declare-fun m!1451669 () Bool)

(assert (=> b!1581373 m!1451669))

(declare-fun m!1451671 () Bool)

(assert (=> b!1581375 m!1451671))

(declare-fun m!1451673 () Bool)

(assert (=> b!1581374 m!1451673))

(declare-fun m!1451675 () Bool)

(assert (=> start!137432 m!1451675))

(declare-fun m!1451677 () Bool)

(assert (=> b!1581372 m!1451677))

(check-sat tp_is_empty!39247 (not start!137432) (not b!1581376) (not b!1581378) (not b!1581375) (not b!1581374) (not b!1581373) (not b!1581372))
(check-sat)
(get-model)

(declare-fun d!166579 () Bool)

(assert (=> d!166579 (= (isEmpty!1188 lt!676718) (not ((_ is Some!931) lt!676718)))))

(assert (=> b!1581378 d!166579))

(declare-fun d!166585 () Bool)

(assert (=> d!166585 (= (unapply!100 l!1390) (ite ((_ is Nil!36871) l!1390) None!930 (Some!931 (tuple2!25659 (h!38414 l!1390) (t!51780 l!1390)))))))

(assert (=> b!1581378 d!166585))

(declare-fun d!166591 () Bool)

(declare-fun res!1080513 () Bool)

(declare-fun e!882423 () Bool)

(assert (=> d!166591 (=> res!1080513 e!882423)))

(assert (=> d!166591 (= res!1080513 (or ((_ is Nil!36871) l!1390) ((_ is Nil!36871) (t!51780 l!1390))))))

(assert (=> d!166591 (= (isStrictlySorted!1089 l!1390) e!882423)))

(declare-fun b!1581437 () Bool)

(declare-fun e!882425 () Bool)

(assert (=> b!1581437 (= e!882423 e!882425)))

(declare-fun res!1080515 () Bool)

(assert (=> b!1581437 (=> (not res!1080515) (not e!882425))))

(assert (=> b!1581437 (= res!1080515 (bvslt (_1!12839 (h!38414 l!1390)) (_1!12839 (h!38414 (t!51780 l!1390)))))))

(declare-fun b!1581439 () Bool)

(assert (=> b!1581439 (= e!882425 (isStrictlySorted!1089 (t!51780 l!1390)))))

(assert (= (and d!166591 (not res!1080513)) b!1581437))

(assert (= (and b!1581437 res!1080515) b!1581439))

(declare-fun m!1451709 () Bool)

(assert (=> b!1581439 m!1451709))

(assert (=> start!137432 d!166591))

(declare-fun b!1581464 () Bool)

(declare-fun e!882443 () Option!931)

(declare-fun e!882444 () Option!931)

(assert (=> b!1581464 (= e!882443 e!882444)))

(declare-fun c!146537 () Bool)

(assert (=> b!1581464 (= c!146537 (and ((_ is Cons!36870) l!1390) (not (= (_1!12839 (h!38414 l!1390)) key!405))))))

(declare-fun b!1581463 () Bool)

(assert (=> b!1581463 (= e!882443 (Some!930 (_2!12839 (h!38414 l!1390))))))

(declare-fun b!1581466 () Bool)

(assert (=> b!1581466 (= e!882444 None!929)))

(declare-fun d!166597 () Bool)

(declare-fun c!146536 () Bool)

(assert (=> d!166597 (= c!146536 (and ((_ is Cons!36870) l!1390) (= (_1!12839 (h!38414 l!1390)) key!405)))))

(assert (=> d!166597 (= (getValueByKey!826 l!1390 key!405) e!882443)))

(declare-fun b!1581465 () Bool)

(assert (=> b!1581465 (= e!882444 (getValueByKey!826 (t!51780 l!1390) key!405))))

(assert (= (and d!166597 c!146536) b!1581463))

(assert (= (and d!166597 (not c!146536)) b!1581464))

(assert (= (and b!1581464 c!146537) b!1581465))

(assert (= (and b!1581464 (not c!146537)) b!1581466))

(declare-fun m!1451715 () Bool)

(assert (=> b!1581465 m!1451715))

(assert (=> b!1581372 d!166597))

(declare-fun lt!676732 () Bool)

(declare-fun d!166603 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!843 (List!36874) (InoxSet tuple2!25656))

(assert (=> d!166603 (= lt!676732 (select (content!843 l!1390) (tuple2!25657 key!405 value!194)))))

(declare-fun e!882462 () Bool)

(assert (=> d!166603 (= lt!676732 e!882462)))

(declare-fun res!1080544 () Bool)

(assert (=> d!166603 (=> (not res!1080544) (not e!882462))))

(assert (=> d!166603 (= res!1080544 ((_ is Cons!36870) l!1390))))

(assert (=> d!166603 (= (contains!10460 l!1390 (tuple2!25657 key!405 value!194)) lt!676732)))

(declare-fun b!1581483 () Bool)

(declare-fun e!882461 () Bool)

(assert (=> b!1581483 (= e!882462 e!882461)))

(declare-fun res!1080543 () Bool)

(assert (=> b!1581483 (=> res!1080543 e!882461)))

(assert (=> b!1581483 (= res!1080543 (= (h!38414 l!1390) (tuple2!25657 key!405 value!194)))))

(declare-fun b!1581484 () Bool)

(assert (=> b!1581484 (= e!882461 (contains!10460 (t!51780 l!1390) (tuple2!25657 key!405 value!194)))))

(assert (= (and d!166603 res!1080544) b!1581483))

(assert (= (and b!1581483 (not res!1080543)) b!1581484))

(declare-fun m!1451725 () Bool)

(assert (=> d!166603 m!1451725))

(declare-fun m!1451727 () Bool)

(assert (=> d!166603 m!1451727))

(declare-fun m!1451729 () Bool)

(assert (=> b!1581484 m!1451729))

(assert (=> b!1581374 d!166603))

(declare-fun d!166609 () Bool)

(assert (=> d!166609 (= (get!26820 lt!676718) (v!22444 lt!676718))))

(assert (=> b!1581373 d!166609))

(declare-fun d!166613 () Bool)

(declare-fun res!1080557 () Bool)

(declare-fun e!882481 () Bool)

(assert (=> d!166613 (=> res!1080557 e!882481)))

(assert (=> d!166613 (= res!1080557 (and ((_ is Cons!36870) l!1390) (= (_1!12839 (h!38414 l!1390)) key!405)))))

(assert (=> d!166613 (= (containsKey!935 l!1390 key!405) e!882481)))

(declare-fun b!1581509 () Bool)

(declare-fun e!882482 () Bool)

(assert (=> b!1581509 (= e!882481 e!882482)))

(declare-fun res!1080558 () Bool)

(assert (=> b!1581509 (=> (not res!1080558) (not e!882482))))

(assert (=> b!1581509 (= res!1080558 (and (or (not ((_ is Cons!36870) l!1390)) (bvsle (_1!12839 (h!38414 l!1390)) key!405)) ((_ is Cons!36870) l!1390) (bvslt (_1!12839 (h!38414 l!1390)) key!405)))))

(declare-fun b!1581510 () Bool)

(assert (=> b!1581510 (= e!882482 (containsKey!935 (t!51780 l!1390) key!405))))

(assert (= (and d!166613 (not res!1080557)) b!1581509))

(assert (= (and b!1581509 res!1080558) b!1581510))

(declare-fun m!1451741 () Bool)

(assert (=> b!1581510 m!1451741))

(assert (=> b!1581375 d!166613))

(declare-fun b!1581525 () Bool)

(declare-fun e!882491 () Bool)

(declare-fun tp!114612 () Bool)

(assert (=> b!1581525 (= e!882491 (and tp_is_empty!39247 tp!114612))))

(assert (=> b!1581376 (= tp!114597 e!882491)))

(assert (= (and b!1581376 ((_ is Cons!36870) (t!51780 l!1390))) b!1581525))

(check-sat tp_is_empty!39247 (not b!1581525) (not b!1581439) (not b!1581510) (not b!1581465) (not d!166603) (not b!1581484))
(check-sat)
