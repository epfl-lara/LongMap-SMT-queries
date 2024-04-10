; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106336 () Bool)

(assert start!106336)

(assert (=> start!106336 false))

(declare-fun e!720368 () Bool)

(assert (=> start!106336 e!720368))

(assert (=> start!106336 true))

(declare-fun b!1264960 () Bool)

(declare-fun tp_is_empty!32467 () Bool)

(declare-fun tp!96266 () Bool)

(assert (=> b!1264960 (= e!720368 (and tp_is_empty!32467 tp!96266))))

(declare-datatypes ((B!1934 0))(
  ( (B!1935 (val!16302 Int)) )
))
(declare-datatypes ((tuple2!21122 0))(
  ( (tuple2!21123 (_1!10572 (_ BitVec 64)) (_2!10572 B!1934)) )
))
(declare-datatypes ((List!28294 0))(
  ( (Nil!28291) (Cons!28290 (h!29499 tuple2!21122) (t!41815 List!28294)) )
))
(declare-fun l!706 () List!28294)

(assert (= (and start!106336 (is-Cons!28290 l!706)) b!1264960))

(push 1)

(assert (not b!1264960))

(assert tp_is_empty!32467)

(check-sat)

