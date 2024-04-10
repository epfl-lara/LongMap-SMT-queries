; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137136 () Bool)

(assert start!137136)

(declare-fun res!1079618 () Bool)

(declare-fun e!881627 () Bool)

(assert (=> start!137136 (=> (not res!1079618) (not e!881627))))

(declare-datatypes ((B!2652 0))(
  ( (B!2653 (val!19688 Int)) )
))
(declare-datatypes ((tuple2!25502 0))(
  ( (tuple2!25503 (_1!12762 (_ BitVec 64)) (_2!12762 B!2652)) )
))
(declare-datatypes ((List!36808 0))(
  ( (Nil!36805) (Cons!36804 (h!38347 tuple2!25502) (t!51722 List!36808)) )
))
(declare-fun l!1390 () List!36808)

(declare-fun isStrictlySorted!1066 (List!36808) Bool)

(assert (=> start!137136 (= res!1079618 (isStrictlySorted!1066 l!1390))))

(assert (=> start!137136 e!881627))

(declare-fun e!881626 () Bool)

(assert (=> start!137136 e!881626))

(assert (=> start!137136 true))

(declare-fun tp_is_empty!39197 () Bool)

(assert (=> start!137136 tp_is_empty!39197))

(declare-fun b!1580347 () Bool)

(declare-fun res!1079619 () Bool)

(assert (=> b!1580347 (=> (not res!1079619) (not e!881627))))

(declare-fun key!405 () (_ BitVec 64))

(declare-fun containsKey!912 (List!36808 (_ BitVec 64)) Bool)

(assert (=> b!1580347 (= res!1079619 (containsKey!912 l!1390 key!405))))

(declare-fun b!1580348 () Bool)

(assert (=> b!1580348 (= e!881627 false)))

(declare-fun lt!676756 () Bool)

(declare-fun value!194 () B!2652)

(declare-fun contains!10480 (List!36808 tuple2!25502) Bool)

(assert (=> b!1580348 (= lt!676756 (contains!10480 l!1390 (tuple2!25503 key!405 value!194)))))

(declare-fun b!1580349 () Bool)

(declare-fun tp!114456 () Bool)

(assert (=> b!1580349 (= e!881626 (and tp_is_empty!39197 tp!114456))))

(assert (= (and start!137136 res!1079618) b!1580347))

(assert (= (and b!1580347 res!1079619) b!1580348))

(assert (= (and start!137136 (is-Cons!36804 l!1390)) b!1580349))

(declare-fun m!1451809 () Bool)

(assert (=> start!137136 m!1451809))

(declare-fun m!1451811 () Bool)

(assert (=> b!1580347 m!1451811))

(declare-fun m!1451813 () Bool)

(assert (=> b!1580348 m!1451813))

(push 1)

(assert (not b!1580347))

(assert (not b!1580348))

(assert (not b!1580349))

(assert tp_is_empty!39197)

(assert (not start!137136))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

