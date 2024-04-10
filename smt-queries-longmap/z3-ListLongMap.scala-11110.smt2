; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129766 () Bool)

(assert start!129766)

(declare-fun b!1523116 () Bool)

(declare-fun e!849223 () Bool)

(assert (=> b!1523116 (= e!849223 (not true))))

(declare-fun e!849222 () Bool)

(assert (=> b!1523116 e!849222))

(declare-fun res!1042033 () Bool)

(assert (=> b!1523116 (=> (not res!1042033) (not e!849222))))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101362 0))(
  ( (array!101363 (arr!48912 (Array (_ BitVec 32) (_ BitVec 64))) (size!49462 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101362)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101362 (_ BitVec 32)) Bool)

(assert (=> b!1523116 (= res!1042033 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50938 0))(
  ( (Unit!50939) )
))
(declare-fun lt!659864 () Unit!50938)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50938)

(assert (=> b!1523116 (= lt!659864 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523117 () Bool)

(declare-fun res!1042026 () Bool)

(declare-fun e!849221 () Bool)

(assert (=> b!1523117 (=> (not res!1042026) (not e!849221))))

(assert (=> b!1523117 (= res!1042026 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523118 () Bool)

(declare-fun res!1042027 () Bool)

(assert (=> b!1523118 (=> (not res!1042027) (not e!849223))))

(declare-datatypes ((SeekEntryResult!13077 0))(
  ( (MissingZero!13077 (index!54703 (_ BitVec 32))) (Found!13077 (index!54704 (_ BitVec 32))) (Intermediate!13077 (undefined!13889 Bool) (index!54705 (_ BitVec 32)) (x!136395 (_ BitVec 32))) (Undefined!13077) (MissingVacant!13077 (index!54706 (_ BitVec 32))) )
))
(declare-fun lt!659866 () SeekEntryResult!13077)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101362 (_ BitVec 32)) SeekEntryResult!13077)

(assert (=> b!1523118 (= res!1042027 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48912 a!2804) j!70) a!2804 mask!2512) lt!659866))))

(declare-fun b!1523119 () Bool)

(declare-fun res!1042025 () Bool)

(assert (=> b!1523119 (=> (not res!1042025) (not e!849221))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523119 (= res!1042025 (validKeyInArray!0 (select (arr!48912 a!2804) j!70)))))

(declare-fun b!1523120 () Bool)

(declare-fun res!1042032 () Bool)

(assert (=> b!1523120 (=> (not res!1042032) (not e!849223))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!659865 () SeekEntryResult!13077)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523120 (= res!1042032 (= lt!659865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48912 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48912 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101363 (store (arr!48912 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49462 a!2804)) mask!2512)))))

(declare-fun b!1523121 () Bool)

(declare-fun res!1042024 () Bool)

(assert (=> b!1523121 (=> (not res!1042024) (not e!849221))))

(assert (=> b!1523121 (= res!1042024 (validKeyInArray!0 (select (arr!48912 a!2804) i!961)))))

(declare-fun res!1042030 () Bool)

(assert (=> start!129766 (=> (not res!1042030) (not e!849221))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129766 (= res!1042030 (validMask!0 mask!2512))))

(assert (=> start!129766 e!849221))

(assert (=> start!129766 true))

(declare-fun array_inv!37940 (array!101362) Bool)

(assert (=> start!129766 (array_inv!37940 a!2804)))

(declare-fun b!1523122 () Bool)

(declare-fun res!1042031 () Bool)

(assert (=> b!1523122 (=> (not res!1042031) (not e!849221))))

(declare-datatypes ((List!35395 0))(
  ( (Nil!35392) (Cons!35391 (h!36815 (_ BitVec 64)) (t!50089 List!35395)) )
))
(declare-fun arrayNoDuplicates!0 (array!101362 (_ BitVec 32) List!35395) Bool)

(assert (=> b!1523122 (= res!1042031 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35392))))

(declare-fun b!1523123 () Bool)

(assert (=> b!1523123 (= e!849221 e!849223)))

(declare-fun res!1042029 () Bool)

(assert (=> b!1523123 (=> (not res!1042029) (not e!849223))))

