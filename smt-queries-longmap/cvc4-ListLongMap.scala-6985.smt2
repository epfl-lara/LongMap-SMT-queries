; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!88580 () Bool)

(assert start!88580)

(assert (=> start!88580 false))

(declare-fun e!572907 () Bool)

(assert (=> start!88580 e!572907))

(declare-fun b!1018229 () Bool)

(declare-fun tp_is_empty!23687 () Bool)

(declare-fun tp!70999 () Bool)

(assert (=> b!1018229 (= e!572907 (and tp_is_empty!23687 tp!70999))))

(declare-datatypes ((B!1620 0))(
  ( (B!1621 (val!11894 Int)) )
))
(declare-datatypes ((tuple2!15334 0))(
  ( (tuple2!15335 (_1!7678 (_ BitVec 64)) (_2!7678 B!1620)) )
))
(declare-datatypes ((List!21582 0))(
  ( (Nil!21579) (Cons!21578 (h!22776 tuple2!15334) (t!30583 List!21582)) )
))
(declare-fun l!996 () List!21582)

(assert (= (and start!88580 (is-Cons!21578 l!996)) b!1018229))

(push 1)

(assert (not b!1018229))

(assert tp_is_empty!23687)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

