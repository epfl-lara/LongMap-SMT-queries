; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106342 () Bool)

(assert start!106342)

(assert (=> start!106342 false))

(declare-fun e!720377 () Bool)

(assert (=> start!106342 e!720377))

(assert (=> start!106342 true))

(declare-fun b!1264969 () Bool)

(declare-fun tp_is_empty!32473 () Bool)

(declare-fun tp!96275 () Bool)

(assert (=> b!1264969 (= e!720377 (and tp_is_empty!32473 tp!96275))))

(declare-datatypes ((B!1940 0))(
  ( (B!1941 (val!16305 Int)) )
))
(declare-datatypes ((tuple2!21128 0))(
  ( (tuple2!21129 (_1!10575 (_ BitVec 64)) (_2!10575 B!1940)) )
))
(declare-datatypes ((List!28297 0))(
  ( (Nil!28294) (Cons!28293 (h!29502 tuple2!21128) (t!41818 List!28297)) )
))
(declare-fun l!706 () List!28297)

(assert (= (and start!106342 (is-Cons!28293 l!706)) b!1264969))

(push 1)

(assert (not b!1264969))

(assert tp_is_empty!32473)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

