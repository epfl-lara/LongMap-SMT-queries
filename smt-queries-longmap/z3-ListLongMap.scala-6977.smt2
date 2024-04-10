; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88404 () Bool)

(assert start!88404)

(assert (=> start!88404 false))

(declare-fun e!572415 () Bool)

(assert (=> start!88404 e!572415))

(assert (=> start!88404 true))

(declare-fun b!1017419 () Bool)

(declare-fun tp_is_empty!23637 () Bool)

(declare-fun tp!70876 () Bool)

(assert (=> b!1017419 (= e!572415 (and tp_is_empty!23637 tp!70876))))

(declare-datatypes ((B!1570 0))(
  ( (B!1571 (val!11869 Int)) )
))
(declare-datatypes ((tuple2!15284 0))(
  ( (tuple2!15285 (_1!7653 (_ BitVec 64)) (_2!7653 B!1570)) )
))
(declare-datatypes ((List!21557 0))(
  ( (Nil!21554) (Cons!21553 (h!22751 tuple2!15284) (t!30558 List!21557)) )
))
(declare-fun l!1036 () List!21557)

(get-info :version)

(assert (= (and start!88404 ((_ is Cons!21553) l!1036)) b!1017419))

(check-sat (not b!1017419) tp_is_empty!23637)
(check-sat)
