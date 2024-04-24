; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7570 () Bool)

(assert start!7570)

(assert (=> start!7570 false))

(declare-fun e!30981 () Bool)

(assert (=> start!7570 e!30981))

(declare-fun b!48287 () Bool)

(declare-fun tp_is_empty!2083 () Bool)

(declare-fun tp!6365 () Bool)

(assert (=> b!48287 (= e!30981 (and tp_is_empty!2083 tp!6365))))

(declare-datatypes ((B!932 0))(
  ( (B!933 (val!1086 Int)) )
))
(declare-datatypes ((tuple2!1736 0))(
  ( (tuple2!1737 (_1!879 (_ BitVec 64)) (_2!879 B!932)) )
))
(declare-datatypes ((List!1269 0))(
  ( (Nil!1266) (Cons!1265 (h!1845 tuple2!1736) (t!4297 List!1269)) )
))
(declare-fun l!1333 () List!1269)

(get-info :version)

(assert (= (and start!7570 ((_ is Cons!1265) l!1333)) b!48287))

(check-sat (not b!48287) tp_is_empty!2083)
(check-sat)
