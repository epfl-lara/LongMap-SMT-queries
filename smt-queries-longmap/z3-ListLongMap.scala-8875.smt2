; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107770 () Bool)

(assert start!107770)

(assert (=> start!107770 false))

(declare-fun e!727357 () Bool)

(assert (=> start!107770 e!727357))

(assert (=> start!107770 true))

(declare-fun b!1274535 () Bool)

(declare-fun tp_is_empty!33165 () Bool)

(declare-fun tp!97952 () Bool)

(assert (=> b!1274535 (= e!727357 (and tp_is_empty!33165 tp!97952))))

(declare-datatypes ((B!2122 0))(
  ( (B!2123 (val!16657 Int)) )
))
(declare-datatypes ((tuple2!21396 0))(
  ( (tuple2!21397 (_1!10709 (_ BitVec 64)) (_2!10709 B!2122)) )
))
(declare-datatypes ((List!28583 0))(
  ( (Nil!28580) (Cons!28579 (h!29788 tuple2!21396) (t!42116 List!28583)) )
))
(declare-fun l!595 () List!28583)

(get-info :version)

(assert (= (and start!107770 ((_ is Cons!28579) l!595)) b!1274535))

(check-sat (not b!1274535) tp_is_empty!33165)
(check-sat)
