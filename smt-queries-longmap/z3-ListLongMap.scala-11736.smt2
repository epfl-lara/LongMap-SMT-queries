; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137654 () Bool)

(assert start!137654)

(assert (=> start!137654 false))

(declare-fun e!883142 () Bool)

(assert (=> start!137654 e!883142))

(assert (=> start!137654 true))

(declare-fun b!1582441 () Bool)

(declare-fun tp_is_empty!39303 () Bool)

(declare-fun tp!114734 () Bool)

(assert (=> b!1582441 (= e!883142 (and tp_is_empty!39303 tp!114734))))

(declare-datatypes ((B!2758 0))(
  ( (B!2759 (val!19741 Int)) )
))
(declare-datatypes ((tuple2!25650 0))(
  ( (tuple2!25651 (_1!12836 (_ BitVec 64)) (_2!12836 B!2758)) )
))
(declare-datatypes ((List!36861 0))(
  ( (Nil!36858) (Cons!36857 (h!38400 tuple2!25650) (t!51775 List!36861)) )
))
(declare-fun l!1356 () List!36861)

(get-info :version)

(assert (= (and start!137654 ((_ is Cons!36857) l!1356)) b!1582441))

(check-sat (not b!1582441) tp_is_empty!39303)
(check-sat)
