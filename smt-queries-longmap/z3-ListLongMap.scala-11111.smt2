; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129772 () Bool)

(assert start!129772)

(declare-fun b!1523215 () Bool)

(declare-fun e!849256 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101368 0))(
  ( (array!101369 (arr!48915 (Array (_ BitVec 32) (_ BitVec 64))) (size!49465 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101368)

(declare-datatypes ((SeekEntryResult!13080 0))(
  ( (MissingZero!13080 (index!54715 (_ BitVec 32))) (Found!13080 (index!54716 (_ BitVec 32))) (Intermediate!13080 (undefined!13892 Bool) (index!54717 (_ BitVec 32)) (x!136406 (_ BitVec 32))) (Undefined!13080) (MissingVacant!13080 (index!54718 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101368 (_ BitVec 32)) SeekEntryResult!13080)

(assert (=> b!1523215 (= e!849256 (= (seekEntry!0 (select (arr!48915 a!2804) j!70) a!2804 mask!2512) (Found!13080 j!70)))))

(declare-fun b!1523216 () Bool)

(declare-fun res!1042130 () Bool)

(declare-fun e!849257 () Bool)

(assert (=> b!1523216 (=> (not res!1042130) (not e!849257))))

(declare-datatypes ((List!35398 0))(
  ( (Nil!35395) (Cons!35394 (h!36818 (_ BitVec 64)) (t!50092 List!35398)) )
))
(declare-fun arrayNoDuplicates!0 (array!101368 (_ BitVec 32) List!35398) Bool)

(assert (=> b!1523216 (= res!1042130 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35395))))

(declare-fun b!1523217 () Bool)

(declare-fun res!1042127 () Bool)

(declare-fun e!849259 () Bool)

(assert (=> b!1523217 (=> (not res!1042127) (not e!849259))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun lt!659893 () SeekEntryResult!13080)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101368 (_ BitVec 32)) SeekEntryResult!13080)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1523217 (= res!1042127 (= lt!659893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48915 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48915 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101369 (store (arr!48915 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49465 a!2804)) mask!2512)))))

(declare-fun b!1523218 () Bool)

(assert (=> b!1523218 (= e!849257 e!849259)))

(declare-fun res!1042126 () Bool)

(assert (=> b!1523218 (=> (not res!1042126) (not e!849259))))

(declare-fun lt!659891 () SeekEntryResult!13080)

(assert (=> b!1523218 (= res!1042126 (= lt!659893 lt!659891))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1523218 (= lt!659891 (Intermediate!13080 false resIndex!21 resX!21))))

(assert (=> b!1523218 (= lt!659893 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48915 a!2804) j!70) mask!2512) (select (arr!48915 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1523219 () Bool)

(declare-fun res!1042122 () Bool)

(assert (=> b!1523219 (=> (not res!1042122) (not e!849257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101368 (_ BitVec 32)) Bool)

(assert (=> b!1523219 (= res!1042122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1523220 () Bool)

(declare-fun res!1042124 () Bool)

(assert (=> b!1523220 (=> (not res!1042124) (not e!849257))))

(assert (=> b!1523220 (= res!1042124 (and (= (size!49465 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49465 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49465 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1042125 () Bool)

(assert (=> start!129772 (=> (not res!1042125) (not e!849257))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129772 (= res!1042125 (validMask!0 mask!2512))))

(assert (=> start!129772 e!849257))

(assert (=> start!129772 true))

(declare-fun array_inv!37943 (array!101368) Bool)

(assert (=> start!129772 (array_inv!37943 a!2804)))

(declare-fun b!1523221 () Bool)

(assert (=> b!1523221 (= e!849259 (not true))))

(assert (=> b!1523221 e!849256))

(declare-fun res!1042132 () Bool)

(assert (=> b!1523221 (=> (not res!1042132) (not e!849256))))

(assert (=> b!1523221 (= res!1042132 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50944 0))(
  ( (Unit!50945) )
))
(declare-fun lt!659892 () Unit!50944)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50944)

(assert (=> b!1523221 (= lt!659892 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1523222 () Bool)

(declare-fun res!1042131 () Bool)

(assert (=> b!1523222 (=> (not res!1042131) (not e!849257))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1523222 (= res!1042131 (validKeyInArray!0 (select (arr!48915 a!2804) j!70)))))

(declare-fun b!1523223 () Bool)

(declare-fun res!1042128 () Bool)

(assert (=> b!1523223 (=> (not res!1042128) (not e!849257))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1523223 (= res!1042128 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49465 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49465 a!2804))))))

(declare-fun b!1523224 () Bool)

(declare-fun res!1042129 () Bool)

(assert (=> b!1523224 (=> (not res!1042129) (not e!849257))))

(assert (=> b!1523224 (= res!1042129 (validKeyInArray!0 (select (arr!48915 a!2804) i!961)))))

(declare-fun b!1523225 () Bool)

(declare-fun res!1042123 () Bool)

(assert (=> b!1523225 (=> (not res!1042123) (not e!849259))))

(assert (=> b!1523225 (= res!1042123 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48915 a!2804) j!70) a!2804 mask!2512) lt!659891))))

(assert (= (and start!129772 res!1042125) b!1523220))

(assert (= (and b!1523220 res!1042124) b!1523224))

(assert (= (and b!1523224 res!1042129) b!1523222))

(assert (= (and b!1523222 res!1042131) b!1523219))

(assert (= (and b!1523219 res!1042122) b!1523216))

(assert (= (and b!1523216 res!1042130) b!1523223))

(assert (= (and b!1523223 res!1042128) b!1523218))

(assert (= (and b!1523218 res!1042126) b!1523225))

(assert (= (and b!1523225 res!1042123) b!1523217))

(assert (= (and b!1523217 res!1042127) b!1523221))

(assert (= (and b!1523221 res!1042132) b!1523215))

(declare-fun m!1406313 () Bool)

(assert (=> b!1523216 m!1406313))

(declare-fun m!1406315 () Bool)

(assert (=> b!1523218 m!1406315))

(assert (=> b!1523218 m!1406315))

(declare-fun m!1406317 () Bool)

(assert (=> b!1523218 m!1406317))

(assert (=> b!1523218 m!1406317))

(assert (=> b!1523218 m!1406315))

(declare-fun m!1406319 () Bool)

(assert (=> b!1523218 m!1406319))

(assert (=> b!1523225 m!1406315))

(assert (=> b!1523225 m!1406315))

(declare-fun m!1406321 () Bool)

(assert (=> b!1523225 m!1406321))

(declare-fun m!1406323 () Bool)

(assert (=> start!129772 m!1406323))

(declare-fun m!1406325 () Bool)

(assert (=> start!129772 m!1406325))

(declare-fun m!1406327 () Bool)

(assert (=> b!1523224 m!1406327))

(assert (=> b!1523224 m!1406327))

(declare-fun m!1406329 () Bool)

(assert (=> b!1523224 m!1406329))

(assert (=> b!1523222 m!1406315))

(assert (=> b!1523222 m!1406315))

(declare-fun m!1406331 () Bool)

(assert (=> b!1523222 m!1406331))

(declare-fun m!1406333 () Bool)

(assert (=> b!1523219 m!1406333))

(declare-fun m!1406335 () Bool)

(assert (=> b!1523217 m!1406335))

(declare-fun m!1406337 () Bool)

(assert (=> b!1523217 m!1406337))

(assert (=> b!1523217 m!1406337))

(declare-fun m!1406339 () Bool)

(assert (=> b!1523217 m!1406339))

(assert (=> b!1523217 m!1406339))

(assert (=> b!1523217 m!1406337))

(declare-fun m!1406341 () Bool)

(assert (=> b!1523217 m!1406341))

(assert (=> b!1523215 m!1406315))

(assert (=> b!1523215 m!1406315))

(declare-fun m!1406343 () Bool)

(assert (=> b!1523215 m!1406343))

(declare-fun m!1406345 () Bool)

(assert (=> b!1523221 m!1406345))

(declare-fun m!1406347 () Bool)

(assert (=> b!1523221 m!1406347))

(check-sat (not b!1523218) (not b!1523216) (not b!1523222) (not b!1523225) (not b!1523215) (not b!1523224) (not b!1523219) (not b!1523221) (not start!129772) (not b!1523217))
(check-sat)
