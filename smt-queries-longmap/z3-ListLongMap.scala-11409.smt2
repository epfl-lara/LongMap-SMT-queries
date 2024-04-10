; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132850 () Bool)

(assert start!132850)

(declare-fun res!1064580 () Bool)

(declare-fun e!866597 () Bool)

(assert (=> start!132850 (=> (not res!1064580) (not e!866597))))

(declare-datatypes ((B!2332 0))(
  ( (B!2333 (val!19252 Int)) )
))
(declare-datatypes ((tuple2!24880 0))(
  ( (tuple2!24881 (_1!12451 (_ BitVec 64)) (_2!12451 B!2332)) )
))
(declare-datatypes ((List!36286 0))(
  ( (Nil!36283) (Cons!36282 (h!37728 tuple2!24880) (t!51007 List!36286)) )
))
(declare-fun l!1177 () List!36286)

(declare-fun isStrictlySorted!939 (List!36286) Bool)

(assert (=> start!132850 (= res!1064580 (isStrictlySorted!939 l!1177))))

(assert (=> start!132850 e!866597))

(declare-fun e!866596 () Bool)

(assert (=> start!132850 e!866596))

(assert (=> start!132850 true))

(declare-fun b!1556022 () Bool)

(declare-fun res!1064581 () Bool)

(assert (=> b!1556022 (=> (not res!1064581) (not e!866597))))

(declare-fun newKey!105 () (_ BitVec 64))

(declare-fun otherKey!50 () (_ BitVec 64))

(assert (=> b!1556022 (= res!1064581 (not (= newKey!105 otherKey!50)))))

(declare-fun b!1556023 () Bool)

(declare-fun ListPrimitiveSize!176 (List!36286) Int)

(assert (=> b!1556023 (= e!866597 (< (ListPrimitiveSize!176 l!1177) 0))))

(declare-fun b!1556024 () Bool)

(declare-fun tp_is_empty!38343 () Bool)

(declare-fun tp!112374 () Bool)

(assert (=> b!1556024 (= e!866596 (and tp_is_empty!38343 tp!112374))))

(assert (= (and start!132850 res!1064580) b!1556022))

(assert (= (and b!1556022 res!1064581) b!1556023))

(get-info :version)

(assert (= (and start!132850 ((_ is Cons!36282) l!1177)) b!1556024))

(declare-fun m!1433755 () Bool)

(assert (=> start!132850 m!1433755))

(declare-fun m!1433757 () Bool)

(assert (=> b!1556023 m!1433757))

(check-sat (not b!1556023) (not start!132850) (not b!1556024) tp_is_empty!38343)
(check-sat)
(get-model)

(declare-fun d!162049 () Bool)

(declare-fun lt!670375 () Int)

(assert (=> d!162049 (>= lt!670375 0)))

(declare-fun e!866608 () Int)

(assert (=> d!162049 (= lt!670375 e!866608)))

(declare-fun c!143710 () Bool)

(assert (=> d!162049 (= c!143710 ((_ is Nil!36283) l!1177))))

(assert (=> d!162049 (= (ListPrimitiveSize!176 l!1177) lt!670375)))

(declare-fun b!1556042 () Bool)

(assert (=> b!1556042 (= e!866608 0)))

(declare-fun b!1556043 () Bool)

(assert (=> b!1556043 (= e!866608 (+ 1 (ListPrimitiveSize!176 (t!51007 l!1177))))))

(assert (= (and d!162049 c!143710) b!1556042))

(assert (= (and d!162049 (not c!143710)) b!1556043))

(declare-fun m!1433763 () Bool)

(assert (=> b!1556043 m!1433763))

(assert (=> b!1556023 d!162049))

(declare-fun d!162055 () Bool)

(declare-fun res!1064602 () Bool)

(declare-fun e!866624 () Bool)

(assert (=> d!162055 (=> res!1064602 e!866624)))

(assert (=> d!162055 (= res!1064602 (or ((_ is Nil!36283) l!1177) ((_ is Nil!36283) (t!51007 l!1177))))))

(assert (=> d!162055 (= (isStrictlySorted!939 l!1177) e!866624)))

(declare-fun b!1556060 () Bool)

(declare-fun e!866625 () Bool)

(assert (=> b!1556060 (= e!866624 e!866625)))

(declare-fun res!1064603 () Bool)

(assert (=> b!1556060 (=> (not res!1064603) (not e!866625))))

(assert (=> b!1556060 (= res!1064603 (bvslt (_1!12451 (h!37728 l!1177)) (_1!12451 (h!37728 (t!51007 l!1177)))))))

(declare-fun b!1556061 () Bool)

(assert (=> b!1556061 (= e!866625 (isStrictlySorted!939 (t!51007 l!1177)))))

(assert (= (and d!162055 (not res!1064602)) b!1556060))

(assert (= (and b!1556060 res!1064603) b!1556061))

(declare-fun m!1433769 () Bool)

(assert (=> b!1556061 m!1433769))

(assert (=> start!132850 d!162055))

(declare-fun b!1556072 () Bool)

(declare-fun e!866632 () Bool)

(declare-fun tp!112380 () Bool)

(assert (=> b!1556072 (= e!866632 (and tp_is_empty!38343 tp!112380))))

(assert (=> b!1556024 (= tp!112374 e!866632)))

(assert (= (and b!1556024 ((_ is Cons!36282) (t!51007 l!1177))) b!1556072))

(check-sat (not b!1556043) (not b!1556061) (not b!1556072) tp_is_empty!38343)
(check-sat)
