; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138176 () Bool)

(assert start!138176)

(assert (=> start!138176 false))

(declare-fun e!884885 () Bool)

(assert (=> start!138176 e!884885))

(assert (=> start!138176 true))

(declare-fun b!1585191 () Bool)

(declare-fun tp_is_empty!39343 () Bool)

(declare-fun tp!114831 () Bool)

(assert (=> b!1585191 (= e!884885 (and tp_is_empty!39343 tp!114831))))

(declare-datatypes ((B!2810 0))(
  ( (B!2811 (val!19767 Int)) )
))
(declare-datatypes ((tuple2!25762 0))(
  ( (tuple2!25763 (_1!12892 (_ BitVec 64)) (_2!12892 B!2810)) )
))
(declare-datatypes ((List!36919 0))(
  ( (Nil!36916) (Cons!36915 (h!38476 tuple2!25762) (t!51825 List!36919)) )
))
(declare-fun l!1065 () List!36919)

(get-info :version)

(assert (= (and start!138176 ((_ is Cons!36915) l!1065)) b!1585191))

(check-sat (not b!1585191) tp_is_empty!39343)
(check-sat)
