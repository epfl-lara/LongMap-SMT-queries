; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!88584 () Bool)

(assert start!88584)

(assert (=> start!88584 false))

(declare-fun e!572913 () Bool)

(assert (=> start!88584 e!572913))

(assert (=> start!88584 true))

(declare-fun b!1018235 () Bool)

(declare-fun tp_is_empty!23691 () Bool)

(declare-fun tp!71005 () Bool)

(assert (=> b!1018235 (= e!572913 (and tp_is_empty!23691 tp!71005))))

(declare-datatypes ((B!1624 0))(
  ( (B!1625 (val!11896 Int)) )
))
(declare-datatypes ((tuple2!15338 0))(
  ( (tuple2!15339 (_1!7680 (_ BitVec 64)) (_2!7680 B!1624)) )
))
(declare-datatypes ((List!21584 0))(
  ( (Nil!21581) (Cons!21580 (h!22778 tuple2!15338) (t!30585 List!21584)) )
))
(declare-fun l!996 () List!21584)

(get-info :version)

(assert (= (and start!88584 ((_ is Cons!21580) l!996)) b!1018235))

(check-sat (not b!1018235) tp_is_empty!23691)
(check-sat)
