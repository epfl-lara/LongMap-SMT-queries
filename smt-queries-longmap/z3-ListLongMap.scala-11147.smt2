; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!130246 () Bool)

(assert start!130246)

(declare-fun b!1528992 () Bool)

(declare-fun res!1046700 () Bool)

(declare-fun e!852146 () Bool)

(assert (=> b!1528992 (=> (not res!1046700) (not e!852146))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101596 0))(
  ( (array!101597 (arr!49023 (Array (_ BitVec 32) (_ BitVec 64))) (size!49573 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101596)

(assert (=> b!1528992 (= res!1046700 (and (= (size!49573 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49573 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49573 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1528993 () Bool)

(declare-fun res!1046706 () Bool)

(assert (=> b!1528993 (=> (not res!1046706) (not e!852146))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1528993 (= res!1046706 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49573 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49573 a!2804))))))

(declare-fun b!1528994 () Bool)

(declare-fun e!852145 () Bool)

(declare-fun e!852147 () Bool)

(assert (=> b!1528994 (= e!852145 (not e!852147))))

(declare-fun res!1046709 () Bool)

(assert (=> b!1528994 (=> res!1046709 e!852147)))

(assert (=> b!1528994 (= res!1046709 (or (not (= (select (arr!49023 a!2804) j!70) (select (store (arr!49023 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21)))))

(declare-fun e!852144 () Bool)

(assert (=> b!1528994 e!852144))

(declare-fun res!1046701 () Bool)

(assert (=> b!1528994 (=> (not res!1046701) (not e!852144))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101596 (_ BitVec 32)) Bool)

(assert (=> b!1528994 (= res!1046701 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!51160 0))(
  ( (Unit!51161) )
))
(declare-fun lt!662284 () Unit!51160)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101596 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!51160)

(assert (=> b!1528994 (= lt!662284 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1528995 () Bool)

(declare-fun res!1046704 () Bool)

(assert (=> b!1528995 (=> (not res!1046704) (not e!852146))))

(assert (=> b!1528995 (= res!1046704 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1528996 () Bool)

(declare-datatypes ((SeekEntryResult!13188 0))(
  ( (MissingZero!13188 (index!55147 (_ BitVec 32))) (Found!13188 (index!55148 (_ BitVec 32))) (Intermediate!13188 (undefined!14000 Bool) (index!55149 (_ BitVec 32)) (x!136835 (_ BitVec 32))) (Undefined!13188) (MissingVacant!13188 (index!55150 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101596 (_ BitVec 32)) SeekEntryResult!13188)

(assert (=> b!1528996 (= e!852144 (= (seekEntry!0 (select (arr!49023 a!2804) j!70) a!2804 mask!2512) (Found!13188 j!70)))))

(declare-fun b!1528997 () Bool)

(declare-fun res!1046703 () Bool)

(assert (=> b!1528997 (=> (not res!1046703) (not e!852146))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1528997 (= res!1046703 (validKeyInArray!0 (select (arr!49023 a!2804) i!961)))))

(declare-fun b!1528998 () Bool)

(declare-fun res!1046710 () Bool)

(assert (=> b!1528998 (=> (not res!1046710) (not e!852146))))

(assert (=> b!1528998 (= res!1046710 (validKeyInArray!0 (select (arr!49023 a!2804) j!70)))))

(declare-fun res!1046707 () Bool)

(assert (=> start!130246 (=> (not res!1046707) (not e!852146))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!130246 (= res!1046707 (validMask!0 mask!2512))))

(assert (=> start!130246 e!852146))

(assert (=> start!130246 true))

(declare-fun array_inv!38051 (array!101596) Bool)

(assert (=> start!130246 (array_inv!38051 a!2804)))

(declare-fun b!1528999 () Bool)

(declare-fun res!1046702 () Bool)

(assert (=> b!1528999 (=> (not res!1046702) (not e!852145))))

(declare-fun lt!662287 () SeekEntryResult!13188)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101596 (_ BitVec 32)) SeekEntryResult!13188)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1528999 (= res!1046702 (= lt!662287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!49023 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!49023 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101597 (store (arr!49023 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49573 a!2804)) mask!2512)))))

(declare-fun b!1529000 () Bool)

(assert (=> b!1529000 (= e!852147 true)))

(declare-fun lt!662286 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1529000 (= lt!662286 (nextIndex!0 index!487 x!534 mask!2512))))

(declare-fun b!1529001 () Bool)

(declare-fun res!1046705 () Bool)

(assert (=> b!1529001 (=> (not res!1046705) (not e!852145))))

(declare-fun lt!662285 () SeekEntryResult!13188)

(assert (=> b!1529001 (= res!1046705 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!49023 a!2804) j!70) a!2804 mask!2512) lt!662285))))

(declare-fun b!1529002 () Bool)

(assert (=> b!1529002 (= e!852146 e!852145)))

(declare-fun res!1046699 () Bool)

(assert (=> b!1529002 (=> (not res!1046699) (not e!852145))))

(assert (=> b!1529002 (= res!1046699 (= lt!662287 lt!662285))))

(assert (=> b!1529002 (= lt!662285 (Intermediate!13188 false resIndex!21 resX!21))))

(assert (=> b!1529002 (= lt!662287 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!49023 a!2804) j!70) mask!2512) (select (arr!49023 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1529003 () Bool)

(declare-fun res!1046708 () Bool)

(assert (=> b!1529003 (=> (not res!1046708) (not e!852146))))

(declare-datatypes ((List!35506 0))(
  ( (Nil!35503) (Cons!35502 (h!36938 (_ BitVec 64)) (t!50200 List!35506)) )
))
(declare-fun arrayNoDuplicates!0 (array!101596 (_ BitVec 32) List!35506) Bool)

(assert (=> b!1529003 (= res!1046708 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35503))))

(assert (= (and start!130246 res!1046707) b!1528992))

(assert (= (and b!1528992 res!1046700) b!1528997))

(assert (= (and b!1528997 res!1046703) b!1528998))

(assert (= (and b!1528998 res!1046710) b!1528995))

(assert (= (and b!1528995 res!1046704) b!1529003))

(assert (= (and b!1529003 res!1046708) b!1528993))

(assert (= (and b!1528993 res!1046706) b!1529002))

(assert (= (and b!1529002 res!1046699) b!1529001))

(assert (= (and b!1529001 res!1046705) b!1528999))

(assert (= (and b!1528999 res!1046702) b!1528994))

(assert (= (and b!1528994 res!1046701) b!1528996))

(assert (= (and b!1528994 (not res!1046709)) b!1529000))

(declare-fun m!1411913 () Bool)

(assert (=> start!130246 m!1411913))

(declare-fun m!1411915 () Bool)

(assert (=> start!130246 m!1411915))

(declare-fun m!1411917 () Bool)

(assert (=> b!1528997 m!1411917))

(assert (=> b!1528997 m!1411917))

(declare-fun m!1411919 () Bool)

(assert (=> b!1528997 m!1411919))

(declare-fun m!1411921 () Bool)

(assert (=> b!1528994 m!1411921))

(declare-fun m!1411923 () Bool)

(assert (=> b!1528994 m!1411923))

(declare-fun m!1411925 () Bool)

(assert (=> b!1528994 m!1411925))

(declare-fun m!1411927 () Bool)

(assert (=> b!1528994 m!1411927))

(declare-fun m!1411929 () Bool)

(assert (=> b!1528994 m!1411929))

(declare-fun m!1411931 () Bool)

(assert (=> b!1529000 m!1411931))

(assert (=> b!1528998 m!1411921))

(assert (=> b!1528998 m!1411921))

(declare-fun m!1411933 () Bool)

(assert (=> b!1528998 m!1411933))

(assert (=> b!1529002 m!1411921))

(assert (=> b!1529002 m!1411921))

(declare-fun m!1411935 () Bool)

(assert (=> b!1529002 m!1411935))

(assert (=> b!1529002 m!1411935))

(assert (=> b!1529002 m!1411921))

(declare-fun m!1411937 () Bool)

(assert (=> b!1529002 m!1411937))

(declare-fun m!1411939 () Bool)

(assert (=> b!1529003 m!1411939))

(assert (=> b!1529001 m!1411921))

(assert (=> b!1529001 m!1411921))

(declare-fun m!1411941 () Bool)

(assert (=> b!1529001 m!1411941))

(assert (=> b!1528996 m!1411921))

(assert (=> b!1528996 m!1411921))

(declare-fun m!1411943 () Bool)

(assert (=> b!1528996 m!1411943))

(assert (=> b!1528999 m!1411925))

(assert (=> b!1528999 m!1411927))

(assert (=> b!1528999 m!1411927))

(declare-fun m!1411945 () Bool)

(assert (=> b!1528999 m!1411945))

(assert (=> b!1528999 m!1411945))

(assert (=> b!1528999 m!1411927))

(declare-fun m!1411947 () Bool)

(assert (=> b!1528999 m!1411947))

(declare-fun m!1411949 () Bool)

(assert (=> b!1528995 m!1411949))

(check-sat (not b!1529003) (not b!1529002) (not start!130246) (not b!1528997) (not b!1528994) (not b!1528998) (not b!1528995) (not b!1528999) (not b!1529001) (not b!1528996) (not b!1529000))
(check-sat)
