; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!138390 () Bool)

(assert start!138390)

(declare-fun res!1083228 () Bool)

(declare-fun e!885668 () Bool)

(assert (=> start!138390 (=> (not res!1083228) (not e!885668))))

(declare-datatypes ((B!3042 0))(
  ( (B!3043 (val!19883 Int)) )
))
(declare-datatypes ((tuple2!26002 0))(
  ( (tuple2!26003 (_1!13012 (_ BitVec 64)) (_2!13012 B!3042)) )
))
(declare-datatypes ((List!37044 0))(
  ( (Nil!37041) (Cons!37040 (h!38584 tuple2!26002) (t!51966 List!37044)) )
))
(declare-fun l!636 () List!37044)

(declare-fun isStrictlySorted!1223 (List!37044) Bool)

(assert (=> start!138390 (= res!1083228 (isStrictlySorted!1223 l!636))))

(assert (=> start!138390 e!885668))

(declare-fun e!885669 () Bool)

(assert (=> start!138390 e!885669))

(assert (=> start!138390 true))

(declare-fun b!1586040 () Bool)

(declare-fun key!185 () (_ BitVec 64))

(assert (=> b!1586040 (= e!885668 (and (or (not (is-Cons!37040 l!636)) (not (= (_1!13012 (h!38584 l!636)) key!185))) (or (not (is-Cons!37040 l!636)) (bvsle (_1!13012 (h!38584 l!636)) key!185)) (or (not (is-Cons!37040 l!636)) (bvsge (_1!13012 (h!38584 l!636)) key!185)) (not (is-Nil!37041 l!636))))))

(declare-fun b!1586041 () Bool)

(declare-fun tp_is_empty!39575 () Bool)

(declare-fun tp!115422 () Bool)

(assert (=> b!1586041 (= e!885669 (and tp_is_empty!39575 tp!115422))))

(assert (= (and start!138390 res!1083228) b!1586040))

(assert (= (and start!138390 (is-Cons!37040 l!636)) b!1586041))

(declare-fun m!1453855 () Bool)

(assert (=> start!138390 m!1453855))

(push 1)

(assert (not start!138390))

(assert (not b!1586041))

(assert tp_is_empty!39575)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

