; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129964 () Bool)

(assert start!129964)

(declare-fun b!1525094 () Bool)

(declare-fun res!1043466 () Bool)

(declare-fun e!850131 () Bool)

(assert (=> b!1525094 (=> (not res!1043466) (not e!850131))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101440 0))(
  ( (array!101441 (arr!48948 (Array (_ BitVec 32) (_ BitVec 64))) (size!49498 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101440)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!13113 0))(
  ( (MissingZero!13113 (index!54847 (_ BitVec 32))) (Found!13113 (index!54848 (_ BitVec 32))) (Intermediate!13113 (undefined!13925 Bool) (index!54849 (_ BitVec 32)) (x!136542 (_ BitVec 32))) (Undefined!13113) (MissingVacant!13113 (index!54850 (_ BitVec 32))) )
))
(declare-fun lt!660557 () SeekEntryResult!13113)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101440 (_ BitVec 32)) SeekEntryResult!13113)

(assert (=> b!1525094 (= res!1043466 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48948 a!2804) j!70) a!2804 mask!2512) lt!660557))))

(declare-fun b!1525095 () Bool)

(declare-fun e!850132 () Bool)

(assert (=> b!1525095 (= e!850132 e!850131)))

(declare-fun res!1043457 () Bool)

(assert (=> b!1525095 (=> (not res!1043457) (not e!850131))))

(declare-fun lt!660558 () SeekEntryResult!13113)

(assert (=> b!1525095 (= res!1043457 (= lt!660558 lt!660557))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1525095 (= lt!660557 (Intermediate!13113 false resIndex!21 resX!21))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1525095 (= lt!660558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48948 a!2804) j!70) mask!2512) (select (arr!48948 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1525096 () Bool)

(assert (=> b!1525096 (= e!850131 (not true))))

(declare-fun e!850135 () Bool)

(assert (=> b!1525096 e!850135))

(declare-fun res!1043465 () Bool)

(assert (=> b!1525096 (=> (not res!1043465) (not e!850135))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101440 (_ BitVec 32)) Bool)

(assert (=> b!1525096 (= res!1043465 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51010 0))(
  ( (Unit!51011) )
))
(declare-fun lt!660559 () Unit!51010)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101440 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51010)

