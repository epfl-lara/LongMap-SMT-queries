; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135018 () Bool)

(assert start!135018)

(declare-fun res!1074342 () Bool)

(declare-fun e!876710 () Bool)

(assert (=> start!135018 (=> (not res!1074342) (not e!876710))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135018 (= res!1074342 (validMask!0 mask!889))))

(assert (=> start!135018 e!876710))

(assert (=> start!135018 true))

(declare-datatypes ((array!104958 0))(
  ( (array!104959 (arr!50642 (Array (_ BitVec 32) (_ BitVec 64))) (size!51194 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!104958)

(declare-fun array_inv!39578 (array!104958) Bool)

(assert (=> start!135018 (array_inv!39578 _keys!600)))

(declare-fun b!1572294 () Bool)

(declare-fun res!1074340 () Bool)

(assert (=> b!1572294 (=> (not res!1074340) (not e!876710))))

(assert (=> b!1572294 (= res!1074340 (= (size!51194 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572295 () Bool)

(declare-fun res!1074341 () Bool)

(assert (=> b!1572295 (=> (not res!1074341) (not e!876710))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572295 (= res!1074341 (validKeyInArray!0 k0!754))))

(declare-fun b!1572296 () Bool)

(assert (=> b!1572296 (= e!876710 false)))

(declare-datatypes ((SeekEntryResult!13590 0))(
  ( (MissingZero!13590 (index!56758 (_ BitVec 32))) (Found!13590 (index!56759 (_ BitVec 32))) (Intermediate!13590 (undefined!14402 Bool) (index!56760 (_ BitVec 32)) (x!141539 (_ BitVec 32))) (Undefined!13590) (MissingVacant!13590 (index!56761 (_ BitVec 32))) )
))
(declare-fun lt!673773 () SeekEntryResult!13590)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!104958 (_ BitVec 32)) SeekEntryResult!13590)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572296 (= lt!673773 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135018 res!1074342) b!1572294))

(assert (= (and b!1572294 res!1074340) b!1572295))

(assert (= (and b!1572295 res!1074341) b!1572296))

(declare-fun m!1445379 () Bool)

(assert (=> start!135018 m!1445379))

(declare-fun m!1445381 () Bool)

(assert (=> start!135018 m!1445381))

(declare-fun m!1445383 () Bool)

(assert (=> b!1572295 m!1445383))

(declare-fun m!1445385 () Bool)

(assert (=> b!1572296 m!1445385))

(assert (=> b!1572296 m!1445385))

(declare-fun m!1445387 () Bool)

(assert (=> b!1572296 m!1445387))

(check-sat (not b!1572296) (not start!135018) (not b!1572295))
(check-sat)
