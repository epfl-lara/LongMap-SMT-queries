; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107802 () Bool)

(assert start!107802)

(assert (=> start!107802 false))

(declare-fun e!727447 () Bool)

(assert (=> start!107802 e!727447))

(assert (=> start!107802 true))

(declare-fun b!1274649 () Bool)

(declare-fun tp_is_empty!33191 () Bool)

(declare-fun tp!98000 () Bool)

(assert (=> b!1274649 (= e!727447 (and tp_is_empty!33191 tp!98000))))

(declare-datatypes ((B!2148 0))(
  ( (B!2149 (val!16670 Int)) )
))
(declare-datatypes ((tuple2!21422 0))(
  ( (tuple2!21423 (_1!10722 (_ BitVec 64)) (_2!10722 B!2148)) )
))
(declare-datatypes ((List!28596 0))(
  ( (Nil!28593) (Cons!28592 (h!29801 tuple2!21422) (t!42129 List!28596)) )
))
(declare-fun l!595 () List!28596)

(assert (= (and start!107802 (is-Cons!28592 l!595)) b!1274649))

(push 1)

(assert (not b!1274649))

(assert tp_is_empty!33191)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

