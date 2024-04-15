; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106338 () Bool)

(assert start!106338)

(assert (=> start!106338 false))

(declare-fun e!720332 () Bool)

(assert (=> start!106338 e!720332))

(assert (=> start!106338 true))

(declare-fun b!1264887 () Bool)

(declare-fun tp_is_empty!32473 () Bool)

(declare-fun tp!96275 () Bool)

(assert (=> b!1264887 (= e!720332 (and tp_is_empty!32473 tp!96275))))

(declare-datatypes ((B!1940 0))(
  ( (B!1941 (val!16305 Int)) )
))
(declare-datatypes ((tuple2!21210 0))(
  ( (tuple2!21211 (_1!10616 (_ BitVec 64)) (_2!10616 B!1940)) )
))
(declare-datatypes ((List!28381 0))(
  ( (Nil!28378) (Cons!28377 (h!29586 tuple2!21210) (t!41893 List!28381)) )
))
(declare-fun l!706 () List!28381)

(get-info :version)

(assert (= (and start!106338 ((_ is Cons!28377) l!706)) b!1264887))

(check-sat (not b!1264887) tp_is_empty!32473)
(check-sat)
