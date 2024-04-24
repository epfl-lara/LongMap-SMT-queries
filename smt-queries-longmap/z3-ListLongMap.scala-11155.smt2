; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130674 () Bool)

(assert start!130674)

(declare-fun b!1532112 () Bool)

(declare-fun res!1048341 () Bool)

(declare-fun e!853911 () Bool)

(assert (=> b!1532112 (=> (not res!1048341) (not e!853911))))

(declare-datatypes ((SeekEntryResult!13157 0))(
  ( (MissingZero!13157 (index!55023 (_ BitVec 32))) (Found!13157 (index!55024 (_ BitVec 32))) (Intermediate!13157 (undefined!13969 Bool) (index!55025 (_ BitVec 32)) (x!136915 (_ BitVec 32))) (Undefined!13157) (MissingVacant!13157 (index!55026 (_ BitVec 32))) )
))
(declare-fun lt!663436 () SeekEntryResult!13157)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-datatypes ((array!101761 0))(
  ( (array!101762 (arr!49099 (Array (_ BitVec 32) (_ BitVec 64))) (size!49650 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101761)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101761 (_ BitVec 32)) SeekEntryResult!13157)

(assert (=> b!1532112 (= res!1048341 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49099 a!2804) j!70) a!2804 mask!2512) lt!663436))))

(declare-fun b!1532113 () Bool)

(declare-fun e!853912 () Bool)

(assert (=> b!1532113 (= e!853912 true)))

