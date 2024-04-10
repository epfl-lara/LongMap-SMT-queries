; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43774 () Bool)

(assert start!43774)

(declare-fun b!483906 () Bool)

(declare-fun e!284821 () Bool)

(declare-fun e!284822 () Bool)

(assert (=> b!483906 (= e!284821 e!284822)))

(declare-fun res!288318 () Bool)

(assert (=> b!483906 (=> (not res!288318) (not e!284822))))

(declare-datatypes ((B!1104 0))(
  ( (B!1105 (val!7004 Int)) )
))
(declare-datatypes ((tuple2!9210 0))(
  ( (tuple2!9211 (_1!4616 (_ BitVec 64)) (_2!4616 B!1104)) )
))
(declare-datatypes ((List!9268 0))(
  ( (Nil!9265) (Cons!9264 (h!10120 tuple2!9210) (t!15490 List!9268)) )
))
(declare-fun l!956 () List!9268)

(declare-fun key!251 () (_ BitVec 64))

(assert (=> b!483906 (= res!288318 (and (is-Cons!9264 l!956) (bvslt (_1!4616 (h!10120 l!956)) key!251)))))

(declare-fun lt!219313 () List!9268)

(declare-fun value!166 () B!1104)

(declare-fun insertStrictlySorted!225 (List!9268 (_ BitVec 64) B!1104) List!9268)

(assert (=> b!483906 (= lt!219313 (insertStrictlySorted!225 l!956 key!251 value!166))))

(declare-fun b!483907 () Bool)

(declare-fun e!284823 () Bool)

(declare-fun tp_is_empty!13913 () Bool)

(declare-fun tp!43459 () Bool)

(assert (=> b!483907 (= e!284823 (and tp_is_empty!13913 tp!43459))))

(declare-fun b!483908 () Bool)

(declare-fun res!288317 () Bool)

(assert (=> b!483908 (=> (not res!288317) (not e!284821))))

(declare-fun containsKey!370 (List!9268 (_ BitVec 64)) Bool)

(assert (=> b!483908 (= res!288317 (not (containsKey!370 l!956 key!251)))))

(declare-fun res!288316 () Bool)

(assert (=> start!43774 (=> (not res!288316) (not e!284821))))

(declare-fun isStrictlySorted!407 (List!9268) Bool)

(assert (=> start!43774 (= res!288316 (isStrictlySorted!407 l!956))))

(assert (=> start!43774 e!284821))

(assert (=> start!43774 e!284823))

(assert (=> start!43774 true))

(assert (=> start!43774 tp_is_empty!13913))

(declare-fun b!483909 () Bool)

(assert (=> b!483909 (= e!284822 (not true))))

(declare-fun length!10 (List!9268) Int)

(assert (=> b!483909 (= (length!10 (insertStrictlySorted!225 (t!15490 l!956) key!251 value!166)) (+ 1 (length!10 (t!15490 l!956))))))

(declare-datatypes ((Unit!14180 0))(
  ( (Unit!14181) )
))
(declare-fun lt!219312 () Unit!14180)

(declare-fun lemmaAddNewKeyIncrementSize!3 (List!9268 (_ BitVec 64) B!1104) Unit!14180)

(assert (=> b!483909 (= lt!219312 (lemmaAddNewKeyIncrementSize!3 (t!15490 l!956) key!251 value!166))))

(declare-fun b!483910 () Bool)

(declare-fun res!288320 () Bool)

(assert (=> b!483910 (=> (not res!288320) (not e!284822))))

(assert (=> b!483910 (= res!288320 (isStrictlySorted!407 (t!15490 l!956)))))

(declare-fun b!483911 () Bool)

(declare-fun res!288319 () Bool)

(assert (=> b!483911 (=> (not res!288319) (not e!284822))))

(assert (=> b!483911 (= res!288319 (not (containsKey!370 (t!15490 l!956) key!251)))))

(assert (= (and start!43774 res!288316) b!483908))

(assert (= (and b!483908 res!288317) b!483906))

(assert (= (and b!483906 res!288318) b!483910))

(assert (= (and b!483910 res!288320) b!483911))

(assert (= (and b!483911 res!288319) b!483909))

(assert (= (and start!43774 (is-Cons!9264 l!956)) b!483907))

(declare-fun m!464787 () Bool)

(assert (=> b!483909 m!464787))

(assert (=> b!483909 m!464787))

(declare-fun m!464789 () Bool)

(assert (=> b!483909 m!464789))

(declare-fun m!464791 () Bool)

(assert (=> b!483909 m!464791))

(declare-fun m!464793 () Bool)

(assert (=> b!483909 m!464793))

(declare-fun m!464795 () Bool)

(assert (=> start!43774 m!464795))

(declare-fun m!464797 () Bool)

(assert (=> b!483908 m!464797))

(declare-fun m!464799 () Bool)

(assert (=> b!483911 m!464799))

(declare-fun m!464801 () Bool)

(assert (=> b!483910 m!464801))

(declare-fun m!464803 () Bool)

(assert (=> b!483906 m!464803))

(push 1)

(assert (not b!483908))

(assert (not start!43774))

(assert (not b!483911))

(assert (not b!483907))

(assert (not b!483910))

(assert (not b!483906))

(assert tp_is_empty!13913)

(assert (not b!483909))

(check-sat)

