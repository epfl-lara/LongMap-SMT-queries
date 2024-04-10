; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7574 () Bool)

(assert start!7574)

(assert (=> start!7574 false))

(declare-fun e!31033 () Bool)

(assert (=> start!7574 e!31033))

(assert (=> start!7574 true))

(declare-fun b!48359 () Bool)

(declare-fun tp_is_empty!2093 () Bool)

(declare-fun tp!6380 () Bool)

(assert (=> b!48359 (= e!31033 (and tp_is_empty!2093 tp!6380))))

(declare-datatypes ((B!942 0))(
  ( (B!943 (val!1091 Int)) )
))
(declare-datatypes ((tuple2!1764 0))(
  ( (tuple2!1765 (_1!893 (_ BitVec 64)) (_2!893 B!942)) )
))
(declare-datatypes ((List!1288 0))(
  ( (Nil!1285) (Cons!1284 (h!1864 tuple2!1764) (t!4316 List!1288)) )
))
(declare-fun l!1333 () List!1288)

(assert (= (and start!7574 (is-Cons!1284 l!1333)) b!48359))

(push 1)

(assert (not b!48359))

(assert tp_is_empty!2093)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

