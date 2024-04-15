; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138336 () Bool)

(assert start!138336)

(declare-datatypes ((B!3018 0))(
  ( (B!3019 (val!19871 Int)) )
))
(declare-fun newValue!21 () B!3018)

(declare-fun e!885486 () Bool)

(declare-datatypes ((tuple2!25978 0))(
  ( (tuple2!25979 (_1!13000 (_ BitVec 64)) (_2!13000 B!3018)) )
))
(declare-datatypes ((List!37032 0))(
  ( (Nil!37029) (Cons!37028 (h!38572 tuple2!25978) (t!51954 List!37032)) )
))
(declare-fun lt!677213 () List!37032)

(declare-fun b!1585799 () Bool)

(declare-fun newKey!21 () (_ BitVec 64))

(declare-fun contains!10500 (List!37032 tuple2!25978) Bool)

(assert (=> b!1585799 (= e!885486 (not (contains!10500 lt!677213 (tuple2!25979 newKey!21 newValue!21))))))

(declare-fun b!1585800 () Bool)

(declare-fun res!1083113 () Bool)

(assert (=> b!1585800 (=> res!1083113 e!885486)))

(declare-fun containsKey!1021 (List!37032 (_ BitVec 64)) Bool)

(assert (=> b!1585800 (= res!1083113 (not (containsKey!1021 lt!677213 newKey!21)))))

(declare-fun b!1585801 () Bool)

(declare-fun res!1083112 () Bool)

(declare-fun e!885488 () Bool)

(assert (=> b!1585801 (=> (not res!1083112) (not e!885488))))

(declare-fun l!556 () List!37032)

(assert (=> b!1585801 (= res!1083112 (and (or (not (is-Cons!37028 l!556)) (bvsge (_1!13000 (h!38572 l!556)) newKey!21)) (or (not (is-Cons!37028 l!556)) (not (= (_1!13000 (h!38572 l!556)) newKey!21))) (or (not (is-Cons!37028 l!556)) (bvsle (_1!13000 (h!38572 l!556)) newKey!21)) (not (is-Nil!37029 l!556))))))

(declare-fun res!1083114 () Bool)

(assert (=> start!138336 (=> (not res!1083114) (not e!885488))))

(declare-fun isStrictlySorted!1211 (List!37032) Bool)

(assert (=> start!138336 (= res!1083114 (isStrictlySorted!1211 l!556))))

(assert (=> start!138336 e!885488))

(declare-fun e!885489 () Bool)

(assert (=> start!138336 e!885489))

(assert (=> start!138336 true))

(declare-fun tp_is_empty!39551 () Bool)

(assert (=> start!138336 tp_is_empty!39551))

(declare-fun b!1585802 () Bool)

(assert (=> b!1585802 (= e!885488 e!885486)))

(declare-fun res!1083111 () Bool)

(assert (=> b!1585802 (=> res!1083111 e!885486)))

(assert (=> b!1585802 (= res!1083111 (not (isStrictlySorted!1211 lt!677213)))))

(declare-fun err!233 () List!37032)

(assert (=> b!1585802 (= lt!677213 err!233)))

(assert (=> b!1585802 true))

(declare-fun e!885487 () Bool)

(assert (=> b!1585802 e!885487))

(declare-fun b!1585803 () Bool)

(declare-fun tp!115359 () Bool)

(assert (=> b!1585803 (= e!885487 (and tp_is_empty!39551 tp!115359))))

(declare-fun b!1585804 () Bool)

(declare-fun tp!115358 () Bool)

(assert (=> b!1585804 (= e!885489 (and tp_is_empty!39551 tp!115358))))

(assert (= (and start!138336 res!1083114) b!1585801))

(assert (= (and b!1585801 res!1083112) b!1585802))

(assert (= (and b!1585802 (is-Cons!37028 err!233)) b!1585803))

(assert (= (and b!1585802 (not res!1083111)) b!1585800))

(assert (= (and b!1585800 (not res!1083113)) b!1585799))

(assert (= (and start!138336 (is-Cons!37028 l!556)) b!1585804))

(declare-fun m!1453771 () Bool)

(assert (=> b!1585799 m!1453771))

(declare-fun m!1453773 () Bool)

(assert (=> b!1585800 m!1453773))

(declare-fun m!1453775 () Bool)

(assert (=> start!138336 m!1453775))

(declare-fun m!1453777 () Bool)

(assert (=> b!1585802 m!1453777))

(push 1)

(assert (not b!1585802))

(assert (not start!138336))

(assert (not b!1585800))

(assert tp_is_empty!39551)

(assert (not b!1585803))

(assert (not b!1585799))

(assert (not b!1585804))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

