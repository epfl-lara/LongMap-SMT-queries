; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43758 () Bool)

(assert start!43758)

(declare-fun res!288282 () Bool)

(declare-fun e!284764 () Bool)

(assert (=> start!43758 (=> (not res!288282) (not e!284764))))

(declare-datatypes ((B!1100 0))(
  ( (B!1101 (val!7002 Int)) )
))
(declare-datatypes ((tuple2!9120 0))(
  ( (tuple2!9121 (_1!4571 (_ BitVec 64)) (_2!4571 B!1100)) )
))
(declare-datatypes ((List!9168 0))(
  ( (Nil!9165) (Cons!9164 (h!10020 tuple2!9120) (t!15382 List!9168)) )
))
(declare-fun l!956 () List!9168)

(declare-fun isStrictlySorted!393 (List!9168) Bool)

(assert (=> start!43758 (= res!288282 (isStrictlySorted!393 l!956))))

(assert (=> start!43758 e!284764))

(declare-fun e!284766 () Bool)

(assert (=> start!43758 e!284766))

(assert (=> start!43758 true))

(declare-fun tp_is_empty!13909 () Bool)

(assert (=> start!43758 tp_is_empty!13909))

(declare-fun b!483809 () Bool)

(declare-fun res!288281 () Bool)

(declare-fun e!284765 () Bool)

(assert (=> b!483809 (=> (not res!288281) (not e!284765))))

(assert (=> b!483809 (= res!288281 (isStrictlySorted!393 (t!15382 l!956)))))

(declare-fun b!483810 () Bool)

(declare-fun tp!43453 () Bool)

(assert (=> b!483810 (= e!284766 (and tp_is_empty!13909 tp!43453))))

(declare-fun b!483811 () Bool)

(assert (=> b!483811 (= e!284764 e!284765)))

(declare-fun res!288280 () Bool)

(assert (=> b!483811 (=> (not res!288280) (not e!284765))))

(declare-fun key!251 () (_ BitVec 64))

(get-info :version)

(assert (=> b!483811 (= res!288280 (and ((_ is Cons!9164) l!956) (bvslt (_1!4571 (h!10020 l!956)) key!251)))))

(declare-fun lt!219313 () List!9168)

(declare-fun value!166 () B!1100)

(declare-fun insertStrictlySorted!224 (List!9168 (_ BitVec 64) B!1100) List!9168)

(assert (=> b!483811 (= lt!219313 (insertStrictlySorted!224 l!956 key!251 value!166))))

(declare-fun b!483812 () Bool)

(declare-fun res!288279 () Bool)

(assert (=> b!483812 (=> (not res!288279) (not e!284765))))

(declare-fun containsKey!368 (List!9168 (_ BitVec 64)) Bool)

(assert (=> b!483812 (= res!288279 (not (containsKey!368 (t!15382 l!956) key!251)))))

(declare-fun b!483813 () Bool)

(assert (=> b!483813 (= e!284765 (not true))))

(declare-fun length!8 (List!9168) Int)

(assert (=> b!483813 (= (length!8 (insertStrictlySorted!224 (t!15382 l!956) key!251 value!166)) (+ 1 (length!8 (t!15382 l!956))))))

(declare-datatypes ((Unit!14141 0))(
  ( (Unit!14142) )
))
(declare-fun lt!219312 () Unit!14141)

(declare-fun lemmaAddNewKeyIncrementSize!1 (List!9168 (_ BitVec 64) B!1100) Unit!14141)

(assert (=> b!483813 (= lt!219312 (lemmaAddNewKeyIncrementSize!1 (t!15382 l!956) key!251 value!166))))

(declare-fun b!483814 () Bool)

(declare-fun res!288283 () Bool)

(assert (=> b!483814 (=> (not res!288283) (not e!284764))))

(assert (=> b!483814 (= res!288283 (not (containsKey!368 l!956 key!251)))))

(assert (= (and start!43758 res!288282) b!483814))

(assert (= (and b!483814 res!288283) b!483811))

(assert (= (and b!483811 res!288280) b!483809))

(assert (= (and b!483809 res!288281) b!483812))

(assert (= (and b!483812 res!288279) b!483813))

(assert (= (and start!43758 ((_ is Cons!9164) l!956)) b!483810))

(declare-fun m!464935 () Bool)

(assert (=> b!483811 m!464935))

(declare-fun m!464937 () Bool)

(assert (=> b!483809 m!464937))

(declare-fun m!464939 () Bool)

(assert (=> b!483814 m!464939))

(declare-fun m!464941 () Bool)

(assert (=> b!483812 m!464941))

(declare-fun m!464943 () Bool)

(assert (=> start!43758 m!464943))

(declare-fun m!464945 () Bool)

(assert (=> b!483813 m!464945))

(assert (=> b!483813 m!464945))

(declare-fun m!464947 () Bool)

(assert (=> b!483813 m!464947))

(declare-fun m!464949 () Bool)

(assert (=> b!483813 m!464949))

(declare-fun m!464951 () Bool)

(assert (=> b!483813 m!464951))

(check-sat (not b!483812) (not start!43758) tp_is_empty!13909 (not b!483814) (not b!483809) (not b!483811) (not b!483813) (not b!483810))
(check-sat)
