; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43772 () Bool)

(assert start!43772)

(declare-fun b!483888 () Bool)

(declare-fun res!288301 () Bool)

(declare-fun e!284812 () Bool)

(assert (=> b!483888 (=> (not res!288301) (not e!284812))))

(declare-datatypes ((B!1102 0))(
  ( (B!1103 (val!7003 Int)) )
))
(declare-datatypes ((tuple2!9208 0))(
  ( (tuple2!9209 (_1!4615 (_ BitVec 64)) (_2!4615 B!1102)) )
))
(declare-datatypes ((List!9267 0))(
  ( (Nil!9264) (Cons!9263 (h!10119 tuple2!9208) (t!15489 List!9267)) )
))
(declare-fun l!956 () List!9267)

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!369 (List!9267 (_ BitVec 64)) Bool)

(assert (=> b!483888 (= res!288301 (not (containsKey!369 (t!15489 l!956) key!251)))))

(declare-fun b!483889 () Bool)

(declare-fun res!288303 () Bool)

(declare-fun e!284813 () Bool)

(assert (=> b!483889 (=> (not res!288303) (not e!284813))))

(assert (=> b!483889 (= res!288303 (not (containsKey!369 l!956 key!251)))))

(declare-fun b!483890 () Bool)

(declare-fun e!284814 () Bool)

(declare-fun tp_is_empty!13911 () Bool)

(declare-fun tp!43456 () Bool)

(assert (=> b!483890 (= e!284814 (and tp_is_empty!13911 tp!43456))))

(declare-fun b!483891 () Bool)

(assert (=> b!483891 (= e!284813 e!284812)))

(declare-fun res!288305 () Bool)

(assert (=> b!483891 (=> (not res!288305) (not e!284812))))

(get-info :version)

(assert (=> b!483891 (= res!288305 (and ((_ is Cons!9263) l!956) (bvslt (_1!4615 (h!10119 l!956)) key!251)))))

(declare-fun value!166 () B!1102)

(declare-fun lt!219306 () List!9267)

(declare-fun insertStrictlySorted!224 (List!9267 (_ BitVec 64) B!1102) List!9267)

(assert (=> b!483891 (= lt!219306 (insertStrictlySorted!224 l!956 key!251 value!166))))

(declare-fun res!288304 () Bool)

(assert (=> start!43772 (=> (not res!288304) (not e!284813))))

(declare-fun isStrictlySorted!406 (List!9267) Bool)

(assert (=> start!43772 (= res!288304 (isStrictlySorted!406 l!956))))

(assert (=> start!43772 e!284813))

(assert (=> start!43772 e!284814))

(assert (=> start!43772 true))

(assert (=> start!43772 tp_is_empty!13911))

(declare-fun b!483892 () Bool)

(declare-fun res!288302 () Bool)

(assert (=> b!483892 (=> (not res!288302) (not e!284812))))

(assert (=> b!483892 (= res!288302 (isStrictlySorted!406 (t!15489 l!956)))))

(declare-fun b!483893 () Bool)

(assert (=> b!483893 (= e!284812 (not true))))

(declare-fun length!9 (List!9267) Int)

(assert (=> b!483893 (= (length!9 (insertStrictlySorted!224 (t!15489 l!956) key!251 value!166)) (+ 1 (length!9 (t!15489 l!956))))))

(declare-datatypes ((Unit!14178 0))(
  ( (Unit!14179) )
))
(declare-fun lt!219307 () Unit!14178)

(declare-fun lemmaAddNewKeyIncrementSize!2 (List!9267 (_ BitVec 64) B!1102) Unit!14178)

(assert (=> b!483893 (= lt!219307 (lemmaAddNewKeyIncrementSize!2 (t!15489 l!956) key!251 value!166))))

(assert (= (and start!43772 res!288304) b!483889))

(assert (= (and b!483889 res!288303) b!483891))

(assert (= (and b!483891 res!288305) b!483892))

(assert (= (and b!483892 res!288302) b!483888))

(assert (= (and b!483888 res!288301) b!483893))

(assert (= (and start!43772 ((_ is Cons!9263) l!956)) b!483890))

(declare-fun m!464769 () Bool)

(assert (=> b!483893 m!464769))

(assert (=> b!483893 m!464769))

(declare-fun m!464771 () Bool)

(assert (=> b!483893 m!464771))

(declare-fun m!464773 () Bool)

(assert (=> b!483893 m!464773))

(declare-fun m!464775 () Bool)

(assert (=> b!483893 m!464775))

(declare-fun m!464777 () Bool)

(assert (=> b!483891 m!464777))

(declare-fun m!464779 () Bool)

(assert (=> b!483889 m!464779))

(declare-fun m!464781 () Bool)

(assert (=> start!43772 m!464781))

(declare-fun m!464783 () Bool)

(assert (=> b!483888 m!464783))

(declare-fun m!464785 () Bool)

(assert (=> b!483892 m!464785))

(check-sat (not b!483891) tp_is_empty!13911 (not start!43772) (not b!483890) (not b!483892) (not b!483889) (not b!483893) (not b!483888))
(check-sat)
