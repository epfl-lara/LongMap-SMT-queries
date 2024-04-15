; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135096 () Bool)

(assert start!135096)

(declare-fun b!1572611 () Bool)

(declare-fun res!1074609 () Bool)

(declare-fun e!876918 () Bool)

(assert (=> b!1572611 (=> (not res!1074609) (not e!876918))))

(declare-datatypes ((array!105009 0))(
  ( (array!105010 (arr!50666 (Array (_ BitVec 32) (_ BitVec 64))) (size!51218 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105009)

(declare-fun mask!889 () (_ BitVec 32))

(assert (=> b!1572611 (= res!1074609 (= (size!51218 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1572614 () Bool)

(declare-fun e!876919 () Bool)

(assert (=> b!1572614 (= e!876919 false)))

(declare-fun k0!754 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13614 0))(
  ( (MissingZero!13614 (index!56854 (_ BitVec 32))) (Found!13614 (index!56855 (_ BitVec 32))) (Intermediate!13614 (undefined!14426 Bool) (index!56856 (_ BitVec 32)) (x!141633 (_ BitVec 32))) (Undefined!13614) (MissingVacant!13614 (index!56857 (_ BitVec 32))) )
))
(declare-fun lt!673901 () SeekEntryResult!13614)

(declare-fun lt!673902 () SeekEntryResult!13614)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105009 (_ BitVec 32)) SeekEntryResult!13614)

(assert (=> b!1572614 (= lt!673901 (seekKeyOrZeroReturnVacant!0 (x!141633 lt!673902) (index!56856 lt!673902) (index!56856 lt!673902) k0!754 _keys!600 mask!889))))

(declare-fun res!1074608 () Bool)

(assert (=> start!135096 (=> (not res!1074608) (not e!876918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135096 (= res!1074608 (validMask!0 mask!889))))

(assert (=> start!135096 e!876918))

(assert (=> start!135096 true))

(declare-fun array_inv!39602 (array!105009) Bool)

(assert (=> start!135096 (array_inv!39602 _keys!600)))

(declare-fun b!1572612 () Bool)

(declare-fun res!1074606 () Bool)

(assert (=> b!1572612 (=> (not res!1074606) (not e!876918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1572612 (= res!1074606 (validKeyInArray!0 k0!754))))

(declare-fun b!1572613 () Bool)

(assert (=> b!1572613 (= e!876918 e!876919)))

(declare-fun res!1074607 () Bool)

(assert (=> b!1572613 (=> (not res!1074607) (not e!876919))))

(get-info :version)

(assert (=> b!1572613 (= res!1074607 (and (not (undefined!14426 lt!673902)) ((_ is Intermediate!13614) lt!673902) (not (= (select (arr!50666 _keys!600) (index!56856 lt!673902)) k0!754)) (not (= (select (arr!50666 _keys!600) (index!56856 lt!673902)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!50666 _keys!600) (index!56856 lt!673902)) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge (index!56856 lt!673902) #b00000000000000000000000000000000) (bvslt (index!56856 lt!673902) (bvadd #b00000000000000000000000000000001 mask!889))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105009 (_ BitVec 32)) SeekEntryResult!13614)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1572613 (= lt!673902 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(assert (= (and start!135096 res!1074608) b!1572611))

(assert (= (and b!1572611 res!1074609) b!1572612))

(assert (= (and b!1572612 res!1074606) b!1572613))

(assert (= (and b!1572613 res!1074607) b!1572614))

(declare-fun m!1445673 () Bool)

(assert (=> b!1572614 m!1445673))

(declare-fun m!1445675 () Bool)

(assert (=> start!135096 m!1445675))

(declare-fun m!1445677 () Bool)

(assert (=> start!135096 m!1445677))

(declare-fun m!1445679 () Bool)

(assert (=> b!1572612 m!1445679))

(declare-fun m!1445681 () Bool)

(assert (=> b!1572613 m!1445681))

(declare-fun m!1445683 () Bool)

(assert (=> b!1572613 m!1445683))

(assert (=> b!1572613 m!1445683))

(declare-fun m!1445685 () Bool)

(assert (=> b!1572613 m!1445685))

(check-sat (not b!1572614) (not b!1572613) (not b!1572612) (not start!135096))
(check-sat)
