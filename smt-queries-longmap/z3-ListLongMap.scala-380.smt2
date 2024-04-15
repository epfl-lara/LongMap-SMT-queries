; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7188 () Bool)

(assert start!7188)

(assert (=> start!7188 false))

(declare-fun e!29293 () Bool)

(assert (=> start!7188 e!29293))

(declare-fun b!46002 () Bool)

(declare-fun tp_is_empty!1957 () Bool)

(declare-fun tp!6056 () Bool)

(assert (=> b!46002 (= e!29293 (and tp_is_empty!1957 tp!6056))))

(declare-datatypes ((B!860 0))(
  ( (B!861 (val!1017 Int)) )
))
(declare-datatypes ((tuple2!1686 0))(
  ( (tuple2!1687 (_1!854 (_ BitVec 64)) (_2!854 B!860)) )
))
(declare-datatypes ((List!1228 0))(
  ( (Nil!1225) (Cons!1224 (h!1804 tuple2!1686) (t!4252 List!1228)) )
))
(declare-fun l!812 () List!1228)

(get-info :version)

(assert (= (and start!7188 ((_ is Cons!1224) l!812)) b!46002))

(check-sat (not b!46002) tp_is_empty!1957)
(check-sat)
