; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137020 () Bool)

(assert start!137020)

(assert (=> start!137020 false))

(declare-fun e!881144 () Bool)

(assert (=> start!137020 e!881144))

(declare-fun b!1579574 () Bool)

(declare-fun tp_is_empty!39151 () Bool)

(declare-fun tp!114379 () Bool)

(assert (=> b!1579574 (= e!881144 (and tp_is_empty!39151 tp!114379))))

(declare-datatypes ((B!2606 0))(
  ( (B!2607 (val!19665 Int)) )
))
(declare-datatypes ((tuple2!25500 0))(
  ( (tuple2!25501 (_1!12761 (_ BitVec 64)) (_2!12761 B!2606)) )
))
(declare-datatypes ((List!36826 0))(
  ( (Nil!36823) (Cons!36822 (h!38366 tuple2!25500) (t!51732 List!36826)) )
))
(declare-fun l!1390 () List!36826)

(get-info :version)

(assert (= (and start!137020 ((_ is Cons!36822) l!1390)) b!1579574))

(check-sat (not b!1579574) tp_is_empty!39151)
(check-sat)
