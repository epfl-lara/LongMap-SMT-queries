; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!138630 () Bool)

(assert start!138630)

(assert (=> start!138630 false))

(declare-fun e!886586 () Bool)

(assert (=> start!138630 e!886586))

(assert (=> start!138630 true))

(declare-fun b!1587741 () Bool)

(declare-fun tp_is_empty!39499 () Bool)

(declare-fun tp!115216 () Bool)

(assert (=> b!1587741 (= e!886586 (and tp_is_empty!39499 tp!115216))))

(declare-datatypes ((B!2966 0))(
  ( (B!2967 (val!19845 Int)) )
))
(declare-datatypes ((tuple2!25918 0))(
  ( (tuple2!25919 (_1!12970 (_ BitVec 64)) (_2!12970 B!2966)) )
))
(declare-datatypes ((List!36997 0))(
  ( (Nil!36994) (Cons!36993 (h!38554 tuple2!25918) (t!51908 List!36997)) )
))
(declare-fun l!556 () List!36997)

(get-info :version)

(assert (= (and start!138630 ((_ is Cons!36993) l!556)) b!1587741))

(check-sat (not b!1587741) tp_is_empty!39499)
(check-sat)
