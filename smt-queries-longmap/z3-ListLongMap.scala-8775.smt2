; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106716 () Bool)

(assert start!106716)

(assert (=> start!106716 false))

(declare-fun e!721775 () Bool)

(assert (=> start!106716 e!721775))

(assert (=> start!106716 true))

(declare-fun b!1267041 () Bool)

(declare-fun tp_is_empty!32563 () Bool)

(declare-fun tp!96533 () Bool)

(assert (=> b!1267041 (= e!721775 (and tp_is_empty!32563 tp!96533))))

(declare-datatypes ((B!2042 0))(
  ( (B!2043 (val!16356 Int)) )
))
(declare-datatypes ((tuple2!21312 0))(
  ( (tuple2!21313 (_1!10667 (_ BitVec 64)) (_2!10667 B!2042)) )
))
(declare-datatypes ((List!28432 0))(
  ( (Nil!28429) (Cons!28428 (h!29637 tuple2!21312) (t!41950 List!28432)) )
))
(declare-fun l!874 () List!28432)

(get-info :version)

(assert (= (and start!106716 ((_ is Cons!28428) l!874)) b!1267041))

(check-sat (not b!1267041) tp_is_empty!32563)
(check-sat)
