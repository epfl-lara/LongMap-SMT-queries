; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106788 () Bool)

(assert start!106788)

(declare-fun res!843674 () Bool)

(declare-fun e!722015 () Bool)

(assert (=> start!106788 (=> (not res!843674) (not e!722015))))

(declare-datatypes ((B!2080 0))(
  ( (B!2081 (val!16375 Int)) )
))
(declare-datatypes ((tuple2!21268 0))(
  ( (tuple2!21269 (_1!10645 (_ BitVec 64)) (_2!10645 B!2080)) )
))
(declare-datatypes ((List!28367 0))(
  ( (Nil!28364) (Cons!28363 (h!29572 tuple2!21268) (t!41894 List!28367)) )
))
(declare-fun l!874 () List!28367)

(declare-fun isStrictlySorted!824 (List!28367) Bool)

(assert (=> start!106788 (= res!843674 (isStrictlySorted!824 l!874))))

(assert (=> start!106788 e!722015))

(declare-fun e!722014 () Bool)

(assert (=> start!106788 e!722014))

(assert (=> start!106788 true))

(declare-fun b!1267416 () Bool)

(declare-fun res!843673 () Bool)

(assert (=> b!1267416 (=> (not res!843673) (not e!722015))))

(get-info :version)

(assert (=> b!1267416 (= res!843673 ((_ is Cons!28363) l!874))))

(declare-fun b!1267417 () Bool)

(declare-fun res!843675 () Bool)

(assert (=> b!1267417 (=> (not res!843675) (not e!722015))))

(assert (=> b!1267417 (= res!843675 (isStrictlySorted!824 (t!41894 l!874)))))

(declare-fun b!1267418 () Bool)

(declare-fun key!235 () (_ BitVec 64))

(declare-fun containsKey!683 (List!28367 (_ BitVec 64)) Bool)

(assert (=> b!1267418 (= e!722015 (containsKey!683 (t!41894 l!874) key!235))))

(declare-fun b!1267419 () Bool)

(declare-fun tp_is_empty!32601 () Bool)

(declare-fun tp!96608 () Bool)

(assert (=> b!1267419 (= e!722014 (and tp_is_empty!32601 tp!96608))))

(declare-fun b!1267420 () Bool)

(declare-fun res!843676 () Bool)

(assert (=> b!1267420 (=> (not res!843676) (not e!722015))))

(assert (=> b!1267420 (= res!843676 (not (containsKey!683 l!874 key!235)))))

(assert (= (and start!106788 res!843674) b!1267420))

(assert (= (and b!1267420 res!843676) b!1267416))

(assert (= (and b!1267416 res!843673) b!1267417))

(assert (= (and b!1267417 res!843675) b!1267418))

(assert (= (and start!106788 ((_ is Cons!28363) l!874)) b!1267419))

(declare-fun m!1166729 () Bool)

(assert (=> start!106788 m!1166729))

(declare-fun m!1166731 () Bool)

(assert (=> b!1267417 m!1166731))

(declare-fun m!1166733 () Bool)

(assert (=> b!1267418 m!1166733))

(declare-fun m!1166735 () Bool)

(assert (=> b!1267420 m!1166735))

(check-sat (not b!1267419) (not b!1267417) (not b!1267418) (not b!1267420) tp_is_empty!32601 (not start!106788))
(check-sat)
(get-model)

(declare-fun d!139462 () Bool)

(declare-fun res!843699 () Bool)

(declare-fun e!722032 () Bool)

(assert (=> d!139462 (=> res!843699 e!722032)))

(assert (=> d!139462 (= res!843699 (or ((_ is Nil!28364) l!874) ((_ is Nil!28364) (t!41894 l!874))))))

(assert (=> d!139462 (= (isStrictlySorted!824 l!874) e!722032)))

(declare-fun b!1267446 () Bool)

(declare-fun e!722033 () Bool)

(assert (=> b!1267446 (= e!722032 e!722033)))

(declare-fun res!843700 () Bool)

(assert (=> b!1267446 (=> (not res!843700) (not e!722033))))

(assert (=> b!1267446 (= res!843700 (bvslt (_1!10645 (h!29572 l!874)) (_1!10645 (h!29572 (t!41894 l!874)))))))

(declare-fun b!1267447 () Bool)

(assert (=> b!1267447 (= e!722033 (isStrictlySorted!824 (t!41894 l!874)))))

(assert (= (and d!139462 (not res!843699)) b!1267446))

(assert (= (and b!1267446 res!843700) b!1267447))

(assert (=> b!1267447 m!1166731))

(assert (=> start!106788 d!139462))

(declare-fun d!139467 () Bool)

(declare-fun res!843710 () Bool)

(declare-fun e!722043 () Bool)

(assert (=> d!139467 (=> res!843710 e!722043)))

