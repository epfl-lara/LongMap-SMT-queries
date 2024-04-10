; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!1694 () Bool)

(assert start!1694)

(assert (=> start!1694 false))

(declare-fun e!7136 () Bool)

(assert (=> start!1694 e!7136))

(assert (=> start!1694 true))

(declare-fun tp_is_empty!603 () Bool)

(assert (=> start!1694 tp_is_empty!603))

(declare-fun b!11975 () Bool)

(declare-fun tp!2018 () Bool)

(assert (=> b!11975 (= e!7136 (and tp_is_empty!603 tp!2018))))

(declare-datatypes ((B!430 0))(
  ( (B!431 (val!310 Int)) )
))
(declare-datatypes ((tuple2!420 0))(
  ( (tuple2!421 (_1!210 (_ BitVec 64)) (_2!210 B!430)) )
))
(declare-datatypes ((List!362 0))(
  ( (Nil!359) (Cons!358 (h!924 tuple2!420) (t!2749 List!362)) )
))
(declare-fun l!1094 () List!362)

(get-info :version)

(assert (= (and start!1694 ((_ is Cons!358) l!1094)) b!11975))

(check-sat (not b!11975) tp_is_empty!603)
(check-sat)
