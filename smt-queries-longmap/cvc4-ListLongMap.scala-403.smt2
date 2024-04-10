; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7568 () Bool)

(assert start!7568)

(assert (=> start!7568 false))

(declare-fun e!31024 () Bool)

(assert (=> start!7568 e!31024))

(declare-fun b!48350 () Bool)

(declare-fun tp_is_empty!2087 () Bool)

(declare-fun tp!6371 () Bool)

(assert (=> b!48350 (= e!31024 (and tp_is_empty!2087 tp!6371))))

(declare-datatypes ((B!936 0))(
  ( (B!937 (val!1088 Int)) )
))
(declare-datatypes ((tuple2!1758 0))(
  ( (tuple2!1759 (_1!890 (_ BitVec 64)) (_2!890 B!936)) )
))
(declare-datatypes ((List!1285 0))(
  ( (Nil!1282) (Cons!1281 (h!1861 tuple2!1758) (t!4313 List!1285)) )
))
(declare-fun l!1333 () List!1285)

(assert (= (and start!7568 (is-Cons!1281 l!1333)) b!48350))

(push 1)

(assert (not b!48350))

(assert tp_is_empty!2087)

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

