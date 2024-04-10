; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43762 () Bool)

(assert start!43762)

(declare-fun res!288256 () Bool)

(declare-fun e!284778 () Bool)

(assert (=> start!43762 (=> (not res!288256) (not e!284778))))

(declare-datatypes ((B!1092 0))(
  ( (B!1093 (val!6998 Int)) )
))
(declare-datatypes ((tuple2!9198 0))(
  ( (tuple2!9199 (_1!4610 (_ BitVec 64)) (_2!4610 B!1092)) )
))
(declare-datatypes ((List!9262 0))(
  ( (Nil!9259) (Cons!9258 (h!10114 tuple2!9198) (t!15484 List!9262)) )
))
(declare-fun l!956 () List!9262)

(declare-fun isStrictlySorted!401 (List!9262) Bool)

(assert (=> start!43762 (= res!288256 (isStrictlySorted!401 l!956))))

(assert (=> start!43762 e!284778))

(declare-fun e!284777 () Bool)

(assert (=> start!43762 e!284777))

(assert (=> start!43762 true))

(declare-fun tp_is_empty!13901 () Bool)

(assert (=> start!43762 tp_is_empty!13901))

(declare-fun b!483828 () Bool)

(declare-fun res!288257 () Bool)

(assert (=> b!483828 (=> (not res!288257) (not e!284778))))

(declare-fun key!251 () (_ BitVec 64))

(declare-fun containsKey!364 (List!9262 (_ BitVec 64)) Bool)

(assert (=> b!483828 (= res!288257 (not (containsKey!364 l!956 key!251)))))

(declare-fun b!483829 () Bool)

(assert (=> b!483829 (= e!284778 false)))

(declare-fun value!166 () B!1092)

(declare-fun lt!219286 () List!9262)

(declare-fun insertStrictlySorted!219 (List!9262 (_ BitVec 64) B!1092) List!9262)

(assert (=> b!483829 (= lt!219286 (insertStrictlySorted!219 l!956 key!251 value!166))))

(declare-fun b!483830 () Bool)

(declare-fun tp!43441 () Bool)

(assert (=> b!483830 (= e!284777 (and tp_is_empty!13901 tp!43441))))

(assert (= (and start!43762 res!288256) b!483828))

(assert (= (and b!483828 res!288257) b!483829))

(assert (= (and start!43762 (is-Cons!9258 l!956)) b!483830))

(declare-fun m!464727 () Bool)

(assert (=> start!43762 m!464727))

(declare-fun m!464729 () Bool)

(assert (=> b!483828 m!464729))

(declare-fun m!464731 () Bool)

(assert (=> b!483829 m!464731))

(push 1)

(assert tp_is_empty!13901)

(assert (not b!483828))

(assert (not start!43762))

(assert (not b!483829))

(assert (not b!483830))

(check-sat)

(pop 1)