(assert (=> b!1523123 (= res!1042029 (= lt!659865 lt!659866))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523123 (= lt!659866 (Intermediate!13077 false resIndex!21 resX!21))))

(assert (=> b!1523123 (= lt!659865 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48912 a!2804) j!70) mask!2512) (select (arr!48912 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523124 () Bool)

(declare-fun res!1042023 () Bool)

(assert (=> b!1523124 (=> (not res!1042023) (not e!849221))))

(assert (=> b!1523124 (= res!1042023 (and (= (size!49462 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49462 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49462 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1523125 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101362 (_ BitVec 32)) SeekEntryResult!13077)

(assert (=> b!1523125 (= e!849222 (= (seekEntry!0 (select (arr!48912 a!2804) j!70) a!2804 mask!2512) (Found!13077 j!70)))))

(declare-fun b!1523126 () Bool)

(declare-fun res!1042028 () Bool)

(assert (=> b!1523126 (=> (not res!1042028) (not e!849221))))

(assert (=> b!1523126 (= res!1042028 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49462 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49462 a!2804))))))

(assert (= (and start!129766 res!1042030) b!1523124))

(assert (= (and b!1523124 res!1042023) b!1523121))

(assert (= (and b!1523121 res!1042024) b!1523119))

(assert (= (and b!1523119 res!1042025) b!1523117))

(assert (= (and b!1523117 res!1042026) b!1523122))

(assert (= (and b!1523122 res!1042031) b!1523126))

(assert (= (and b!1523126 res!1042028) b!1523123))

(assert (= (and b!1523123 res!1042029) b!1523118))

(assert (= (and b!1523118 res!1042027) b!1523120))

(assert (= (and b!1523120 res!1042032) b!1523116))

(assert (= (and b!1523116 res!1042033) b!1523125))

(declare-fun m!1406205 () Bool)

(assert (=> b!1523119 m!1406205))

(assert (=> b!1523119 m!1406205))

(declare-fun m!1406207 () Bool)

(assert (=> b!1523119 m!1406207))

(declare-fun m!1406209 () Bool)

(assert (=> b!1523121 m!1406209))

(assert (=> b!1523121 m!1406209))

(declare-fun m!1406211 () Bool)

(assert (=> b!1523121 m!1406211))

(declare-fun m!1406213 () Bool)

(assert (=> start!129766 m!1406213))

(declare-fun m!1406215 () Bool)

(assert (=> start!129766 m!1406215))

(assert (=> b!1523118 m!1406205))

(assert (=> b!1523118 m!1406205))

(declare-fun m!1406217 () Bool)

(assert (=> b!1523118 m!1406217))

(assert (=> b!1523125 m!1406205))

(assert (=> b!1523125 m!1406205))

(declare-fun m!1406219 () Bool)

(assert (=> b!1523125 m!1406219))

(declare-fun m!1406221 () Bool)

(assert (=> b!1523117 m!1406221))

(declare-fun m!1406223 () Bool)

(assert (=> b!1523116 m!1406223))

(declare-fun m!1406225 () Bool)

(assert (=> b!1523116 m!1406225))

(assert (=> b!1523123 m!1406205))

(assert (=> b!1523123 m!1406205))

(declare-fun m!1406227 () Bool)

(assert (=> b!1523123 m!1406227))

(assert (=> b!1523123 m!1406227))

(assert (=> b!1523123 m!1406205))

(declare-fun m!1406229 () Bool)

(assert (=> b!1523123 m!1406229))

(declare-fun m!1406231 () Bool)

(assert (=> b!1523120 m!1406231))

(declare-fun m!1406233 () Bool)

(assert (=> b!1523120 m!1406233))

(assert (=> b!1523120 m!1406233))

(declare-fun m!1406235 () Bool)

(assert (=> b!1523120 m!1406235))

(assert (=> b!1523120 m!1406235))

(assert (=> b!1523120 m!1406233))

(declare-fun m!1406237 () Bool)

(assert (=> b!1523120 m!1406237))

(declare-fun m!1406239 () Bool)

(assert (=> b!1523122 m!1406239))

(check-sat (not b!1523120) (not b!1523116) (not b!1523121) (not b!1523125) (not b!1523123) (not b!1523119) (not b!1523118) (not b!1523122) (not b!1523117) (not start!129766))
(check-sat)
