; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7564 () Bool)

(assert start!7564)

(assert (=> start!7564 false))

(declare-fun e!31018 () Bool)

(assert (=> start!7564 e!31018))

(declare-fun b!48344 () Bool)

(declare-fun tp_is_empty!2083 () Bool)

(declare-fun tp!6365 () Bool)

(assert (=> b!48344 (= e!31018 (and tp_is_empty!2083 tp!6365))))

(declare-datatypes ((B!932 0))(
  ( (B!933 (val!1086 Int)) )
))
(declare-datatypes ((tuple2!1754 0))(
  ( (tuple2!1755 (_1!888 (_ BitVec 64)) (_2!888 B!932)) )
))
(declare-datatypes ((List!1283 0))(
  ( (Nil!1280) (Cons!1279 (h!1859 tuple2!1754) (t!4311 List!1283)) )
))
(declare-fun l!1333 () List!1283)

(assert (= (and start!7564 (is-Cons!1279 l!1333)) b!48344))

(push 1)

(assert (not b!48344))

(assert tp_is_empty!2083)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

