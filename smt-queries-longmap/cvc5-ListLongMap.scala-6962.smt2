; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!87906 () Bool)

(assert start!87906)

(assert (=> start!87906 false))

(declare-fun e!571288 () Bool)

(assert (=> start!87906 e!571288))

(declare-fun b!1015514 () Bool)

(declare-fun tp_is_empty!23545 () Bool)

(declare-fun tp!70646 () Bool)

(assert (=> b!1015514 (= e!571288 (and tp_is_empty!23545 tp!70646))))

(declare-datatypes ((B!1478 0))(
  ( (B!1479 (val!11823 Int)) )
))
(declare-datatypes ((tuple2!15192 0))(
  ( (tuple2!15193 (_1!7607 (_ BitVec 64)) (_2!7607 B!1478)) )
))
(declare-datatypes ((List!21475 0))(
  ( (Nil!21472) (Cons!21471 (h!22669 tuple2!15192) (t!30476 List!21475)) )
))
(declare-fun l!1114 () List!21475)

(assert (= (and start!87906 (is-Cons!21471 l!1114)) b!1015514))

(push 1)

(assert (not b!1015514))

(assert tp_is_empty!23545)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

