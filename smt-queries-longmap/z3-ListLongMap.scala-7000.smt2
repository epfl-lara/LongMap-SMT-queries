; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88892 () Bool)

(assert start!88892)

(declare-fun res!683708 () Bool)

(declare-fun e!574113 () Bool)

(assert (=> start!88892 (=> (not res!683708) (not e!574113))))

(declare-datatypes ((B!1706 0))(
  ( (B!1707 (val!11937 Int)) )
))
(declare-datatypes ((tuple2!15500 0))(
  ( (tuple2!15501 (_1!7761 (_ BitVec 64)) (_2!7761 B!1706)) )
))
(declare-datatypes ((List!21660 0))(
  ( (Nil!21657) (Cons!21656 (h!22854 tuple2!15500) (t!30661 List!21660)) )
))
(declare-fun l!1367 () List!21660)

(declare-fun isStrictlySorted!686 (List!21660) Bool)

(assert (=> start!88892 (= res!683708 (isStrictlySorted!686 l!1367))))

(assert (=> start!88892 e!574113))

(declare-fun e!574115 () Bool)

(assert (=> start!88892 e!574115))

(assert (=> start!88892 true))

(declare-fun tp_is_empty!23773 () Bool)

(assert (=> start!88892 tp_is_empty!23773))

(declare-fun b!1020036 () Bool)

(declare-fun tp!71209 () Bool)

(assert (=> b!1020036 (= e!574115 (and tp_is_empty!23773 tp!71209))))

(declare-fun b!1020037 () Bool)

(declare-fun e!574114 () Bool)

(assert (=> b!1020037 (= e!574114 false)))

(declare-fun lt!449592 () Bool)

(declare-fun lt!449593 () tuple2!15500)

(declare-fun contains!5892 (List!21660 tuple2!15500) Bool)

(assert (=> b!1020037 (= lt!449592 (contains!5892 (t!30661 l!1367) lt!449593))))

(declare-fun b!1020038 () Bool)

(declare-fun res!683707 () Bool)

(assert (=> b!1020038 (=> (not res!683707) (not e!574114))))

(get-info :version)

(assert (=> b!1020038 (= res!683707 (and ((_ is Cons!21656) l!1367) (not (= (h!22854 l!1367) lt!449593))))))

(declare-fun b!1020039 () Bool)

(assert (=> b!1020039 (= e!574113 e!574114)))

(declare-fun res!683709 () Bool)

(assert (=> b!1020039 (=> (not res!683709) (not e!574114))))

(assert (=> b!1020039 (= res!683709 (contains!5892 l!1367 lt!449593))))

(declare-fun key!393 () (_ BitVec 64))

(declare-fun value!188 () B!1706)

(assert (=> b!1020039 (= lt!449593 (tuple2!15501 key!393 value!188))))

(declare-fun b!1020040 () Bool)

(declare-fun res!683710 () Bool)

(assert (=> b!1020040 (=> (not res!683710) (not e!574114))))

(assert (=> b!1020040 (= res!683710 (isStrictlySorted!686 (t!30661 l!1367)))))

(assert (= (and start!88892 res!683708) b!1020039))

(assert (= (and b!1020039 res!683709) b!1020038))

(assert (= (and b!1020038 res!683707) b!1020040))

(assert (= (and b!1020040 res!683710) b!1020037))

(assert (= (and start!88892 ((_ is Cons!21656) l!1367)) b!1020036))

(declare-fun m!939611 () Bool)

(assert (=> start!88892 m!939611))

(declare-fun m!939613 () Bool)

(assert (=> b!1020037 m!939613))

(declare-fun m!939615 () Bool)

(assert (=> b!1020039 m!939615))

(declare-fun m!939617 () Bool)

(assert (=> b!1020040 m!939617))

(check-sat (not b!1020039) (not start!88892) (not b!1020037) tp_is_empty!23773 (not b!1020040) (not b!1020036))
(check-sat)
