; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87936 () Bool)

(assert start!87936)

(assert (=> start!87936 false))

(declare-fun e!571283 () Bool)

(assert (=> start!87936 e!571283))

(assert (=> start!87936 true))

(declare-fun tp_is_empty!23557 () Bool)

(assert (=> start!87936 tp_is_empty!23557))

(declare-fun b!1015492 () Bool)

(declare-fun tp!70674 () Bool)

(assert (=> b!1015492 (= e!571283 (and tp_is_empty!23557 tp!70674))))

(declare-datatypes ((B!1490 0))(
  ( (B!1491 (val!11829 Int)) )
))
(declare-datatypes ((tuple2!15284 0))(
  ( (tuple2!15285 (_1!7653 (_ BitVec 64)) (_2!7653 B!1490)) )
))
(declare-datatypes ((List!21519 0))(
  ( (Nil!21516) (Cons!21515 (h!22713 tuple2!15284) (t!30511 List!21519)) )
))
(declare-fun l!1114 () List!21519)

(get-info :version)

(assert (= (and start!87936 ((_ is Cons!21515) l!1114)) b!1015492))

(check-sat (not b!1015492) tp_is_empty!23557)
(check-sat)
