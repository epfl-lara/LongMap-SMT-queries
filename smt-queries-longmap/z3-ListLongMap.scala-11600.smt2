; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!135350 () Bool)

(assert start!135350)

(declare-fun res!1075104 () Bool)

(declare-fun e!877586 () Bool)

(assert (=> start!135350 (=> (not res!1075104) (not e!877586))))

(declare-fun mask!889 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!135350 (= res!1075104 (validMask!0 mask!889))))

(assert (=> start!135350 e!877586))

(assert (=> start!135350 true))

(declare-datatypes ((array!105134 0))(
  ( (array!105135 (arr!50720 (Array (_ BitVec 32) (_ BitVec 64))) (size!51270 (_ BitVec 32))) )
))
(declare-fun _keys!600 () array!105134)

(declare-fun array_inv!39447 (array!105134) Bool)

(assert (=> start!135350 (array_inv!39447 _keys!600)))

(declare-fun b!1573710 () Bool)

(declare-fun res!1075106 () Bool)

(assert (=> b!1573710 (=> (not res!1075106) (not e!877586))))

(assert (=> b!1573710 (= res!1075106 (= (size!51270 _keys!600) (bvadd #b00000000000000000000000000000001 mask!889)))))

(declare-fun b!1573713 () Bool)

(declare-fun e!877584 () Bool)

(declare-datatypes ((SeekEntryResult!13633 0))(
  ( (MissingZero!13633 (index!56930 (_ BitVec 32))) (Found!13633 (index!56931 (_ BitVec 32))) (Intermediate!13633 (undefined!14445 Bool) (index!56932 (_ BitVec 32)) (x!141744 (_ BitVec 32))) (Undefined!13633) (MissingVacant!13633 (index!56933 (_ BitVec 32))) )
))
(declare-fun lt!674551 () SeekEntryResult!13633)

(get-info :version)

(assert (=> b!1573713 (= e!877584 (and (not ((_ is MissingVacant!13633) lt!674551)) (not ((_ is Found!13633) lt!674551)) (not ((_ is MissingZero!13633) lt!674551)) (not ((_ is Undefined!13633) lt!674551))))))

(declare-fun err!154 () SeekEntryResult!13633)

(assert (=> b!1573713 (= lt!674551 err!154)))

(assert (=> b!1573713 true))

(declare-fun b!1573712 () Bool)

(assert (=> b!1573712 (= e!877586 e!877584)))

(declare-fun res!1075107 () Bool)

(assert (=> b!1573712 (=> (not res!1075107) (not e!877584))))

(declare-fun lt!674549 () Bool)

(declare-fun lt!674550 () SeekEntryResult!13633)

(assert (=> b!1573712 (= res!1075107 (and (or lt!674549 (not (undefined!14445 lt!674550))) (or lt!674549 (undefined!14445 lt!674550))))))

(assert (=> b!1573712 (= lt!674549 (not ((_ is Intermediate!13633) lt!674550)))))

(declare-fun k0!754 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!105134 (_ BitVec 32)) SeekEntryResult!13633)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573712 (= lt!674550 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573711 () Bool)

(declare-fun res!1075105 () Bool)

(assert (=> b!1573711 (=> (not res!1075105) (not e!877586))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1573711 (= res!1075105 (validKeyInArray!0 k0!754))))

(assert (= (and start!135350 res!1075104) b!1573710))

(assert (= (and b!1573710 res!1075106) b!1573711))

(assert (= (and b!1573711 res!1075105) b!1573712))

(assert (= (and b!1573712 res!1075107) b!1573713))

(declare-fun m!1447001 () Bool)

(assert (=> start!135350 m!1447001))

(declare-fun m!1447003 () Bool)

(assert (=> start!135350 m!1447003))

(declare-fun m!1447005 () Bool)

(assert (=> b!1573712 m!1447005))

(assert (=> b!1573712 m!1447005))

(declare-fun m!1447007 () Bool)

(assert (=> b!1573712 m!1447007))

(declare-fun m!1447009 () Bool)

(assert (=> b!1573711 m!1447009))

(check-sat (not b!1573711) (not start!135350) (not b!1573712))
(check-sat)
(get-model)

(declare-fun d!165069 () Bool)

(assert (=> d!165069 (= (validKeyInArray!0 k0!754) (and (not (= k0!754 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!754 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1573711 d!165069))

(declare-fun d!165073 () Bool)

(assert (=> d!165073 (= (validMask!0 mask!889) (and (or (= mask!889 #b00000000000000000000000000000111) (= mask!889 #b00000000000000000000000000001111) (= mask!889 #b00000000000000000000000000011111) (= mask!889 #b00000000000000000000000000111111) (= mask!889 #b00000000000000000000000001111111) (= mask!889 #b00000000000000000000000011111111) (= mask!889 #b00000000000000000000000111111111) (= mask!889 #b00000000000000000000001111111111) (= mask!889 #b00000000000000000000011111111111) (= mask!889 #b00000000000000000000111111111111) (= mask!889 #b00000000000000000001111111111111) (= mask!889 #b00000000000000000011111111111111) (= mask!889 #b00000000000000000111111111111111) (= mask!889 #b00000000000000001111111111111111) (= mask!889 #b00000000000000011111111111111111) (= mask!889 #b00000000000000111111111111111111) (= mask!889 #b00000000000001111111111111111111) (= mask!889 #b00000000000011111111111111111111) (= mask!889 #b00000000000111111111111111111111) (= mask!889 #b00000000001111111111111111111111) (= mask!889 #b00000000011111111111111111111111) (= mask!889 #b00000000111111111111111111111111) (= mask!889 #b00000001111111111111111111111111) (= mask!889 #b00000011111111111111111111111111) (= mask!889 #b00000111111111111111111111111111) (= mask!889 #b00001111111111111111111111111111) (= mask!889 #b00011111111111111111111111111111) (= mask!889 #b00111111111111111111111111111111)) (bvsle mask!889 #b00111111111111111111111111111111)))))

(assert (=> start!135350 d!165073))

(declare-fun d!165079 () Bool)

(assert (=> d!165079 (= (array_inv!39447 _keys!600) (bvsge (size!51270 _keys!600) #b00000000000000000000000000000000))))

(assert (=> start!135350 d!165079))

(declare-fun b!1573789 () Bool)

(declare-fun lt!674581 () SeekEntryResult!13633)

(assert (=> b!1573789 (and (bvsge (index!56932 lt!674581) #b00000000000000000000000000000000) (bvslt (index!56932 lt!674581) (size!51270 _keys!600)))))

(declare-fun res!1075144 () Bool)

(assert (=> b!1573789 (= res!1075144 (= (select (arr!50720 _keys!600) (index!56932 lt!674581)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!877634 () Bool)

(assert (=> b!1573789 (=> res!1075144 e!877634)))

(declare-fun b!1573790 () Bool)

(declare-fun e!877633 () SeekEntryResult!13633)

(assert (=> b!1573790 (= e!877633 (Intermediate!13633 false (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000))))

(declare-fun d!165081 () Bool)

(declare-fun e!877632 () Bool)

(assert (=> d!165081 e!877632))

(declare-fun c!145580 () Bool)

(assert (=> d!165081 (= c!145580 (and ((_ is Intermediate!13633) lt!674581) (undefined!14445 lt!674581)))))

(declare-fun e!877631 () SeekEntryResult!13633)

(assert (=> d!165081 (= lt!674581 e!877631)))

(declare-fun c!145579 () Bool)

(assert (=> d!165081 (= c!145579 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!674582 () (_ BitVec 64))

(assert (=> d!165081 (= lt!674582 (select (arr!50720 _keys!600) (toIndex!0 k0!754 mask!889)))))

(assert (=> d!165081 (validMask!0 mask!889)))

(assert (=> d!165081 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!754 mask!889) k0!754 _keys!600 mask!889) lt!674581)))

(declare-fun b!1573791 () Bool)

(assert (=> b!1573791 (and (bvsge (index!56932 lt!674581) #b00000000000000000000000000000000) (bvslt (index!56932 lt!674581) (size!51270 _keys!600)))))

(declare-fun res!1075142 () Bool)

(assert (=> b!1573791 (= res!1075142 (= (select (arr!50720 _keys!600) (index!56932 lt!674581)) k0!754))))

(assert (=> b!1573791 (=> res!1075142 e!877634)))

(declare-fun e!877635 () Bool)

(assert (=> b!1573791 (= e!877635 e!877634)))

(declare-fun b!1573792 () Bool)

(assert (=> b!1573792 (= e!877632 (bvsge (x!141744 lt!674581) #b01111111111111111111111111111110))))

(declare-fun b!1573793 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1573793 (= e!877633 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 k0!754 mask!889) #b00000000000000000000000000000000 mask!889) k0!754 _keys!600 mask!889))))

(declare-fun b!1573794 () Bool)

(assert (=> b!1573794 (= e!877631 e!877633)))

(declare-fun c!145581 () Bool)

(assert (=> b!1573794 (= c!145581 (or (= lt!674582 k0!754) (= (bvadd lt!674582 lt!674582) #b0000000000000000000000000000000000000000000000000000000000000000)))))