(assert (=> d!139467 (= res!843710 (and ((_ is Cons!28363) l!874) (= (_1!10645 (h!29572 l!874)) key!235)))))

(assert (=> d!139467 (= (containsKey!683 l!874 key!235) e!722043)))

(declare-fun b!1267457 () Bool)

(declare-fun e!722045 () Bool)

(assert (=> b!1267457 (= e!722043 e!722045)))

(declare-fun res!843712 () Bool)

(assert (=> b!1267457 (=> (not res!843712) (not e!722045))))

(assert (=> b!1267457 (= res!843712 (and (or (not ((_ is Cons!28363) l!874)) (bvsle (_1!10645 (h!29572 l!874)) key!235)) ((_ is Cons!28363) l!874) (bvslt (_1!10645 (h!29572 l!874)) key!235)))))

(declare-fun b!1267459 () Bool)

(assert (=> b!1267459 (= e!722045 (containsKey!683 (t!41894 l!874) key!235))))

(assert (= (and d!139467 (not res!843710)) b!1267457))

(assert (= (and b!1267457 res!843712) b!1267459))

(assert (=> b!1267459 m!1166733))

(assert (=> b!1267420 d!139467))

(declare-fun d!139471 () Bool)

(declare-fun res!843715 () Bool)

(declare-fun e!722048 () Bool)

(assert (=> d!139471 (=> res!843715 e!722048)))

(assert (=> d!139471 (= res!843715 (or ((_ is Nil!28364) (t!41894 l!874)) ((_ is Nil!28364) (t!41894 (t!41894 l!874)))))))

(assert (=> d!139471 (= (isStrictlySorted!824 (t!41894 l!874)) e!722048)))

(declare-fun b!1267462 () Bool)

(declare-fun e!722049 () Bool)

(assert (=> b!1267462 (= e!722048 e!722049)))

(declare-fun res!843716 () Bool)

(assert (=> b!1267462 (=> (not res!843716) (not e!722049))))

(assert (=> b!1267462 (= res!843716 (bvslt (_1!10645 (h!29572 (t!41894 l!874))) (_1!10645 (h!29572 (t!41894 (t!41894 l!874))))))))

(declare-fun b!1267463 () Bool)

(assert (=> b!1267463 (= e!722049 (isStrictlySorted!824 (t!41894 (t!41894 l!874))))))

(assert (= (and d!139471 (not res!843715)) b!1267462))

(assert (= (and b!1267462 res!843716) b!1267463))

(declare-fun m!1166747 () Bool)

(assert (=> b!1267463 m!1166747))

(assert (=> b!1267417 d!139471))

(declare-fun d!139475 () Bool)

(declare-fun res!843719 () Bool)

(declare-fun e!722052 () Bool)

(assert (=> d!139475 (=> res!843719 e!722052)))

(assert (=> d!139475 (= res!843719 (and ((_ is Cons!28363) (t!41894 l!874)) (= (_1!10645 (h!29572 (t!41894 l!874))) key!235)))))

(assert (=> d!139475 (= (containsKey!683 (t!41894 l!874) key!235) e!722052)))

(declare-fun b!1267466 () Bool)

(declare-fun e!722053 () Bool)

(assert (=> b!1267466 (= e!722052 e!722053)))

(declare-fun res!843720 () Bool)

(assert (=> b!1267466 (=> (not res!843720) (not e!722053))))

(assert (=> b!1267466 (= res!843720 (and (or (not ((_ is Cons!28363) (t!41894 l!874))) (bvsle (_1!10645 (h!29572 (t!41894 l!874))) key!235)) ((_ is Cons!28363) (t!41894 l!874)) (bvslt (_1!10645 (h!29572 (t!41894 l!874))) key!235)))))

(declare-fun b!1267467 () Bool)

(assert (=> b!1267467 (= e!722053 (containsKey!683 (t!41894 (t!41894 l!874)) key!235))))

(assert (= (and d!139475 (not res!843719)) b!1267466))

(assert (= (and b!1267466 res!843720) b!1267467))

(declare-fun m!1166751 () Bool)

(assert (=> b!1267467 m!1166751))

(assert (=> b!1267418 d!139475))

(declare-fun b!1267476 () Bool)

(declare-fun e!722058 () Bool)

(declare-fun tp!96616 () Bool)

(assert (=> b!1267476 (= e!722058 (and tp_is_empty!32601 tp!96616))))

(assert (=> b!1267419 (= tp!96608 e!722058)))

(assert (= (and b!1267419 ((_ is Cons!28363) (t!41894 l!874))) b!1267476))

(check-sat tp_is_empty!32601 (not b!1267467) (not b!1267447) (not b!1267459) (not b!1267476) (not b!1267463))
(check-sat)
