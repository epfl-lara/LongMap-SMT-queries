; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138164 () Bool)

(assert start!138164)

(assert (=> start!138164 false))

(declare-fun e!884858 () Bool)

(assert (=> start!138164 e!884858))

(assert (=> start!138164 true))

(declare-fun b!1585128 () Bool)

(declare-fun tp_is_empty!39331 () Bool)

(declare-fun tp!114813 () Bool)

(assert (=> b!1585128 (= e!884858 (and tp_is_empty!39331 tp!114813))))

(declare-datatypes ((B!2798 0))(
  ( (B!2799 (val!19761 Int)) )
))
(declare-datatypes ((tuple2!25750 0))(
  ( (tuple2!25751 (_1!12886 (_ BitVec 64)) (_2!12886 B!2798)) )
))
(declare-datatypes ((List!36913 0))(
  ( (Nil!36910) (Cons!36909 (h!38470 tuple2!25750) (t!51819 List!36913)) )
))
(declare-fun l!1065 () List!36913)

(get-info :version)

(assert (= (and start!138164 ((_ is Cons!36909) l!1065)) b!1585128))

(check-sat (not b!1585128) tp_is_empty!39331)
(check-sat)
