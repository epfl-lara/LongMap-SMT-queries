; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138372 () Bool)

(assert start!138372)

(declare-fun b!1586115 () Bool)

(declare-fun e!885688 () Bool)

(declare-fun tp_is_empty!39551 () Bool)

(declare-fun tp!115359 () Bool)

(assert (=> b!1586115 (= e!885688 (and tp_is_empty!39551 tp!115359))))

(declare-fun b!1586116 () Bool)

(declare-fun e!885689 () Bool)

(declare-fun e!885690 () Bool)

(assert (=> b!1586116 (= e!885689 e!885690)))

(declare-fun res!1083244 () Bool)

(assert (=> b!1586116 (=> res!1083244 e!885690)))

(declare-datatypes ((B!3018 0))(
  ( (B!3019 (val!19871 Int)) )
))
(declare-datatypes ((tuple2!25910 0))(
  ( (tuple2!25911 (_1!12966 (_ BitVec 64)) (_2!12966 B!3018)) )
))
(declare-datatypes ((List!36991 0))(
  ( (Nil!36988) (Cons!36987 (h!38530 tuple2!25910) (t!51921 List!36991)) )
))
(declare-fun lt!677496 () List!36991)

(declare-fun isStrictlySorted!1213 (List!36991) Bool)

(assert (=> b!1586116 (= res!1083244 (not (isStrictlySorted!1213 lt!677496)))))

(declare-fun err!233 () List!36991)

(assert (=> b!1586116 (= lt!677496 err!233)))

(assert (=> b!1586116 true))

(declare-fun e!885687 () Bool)

(assert (=> b!1586116 e!885687))

(declare-fun res!1083245 () Bool)

(assert (=> start!138372 (=> (not res!1083245) (not e!885689))))

(declare-fun l!556 () List!36991)

(assert (=> start!138372 (= res!1083245 (isStrictlySorted!1213 l!556))))

(assert (=> start!138372 e!885689))

(assert (=> start!138372 e!885688))

(assert (=> start!138372 true))

(assert (=> start!138372 tp_is_empty!39551))

(declare-fun b!1586117 () Bool)

(declare-fun tp!115358 () Bool)

(assert (=> b!1586117 (= e!885687 (and tp_is_empty!39551 tp!115358))))

(declare-fun newValue!21 () B!3018)

(declare-fun b!1586118 () Bool)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun contains!10546 (List!36991 tuple2!25910) Bool)

(assert (=> b!1586118 (= e!885690 (not (contains!10546 lt!677496 (tuple2!25911 newKey!21 newValue!21))))))

(declare-fun b!1586119 () Bool)

(declare-fun res!1083242 () Bool)

(assert (=> b!1586119 (=> res!1083242 e!885690)))

(declare-fun containsKey!1023 (List!36991 (_ BitVec 64)) Bool)

(assert (=> b!1586119 (= res!1083242 (not (containsKey!1023 lt!677496 newKey!21)))))

(declare-fun b!1586120 () Bool)

(declare-fun res!1083243 () Bool)

(assert (=> b!1586120 (=> (not res!1083243) (not e!885689))))

(assert (=> b!1586120 (= res!1083243 (and (or (not (is-Cons!36987 l!556)) (bvsge (_1!12966 (h!38530 l!556)) newKey!21)) (or (not (is-Cons!36987 l!556)) (not (= (_1!12966 (h!38530 l!556)) newKey!21))) (or (not (is-Cons!36987 l!556)) (bvsle (_1!12966 (h!38530 l!556)) newKey!21)) (not (is-Nil!36988 l!556))))))

(assert (= (and start!138372 res!1083245) b!1586120))

(assert (= (and b!1586120 res!1083243) b!1586116))

(assert (= (and b!1586116 (is-Cons!36987 err!233)) b!1586117))

(assert (= (and b!1586116 (not res!1083244)) b!1586119))

(assert (= (and b!1586119 (not res!1083242)) b!1586118))

(assert (= (and start!138372 (is-Cons!36987 l!556)) b!1586115))

(declare-fun m!1454653 () Bool)

(assert (=> b!1586116 m!1454653))

(declare-fun m!1454655 () Bool)

(assert (=> start!138372 m!1454655))

(declare-fun m!1454657 () Bool)

(assert (=> b!1586118 m!1454657))

(declare-fun m!1454659 () Bool)

(assert (=> b!1586119 m!1454659))

(push 1)

(assert (not b!1586117))

(assert (not b!1586119))

(assert (not b!1586116))

(assert (not start!138372))

(assert tp_is_empty!39551)

(assert (not b!1586118))

(assert (not b!1586115))

(check-sat)

(pop 1)

(push 1)

(check-sat)

