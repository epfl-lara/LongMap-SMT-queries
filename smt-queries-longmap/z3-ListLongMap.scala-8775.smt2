; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106722 () Bool)

(assert start!106722)

(assert (=> start!106722 false))

(declare-fun e!721823 () Bool)

(assert (=> start!106722 e!721823))

(assert (=> start!106722 true))

(declare-fun b!1267126 () Bool)

(declare-fun tp_is_empty!32565 () Bool)

(declare-fun tp!96536 () Bool)

(assert (=> b!1267126 (= e!721823 (and tp_is_empty!32565 tp!96536))))

(declare-datatypes ((B!2044 0))(
  ( (B!2045 (val!16357 Int)) )
))
(declare-datatypes ((tuple2!21232 0))(
  ( (tuple2!21233 (_1!10627 (_ BitVec 64)) (_2!10627 B!2044)) )
))
(declare-datatypes ((List!28349 0))(
  ( (Nil!28346) (Cons!28345 (h!29554 tuple2!21232) (t!41876 List!28349)) )
))
(declare-fun l!874 () List!28349)

(get-info :version)

(assert (= (and start!106722 ((_ is Cons!28345) l!874)) b!1267126))

(check-sat (not b!1267126) tp_is_empty!32565)
(check-sat)
