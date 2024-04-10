; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138190 () Bool)

(assert start!138190)

(assert (=> start!138190 false))

(declare-fun e!885024 () Bool)

(assert (=> start!138190 e!885024))

(assert (=> start!138190 true))

(declare-fun b!1585229 () Bool)

(declare-fun tp_is_empty!39501 () Bool)

(declare-fun tp!115218 () Bool)

(assert (=> b!1585229 (= e!885024 (and tp_is_empty!39501 tp!115218))))

(declare-datatypes ((B!2968 0))(
  ( (B!2969 (val!19846 Int)) )
))
(declare-datatypes ((tuple2!25860 0))(
  ( (tuple2!25861 (_1!12941 (_ BitVec 64)) (_2!12941 B!2968)) )
))
(declare-datatypes ((List!36966 0))(
  ( (Nil!36963) (Cons!36962 (h!38505 tuple2!25860) (t!51884 List!36966)) )
))
(declare-fun l!556 () List!36966)

(get-info :version)

(assert (= (and start!138190 ((_ is Cons!36962) l!556)) b!1585229))

(check-sat (not b!1585229) tp_is_empty!39501)
(check-sat)
