; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7572 () Bool)

(assert start!7572)

(assert (=> start!7572 false))

(declare-fun e!30984 () Bool)

(assert (=> start!7572 e!30984))

(assert (=> start!7572 true))

(declare-fun b!48287 () Bool)

(declare-fun tp_is_empty!2089 () Bool)

(declare-fun tp!6374 () Bool)

(assert (=> b!48287 (= e!30984 (and tp_is_empty!2089 tp!6374))))

(declare-datatypes ((B!938 0))(
  ( (B!939 (val!1089 Int)) )
))
(declare-datatypes ((tuple2!1764 0))(
  ( (tuple2!1765 (_1!893 (_ BitVec 64)) (_2!893 B!938)) )
))
(declare-datatypes ((List!1282 0))(
  ( (Nil!1279) (Cons!1278 (h!1858 tuple2!1764) (t!4309 List!1282)) )
))
(declare-fun l!1333 () List!1282)

(get-info :version)

(assert (= (and start!7572 ((_ is Cons!1278) l!1333)) b!48287))

(check-sat (not b!48287) tp_is_empty!2089)
(check-sat)
