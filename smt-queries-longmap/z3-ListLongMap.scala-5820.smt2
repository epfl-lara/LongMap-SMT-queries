; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75064 () Bool)

(assert start!75064)

(assert (=> start!75064 false))

(declare-fun e!492530 () Bool)

(assert (=> start!75064 e!492530))

(assert (=> start!75064 true))

(declare-fun b!885011 () Bool)

(declare-fun tp_is_empty!17749 () Bool)

(declare-fun tp!54231 () Bool)

(assert (=> b!885011 (= e!492530 (and tp_is_empty!17749 tp!54231))))

(declare-datatypes ((B!1238 0))(
  ( (B!1239 (val!8925 Int)) )
))
(declare-datatypes ((tuple2!11864 0))(
  ( (tuple2!11865 (_1!5943 (_ BitVec 64)) (_2!5943 B!1238)) )
))
(declare-datatypes ((List!17649 0))(
  ( (Nil!17646) (Cons!17645 (h!18776 tuple2!11864) (t!24917 List!17649)) )
))
(declare-fun l!906 () List!17649)

(get-info :version)

(assert (= (and start!75064 ((_ is Cons!17645) l!906)) b!885011))

(check-sat (not b!885011) tp_is_empty!17749)
(check-sat)
