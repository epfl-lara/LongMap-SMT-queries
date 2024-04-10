; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7570 () Bool)

(assert start!7570)

(assert (=> start!7570 false))

(declare-fun e!31027 () Bool)

(assert (=> start!7570 e!31027))

(assert (=> start!7570 true))

(declare-fun b!48353 () Bool)

(declare-fun tp_is_empty!2089 () Bool)

(declare-fun tp!6374 () Bool)

(assert (=> b!48353 (= e!31027 (and tp_is_empty!2089 tp!6374))))

(declare-datatypes ((B!938 0))(
  ( (B!939 (val!1089 Int)) )
))
(declare-datatypes ((tuple2!1760 0))(
  ( (tuple2!1761 (_1!891 (_ BitVec 64)) (_2!891 B!938)) )
))
(declare-datatypes ((List!1286 0))(
  ( (Nil!1283) (Cons!1282 (h!1862 tuple2!1760) (t!4314 List!1286)) )
))
(declare-fun l!1333 () List!1286)

(assert (= (and start!7570 (is-Cons!1282 l!1333)) b!48353))

(push 1)

(assert (not b!48353))

(assert tp_is_empty!2089)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

