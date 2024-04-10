; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137738 () Bool)

(assert start!137738)

(assert (=> start!137738 false))

(declare-fun e!883331 () Bool)

(assert (=> start!137738 e!883331))

(assert (=> start!137738 true))

(declare-fun b!1582687 () Bool)

(declare-fun tp_is_empty!39345 () Bool)

(declare-fun tp!114833 () Bool)

(assert (=> b!1582687 (= e!883331 (and tp_is_empty!39345 tp!114833))))

(declare-datatypes ((B!2812 0))(
  ( (B!2813 (val!19768 Int)) )
))
(declare-datatypes ((tuple2!25704 0))(
  ( (tuple2!25705 (_1!12863 (_ BitVec 64)) (_2!12863 B!2812)) )
))
(declare-datatypes ((List!36888 0))(
  ( (Nil!36885) (Cons!36884 (h!38427 tuple2!25704) (t!51802 List!36888)) )
))
(declare-fun l!1065 () List!36888)

(get-info :version)

(assert (= (and start!137738 ((_ is Cons!36884) l!1065)) b!1582687))

(check-sat (not b!1582687) tp_is_empty!39345)
(check-sat)
