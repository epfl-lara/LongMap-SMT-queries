; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7188 () Bool)

(assert start!7188)

(assert (=> start!7188 false))

(declare-fun e!29339 () Bool)

(assert (=> start!7188 e!29339))

(declare-fun b!46071 () Bool)

(declare-fun tp_is_empty!1959 () Bool)

(declare-fun tp!6059 () Bool)

(assert (=> b!46071 (= e!29339 (and tp_is_empty!1959 tp!6059))))

(declare-datatypes ((B!862 0))(
  ( (B!863 (val!1018 Int)) )
))
(declare-datatypes ((tuple2!1684 0))(
  ( (tuple2!1685 (_1!853 (_ BitVec 64)) (_2!853 B!862)) )
))
(declare-datatypes ((List!1236 0))(
  ( (Nil!1233) (Cons!1232 (h!1812 tuple2!1684) (t!4261 List!1236)) )
))
(declare-fun l!812 () List!1236)

(get-info :version)

(assert (= (and start!7188 ((_ is Cons!1232) l!812)) b!46071))

(check-sat (not b!46071) tp_is_empty!1959)
(check-sat)
