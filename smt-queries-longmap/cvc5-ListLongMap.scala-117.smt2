; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2028 () Bool)

(assert start!2028)

(declare-fun b!13668 () Bool)

(assert (=> b!13668 true))

(declare-fun b!13666 () Bool)

(declare-fun e!8179 () Bool)

(assert (=> b!13666 (= e!8179 false)))

(declare-fun b!13667 () Bool)

(declare-fun e!8180 () Bool)

(declare-fun tp_is_empty!679 () Bool)

(declare-fun tp!2213 () Bool)

(assert (=> b!13667 (= e!8180 (and tp_is_empty!679 tp!2213))))

(declare-fun res!10730 () Bool)

(assert (=> b!13668 (=> (not res!10730) (not e!8179))))

(declare-fun lambda!98 () Int)

(declare-datatypes ((B!500 0))(
  ( (B!501 (val!348 Int)) )
))
(declare-datatypes ((tuple2!496 0))(
  ( (tuple2!497 (_1!248 (_ BitVec 64)) (_2!248 B!500)) )
))
(declare-datatypes ((List!403 0))(
  ( (Nil!400) (Cons!399 (h!965 tuple2!496) (t!2799 List!403)) )
))
(declare-fun forall!80 (List!403 Int) Bool)

(assert (=> b!13668 (= res!10730 (forall!80 Nil!400 lambda!98))))

(declare-fun res!10732 () Bool)

(assert (=> start!2028 (=> (not res!10732) (not e!8179))))

(declare-fun l!522 () List!403)

(declare-fun isStrictlySorted!90 (List!403) Bool)

(assert (=> start!2028 (= res!10732 (isStrictlySorted!90 l!522))))

(assert (=> start!2028 e!8179))

(assert (=> start!2028 e!8180))

(assert (=> start!2028 tp_is_empty!679))

(declare-fun b!13669 () Bool)

(declare-fun res!10731 () Bool)

(assert (=> b!13669 (=> (not res!10731) (not e!8179))))

(declare-fun value!159 () B!500)

(assert (=> b!13669 (= res!10731 (and (or (not (is-Cons!399 l!522)) (not (= (_2!248 (h!965 l!522)) value!159))) (or (not (is-Cons!399 l!522)) (= (_2!248 (h!965 l!522)) value!159)) (is-Nil!400 l!522)))))

(declare-fun b!13670 () Bool)

(declare-fun res!10729 () Bool)

(assert (=> b!13670 (=> (not res!10729) (not e!8179))))

(declare-fun isEmpty!87 (List!403) Bool)

(assert (=> b!13670 (= res!10729 (not (isEmpty!87 l!522)))))

(assert (= (and start!2028 res!10732) b!13669))

(assert (= (and b!13669 res!10731) b!13668))

(assert (= (and b!13668 res!10730) b!13670))

(assert (= (and b!13670 res!10729) b!13666))

(assert (= (and start!2028 (is-Cons!399 l!522)) b!13667))

(declare-fun m!9245 () Bool)

(assert (=> b!13668 m!9245))

(declare-fun m!9247 () Bool)

(assert (=> start!2028 m!9247))

(declare-fun m!9249 () Bool)

(assert (=> b!13670 m!9249))

(push 1)

(assert tp_is_empty!679)

(assert (not b!13670))

(assert (not b!13668))

(assert (not start!2028))

(assert (not b!13667))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

