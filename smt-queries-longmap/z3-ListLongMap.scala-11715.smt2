; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137540 () Bool)

(assert start!137540)

(declare-fun res!1080250 () Bool)

(declare-fun e!882988 () Bool)

(assert (=> start!137540 (=> (not res!1080250) (not e!882988))))

(declare-datatypes ((B!2618 0))(
  ( (B!2619 (val!19671 Int)) )
))
(declare-datatypes ((tuple2!25510 0))(
  ( (tuple2!25511 (_1!12766 (_ BitVec 64)) (_2!12766 B!2618)) )
))
(declare-datatypes ((List!36823 0))(
  ( (Nil!36820) (Cons!36819 (h!38380 tuple2!25510) (t!51729 List!36823)) )
))
(declare-fun l!1390 () List!36823)

(declare-fun isStrictlySorted!1037 (List!36823) Bool)

(assert (=> start!137540 (= res!1080250 (isStrictlySorted!1037 l!1390))))

(assert (=> start!137540 e!882988))

(declare-fun e!882989 () Bool)

(assert (=> start!137540 e!882989))

(assert (=> start!137540 true))

(declare-fun tp_is_empty!39163 () Bool)

(assert (=> start!137540 tp_is_empty!39163))

(declare-fun b!1582504 () Bool)

(declare-fun res!1080251 () Bool)

(assert (=> b!1582504 (=> (not res!1080251) (not e!882988))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!896 (List!36823 (_ BitVec 64)) Bool)

(assert (=> b!1582504 (= res!1080251 (containsKey!896 l!1390 key!405))))

(declare-fun b!1582505 () Bool)

(assert (=> b!1582505 (= e!882988 false)))

(declare-fun lt!677568 () Bool)

(declare-fun value!194 () B!2618)

(declare-fun contains!10508 (List!36823 tuple2!25510) Bool)

(assert (=> b!1582505 (= lt!677568 (contains!10508 l!1390 (tuple2!25511 key!405 value!194)))))

(declare-fun b!1582506 () Bool)

(declare-fun tp!114405 () Bool)

(assert (=> b!1582506 (= e!882989 (and tp_is_empty!39163 tp!114405))))

(assert (= (and start!137540 res!1080250) b!1582504))

(assert (= (and b!1582504 res!1080251) b!1582505))

(get-info :version)

(assert (= (and start!137540 ((_ is Cons!36819) l!1390)) b!1582506))

(declare-fun m!1453893 () Bool)

(assert (=> start!137540 m!1453893))

(declare-fun m!1453895 () Bool)

(assert (=> b!1582504 m!1453895))

(declare-fun m!1453897 () Bool)

(assert (=> b!1582505 m!1453897))

(check-sat (not start!137540) (not b!1582506) tp_is_empty!39163 (not b!1582504) (not b!1582505))
(check-sat)
