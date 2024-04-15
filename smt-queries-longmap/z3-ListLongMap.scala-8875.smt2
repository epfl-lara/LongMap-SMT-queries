; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107768 () Bool)

(assert start!107768)

(assert (=> start!107768 false))

(declare-fun e!727325 () Bool)

(assert (=> start!107768 e!727325))

(assert (=> start!107768 true))

(declare-fun b!1274468 () Bool)

(declare-fun tp_is_empty!33163 () Bool)

(declare-fun tp!97950 () Bool)

(assert (=> b!1274468 (= e!727325 (and tp_is_empty!33163 tp!97950))))

(declare-datatypes ((B!2120 0))(
  ( (B!2121 (val!16656 Int)) )
))
(declare-datatypes ((tuple2!21470 0))(
  ( (tuple2!21471 (_1!10746 (_ BitVec 64)) (_2!10746 B!2120)) )
))
(declare-datatypes ((List!28655 0))(
  ( (Nil!28652) (Cons!28651 (h!29860 tuple2!21470) (t!42180 List!28655)) )
))
(declare-fun l!595 () List!28655)

(get-info :version)

(assert (= (and start!107768 ((_ is Cons!28651) l!595)) b!1274468))

(check-sat (not b!1274468) tp_is_empty!33163)
(check-sat)
