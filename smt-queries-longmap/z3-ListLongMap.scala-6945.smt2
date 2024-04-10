; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!87464 () Bool)

(assert start!87464)

(assert (=> start!87464 false))

(declare-fun e!569893 () Bool)

(assert (=> start!87464 e!569893))

(declare-fun b!1013117 () Bool)

(declare-fun tp_is_empty!23445 () Bool)

(declare-fun tp!70376 () Bool)

(assert (=> b!1013117 (= e!569893 (and tp_is_empty!23445 tp!70376))))

(declare-datatypes ((B!1378 0))(
  ( (B!1379 (val!11773 Int)) )
))
(declare-datatypes ((tuple2!15092 0))(
  ( (tuple2!15093 (_1!7557 (_ BitVec 64)) (_2!7557 B!1378)) )
))
(declare-datatypes ((List!21392 0))(
  ( (Nil!21389) (Cons!21388 (h!22586 tuple2!15092) (t!30393 List!21392)) )
))
(declare-fun l!412 () List!21392)

(get-info :version)

(assert (= (and start!87464 ((_ is Cons!21388) l!412)) b!1013117))

(check-sat (not b!1013117) tp_is_empty!23445)
(check-sat)
