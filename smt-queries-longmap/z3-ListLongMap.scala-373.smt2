; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7098 () Bool)

(assert start!7098)

(assert (=> start!7098 false))

(declare-fun e!28921 () Bool)

(assert (=> start!7098 e!28921))

(declare-fun b!45429 () Bool)

(declare-fun tp_is_empty!1915 () Bool)

(declare-fun tp!5966 () Bool)

(assert (=> b!45429 (= e!28921 (and tp_is_empty!1915 tp!5966))))

(declare-datatypes ((B!818 0))(
  ( (B!819 (val!996 Int)) )
))
(declare-datatypes ((tuple2!1644 0))(
  ( (tuple2!1645 (_1!833 (_ BitVec 64)) (_2!833 B!818)) )
))
(declare-datatypes ((List!1207 0))(
  ( (Nil!1204) (Cons!1203 (h!1783 tuple2!1644) (t!4231 List!1207)) )
))
(declare-fun l!812 () List!1207)

(get-info :version)

(assert (= (and start!7098 ((_ is Cons!1203) l!812)) b!45429))

(check-sat (not b!45429) tp_is_empty!1915)
(check-sat)
