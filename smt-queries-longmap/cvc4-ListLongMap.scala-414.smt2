; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7778 () Bool)

(assert start!7778)

(assert (=> start!7778 false))

(declare-fun e!31744 () Bool)

(assert (=> start!7778 e!31744))

(assert (=> start!7778 true))

(declare-fun b!49412 () Bool)

(declare-fun tp_is_empty!2153 () Bool)

(declare-fun tp!6530 () Bool)

(assert (=> b!49412 (= e!31744 (and tp_is_empty!2153 tp!6530))))

(declare-datatypes ((B!1002 0))(
  ( (B!1003 (val!1121 Int)) )
))
(declare-datatypes ((tuple2!1824 0))(
  ( (tuple2!1825 (_1!923 (_ BitVec 64)) (_2!923 B!1002)) )
))
(declare-datatypes ((List!1318 0))(
  ( (Nil!1315) (Cons!1314 (h!1894 tuple2!1824) (t!4352 List!1318)) )
))
(declare-fun l!1333 () List!1318)

(assert (= (and start!7778 (is-Cons!1314 l!1333)) b!49412))

(push 1)

(assert (not b!49412))

(assert tp_is_empty!2153)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

