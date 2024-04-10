; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106346 () Bool)

(assert start!106346)

(assert (=> start!106346 false))

(declare-fun e!720383 () Bool)

(assert (=> start!106346 e!720383))

(assert (=> start!106346 true))

(declare-fun b!1264975 () Bool)

(declare-fun tp_is_empty!32477 () Bool)

(declare-fun tp!96281 () Bool)

(assert (=> b!1264975 (= e!720383 (and tp_is_empty!32477 tp!96281))))

(declare-datatypes ((B!1944 0))(
  ( (B!1945 (val!16307 Int)) )
))
(declare-datatypes ((tuple2!21132 0))(
  ( (tuple2!21133 (_1!10577 (_ BitVec 64)) (_2!10577 B!1944)) )
))
(declare-datatypes ((List!28299 0))(
  ( (Nil!28296) (Cons!28295 (h!29504 tuple2!21132) (t!41820 List!28299)) )
))
(declare-fun l!706 () List!28299)

(assert (= (and start!106346 (is-Cons!28295 l!706)) b!1264975))

(push 1)

(assert (not b!1264975))

(assert tp_is_empty!32477)

(check-sat)

(pop 1)

(push 1)

