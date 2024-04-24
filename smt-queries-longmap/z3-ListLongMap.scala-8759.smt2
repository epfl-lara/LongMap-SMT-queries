; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106572 () Bool)

(assert start!106572)

(declare-fun b!1266293 () Bool)

(declare-fun e!721236 () Bool)

(assert (=> b!1266293 (= e!721236 (not true))))

(declare-datatypes ((B!1946 0))(
  ( (B!1947 (val!16308 Int)) )
))
(declare-datatypes ((tuple2!21144 0))(
  ( (tuple2!21145 (_1!10583 (_ BitVec 64)) (_2!10583 B!1946)) )
))
(declare-datatypes ((List!28336 0))(
  ( (Nil!28333) (Cons!28332 (h!29550 tuple2!21144) (t!41849 List!28336)) )
))
(declare-fun l!706 () List!28336)

(declare-fun key1!31 () (_ BitVec 64))

(declare-fun v1!26 () B!1946)

(declare-fun removeStrictlySorted!148 (List!28336 (_ BitVec 64)) List!28336)

(declare-fun insertStrictlySorted!457 (List!28336 (_ BitVec 64) B!1946) List!28336)

(assert (=> b!1266293 (= (removeStrictlySorted!148 (insertStrictlySorted!457 (t!41849 l!706) key1!31 v1!26) key1!31) (t!41849 l!706))))

(declare-datatypes ((Unit!42145 0))(
  ( (Unit!42146) )
))
(declare-fun lt!574480 () Unit!42145)

(declare-fun lemmaInsertStrictlySortedThenRemoveIsSame!4 (List!28336 (_ BitVec 64) B!1946) Unit!42145)

(assert (=> b!1266293 (= lt!574480 (lemmaInsertStrictlySortedThenRemoveIsSame!4 (t!41849 l!706) key1!31 v1!26))))

(declare-fun res!842859 () Bool)

(assert (=> start!106572 (=> (not res!842859) (not e!721236))))

(declare-fun isStrictlySorted!766 (List!28336) Bool)

(assert (=> start!106572 (= res!842859 (isStrictlySorted!766 l!706))))

(assert (=> start!106572 e!721236))

(declare-fun e!721235 () Bool)

(assert (=> start!106572 e!721235))

(assert (=> start!106572 true))

(declare-fun tp_is_empty!32479 () Bool)

(assert (=> start!106572 tp_is_empty!32479))

(declare-fun b!1266294 () Bool)

(declare-fun res!842858 () Bool)

(assert (=> b!1266294 (=> (not res!842858) (not e!721236))))

(assert (=> b!1266294 (= res!842858 (isStrictlySorted!766 (t!41849 l!706)))))

(declare-fun b!1266295 () Bool)

(declare-fun res!842860 () Bool)

(assert (=> b!1266295 (=> (not res!842860) (not e!721236))))

(declare-fun containsKey!637 (List!28336 (_ BitVec 64)) Bool)

(assert (=> b!1266295 (= res!842860 (not (containsKey!637 (t!41849 l!706) key1!31)))))

(declare-fun b!1266296 () Bool)

(declare-fun res!842857 () Bool)

(assert (=> b!1266296 (=> (not res!842857) (not e!721236))))

(get-info :version)

(assert (=> b!1266296 (= res!842857 ((_ is Cons!28332) l!706))))

(declare-fun b!1266297 () Bool)

(declare-fun res!842861 () Bool)

(assert (=> b!1266297 (=> (not res!842861) (not e!721236))))

(assert (=> b!1266297 (= res!842861 (not (containsKey!637 l!706 key1!31)))))

(declare-fun b!1266298 () Bool)

(declare-fun tp!96284 () Bool)

(assert (=> b!1266298 (= e!721235 (and tp_is_empty!32479 tp!96284))))

(assert (= (and start!106572 res!842859) b!1266297))

(assert (= (and b!1266297 res!842861) b!1266296))

(assert (= (and b!1266296 res!842857) b!1266294))

(assert (= (and b!1266294 res!842858) b!1266295))

(assert (= (and b!1266295 res!842860) b!1266293))

(assert (= (and start!106572 ((_ is Cons!28332) l!706)) b!1266298))

(declare-fun m!1166983 () Bool)

(assert (=> b!1266297 m!1166983))

(declare-fun m!1166985 () Bool)

(assert (=> start!106572 m!1166985))

(declare-fun m!1166987 () Bool)

(assert (=> b!1266293 m!1166987))

(assert (=> b!1266293 m!1166987))

(declare-fun m!1166989 () Bool)

(assert (=> b!1266293 m!1166989))

(declare-fun m!1166991 () Bool)

(assert (=> b!1266293 m!1166991))

(declare-fun m!1166993 () Bool)

(assert (=> b!1266294 m!1166993))

(declare-fun m!1166995 () Bool)

(assert (=> b!1266295 m!1166995))

(check-sat (not b!1266295) (not b!1266297) tp_is_empty!32479 (not b!1266298) (not b!1266293) (not start!106572) (not b!1266294))
(check-sat)
