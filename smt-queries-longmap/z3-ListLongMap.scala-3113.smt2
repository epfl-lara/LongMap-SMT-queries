; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43758 () Bool)

(assert start!43758)

(declare-fun b!483599 () Bool)

(declare-fun e!284629 () Bool)

(declare-fun e!284630 () Bool)

(assert (=> b!483599 (= e!284629 e!284630)))

(declare-fun res!288161 () Bool)

(assert (=> b!483599 (=> (not res!288161) (not e!284630))))

(declare-datatypes ((B!1100 0))(
  ( (B!1101 (val!7002 Int)) )
))
(declare-datatypes ((tuple2!9256 0))(
  ( (tuple2!9257 (_1!4639 (_ BitVec 64)) (_2!4639 B!1100)) )
))
(declare-datatypes ((List!9304 0))(
  ( (Nil!9301) (Cons!9300 (h!10156 tuple2!9256) (t!15517 List!9304)) )
))
(declare-fun l!956 () List!9304)

(declare-fun key!251 () (_ BitVec 64))

(get-info :version)

(assert (=> b!483599 (= res!288161 (and ((_ is Cons!9300) l!956) (bvslt (_1!4639 (h!10156 l!956)) key!251)))))

(declare-fun lt!219066 () List!9304)

(declare-fun value!166 () B!1100)

(declare-fun insertStrictlySorted!224 (List!9304 (_ BitVec 64) B!1100) List!9304)

(assert (=> b!483599 (= lt!219066 (insertStrictlySorted!224 l!956 key!251 value!166))))

(declare-fun res!288157 () Bool)

(assert (=> start!43758 (=> (not res!288157) (not e!284629))))

(declare-fun isStrictlySorted!401 (List!9304) Bool)

(assert (=> start!43758 (= res!288157 (isStrictlySorted!401 l!956))))

(assert (=> start!43758 e!284629))

(declare-fun e!284631 () Bool)

(assert (=> start!43758 e!284631))

(assert (=> start!43758 true))

(declare-fun tp_is_empty!13909 () Bool)

(assert (=> start!43758 tp_is_empty!13909))

(declare-fun b!483600 () Bool)

(declare-fun res!288159 () Bool)

(assert (=> b!483600 (=> (not res!288159) (not e!284630))))

(assert (=> b!483600 (= res!288159 (isStrictlySorted!401 (t!15517 l!956)))))

(declare-fun b!483601 () Bool)

(assert (=> b!483601 (= e!284630 (not true))))

(declare-fun length!8 (List!9304) Int)

(assert (=> b!483601 (= (length!8 (insertStrictlySorted!224 (t!15517 l!956) key!251 value!166)) (+ 1 (length!8 (t!15517 l!956))))))

(declare-datatypes ((Unit!14158 0))(
  ( (Unit!14159) )
))
(declare-fun lt!219067 () Unit!14158)

(declare-fun lemmaAddNewKeyIncrementSize!1 (List!9304 (_ BitVec 64) B!1100) Unit!14158)

(assert (=> b!483601 (= lt!219067 (lemmaAddNewKeyIncrementSize!1 (t!15517 l!956) key!251 value!166))))

(declare-fun b!483602 () Bool)

(declare-fun tp!43453 () Bool)

(assert (=> b!483602 (= e!284631 (and tp_is_empty!13909 tp!43453))))

(declare-fun b!483603 () Bool)

(declare-fun res!288160 () Bool)

(assert (=> b!483603 (=> (not res!288160) (not e!284630))))

(declare-fun containsKey!366 (List!9304 (_ BitVec 64)) Bool)

(assert (=> b!483603 (= res!288160 (not (containsKey!366 (t!15517 l!956) key!251)))))

(declare-fun b!483604 () Bool)

(declare-fun res!288158 () Bool)

(assert (=> b!483604 (=> (not res!288158) (not e!284629))))

(assert (=> b!483604 (= res!288158 (not (containsKey!366 l!956 key!251)))))

(assert (= (and start!43758 res!288157) b!483604))

(assert (= (and b!483604 res!288158) b!483599))

(assert (= (and b!483599 res!288161) b!483600))

(assert (= (and b!483600 res!288159) b!483603))

(assert (= (and b!483603 res!288160) b!483601))

(assert (= (and start!43758 ((_ is Cons!9300) l!956)) b!483602))

(declare-fun m!464019 () Bool)

(assert (=> b!483603 m!464019))

(declare-fun m!464021 () Bool)

(assert (=> start!43758 m!464021))

(declare-fun m!464023 () Bool)

(assert (=> b!483599 m!464023))

(declare-fun m!464025 () Bool)

(assert (=> b!483601 m!464025))

(assert (=> b!483601 m!464025))

(declare-fun m!464027 () Bool)

(assert (=> b!483601 m!464027))

(declare-fun m!464029 () Bool)

(assert (=> b!483601 m!464029))

(declare-fun m!464031 () Bool)

(assert (=> b!483601 m!464031))

(declare-fun m!464033 () Bool)

(assert (=> b!483600 m!464033))

(declare-fun m!464035 () Bool)

(assert (=> b!483604 m!464035))

(check-sat tp_is_empty!13909 (not b!483602) (not b!483600) (not b!483599) (not start!43758) (not b!483601) (not b!483604) (not b!483603))
(check-sat)
