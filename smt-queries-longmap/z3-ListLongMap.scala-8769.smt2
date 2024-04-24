; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106824 () Bool)

(assert start!106824)

(declare-fun res!843809 () Bool)

(declare-fun e!722372 () Bool)

(assert (=> start!106824 (=> (not res!843809) (not e!722372))))

(declare-datatypes ((B!2006 0))(
  ( (B!2007 (val!16338 Int)) )
))
(declare-datatypes ((tuple2!21204 0))(
  ( (tuple2!21205 (_1!10613 (_ BitVec 64)) (_2!10613 B!2006)) )
))
(declare-datatypes ((List!28366 0))(
  ( (Nil!28363) (Cons!28362 (h!29580 tuple2!21204) (t!41885 List!28366)) )
))
(declare-datatypes ((ListLongMap!19007 0))(
  ( (ListLongMap!19008 (toList!9519 List!28366)) )
))
(declare-fun lm!209 () ListLongMap!19007)

(declare-fun a!499 () (_ BitVec 64))

(declare-fun contains!7671 (ListLongMap!19007 (_ BitVec 64)) Bool)

(assert (=> start!106824 (= res!843809 (not (contains!7671 lm!209 a!499)))))

(assert (=> start!106824 e!722372))

(declare-fun e!722373 () Bool)

(declare-fun inv!44161 (ListLongMap!19007) Bool)

(assert (=> start!106824 (and (inv!44161 lm!209) e!722373)))

(assert (=> start!106824 true))

(declare-fun b!1268043 () Bool)

(assert (=> b!1268043 (= e!722372 false)))

(declare-fun b!1268044 () Bool)

(declare-fun tp!96452 () Bool)

(assert (=> b!1268044 (= e!722373 tp!96452)))

(assert (= (and start!106824 res!843809) b!1268043))

(assert (= start!106824 b!1268044))

(declare-fun m!1167997 () Bool)

(assert (=> start!106824 m!1167997))

(declare-fun m!1167999 () Bool)

(assert (=> start!106824 m!1167999))

(check-sat (not start!106824) (not b!1268044))
(check-sat)
