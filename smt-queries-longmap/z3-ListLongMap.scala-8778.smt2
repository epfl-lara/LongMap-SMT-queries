; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106740 () Bool)

(assert start!106740)

(assert (=> start!106740 false))

(declare-fun e!721859 () Bool)

(assert (=> start!106740 e!721859))

(assert (=> start!106740 true))

(declare-fun b!1267198 () Bool)

(declare-fun tp_is_empty!32583 () Bool)

(declare-fun tp!96563 () Bool)

(assert (=> b!1267198 (= e!721859 (and tp_is_empty!32583 tp!96563))))

(declare-datatypes ((B!2062 0))(
  ( (B!2063 (val!16366 Int)) )
))
(declare-datatypes ((tuple2!21250 0))(
  ( (tuple2!21251 (_1!10636 (_ BitVec 64)) (_2!10636 B!2062)) )
))
(declare-datatypes ((List!28358 0))(
  ( (Nil!28355) (Cons!28354 (h!29563 tuple2!21250) (t!41885 List!28358)) )
))
(declare-fun l!874 () List!28358)

(get-info :version)

(assert (= (and start!106740 ((_ is Cons!28354) l!874)) b!1267198))

(check-sat (not b!1267198) tp_is_empty!32583)
(check-sat)
