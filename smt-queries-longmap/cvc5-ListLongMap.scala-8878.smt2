; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107792 () Bool)

(assert start!107792)

(assert (=> start!107792 false))

(declare-fun e!727432 () Bool)

(assert (=> start!107792 e!727432))

(assert (=> start!107792 true))

(declare-fun b!1274634 () Bool)

(declare-fun tp_is_empty!33181 () Bool)

(declare-fun tp!97985 () Bool)

(assert (=> b!1274634 (= e!727432 (and tp_is_empty!33181 tp!97985))))

(declare-datatypes ((B!2138 0))(
  ( (B!2139 (val!16665 Int)) )
))
(declare-datatypes ((tuple2!21412 0))(
  ( (tuple2!21413 (_1!10717 (_ BitVec 64)) (_2!10717 B!2138)) )
))
(declare-datatypes ((List!28591 0))(
  ( (Nil!28588) (Cons!28587 (h!29796 tuple2!21412) (t!42124 List!28591)) )
))
(declare-fun l!595 () List!28591)

(assert (= (and start!107792 (is-Cons!28587 l!595)) b!1274634))

(push 1)

(assert (not b!1274634))

(assert tp_is_empty!33181)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

