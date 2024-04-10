; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7164 () Bool)

(assert start!7164)

(assert (=> start!7164 false))

(declare-fun e!29252 () Bool)

(assert (=> start!7164 e!29252))

(declare-fun b!45951 () Bool)

(declare-fun tp_is_empty!1947 () Bool)

(declare-fun tp!6032 () Bool)

(assert (=> b!45951 (= e!29252 (and tp_is_empty!1947 tp!6032))))

(declare-datatypes ((B!850 0))(
  ( (B!851 (val!1012 Int)) )
))
(declare-datatypes ((tuple2!1672 0))(
  ( (tuple2!1673 (_1!847 (_ BitVec 64)) (_2!847 B!850)) )
))
(declare-datatypes ((List!1230 0))(
  ( (Nil!1227) (Cons!1226 (h!1806 tuple2!1672) (t!4255 List!1230)) )
))
(declare-fun l!812 () List!1230)

(get-info :version)

(assert (= (and start!7164 ((_ is Cons!1226) l!812)) b!45951))

(check-sat (not b!45951) tp_is_empty!1947)
(check-sat)
