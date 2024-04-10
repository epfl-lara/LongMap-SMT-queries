; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106394 () Bool)

(assert start!106394)

(assert (=> start!106394 false))

(declare-fun e!720578 () Bool)

(assert (=> start!106394 e!720578))

(assert (=> start!106394 true))

(declare-fun b!1265326 () Bool)

(declare-fun tp_is_empty!32495 () Bool)

(declare-fun tp!96317 () Bool)

(assert (=> b!1265326 (= e!720578 (and tp_is_empty!32495 tp!96317))))

(declare-datatypes ((B!1962 0))(
  ( (B!1963 (val!16316 Int)) )
))
(declare-datatypes ((tuple2!21150 0))(
  ( (tuple2!21151 (_1!10586 (_ BitVec 64)) (_2!10586 B!1962)) )
))
(declare-datatypes ((List!28308 0))(
  ( (Nil!28305) (Cons!28304 (h!29513 tuple2!21150) (t!41829 List!28308)) )
))
(declare-fun l!706 () List!28308)

(assert (= (and start!106394 (is-Cons!28304 l!706)) b!1265326))

(push 1)

(assert (not b!1265326))

(assert tp_is_empty!32495)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

