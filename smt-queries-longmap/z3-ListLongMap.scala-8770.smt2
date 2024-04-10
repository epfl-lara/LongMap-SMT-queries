; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106608 () Bool)

(assert start!106608)

(declare-fun res!843301 () Bool)

(declare-fun e!721549 () Bool)

(assert (=> start!106608 (=> (not res!843301) (not e!721549))))

(declare-datatypes ((B!2014 0))(
  ( (B!2015 (val!16342 Int)) )
))
(declare-datatypes ((tuple2!21202 0))(
  ( (tuple2!21203 (_1!10612 (_ BitVec 64)) (_2!10612 B!2014)) )
))
(declare-datatypes ((List!28334 0))(
  ( (Nil!28331) (Cons!28330 (h!29539 tuple2!21202) (t!41861 List!28334)) )
))
(declare-datatypes ((ListLongMap!18997 0))(
  ( (ListLongMap!18998 (toList!9514 List!28334)) )
))
(declare-fun lm!209 () ListLongMap!18997)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7650 (ListLongMap!18997 (_ BitVec 64)) Bool)

(assert (=> start!106608 (= res!843301 (not (contains!7650 lm!209 a!499)))))

(assert (=> start!106608 e!721549))

(declare-fun e!721550 () Bool)

(declare-fun inv!44170 (ListLongMap!18997) Bool)

(assert (=> start!106608 (and (inv!44170 lm!209) e!721550)))

(assert (=> start!106608 true))

(declare-fun b!1266762 () Bool)

(assert (=> b!1266762 (= e!721549 false)))

(declare-fun b!1266763 () Bool)

(declare-fun tp!96464 () Bool)

(assert (=> b!1266763 (= e!721550 tp!96464)))

(assert (= (and start!106608 res!843301) b!1266762))

(assert (= start!106608 b!1266763))

(declare-fun m!1166401 () Bool)

(assert (=> start!106608 m!1166401))

(declare-fun m!1166403 () Bool)

(assert (=> start!106608 m!1166403))

(check-sat (not start!106608) (not b!1266763))
(check-sat)
