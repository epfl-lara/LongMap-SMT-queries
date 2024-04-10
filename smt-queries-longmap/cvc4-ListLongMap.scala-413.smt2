; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7772 () Bool)

(assert start!7772)

(assert (=> start!7772 false))

(declare-fun e!31735 () Bool)

(assert (=> start!7772 e!31735))

(assert (=> start!7772 true))

(declare-fun b!49403 () Bool)

(declare-fun tp_is_empty!2147 () Bool)

(declare-fun tp!6521 () Bool)

(assert (=> b!49403 (= e!31735 (and tp_is_empty!2147 tp!6521))))

(declare-datatypes ((B!996 0))(
  ( (B!997 (val!1118 Int)) )
))
(declare-datatypes ((tuple2!1818 0))(
  ( (tuple2!1819 (_1!920 (_ BitVec 64)) (_2!920 B!996)) )
))
(declare-datatypes ((List!1315 0))(
  ( (Nil!1312) (Cons!1311 (h!1891 tuple2!1818) (t!4349 List!1315)) )
))
(declare-fun l!1333 () List!1315)

(assert (= (and start!7772 (is-Cons!1311 l!1333)) b!49403))

(push 1)

(assert (not b!49403))

(assert tp_is_empty!2147)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

