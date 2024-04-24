; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7576 () Bool)

(assert start!7576)

(assert (=> start!7576 false))

(declare-fun e!30990 () Bool)

(assert (=> start!7576 e!30990))

(assert (=> start!7576 true))

(declare-fun b!48296 () Bool)

(declare-fun tp_is_empty!2089 () Bool)

(declare-fun tp!6374 () Bool)

(assert (=> b!48296 (= e!30990 (and tp_is_empty!2089 tp!6374))))

(declare-datatypes ((B!938 0))(
  ( (B!939 (val!1089 Int)) )
))
(declare-datatypes ((tuple2!1742 0))(
  ( (tuple2!1743 (_1!882 (_ BitVec 64)) (_2!882 B!938)) )
))
(declare-datatypes ((List!1272 0))(
  ( (Nil!1269) (Cons!1268 (h!1848 tuple2!1742) (t!4300 List!1272)) )
))
(declare-fun l!1333 () List!1272)

(get-info :version)

(assert (= (and start!7576 ((_ is Cons!1268) l!1333)) b!48296))

(check-sat (not b!48296) tp_is_empty!2089)
(check-sat)
