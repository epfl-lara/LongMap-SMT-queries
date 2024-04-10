; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1648 () Bool)

(assert start!1648)

(declare-fun res!9745 () Bool)

(declare-fun e!7021 () Bool)

(assert (=> start!1648 (=> (not res!9745) (not e!7021))))

(declare-datatypes ((B!408 0))(
  ( (B!409 (val!299 Int)) )
))
(declare-datatypes ((tuple2!398 0))(
  ( (tuple2!399 (_1!199 (_ BitVec 64)) (_2!199 B!408)) )
))
(declare-datatypes ((List!351 0))(
  ( (Nil!348) (Cons!347 (h!913 tuple2!398) (t!2738 List!351)) )
))
(declare-datatypes ((ListLongMap!379 0))(
  ( (ListLongMap!380 (toList!205 List!351)) )
))
(declare-fun lm!265 () ListLongMap!379)

(declare-fun a!527 () (_ BitVec 64))

(declare-fun contains!173 (ListLongMap!379 (_ BitVec 64)) Bool)

(assert (=> start!1648 (= res!9745 (contains!173 lm!265 a!527))))

(assert (=> start!1648 e!7021))

(declare-fun e!7022 () Bool)

(declare-fun inv!584 (ListLongMap!379) Bool)

(assert (=> start!1648 (and (inv!584 lm!265) e!7022)))

(assert (=> start!1648 true))

(declare-fun tp_is_empty!581 () Bool)

(assert (=> start!1648 tp_is_empty!581))

(declare-fun b!11800 () Bool)

(assert (=> b!11800 (= e!7021 false)))

(declare-fun b!11801 () Bool)

(declare-fun tp!1976 () Bool)

(assert (=> b!11801 (= e!7022 tp!1976)))

(assert (= (and start!1648 res!9745) b!11800))

(assert (= start!1648 b!11801))

(declare-fun m!8233 () Bool)

(assert (=> start!1648 m!8233))

(declare-fun m!8235 () Bool)

(assert (=> start!1648 m!8235))

(push 1)

(assert (not start!1648))

(assert (not b!11801))

(assert tp_is_empty!581)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

