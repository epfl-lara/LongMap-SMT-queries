; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107768 () Bool)

(assert start!107768)

(assert (=> start!107768 false))

(declare-fun e!727354 () Bool)

(assert (=> start!107768 e!727354))

(assert (=> start!107768 true))

(declare-fun b!1274532 () Bool)

(declare-fun tp_is_empty!33163 () Bool)

(declare-fun tp!97949 () Bool)

(assert (=> b!1274532 (= e!727354 (and tp_is_empty!33163 tp!97949))))

(declare-datatypes ((B!2120 0))(
  ( (B!2121 (val!16656 Int)) )
))
(declare-datatypes ((tuple2!21394 0))(
  ( (tuple2!21395 (_1!10708 (_ BitVec 64)) (_2!10708 B!2120)) )
))
(declare-datatypes ((List!28582 0))(
  ( (Nil!28579) (Cons!28578 (h!29787 tuple2!21394) (t!42115 List!28582)) )
))
(declare-fun l!595 () List!28582)

(assert (= (and start!107768 (is-Cons!28578 l!595)) b!1274532))

(push 1)

(assert (not b!1274532))

(assert tp_is_empty!33163)

(check-sat)

(pop 1)

