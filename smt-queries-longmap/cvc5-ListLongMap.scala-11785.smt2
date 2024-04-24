; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138868 () Bool)

(assert start!138868)

(declare-fun res!1084285 () Bool)

(declare-fun e!887431 () Bool)

(assert (=> start!138868 (=> (not res!1084285) (not e!887431))))

(declare-datatypes ((B!3042 0))(
  ( (B!3043 (val!19883 Int)) )
))
(declare-datatypes ((tuple2!25994 0))(
  ( (tuple2!25995 (_1!13008 (_ BitVec 64)) (_2!13008 B!3042)) )
))
(declare-datatypes ((List!37035 0))(
  ( (Nil!37032) (Cons!37031 (h!38592 tuple2!25994) (t!51958 List!37035)) )
))
(declare-fun l!636 () List!37035)

(declare-fun isStrictlySorted!1213 (List!37035) Bool)

(assert (=> start!138868 (= res!1084285 (isStrictlySorted!1213 l!636))))

(assert (=> start!138868 e!887431))

(declare-fun e!887432 () Bool)

(assert (=> start!138868 e!887432))

(assert (=> start!138868 true))

(declare-fun b!1588867 () Bool)

(declare-fun key!185 () (_ BitVec 64))

(assert (=> b!1588867 (= e!887431 (and (or (not (is-Cons!37031 l!636)) (not (= (_1!13008 (h!38592 l!636)) key!185))) (or (not (is-Cons!37031 l!636)) (bvsle (_1!13008 (h!38592 l!636)) key!185)) (or (not (is-Cons!37031 l!636)) (bvsge (_1!13008 (h!38592 l!636)) key!185)) (not (is-Nil!37032 l!636))))))

(declare-fun b!1588868 () Bool)

(declare-fun tp_is_empty!39575 () Bool)

(declare-fun tp!115423 () Bool)

(assert (=> b!1588868 (= e!887432 (and tp_is_empty!39575 tp!115423))))

(assert (= (and start!138868 res!1084285) b!1588867))

(assert (= (and start!138868 (is-Cons!37031 l!636)) b!1588868))

(declare-fun m!1457059 () Bool)

(assert (=> start!138868 m!1457059))

(push 1)

(assert (not start!138868))

(assert (not b!1588868))

(assert tp_is_empty!39575)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

