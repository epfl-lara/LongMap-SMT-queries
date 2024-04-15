; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106596 () Bool)

(assert start!106596)

(declare-fun res!843249 () Bool)

(declare-fun e!721480 () Bool)

(assert (=> start!106596 (=> (not res!843249) (not e!721480))))

(declare-datatypes ((B!2006 0))(
  ( (B!2007 (val!16338 Int)) )
))
(declare-datatypes ((tuple2!21276 0))(
  ( (tuple2!21277 (_1!10649 (_ BitVec 64)) (_2!10649 B!2006)) )
))
(declare-datatypes ((List!28414 0))(
  ( (Nil!28411) (Cons!28410 (h!29619 tuple2!21276) (t!41932 List!28414)) )
))
(declare-datatypes ((ListLongMap!19071 0))(
  ( (ListLongMap!19072 (toList!9551 List!28414)) )
))
(declare-fun lm!209 () ListLongMap!19071)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7615 (ListLongMap!19071 (_ BitVec 64)) Bool)

(assert (=> start!106596 (= res!843249 (not (contains!7615 lm!209 a!499)))))

(assert (=> start!106596 e!721480))

(declare-fun e!721481 () Bool)

(declare-fun inv!44161 (ListLongMap!19071) Bool)

(assert (=> start!106596 (and (inv!44161 lm!209) e!721481)))

(assert (=> start!106596 true))

(declare-fun b!1266656 () Bool)

(assert (=> b!1266656 (= e!721480 false)))

(declare-fun b!1266657 () Bool)

(declare-fun tp!96452 () Bool)

(assert (=> b!1266657 (= e!721481 tp!96452)))

(assert (= (and start!106596 res!843249) b!1266656))

(assert (= start!106596 b!1266657))

(declare-fun m!1165865 () Bool)

(assert (=> start!106596 m!1165865))

(declare-fun m!1165867 () Bool)

(assert (=> start!106596 m!1165867))

(check-sat (not start!106596) (not b!1266657))
(check-sat)
