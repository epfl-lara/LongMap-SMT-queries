; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7774 () Bool)

(assert start!7774)

(assert (=> start!7774 false))

(declare-fun e!31738 () Bool)

(assert (=> start!7774 e!31738))

(assert (=> start!7774 true))

(declare-fun b!49406 () Bool)

(declare-fun tp_is_empty!2149 () Bool)

(declare-fun tp!6524 () Bool)

(assert (=> b!49406 (= e!31738 (and tp_is_empty!2149 tp!6524))))

(declare-datatypes ((B!998 0))(
  ( (B!999 (val!1119 Int)) )
))
(declare-datatypes ((tuple2!1820 0))(
  ( (tuple2!1821 (_1!921 (_ BitVec 64)) (_2!921 B!998)) )
))
(declare-datatypes ((List!1316 0))(
  ( (Nil!1313) (Cons!1312 (h!1892 tuple2!1820) (t!4350 List!1316)) )
))
(declare-fun l!1333 () List!1316)

(assert (= (and start!7774 (is-Cons!1312 l!1333)) b!49406))

(push 1)

(assert (not b!49406))

(assert tp_is_empty!2149)

(check-sat)

(pop 1)

(push 1)

(check-sat)

