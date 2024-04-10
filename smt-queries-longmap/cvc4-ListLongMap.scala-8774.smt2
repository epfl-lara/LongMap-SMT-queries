; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106718 () Bool)

(assert start!106718)

(assert (=> start!106718 false))

(declare-fun e!721817 () Bool)

(assert (=> start!106718 e!721817))

(declare-fun b!1267120 () Bool)

(declare-fun tp_is_empty!32561 () Bool)

(declare-fun tp!96530 () Bool)

(assert (=> b!1267120 (= e!721817 (and tp_is_empty!32561 tp!96530))))

(declare-datatypes ((B!2040 0))(
  ( (B!2041 (val!16355 Int)) )
))
(declare-datatypes ((tuple2!21228 0))(
  ( (tuple2!21229 (_1!10625 (_ BitVec 64)) (_2!10625 B!2040)) )
))
(declare-datatypes ((List!28347 0))(
  ( (Nil!28344) (Cons!28343 (h!29552 tuple2!21228) (t!41874 List!28347)) )
))
(declare-fun l!874 () List!28347)

(assert (= (and start!106718 (is-Cons!28343 l!874)) b!1267120))

(push 1)

(assert (not b!1267120))

(assert tp_is_empty!32561)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

