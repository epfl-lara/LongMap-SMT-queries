; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106962 () Bool)

(assert start!106962)

(assert (=> start!106962 false))

(declare-fun e!722703 () Bool)

(assert (=> start!106962 e!722703))

(assert (=> start!106962 true))

(declare-fun b!1268500 () Bool)

(declare-fun tp_is_empty!32581 () Bool)

(declare-fun tp!96560 () Bool)

(assert (=> b!1268500 (= e!722703 (and tp_is_empty!32581 tp!96560))))

(declare-datatypes ((B!2060 0))(
  ( (B!2061 (val!16365 Int)) )
))
(declare-datatypes ((tuple2!21258 0))(
  ( (tuple2!21259 (_1!10640 (_ BitVec 64)) (_2!10640 B!2060)) )
))
(declare-datatypes ((List!28393 0))(
  ( (Nil!28390) (Cons!28389 (h!29607 tuple2!21258) (t!41912 List!28393)) )
))
(declare-fun l!874 () List!28393)

(get-info :version)

(assert (= (and start!106962 ((_ is Cons!28389) l!874)) b!1268500))

(check-sat (not b!1268500) tp_is_empty!32581)
(check-sat)
