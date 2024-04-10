; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106770 () Bool)

(assert start!106770)

(declare-fun b!1267318 () Bool)

(declare-fun res!843601 () Bool)

(declare-fun e!721946 () Bool)

(assert (=> b!1267318 (=> (not res!843601) (not e!721946))))

(declare-datatypes ((B!2074 0))(
  ( (B!2075 (val!16372 Int)) )
))
(declare-datatypes ((tuple2!21262 0))(
  ( (tuple2!21263 (_1!10642 (_ BitVec 64)) (_2!10642 B!2074)) )
))
(declare-datatypes ((List!28364 0))(
  ( (Nil!28361) (Cons!28360 (h!29569 tuple2!21262) (t!41891 List!28364)) )
))
(declare-fun l!874 () List!28364)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!680 (List!28364 (_ BitVec 64)) Bool)

(assert (=> b!1267318 (= res!843601 (not (containsKey!680 l!874 key!235)))))

(declare-fun b!1267320 () Bool)

(declare-fun isStrictlySorted!821 (List!28364) Bool)

(assert (=> b!1267320 (= e!721946 (not (isStrictlySorted!821 (t!41891 l!874))))))

(declare-fun res!843599 () Bool)

(assert (=> start!106770 (=> (not res!843599) (not e!721946))))

(assert (=> start!106770 (= res!843599 (isStrictlySorted!821 l!874))))

(assert (=> start!106770 e!721946))

(declare-fun e!721945 () Bool)

(assert (=> start!106770 e!721945))

(assert (=> start!106770 true))

(declare-fun b!1267321 () Bool)

(declare-fun tp_is_empty!32595 () Bool)

(declare-fun tp!96590 () Bool)

(assert (=> b!1267321 (= e!721945 (and tp_is_empty!32595 tp!96590))))

(declare-fun b!1267319 () Bool)

(declare-fun res!843600 () Bool)

(assert (=> b!1267319 (=> (not res!843600) (not e!721946))))

(get-info :version)

(assert (=> b!1267319 (= res!843600 ((_ is Cons!28360) l!874))))

(assert (= (and start!106770 res!843599) b!1267318))

(assert (= (and b!1267318 res!843601) b!1267319))

(assert (= (and b!1267319 res!843600) b!1267320))

(assert (= (and start!106770 ((_ is Cons!28360) l!874)) b!1267321))

(declare-fun m!1166697 () Bool)

(assert (=> b!1267318 m!1166697))

(declare-fun m!1166699 () Bool)

(assert (=> b!1267320 m!1166699))

(declare-fun m!1166701 () Bool)

(assert (=> start!106770 m!1166701))

(check-sat (not start!106770) (not b!1267318) tp_is_empty!32595 (not b!1267320) (not b!1267321))
(check-sat)
(get-model)

(declare-fun d!139445 () Bool)

(declare-fun res!843643 () Bool)

(declare-fun e!721991 () Bool)

(assert (=> d!139445 (=> res!843643 e!721991)))

(assert (=> d!139445 (= res!843643 (and ((_ is Cons!28360) l!874) (= (_1!10642 (h!29569 l!874)) key!235)))))

(assert (=> d!139445 (= (containsKey!680 l!874 key!235) e!721991)))

(declare-fun b!1267376 () Bool)

(declare-fun e!721992 () Bool)

(assert (=> b!1267376 (= e!721991 e!721992)))

(declare-fun res!843644 () Bool)

(assert (=> b!1267376 (=> (not res!843644) (not e!721992))))

(assert (=> b!1267376 (= res!843644 (and (or (not ((_ is Cons!28360) l!874)) (bvsle (_1!10642 (h!29569 l!874)) key!235)) ((_ is Cons!28360) l!874) (bvslt (_1!10642 (h!29569 l!874)) key!235)))))

(declare-fun b!1267377 () Bool)

(assert (=> b!1267377 (= e!721992 (containsKey!680 (t!41891 l!874) key!235))))

(assert (= (and d!139445 (not res!843643)) b!1267376))

(assert (= (and b!1267376 res!843644) b!1267377))

(declare-fun m!1166717 () Bool)

(assert (=> b!1267377 m!1166717))

(assert (=> b!1267318 d!139445))

(declare-fun d!139455 () Bool)

(declare-fun res!843649 () Bool)

(declare-fun e!721997 () Bool)

(assert (=> d!139455 (=> res!843649 e!721997)))

(assert (=> d!139455 (= res!843649 (or ((_ is Nil!28361) (t!41891 l!874)) ((_ is Nil!28361) (t!41891 (t!41891 l!874)))))))

(assert (=> d!139455 (= (isStrictlySorted!821 (t!41891 l!874)) e!721997)))

(declare-fun b!1267382 () Bool)

(declare-fun e!721998 () Bool)

(assert (=> b!1267382 (= e!721997 e!721998)))

(declare-fun res!843650 () Bool)

(assert (=> b!1267382 (=> (not res!843650) (not e!721998))))

(assert (=> b!1267382 (= res!843650 (bvslt (_1!10642 (h!29569 (t!41891 l!874))) (_1!10642 (h!29569 (t!41891 (t!41891 l!874))))))))

(declare-fun b!1267383 () Bool)

(assert (=> b!1267383 (= e!721998 (isStrictlySorted!821 (t!41891 (t!41891 l!874))))))

(assert (= (and d!139455 (not res!843649)) b!1267382))

(assert (= (and b!1267382 res!843650) b!1267383))

(declare-fun m!1166719 () Bool)

(assert (=> b!1267383 m!1166719))

(assert (=> b!1267320 d!139455))

(declare-fun d!139457 () Bool)

(declare-fun res!843651 () Bool)

(declare-fun e!721999 () Bool)

(assert (=> d!139457 (=> res!843651 e!721999)))

(assert (=> d!139457 (= res!843651 (or ((_ is Nil!28361) l!874) ((_ is Nil!28361) (t!41891 l!874))))))

(assert (=> d!139457 (= (isStrictlySorted!821 l!874) e!721999)))

(declare-fun b!1267384 () Bool)

(declare-fun e!722000 () Bool)

(assert (=> b!1267384 (= e!721999 e!722000)))

(declare-fun res!843652 () Bool)

(assert (=> b!1267384 (=> (not res!843652) (not e!722000))))

(assert (=> b!1267384 (= res!843652 (bvslt (_1!10642 (h!29569 l!874)) (_1!10642 (h!29569 (t!41891 l!874)))))))

(declare-fun b!1267385 () Bool)

(assert (=> b!1267385 (= e!722000 (isStrictlySorted!821 (t!41891 l!874)))))

(assert (= (and d!139457 (not res!843651)) b!1267384))

(assert (= (and b!1267384 res!843652) b!1267385))

(assert (=> b!1267385 m!1166699))

(assert (=> start!106770 d!139457))

(declare-fun b!1267390 () Bool)

(declare-fun e!722003 () Bool)

(declare-fun tp!96602 () Bool)

(assert (=> b!1267390 (= e!722003 (and tp_is_empty!32595 tp!96602))))

(assert (=> b!1267321 (= tp!96590 e!722003)))

(assert (= (and b!1267321 ((_ is Cons!28360) (t!41891 l!874))) b!1267390))

(check-sat (not b!1267377) tp_is_empty!32595 (not b!1267390) (not b!1267383) (not b!1267385))
