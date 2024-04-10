; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134452 () Bool)

(assert start!134452)

(assert (=> start!134452 false))

(assert (=> start!134452 true))

(declare-fun e!875072 () Bool)

(assert (=> start!134452 e!875072))

(declare-fun b!1569705 () Bool)

(declare-fun tp_is_empty!39081 () Bool)

(declare-fun tp!114168 () Bool)

(assert (=> b!1569705 (= e!875072 (and tp_is_empty!39081 tp!114168))))

(declare-datatypes ((B!2530 0))(
  ( (B!2531 (val!19627 Int)) )
))
(declare-datatypes ((tuple2!25356 0))(
  ( (tuple2!25357 (_1!12689 (_ BitVec 64)) (_2!12689 B!2530)) )
))
(declare-datatypes ((List!36747 0))(
  ( (Nil!36744) (Cons!36743 (h!38190 tuple2!25356) (t!51655 List!36747)) )
))
(declare-fun l!750 () List!36747)

(get-info :version)

(assert (= (and start!134452 ((_ is Cons!36743) l!750)) b!1569705))

(check-sat (not b!1569705) tp_is_empty!39081)
(check-sat)
