; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106390 () Bool)

(assert start!106390)

(assert (=> start!106390 false))

(declare-fun e!720572 () Bool)

(assert (=> start!106390 e!720572))

(assert (=> start!106390 true))

(declare-fun b!1265320 () Bool)

(declare-fun tp_is_empty!32491 () Bool)

(declare-fun tp!96311 () Bool)

(assert (=> b!1265320 (= e!720572 (and tp_is_empty!32491 tp!96311))))

(declare-datatypes ((B!1958 0))(
  ( (B!1959 (val!16314 Int)) )
))
(declare-datatypes ((tuple2!21146 0))(
  ( (tuple2!21147 (_1!10584 (_ BitVec 64)) (_2!10584 B!1958)) )
))
(declare-datatypes ((List!28306 0))(
  ( (Nil!28303) (Cons!28302 (h!29511 tuple2!21146) (t!41827 List!28306)) )
))
(declare-fun l!706 () List!28306)

(assert (= (and start!106390 (is-Cons!28302 l!706)) b!1265320))

(push 1)

(assert (not b!1265320))

(assert tp_is_empty!32491)

(check-sat)

(pop 1)

