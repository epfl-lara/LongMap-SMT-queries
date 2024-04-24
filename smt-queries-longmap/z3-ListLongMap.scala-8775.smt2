; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106944 () Bool)

(assert start!106944)

(assert (=> start!106944 false))

(declare-fun e!722667 () Bool)

(assert (=> start!106944 e!722667))

(assert (=> start!106944 true))

(declare-fun b!1268428 () Bool)

(declare-fun tp_is_empty!32563 () Bool)

(declare-fun tp!96533 () Bool)

(assert (=> b!1268428 (= e!722667 (and tp_is_empty!32563 tp!96533))))

(declare-datatypes ((B!2042 0))(
  ( (B!2043 (val!16356 Int)) )
))
(declare-datatypes ((tuple2!21240 0))(
  ( (tuple2!21241 (_1!10631 (_ BitVec 64)) (_2!10631 B!2042)) )
))
(declare-datatypes ((List!28384 0))(
  ( (Nil!28381) (Cons!28380 (h!29598 tuple2!21240) (t!41903 List!28384)) )
))
(declare-fun l!874 () List!28384)

(get-info :version)

(assert (= (and start!106944 ((_ is Cons!28380) l!874)) b!1268428))

(check-sat (not b!1268428) tp_is_empty!32563)
(check-sat)
