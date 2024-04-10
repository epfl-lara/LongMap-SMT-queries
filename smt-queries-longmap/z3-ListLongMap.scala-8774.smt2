; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106716 () Bool)

(assert start!106716)

(assert (=> start!106716 false))

(declare-fun e!721814 () Bool)

(assert (=> start!106716 e!721814))

(declare-fun b!1267117 () Bool)

(declare-fun tp_is_empty!32559 () Bool)

(declare-fun tp!96527 () Bool)

(assert (=> b!1267117 (= e!721814 (and tp_is_empty!32559 tp!96527))))

(declare-datatypes ((B!2038 0))(
  ( (B!2039 (val!16354 Int)) )
))
(declare-datatypes ((tuple2!21226 0))(
  ( (tuple2!21227 (_1!10624 (_ BitVec 64)) (_2!10624 B!2038)) )
))
(declare-datatypes ((List!28346 0))(
  ( (Nil!28343) (Cons!28342 (h!29551 tuple2!21226) (t!41873 List!28346)) )
))
(declare-fun l!874 () List!28346)

(get-info :version)

(assert (= (and start!106716 ((_ is Cons!28342) l!874)) b!1267117))

(check-sat (not b!1267117) tp_is_empty!32559)
(check-sat)
