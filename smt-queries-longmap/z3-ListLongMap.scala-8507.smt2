; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!103712 () Bool)

(assert start!103712)

(assert (=> start!103712 false))

(assert (=> start!103712 true))

(declare-fun e!703923 () Bool)

(assert (=> start!103712 e!703923))

(declare-fun b!1241849 () Bool)

(declare-fun tp_is_empty!31269 () Bool)

(declare-fun tp!92702 () Bool)

(assert (=> b!1241849 (= e!703923 (and tp_is_empty!31269 tp!92702))))

(declare-datatypes ((B!1870 0))(
  ( (B!1871 (val!15697 Int)) )
))
(declare-datatypes ((tuple2!20266 0))(
  ( (tuple2!20267 (_1!10144 (_ BitVec 64)) (_2!10144 B!1870)) )
))
(declare-datatypes ((List!27362 0))(
  ( (Nil!27359) (Cons!27358 (h!28567 tuple2!20266) (t!40825 List!27362)) )
))
(declare-fun l!644 () List!27362)

(get-info :version)

(assert (= (and start!103712 ((_ is Cons!27358) l!644)) b!1241849))

(check-sat (not b!1241849) tp_is_empty!31269)
(check-sat)
