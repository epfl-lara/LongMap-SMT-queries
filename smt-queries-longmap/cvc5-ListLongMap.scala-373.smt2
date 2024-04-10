; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7096 () Bool)

(assert start!7096)

(assert (=> start!7096 false))

(declare-fun e!28964 () Bool)

(assert (=> start!7096 e!28964))

(declare-fun b!45495 () Bool)

(declare-fun tp_is_empty!1915 () Bool)

(declare-fun tp!5966 () Bool)

(assert (=> b!45495 (= e!28964 (and tp_is_empty!1915 tp!5966))))

(declare-datatypes ((B!818 0))(
  ( (B!819 (val!996 Int)) )
))
(declare-datatypes ((tuple2!1640 0))(
  ( (tuple2!1641 (_1!831 (_ BitVec 64)) (_2!831 B!818)) )
))
(declare-datatypes ((List!1214 0))(
  ( (Nil!1211) (Cons!1210 (h!1790 tuple2!1640) (t!4239 List!1214)) )
))
(declare-fun l!812 () List!1214)

(assert (= (and start!7096 (is-Cons!1210 l!812)) b!45495))

(push 1)

(assert (not b!45495))

(assert tp_is_empty!1915)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

