; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137720 () Bool)

(assert start!137720)

(assert (=> start!137720 false))

(declare-fun e!883295 () Bool)

(assert (=> start!137720 e!883295))

(declare-fun b!1582615 () Bool)

(declare-fun tp_is_empty!39327 () Bool)

(declare-fun tp!114806 () Bool)

(assert (=> b!1582615 (= e!883295 (and tp_is_empty!39327 tp!114806))))

(declare-datatypes ((B!2794 0))(
  ( (B!2795 (val!19759 Int)) )
))
(declare-datatypes ((tuple2!25686 0))(
  ( (tuple2!25687 (_1!12854 (_ BitVec 64)) (_2!12854 B!2794)) )
))
(declare-datatypes ((List!36879 0))(
  ( (Nil!36876) (Cons!36875 (h!38418 tuple2!25686) (t!51793 List!36879)) )
))
(declare-fun l!1065 () List!36879)

(get-info :version)

(assert (= (and start!137720 ((_ is Cons!36875) l!1065)) b!1582615))

(check-sat (not b!1582615) tp_is_empty!39327)
(check-sat)
