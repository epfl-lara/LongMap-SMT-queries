; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106734 () Bool)

(assert start!106734)

(assert (=> start!106734 false))

(declare-fun e!721811 () Bool)

(assert (=> start!106734 e!721811))

(assert (=> start!106734 true))

(declare-fun b!1267113 () Bool)

(declare-fun tp_is_empty!32581 () Bool)

(declare-fun tp!96560 () Bool)

(assert (=> b!1267113 (= e!721811 (and tp_is_empty!32581 tp!96560))))

(declare-datatypes ((B!2060 0))(
  ( (B!2061 (val!16365 Int)) )
))
(declare-datatypes ((tuple2!21330 0))(
  ( (tuple2!21331 (_1!10676 (_ BitVec 64)) (_2!10676 B!2060)) )
))
(declare-datatypes ((List!28441 0))(
  ( (Nil!28438) (Cons!28437 (h!29646 tuple2!21330) (t!41959 List!28441)) )
))
(declare-fun l!874 () List!28441)

(get-info :version)

(assert (= (and start!106734 ((_ is Cons!28437) l!874)) b!1267113))

(check-sat (not b!1267113) tp_is_empty!32581)
(check-sat)
