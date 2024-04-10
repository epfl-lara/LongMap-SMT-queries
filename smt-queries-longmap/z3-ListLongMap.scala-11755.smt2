; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137934 () Bool)

(assert start!137934)

(assert (=> start!137934 false))

(declare-fun e!883966 () Bool)

(assert (=> start!137934 e!883966))

(declare-fun b!1583593 () Bool)

(declare-fun tp_is_empty!39405 () Bool)

(declare-fun tp!114997 () Bool)

(assert (=> b!1583593 (= e!883966 (and tp_is_empty!39405 tp!114997))))

(declare-datatypes ((B!2872 0))(
  ( (B!2873 (val!19798 Int)) )
))
(declare-datatypes ((tuple2!25764 0))(
  ( (tuple2!25765 (_1!12893 (_ BitVec 64)) (_2!12893 B!2872)) )
))
(declare-datatypes ((List!36918 0))(
  ( (Nil!36915) (Cons!36914 (h!38457 tuple2!25764) (t!51832 List!36918)) )
))
(declare-fun l!1251 () List!36918)

(get-info :version)

(assert (= (and start!137934 ((_ is Cons!36914) l!1251)) b!1583593))

(check-sat (not b!1583593) tp_is_empty!39405)
(check-sat)