(declare-fun lt!663437 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532113 (= lt!663437 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun res!1048339 () Bool)

(declare-fun e!853908 () Bool)

(assert (=> start!130674 (=> (not res!1048339) (not e!853908))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130674 (= res!1048339 (validMask!0 mask!2512))))

(assert (=> start!130674 e!853908))

(assert (=> start!130674 true))

(declare-fun array_inv!38380 (array!101761) Bool)

(assert (=> start!130674 (array_inv!38380 a!2804)))

(declare-fun b!1532114 () Bool)

(declare-fun res!1048334 () Bool)

(assert (=> b!1532114 (=> (not res!1048334) (not e!853908))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101761 (_ BitVec 32)) Bool)

(assert (=> b!1532114 (= res!1048334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1532115 () Bool)

(declare-fun res!1048335 () Bool)

(assert (=> b!1532115 (=> (not res!1048335) (not e!853908))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1532115 (= res!1048335 (and (= (size!49650 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49650 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49650 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1532116 () Bool)

(declare-fun res!1048337 () Bool)

(assert (=> b!1532116 (=> (not res!1048337) (not e!853911))))

(declare-fun lt!663438 () SeekEntryResult!13157)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1532116 (= res!1048337 (= lt!663438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49099 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49099 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101762 (store (arr!49099 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49650 a!2804)) mask!2512)))))

(declare-fun b!1532117 () Bool)

(assert (=> b!1532117 (= e!853908 e!853911)))

(declare-fun res!1048333 () Bool)

(assert (=> b!1532117 (=> (not res!1048333) (not e!853911))))

(assert (=> b!1532117 (= res!1048333 (= lt!663438 lt!663436))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1532117 (= lt!663436 (Intermediate!13157 false resIndex!21 resX!21))))

(assert (=> b!1532117 (= lt!663438 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49099 a!2804) j!70) mask!2512) (select (arr!49099 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1532118 () Bool)

(declare-fun res!1048338 () Bool)

(assert (=> b!1532118 (=> (not res!1048338) (not e!853908))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1532118 (= res!1048338 (validKeyInArray!0 (select (arr!49099 a!2804) j!70)))))

(declare-fun b!1532119 () Bool)

(declare-fun res!1048336 () Bool)

(assert (=> b!1532119 (=> (not res!1048336) (not e!853908))))

(declare-datatypes ((List!35569 0))(
  ( (Nil!35566) (Cons!35565 (h!37019 (_ BitVec 64)) (t!50255 List!35569)) )
))
(declare-fun arrayNoDuplicates!0 (array!101761 (_ BitVec 32) List!35569) Bool)

(assert (=> b!1532119 (= res!1048336 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35566))))

(declare-fun b!1532120 () Bool)

(assert (=> b!1532120 (= e!853911 (not e!853912))))

(declare-fun res!1048342 () Bool)

(assert (=> b!1532120 (=> res!1048342 e!853912)))

(assert (=> b!1532120 (= res!1048342 (or (not (= (select (arr!49099 a!2804) j!70) (select (store (arr!49099 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!853909 () Bool)

(assert (=> b!1532120 e!853909))

(declare-fun res!1048344 () Bool)

(assert (=> b!1532120 (=> (not res!1048344) (not e!853909))))

(assert (=> b!1532120 (= res!1048344 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51133 0))(
  ( (Unit!51134) )
))
(declare-fun lt!663435 () Unit!51133)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51133)

(assert (=> b!1532120 (= lt!663435 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1532121 () Bool)

(declare-fun res!1048340 () Bool)

(assert (=> b!1532121 (=> (not res!1048340) (not e!853908))))

(assert (=> b!1532121 (= res!1048340 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49650 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49650 a!2804))))))

(declare-fun b!1532122 () Bool)

(declare-fun res!1048343 () Bool)

(assert (=> b!1532122 (=> (not res!1048343) (not e!853908))))

(assert (=> b!1532122 (= res!1048343 (validKeyInArray!0 (select (arr!49099 a!2804) i!961)))))

(declare-fun b!1532123 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101761 (_ BitVec 32)) SeekEntryResult!13157)

(assert (=> b!1532123 (= e!853909 (= (seekEntry!0 (select (arr!49099 a!2804) j!70) a!2804 mask!2512) (Found!13157 j!70)))))

(assert (= (and start!130674 res!1048339) b!1532115))

(assert (= (and b!1532115 res!1048335) b!1532122))

(assert (= (and b!1532122 res!1048343) b!1532118))

(assert (= (and b!1532118 res!1048338) b!1532114))

(assert (= (and b!1532114 res!1048334) b!1532119))

(assert (= (and b!1532119 res!1048336) b!1532121))

(assert (= (and b!1532121 res!1048340) b!1532117))

(assert (= (and b!1532117 res!1048333) b!1532112))

(assert (= (and b!1532112 res!1048341) b!1532116))

(assert (= (and b!1532116 res!1048337) b!1532120))

(assert (= (and b!1532120 res!1048344) b!1532123))

(assert (= (and b!1532120 (not res!1048342)) b!1532113))

(declare-fun m!1414927 () Bool)

(assert (=> b!1532122 m!1414927))

(assert (=> b!1532122 m!1414927))

(declare-fun m!1414929 () Bool)

(assert (=> b!1532122 m!1414929))

(declare-fun m!1414931 () Bool)

(assert (=> start!130674 m!1414931))

(declare-fun m!1414933 () Bool)

(assert (=> start!130674 m!1414933))

(declare-fun m!1414935 () Bool)

(assert (=> b!1532113 m!1414935))

(declare-fun m!1414937 () Bool)

(assert (=> b!1532117 m!1414937))

(assert (=> b!1532117 m!1414937))

(declare-fun m!1414939 () Bool)

(assert (=> b!1532117 m!1414939))

(assert (=> b!1532117 m!1414939))

(assert (=> b!1532117 m!1414937))

(declare-fun m!1414941 () Bool)

(assert (=> b!1532117 m!1414941))

(declare-fun m!1414943 () Bool)

(assert (=> b!1532114 m!1414943))

(assert (=> b!1532123 m!1414937))

(assert (=> b!1532123 m!1414937))

(declare-fun m!1414945 () Bool)

(assert (=> b!1532123 m!1414945))

(declare-fun m!1414947 () Bool)

(assert (=> b!1532119 m!1414947))

(assert (=> b!1532118 m!1414937))

(assert (=> b!1532118 m!1414937))

(declare-fun m!1414949 () Bool)

(assert (=> b!1532118 m!1414949))

(declare-fun m!1414951 () Bool)

(assert (=> b!1532116 m!1414951))

(declare-fun m!1414953 () Bool)

(assert (=> b!1532116 m!1414953))

(assert (=> b!1532116 m!1414953))

(declare-fun m!1414955 () Bool)

(assert (=> b!1532116 m!1414955))

(assert (=> b!1532116 m!1414955))

(assert (=> b!1532116 m!1414953))

(declare-fun m!1414957 () Bool)

(assert (=> b!1532116 m!1414957))

(assert (=> b!1532112 m!1414937))

(assert (=> b!1532112 m!1414937))

(declare-fun m!1414959 () Bool)

(assert (=> b!1532112 m!1414959))

(assert (=> b!1532120 m!1414937))

(declare-fun m!1414961 () Bool)

(assert (=> b!1532120 m!1414961))

(assert (=> b!1532120 m!1414951))

(assert (=> b!1532120 m!1414953))

(declare-fun m!1414963 () Bool)

(assert (=> b!1532120 m!1414963))

(check-sat (not b!1532118) (not b!1532112) (not b!1532117) (not b!1532123) (not b!1532114) (not b!1532113) (not b!1532116) (not b!1532119) (not b!1532122) (not start!130674) (not b!1532120))
(check-sat)
