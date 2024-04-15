; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87906 () Bool)

(assert start!87906)

(assert (=> start!87906 false))

(declare-fun e!571211 () Bool)

(assert (=> start!87906 e!571211))

(declare-fun b!1015384 () Bool)

(declare-fun tp_is_empty!23545 () Bool)

(declare-fun tp!70647 () Bool)

(assert (=> b!1015384 (= e!571211 (and tp_is_empty!23545 tp!70647))))

(declare-datatypes ((B!1478 0))(
  ( (B!1479 (val!11823 Int)) )
))
(declare-datatypes ((tuple2!15272 0))(
  ( (tuple2!15273 (_1!7647 (_ BitVec 64)) (_2!7647 B!1478)) )
))
(declare-datatypes ((List!21510 0))(
  ( (Nil!21507) (Cons!21506 (h!22704 tuple2!15272) (t!30502 List!21510)) )
))
(declare-fun l!1114 () List!21510)

(get-info :version)

(assert (= (and start!87906 ((_ is Cons!21506) l!1114)) b!1015384))

(check-sat (not b!1015384) tp_is_empty!23545)
(check-sat)
