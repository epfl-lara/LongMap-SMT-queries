; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134312 () Bool)

(assert start!134312)

(assert (=> start!134312 false))

(assert (=> start!134312 true))

(declare-fun e!874427 () Bool)

(assert (=> start!134312 e!874427))

(declare-fun b!1568568 () Bool)

(declare-fun tp_is_empty!39013 () Bool)

(declare-fun tp!114021 () Bool)

(assert (=> b!1568568 (= e!874427 (and tp_is_empty!39013 tp!114021))))

(declare-datatypes ((B!2462 0))(
  ( (B!2463 (val!19593 Int)) )
))
(declare-datatypes ((tuple2!25288 0))(
  ( (tuple2!25289 (_1!12655 (_ BitVec 64)) (_2!12655 B!2462)) )
))
(declare-datatypes ((List!36713 0))(
  ( (Nil!36710) (Cons!36709 (h!38156 tuple2!25288) (t!51621 List!36713)) )
))
(declare-fun l!750 () List!36713)

(assert (= (and start!134312 (is-Cons!36709 l!750)) b!1568568))

(push 1)

(assert (not b!1568568))

(assert tp_is_empty!39013)

(check-sat)

(pop 1)

