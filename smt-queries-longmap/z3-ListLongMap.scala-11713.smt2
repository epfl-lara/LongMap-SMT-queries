; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137492 () Bool)

(assert start!137492)

(assert (=> start!137492 false))

(declare-fun e!882887 () Bool)

(assert (=> start!137492 e!882887))

(declare-fun b!1582377 () Bool)

(declare-fun tp_is_empty!39151 () Bool)

(declare-fun tp!114378 () Bool)

(assert (=> b!1582377 (= e!882887 (and tp_is_empty!39151 tp!114378))))

(declare-datatypes ((B!2606 0))(
  ( (B!2607 (val!19665 Int)) )
))
(declare-datatypes ((tuple2!25492 0))(
  ( (tuple2!25493 (_1!12757 (_ BitVec 64)) (_2!12757 B!2606)) )
))
(declare-datatypes ((List!36817 0))(
  ( (Nil!36814) (Cons!36813 (h!38374 tuple2!25492) (t!51723 List!36817)) )
))
(declare-fun l!1390 () List!36817)

(get-info :version)

(assert (= (and start!137492 ((_ is Cons!36813) l!1390)) b!1582377))

(check-sat (not b!1582377) tp_is_empty!39151)
(check-sat)
