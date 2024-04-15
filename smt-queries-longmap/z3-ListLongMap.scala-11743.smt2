; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137690 () Bool)

(assert start!137690)

(assert (=> start!137690 false))

(declare-fun e!883103 () Bool)

(assert (=> start!137690 e!883103))

(assert (=> start!137690 true))

(declare-fun b!1582308 () Bool)

(declare-fun tp_is_empty!39331 () Bool)

(declare-fun tp!114813 () Bool)

(assert (=> b!1582308 (= e!883103 (and tp_is_empty!39331 tp!114813))))

(declare-datatypes ((B!2798 0))(
  ( (B!2799 (val!19761 Int)) )
))
(declare-datatypes ((tuple2!25758 0))(
  ( (tuple2!25759 (_1!12890 (_ BitVec 64)) (_2!12890 B!2798)) )
))
(declare-datatypes ((List!36922 0))(
  ( (Nil!36919) (Cons!36918 (h!38462 tuple2!25758) (t!51828 List!36922)) )
))
(declare-fun l!1065 () List!36922)

(get-info :version)

(assert (= (and start!137690 ((_ is Cons!36918) l!1065)) b!1582308))

(check-sat (not b!1582308) tp_is_empty!39331)
(check-sat)
