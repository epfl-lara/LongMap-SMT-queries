; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75150 () Bool)

(assert start!75150)

(assert (=> start!75150 false))

(declare-fun e!492978 () Bool)

(assert (=> start!75150 e!492978))

(declare-fun b!885760 () Bool)

(declare-fun tp_is_empty!17787 () Bool)

(declare-fun tp!54305 () Bool)

(assert (=> b!885760 (= e!492978 (and tp_is_empty!17787 tp!54305))))

(declare-datatypes ((B!1276 0))(
  ( (B!1277 (val!8944 Int)) )
))
(declare-datatypes ((tuple2!11882 0))(
  ( (tuple2!11883 (_1!5952 (_ BitVec 64)) (_2!5952 B!1276)) )
))
(declare-datatypes ((List!17660 0))(
  ( (Nil!17657) (Cons!17656 (h!18787 tuple2!11882) (t!24937 List!17660)) )
))
(declare-fun l!906 () List!17660)

(get-info :version)

(assert (= (and start!75150 ((_ is Cons!17656) l!906)) b!885760))

(check-sat (not b!885760) tp_is_empty!17787)
(check-sat)
