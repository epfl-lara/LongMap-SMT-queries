; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88638 () Bool)

(assert start!88638)

(assert (=> start!88638 false))

(declare-fun e!573265 () Bool)

(assert (=> start!88638 e!573265))

(assert (=> start!88638 true))

(declare-fun b!1018746 () Bool)

(declare-fun tp_is_empty!23635 () Bool)

(declare-fun tp!70874 () Bool)

(assert (=> b!1018746 (= e!573265 (and tp_is_empty!23635 tp!70874))))

(declare-datatypes ((B!1568 0))(
  ( (B!1569 (val!11868 Int)) )
))
(declare-datatypes ((tuple2!15286 0))(
  ( (tuple2!15287 (_1!7654 (_ BitVec 64)) (_2!7654 B!1568)) )
))
(declare-datatypes ((List!21545 0))(
  ( (Nil!21542) (Cons!21541 (h!22748 tuple2!15286) (t!30538 List!21545)) )
))
(declare-fun l!1036 () List!21545)

(get-info :version)

(assert (= (and start!88638 ((_ is Cons!21541) l!1036)) b!1018746))

(check-sat (not b!1018746) tp_is_empty!23635)
(check-sat)
