; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137898 () Bool)

(assert start!137898)

(assert (=> start!137898 false))

(declare-fun e!883765 () Bool)

(assert (=> start!137898 e!883765))

(declare-fun b!1583277 () Bool)

(declare-fun tp_is_empty!39403 () Bool)

(declare-fun tp!114995 () Bool)

(assert (=> b!1583277 (= e!883765 (and tp_is_empty!39403 tp!114995))))

(declare-datatypes ((B!2870 0))(
  ( (B!2871 (val!19797 Int)) )
))
(declare-datatypes ((tuple2!25830 0))(
  ( (tuple2!25831 (_1!12926 (_ BitVec 64)) (_2!12926 B!2870)) )
))
(declare-datatypes ((List!36958 0))(
  ( (Nil!36955) (Cons!36954 (h!38498 tuple2!25830) (t!51864 List!36958)) )
))
(declare-fun l!1251 () List!36958)

(get-info :version)

(assert (= (and start!137898 ((_ is Cons!36954) l!1251)) b!1583277))

(check-sat (not b!1583277) tp_is_empty!39403)
(check-sat)
