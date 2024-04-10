; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!1692 () Bool)

(assert start!1692)

(assert (=> start!1692 false))

(declare-fun e!7133 () Bool)

(assert (=> start!1692 e!7133))

(assert (=> start!1692 true))

(declare-fun tp_is_empty!601 () Bool)

(assert (=> start!1692 tp_is_empty!601))

(declare-fun b!11972 () Bool)

(declare-fun tp!2015 () Bool)

(assert (=> b!11972 (= e!7133 (and tp_is_empty!601 tp!2015))))

(declare-datatypes ((B!428 0))(
  ( (B!429 (val!309 Int)) )
))
(declare-datatypes ((tuple2!418 0))(
  ( (tuple2!419 (_1!209 (_ BitVec 64)) (_2!209 B!428)) )
))
(declare-datatypes ((List!361 0))(
  ( (Nil!358) (Cons!357 (h!923 tuple2!418) (t!2748 List!361)) )
))
(declare-fun l!1094 () List!361)

(assert (= (and start!1692 (is-Cons!357 l!1094)) b!11972))

(push 1)

(assert (not b!11972))

(assert tp_is_empty!601)

(check-sat)

(pop 1)

