; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!136842 () Bool)

(assert start!136842)

(declare-fun res!1078773 () Bool)

(declare-fun e!880687 () Bool)

(assert (=> start!136842 (=> (not res!1078773) (not e!880687))))

(declare-datatypes ((B!2562 0))(
  ( (B!2563 (val!19643 Int)) )
))
(declare-datatypes ((tuple2!25388 0))(
  ( (tuple2!25389 (_1!12705 (_ BitVec 64)) (_2!12705 B!2562)) )
))
(declare-datatypes ((List!36763 0))(
  ( (Nil!36760) (Cons!36759 (h!38302 tuple2!25388) (t!51677 List!36763)) )
))
(declare-datatypes ((ListLongMap!22727 0))(
  ( (ListLongMap!22728 (toList!11379 List!36763)) )
))
(declare-fun lm!251 () ListLongMap!22727)

(declare-fun a0!51 () (_ BitVec 64))

(declare-fun contains!10435 (ListLongMap!22727 (_ BitVec 64)) Bool)

(assert (=> start!136842 (= res!1078773 (not (contains!10435 lm!251 a0!51)))))

(assert (=> start!136842 e!880687))

(declare-fun e!880688 () Bool)

(declare-fun inv!58914 (ListLongMap!22727) Bool)

(assert (=> start!136842 (and (inv!58914 lm!251) e!880688)))

(assert (=> start!136842 true))

(declare-fun b!1578842 () Bool)

(assert (=> b!1578842 (= e!880687 false)))

(declare-fun b!1578843 () Bool)

(declare-fun tp!114258 () Bool)

(assert (=> b!1578843 (= e!880688 tp!114258)))

(assert (= (and start!136842 res!1078773) b!1578842))

(assert (= start!136842 b!1578843))

(declare-fun m!1450881 () Bool)

(assert (=> start!136842 m!1450881))

(declare-fun m!1450883 () Bool)

(assert (=> start!136842 m!1450883))

(push 1)

(assert (not start!136842))

(assert (not b!1578843))

(check-sat)

(pop 1)

(push 1)

(check-sat)

