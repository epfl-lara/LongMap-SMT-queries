; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130476 () Bool)

(assert start!130476)

(declare-fun res!1045710 () Bool)

(declare-fun e!852463 () Bool)

(assert (=> start!130476 (=> (not res!1045710) (not e!852463))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130476 (= res!1045710 (validMask!0 mask!2512))))

(assert (=> start!130476 e!852463))

(assert (=> start!130476 true))

(declare-datatypes ((array!101626 0))(
  ( (array!101627 (arr!49033 (Array (_ BitVec 32) (_ BitVec 64))) (size!49584 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101626)

(declare-fun array_inv!38314 (array!101626) Bool)

(assert (=> start!130476 (array_inv!38314 a!2804)))

(declare-fun lt!662103 () array!101626)

(declare-fun b!1529152 () Bool)

(declare-fun e!852461 () Bool)

(declare-fun x!534 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!662100 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!13091 0))(
  ( (MissingZero!13091 (index!54759 (_ BitVec 32))) (Found!13091 (index!54760 (_ BitVec 32))) (Intermediate!13091 (undefined!13903 Bool) (index!54761 (_ BitVec 32)) (x!136664 (_ BitVec 32))) (Undefined!13091) (MissingVacant!13091 (index!54762 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101626 (_ BitVec 32)) SeekEntryResult!13091)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101626 (_ BitVec 32)) SeekEntryResult!13091)

(assert (=> b!1529152 (= e!852461 (= (seekEntryOrOpen!0 lt!662100 lt!662103 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!662100 lt!662103 mask!2512)))))

(declare-fun b!1529153 () Bool)

(declare-fun res!1045704 () Bool)

(assert (=> b!1529153 (=> (not res!1045704) (not e!852463))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1529153 (= res!1045704 (and (= (size!49584 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49584 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49584 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1529154 () Bool)

(declare-fun res!1045706 () Bool)

(declare-fun e!852465 () Bool)

(assert (=> b!1529154 (=> (not res!1045706) (not e!852465))))

(declare-fun lt!662101 () SeekEntryResult!13091)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101626 (_ BitVec 32)) SeekEntryResult!13091)

(assert (=> b!1529154 (= res!1045706 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49033 a!2804) j!70) a!2804 mask!2512) lt!662101))))

(declare-fun b!1529155 () Bool)

(declare-fun res!1045713 () Bool)

(assert (=> b!1529155 (=> (not res!1045713) (not e!852463))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1529155 (= res!1045713 (validKeyInArray!0 (select (arr!49033 a!2804) i!961)))))

(declare-fun b!1529156 () Bool)

(declare-fun e!852460 () Bool)

(assert (=> b!1529156 (= e!852460 (not true))))

(declare-fun e!852466 () Bool)

(assert (=> b!1529156 e!852466))

(declare-fun res!1045701 () Bool)

(assert (=> b!1529156 (=> (not res!1045701) (not e!852466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101626 (_ BitVec 32)) Bool)

(assert (=> b!1529156 (= res!1045701 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51001 0))(
  ( (Unit!51002) )
))
(declare-fun lt!662102 () Unit!51001)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51001)

(assert (=> b!1529156 (= lt!662102 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1529157 () Bool)

(declare-fun res!1045707 () Bool)

(assert (=> b!1529157 (=> (not res!1045707) (not e!852463))))

(declare-datatypes ((List!35503 0))(
  ( (Nil!35500) (Cons!35499 (h!36950 (_ BitVec 64)) (t!50189 List!35503)) )
))
(declare-fun arrayNoDuplicates!0 (array!101626 (_ BitVec 32) List!35503) Bool)

(assert (=> b!1529157 (= res!1045707 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35500))))

(declare-fun b!1529158 () Bool)

(declare-fun res!1045705 () Bool)

(assert (=> b!1529158 (=> (not res!1045705) (not e!852463))))

(assert (=> b!1529158 (= res!1045705 (validKeyInArray!0 (select (arr!49033 a!2804) j!70)))))

(declare-fun b!1529159 () Bool)

(declare-fun e!852462 () Bool)

(assert (=> b!1529159 (= e!852462 e!852461)))

(declare-fun res!1045709 () Bool)

(assert (=> b!1529159 (=> (not res!1045709) (not e!852461))))

(assert (=> b!1529159 (= res!1045709 (= (seekEntryOrOpen!0 (select (arr!49033 a!2804) j!70) a!2804 mask!2512) (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!49033 a!2804) j!70) a!2804 mask!2512)))))

(declare-fun b!1529160 () Bool)

(assert (=> b!1529160 (= e!852466 e!852462)))

(declare-fun res!1045711 () Bool)

(assert (=> b!1529160 (=> res!1045711 e!852462)))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1529160 (= res!1045711 (or (not (= (select (arr!49033 a!2804) j!70) lt!662100)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!49033 a!2804) index!487) (select (arr!49033 a!2804) j!70)) (not (= (select (arr!49033 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1529161 () Bool)

(declare-fun res!1045708 () Bool)

(assert (=> b!1529161 (=> (not res!1045708) (not e!852466))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!101626 (_ BitVec 32)) SeekEntryResult!13091)

(assert (=> b!1529161 (= res!1045708 (= (seekEntry!0 (select (arr!49033 a!2804) j!70) a!2804 mask!2512) (Found!13091 j!70)))))

(declare-fun b!1529162 () Bool)

(assert (=> b!1529162 (= e!852465 e!852460)))

(declare-fun res!1045712 () Bool)

(assert (=> b!1529162 (=> (not res!1045712) (not e!852460))))

(declare-fun lt!662099 () SeekEntryResult!13091)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529162 (= res!1045712 (= lt!662099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!662100 mask!2512) lt!662100 lt!662103 mask!2512)))))

(assert (=> b!1529162 (= lt!662100 (select (store (arr!49033 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1529162 (= lt!662103 (array!101627 (store (arr!49033 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49584 a!2804)))))

(declare-fun b!1529163 () Bool)

(declare-fun res!1045703 () Bool)

(assert (=> b!1529163 (=> (not res!1045703) (not e!852463))))

(assert (=> b!1529163 (= res!1045703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1529164 () Bool)

(assert (=> b!1529164 (= e!852463 e!852465)))

(declare-fun res!1045702 () Bool)

(assert (=> b!1529164 (=> (not res!1045702) (not e!852465))))

(assert (=> b!1529164 (= res!1045702 (= lt!662099 lt!662101))))

(assert (=> b!1529164 (= lt!662101 (Intermediate!13091 false resIndex!21 resX!21))))

(assert (=> b!1529164 (= lt!662099 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49033 a!2804) j!70) mask!2512) (select (arr!49033 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529165 () Bool)

(declare-fun res!1045700 () Bool)

(assert (=> b!1529165 (=> (not res!1045700) (not e!852463))))

(assert (=> b!1529165 (= res!1045700 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49584 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49584 a!2804))))))

(assert (= (and start!130476 res!1045710) b!1529153))

(assert (= (and b!1529153 res!1045704) b!1529155))

(assert (= (and b!1529155 res!1045713) b!1529158))

(assert (= (and b!1529158 res!1045705) b!1529163))

(assert (= (and b!1529163 res!1045703) b!1529157))

(assert (= (and b!1529157 res!1045707) b!1529165))

(assert (= (and b!1529165 res!1045700) b!1529164))

(assert (= (and b!1529164 res!1045702) b!1529154))

(assert (= (and b!1529154 res!1045706) b!1529162))

(assert (= (and b!1529162 res!1045712) b!1529156))

(assert (= (and b!1529156 res!1045701) b!1529161))

(assert (= (and b!1529161 res!1045708) b!1529160))

(assert (= (and b!1529160 (not res!1045711)) b!1529159))

(assert (= (and b!1529159 res!1045709) b!1529152))

(declare-fun m!1411843 () Bool)

(assert (=> b!1529157 m!1411843))

(declare-fun m!1411845 () Bool)

(assert (=> b!1529164 m!1411845))

(assert (=> b!1529164 m!1411845))

(declare-fun m!1411847 () Bool)

(assert (=> b!1529164 m!1411847))

(assert (=> b!1529164 m!1411847))

(assert (=> b!1529164 m!1411845))

(declare-fun m!1411849 () Bool)

(assert (=> b!1529164 m!1411849))

(assert (=> b!1529158 m!1411845))

(assert (=> b!1529158 m!1411845))

(declare-fun m!1411851 () Bool)

(assert (=> b!1529158 m!1411851))

(declare-fun m!1411853 () Bool)

(assert (=> b!1529155 m!1411853))

(assert (=> b!1529155 m!1411853))

(declare-fun m!1411855 () Bool)

(assert (=> b!1529155 m!1411855))

(declare-fun m!1411857 () Bool)

(assert (=> b!1529156 m!1411857))

(declare-fun m!1411859 () Bool)

(assert (=> b!1529156 m!1411859))

(assert (=> b!1529160 m!1411845))

(declare-fun m!1411861 () Bool)

(assert (=> b!1529160 m!1411861))

(assert (=> b!1529161 m!1411845))

(assert (=> b!1529161 m!1411845))

(declare-fun m!1411863 () Bool)

(assert (=> b!1529161 m!1411863))

(declare-fun m!1411865 () Bool)

(assert (=> b!1529163 m!1411865))

(declare-fun m!1411867 () Bool)

(assert (=> b!1529152 m!1411867))

(declare-fun m!1411869 () Bool)

(assert (=> b!1529152 m!1411869))

(declare-fun m!1411871 () Bool)

(assert (=> start!130476 m!1411871))

(declare-fun m!1411873 () Bool)

(assert (=> start!130476 m!1411873))

(assert (=> b!1529159 m!1411845))

(assert (=> b!1529159 m!1411845))

(declare-fun m!1411875 () Bool)

(assert (=> b!1529159 m!1411875))

(assert (=> b!1529159 m!1411845))

(declare-fun m!1411877 () Bool)

(assert (=> b!1529159 m!1411877))

(declare-fun m!1411879 () Bool)

(assert (=> b!1529162 m!1411879))

(assert (=> b!1529162 m!1411879))

(declare-fun m!1411881 () Bool)

(assert (=> b!1529162 m!1411881))

(declare-fun m!1411883 () Bool)

(assert (=> b!1529162 m!1411883))

(declare-fun m!1411885 () Bool)

(assert (=> b!1529162 m!1411885))

(assert (=> b!1529154 m!1411845))

(assert (=> b!1529154 m!1411845))

(declare-fun m!1411887 () Bool)

(assert (=> b!1529154 m!1411887))

(check-sat (not b!1529155) (not start!130476) (not b!1529162) (not b!1529154) (not b!1529161) (not b!1529164) (not b!1529159) (not b!1529156) (not b!1529158) (not b!1529152) (not b!1529163) (not b!1529157))
(check-sat)
