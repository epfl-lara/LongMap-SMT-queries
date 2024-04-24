; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88650 () Bool)

(assert start!88650)

(assert (=> start!88650 false))

(declare-fun e!573292 () Bool)

(assert (=> start!88650 e!573292))

(assert (=> start!88650 true))

(declare-fun b!1018809 () Bool)

(declare-fun tp_is_empty!23647 () Bool)

(declare-fun tp!70892 () Bool)

(assert (=> b!1018809 (= e!573292 (and tp_is_empty!23647 tp!70892))))

(declare-datatypes ((B!1580 0))(
  ( (B!1581 (val!11874 Int)) )
))
(declare-datatypes ((tuple2!15298 0))(
  ( (tuple2!15299 (_1!7660 (_ BitVec 64)) (_2!7660 B!1580)) )
))
(declare-datatypes ((List!21551 0))(
  ( (Nil!21548) (Cons!21547 (h!22754 tuple2!15298) (t!30544 List!21551)) )
))
(declare-fun l!1036 () List!21551)

(get-info :version)

(assert (= (and start!88650 ((_ is Cons!21547) l!1036)) b!1018809))

(check-sat (not b!1018809) tp_is_empty!23647)
(check-sat)
