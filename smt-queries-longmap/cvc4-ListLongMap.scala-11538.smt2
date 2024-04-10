; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!134316 () Bool)

(assert start!134316)

(assert (=> start!134316 false))

(assert (=> start!134316 true))

(declare-fun e!874433 () Bool)

(assert (=> start!134316 e!874433))

(declare-fun b!1568574 () Bool)

(declare-fun tp_is_empty!39017 () Bool)

(declare-fun tp!114027 () Bool)

(assert (=> b!1568574 (= e!874433 (and tp_is_empty!39017 tp!114027))))

(declare-datatypes ((B!2466 0))(
  ( (B!2467 (val!19595 Int)) )
))
(declare-datatypes ((tuple2!25292 0))(
  ( (tuple2!25293 (_1!12657 (_ BitVec 64)) (_2!12657 B!2466)) )
))
(declare-datatypes ((List!36715 0))(
  ( (Nil!36712) (Cons!36711 (h!38158 tuple2!25292) (t!51623 List!36715)) )
))
(declare-fun l!750 () List!36715)

(assert (= (and start!134316 (is-Cons!36711 l!750)) b!1568574))

(push 1)

(assert (not b!1568574))

(assert tp_is_empty!39017)

(check-sat)

(pop 1)