(assert (=> b!1525096 (= lt!660559 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1525097 () Bool)

(declare-fun res!1043462 () Bool)

(assert (=> b!1525097 (=> (not res!1043462) (not e!850132))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1525097 (= res!1043462 (validKeyInArray!0 (select (arr!48948 a!2804) i!961)))))

(declare-fun b!1525098 () Bool)

(declare-fun e!850133 () Bool)

(assert (=> b!1525098 (= e!850135 e!850133)))

(declare-fun res!1043456 () Bool)

(assert (=> b!1525098 (=> res!1043456 e!850133)))

(assert (=> b!1525098 (= res!1043456 (or (not (= (select (arr!48948 a!2804) j!70) (select (store (arr!48948 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48948 a!2804) index!487) (select (arr!48948 a!2804) j!70)) (not (= (select (arr!48948 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1525099 () Bool)

(declare-fun res!1043455 () Bool)

(assert (=> b!1525099 (=> (not res!1043455) (not e!850132))))

(assert (=> b!1525099 (= res!1043455 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49498 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49498 a!2804))))))

(declare-fun b!1525100 () Bool)

(declare-fun res!1043458 () Bool)

(assert (=> b!1525100 (=> (not res!1043458) (not e!850132))))

(declare-datatypes ((List!35431 0))(
  ( (Nil!35428) (Cons!35427 (h!36857 (_ BitVec 64)) (t!50125 List!35431)) )
))
(declare-fun arrayNoDuplicates!0 (array!101440 (_ BitVec 32) List!35431) Bool)

(assert (=> b!1525100 (= res!1043458 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35428))))

(declare-fun b!1525101 () Bool)

(declare-fun res!1043464 () Bool)

(assert (=> b!1525101 (=> (not res!1043464) (not e!850132))))

(assert (=> b!1525101 (= res!1043464 (and (= (size!49498 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49498 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49498 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1525102 () Bool)

(declare-fun res!1043461 () Bool)

(assert (=> b!1525102 (=> (not res!1043461) (not e!850132))))

(assert (=> b!1525102 (= res!1043461 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1525103 () Bool)

(declare-fun res!1043467 () Bool)

(assert (=> b!1525103 (=> (not res!1043467) (not e!850135))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101440 (_ BitVec 32)) SeekEntryResult!13113)

(assert (=> b!1525103 (= res!1043467 (= (seekEntry!0 (select (arr!48948 a!2804) j!70) a!2804 mask!2512) (Found!13113 j!70)))))

(declare-fun res!1043460 () Bool)

(assert (=> start!129964 (=> (not res!1043460) (not e!850132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129964 (= res!1043460 (validMask!0 mask!2512))))

(assert (=> start!129964 e!850132))

(assert (=> start!129964 true))

(declare-fun array_inv!37976 (array!101440) Bool)

(assert (=> start!129964 (array_inv!37976 a!2804)))

(declare-fun b!1525104 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101440 (_ BitVec 32)) SeekEntryResult!13113)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101440 (_ BitVec 32)) SeekEntryResult!13113)

(assert (=> b!1525104 (= e!850133 (= (seekEntryOrOpen!0 (select (arr!48948 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48948 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1525105 () Bool)

(declare-fun res!1043463 () Bool)

(assert (=> b!1525105 (=> (not res!1043463) (not e!850132))))

(assert (=> b!1525105 (= res!1043463 (validKeyInArray!0 (select (arr!48948 a!2804) j!70)))))

(declare-fun b!1525106 () Bool)

(declare-fun res!1043459 () Bool)

(assert (=> b!1525106 (=> (not res!1043459) (not e!850131))))

(assert (=> b!1525106 (= res!1043459 (= lt!660558 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48948 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48948 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101441 (store (arr!48948 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49498 a!2804)) mask!2512)))))

(assert (= (and start!129964 res!1043460) b!1525101))

(assert (= (and b!1525101 res!1043464) b!1525097))

(assert (= (and b!1525097 res!1043462) b!1525105))

(assert (= (and b!1525105 res!1043463) b!1525102))

(assert (= (and b!1525102 res!1043461) b!1525100))

(assert (= (and b!1525100 res!1043458) b!1525099))

(assert (= (and b!1525099 res!1043455) b!1525095))

(assert (= (and b!1525095 res!1043457) b!1525094))

(assert (= (and b!1525094 res!1043466) b!1525106))

(assert (= (and b!1525106 res!1043459) b!1525096))

(assert (= (and b!1525096 res!1043465) b!1525103))

(assert (= (and b!1525103 res!1043467) b!1525098))

(assert (= (and b!1525098 (not res!1043456)) b!1525104))

(declare-fun m!1407981 () Bool)

(assert (=> b!1525102 m!1407981))

(declare-fun m!1407983 () Bool)

(assert (=> b!1525097 m!1407983))

(assert (=> b!1525097 m!1407983))

(declare-fun m!1407985 () Bool)

(assert (=> b!1525097 m!1407985))

(declare-fun m!1407987 () Bool)

(assert (=> b!1525094 m!1407987))

(assert (=> b!1525094 m!1407987))

(declare-fun m!1407989 () Bool)

(assert (=> b!1525094 m!1407989))

(declare-fun m!1407991 () Bool)

(assert (=> start!129964 m!1407991))

(declare-fun m!1407993 () Bool)

(assert (=> start!129964 m!1407993))

(assert (=> b!1525104 m!1407987))

(assert (=> b!1525104 m!1407987))

(declare-fun m!1407995 () Bool)

(assert (=> b!1525104 m!1407995))

(assert (=> b!1525104 m!1407987))

(declare-fun m!1407997 () Bool)

(assert (=> b!1525104 m!1407997))

(declare-fun m!1407999 () Bool)

(assert (=> b!1525096 m!1407999))

(declare-fun m!1408001 () Bool)

(assert (=> b!1525096 m!1408001))

(assert (=> b!1525105 m!1407987))

(assert (=> b!1525105 m!1407987))

(declare-fun m!1408003 () Bool)

(assert (=> b!1525105 m!1408003))

(assert (=> b!1525103 m!1407987))

(assert (=> b!1525103 m!1407987))

(declare-fun m!1408005 () Bool)

(assert (=> b!1525103 m!1408005))

(assert (=> b!1525095 m!1407987))

(assert (=> b!1525095 m!1407987))

(declare-fun m!1408007 () Bool)

(assert (=> b!1525095 m!1408007))

(assert (=> b!1525095 m!1408007))

(assert (=> b!1525095 m!1407987))

(declare-fun m!1408009 () Bool)

(assert (=> b!1525095 m!1408009))

(declare-fun m!1408011 () Bool)

(assert (=> b!1525100 m!1408011))

(declare-fun m!1408013 () Bool)

(assert (=> b!1525106 m!1408013))

(declare-fun m!1408015 () Bool)

(assert (=> b!1525106 m!1408015))

(assert (=> b!1525106 m!1408015))

(declare-fun m!1408017 () Bool)

(assert (=> b!1525106 m!1408017))

(assert (=> b!1525106 m!1408017))

(assert (=> b!1525106 m!1408015))

(declare-fun m!1408019 () Bool)

(assert (=> b!1525106 m!1408019))

(assert (=> b!1525098 m!1407987))

(assert (=> b!1525098 m!1408013))

(assert (=> b!1525098 m!1408015))

(declare-fun m!1408021 () Bool)

(assert (=> b!1525098 m!1408021))

(check-sat (not b!1525096) (not b!1525102) (not b!1525095) (not b!1525105) (not b!1525100) (not b!1525094) (not b!1525106) (not b!1525104) (not b!1525097) (not start!129964) (not b!1525103))
(check-sat)
