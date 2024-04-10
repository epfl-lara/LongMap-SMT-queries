; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138182 () Bool)

(assert start!138182)

(declare-fun res!1082674 () Bool)

(declare-fun e!885005 () Bool)

(assert (=> start!138182 (=> (not res!1082674) (not e!885005))))

(declare-datatypes ((B!2960 0))(
  ( (B!2961 (val!19842 Int)) )
))
(declare-datatypes ((tuple2!25852 0))(
  ( (tuple2!25853 (_1!12937 (_ BitVec 64)) (_2!12937 B!2960)) )
))
(declare-datatypes ((List!36962 0))(
  ( (Nil!36959) (Cons!36958 (h!38501 tuple2!25852) (t!51880 List!36962)) )
))
(declare-fun l!556 () List!36962)

(declare-fun isStrictlySorted!1187 (List!36962) Bool)

(assert (=> start!138182 (= res!1082674 (isStrictlySorted!1187 l!556))))

(assert (=> start!138182 e!885005))

(declare-fun e!885006 () Bool)

(assert (=> start!138182 e!885006))

(assert (=> start!138182 true))

(declare-fun tp_is_empty!39493 () Bool)

(assert (=> start!138182 tp_is_empty!39493))

(declare-fun b!1585203 () Bool)

(declare-fun res!1082675 () Bool)

(assert (=> b!1585203 (=> (not res!1082675) (not e!885005))))

(declare-fun newKey!21 () (_ BitVec 64))

(assert (=> b!1585203 (= res!1082675 (and (or (not (is-Cons!36958 l!556)) (bvsge (_1!12937 (h!38501 l!556)) newKey!21)) (or (not (is-Cons!36958 l!556)) (not (= (_1!12937 (h!38501 l!556)) newKey!21))) (or (not (is-Cons!36958 l!556)) (bvsle (_1!12937 (h!38501 l!556)) newKey!21)) (is-Nil!36959 l!556)))))

(declare-fun b!1585204 () Bool)

(assert (=> b!1585204 (= e!885005 false)))

(declare-fun lt!677343 () Bool)

(declare-fun newValue!21 () B!2960)

(declare-fun $colon$colon!1037 (List!36962 tuple2!25852) List!36962)

(assert (=> b!1585204 (= lt!677343 (isStrictlySorted!1187 ($colon$colon!1037 Nil!36959 (tuple2!25853 newKey!21 newValue!21))))))

(declare-fun b!1585205 () Bool)

(declare-fun tp!115206 () Bool)

(assert (=> b!1585205 (= e!885006 (and tp_is_empty!39493 tp!115206))))

(assert (= (and start!138182 res!1082674) b!1585203))

(assert (= (and b!1585203 res!1082675) b!1585204))

(assert (= (and start!138182 (is-Cons!36958 l!556)) b!1585205))

(declare-fun m!1454157 () Bool)

(assert (=> start!138182 m!1454157))

(declare-fun m!1454159 () Bool)

(assert (=> b!1585204 m!1454159))

(assert (=> b!1585204 m!1454159))

(declare-fun m!1454161 () Bool)

(assert (=> b!1585204 m!1454161))

(push 1)

(assert (not b!1585204))

(assert (not start!138182))

(assert (not b!1585205))

(assert tp_is_empty!39493)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

