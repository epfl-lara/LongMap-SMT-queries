; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7566 () Bool)

(assert start!7566)

(assert (=> start!7566 false))

(declare-fun e!30975 () Bool)

(assert (=> start!7566 e!30975))

(declare-fun b!48278 () Bool)

(declare-fun tp_is_empty!2083 () Bool)

(declare-fun tp!6365 () Bool)

(assert (=> b!48278 (= e!30975 (and tp_is_empty!2083 tp!6365))))

(declare-datatypes ((B!932 0))(
  ( (B!933 (val!1086 Int)) )
))
(declare-datatypes ((tuple2!1758 0))(
  ( (tuple2!1759 (_1!890 (_ BitVec 64)) (_2!890 B!932)) )
))
(declare-datatypes ((List!1279 0))(
  ( (Nil!1276) (Cons!1275 (h!1855 tuple2!1758) (t!4306 List!1279)) )
))
(declare-fun l!1333 () List!1279)

(get-info :version)

(assert (= (and start!7566 ((_ is Cons!1275) l!1333)) b!48278))

(check-sat (not b!48278) tp_is_empty!2083)
(check-sat)
