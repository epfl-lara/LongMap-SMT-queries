; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129570 () Bool)

(assert start!129570)

(declare-fun b!1521056 () Bool)

(declare-fun e!848431 () Bool)

(assert (=> b!1521056 (= e!848431 false)))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101245 0))(
  ( (array!101246 (arr!48855 (Array (_ BitVec 32) (_ BitVec 64))) (size!49405 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101245)

(declare-datatypes ((SeekEntryResult!13020 0))(
  ( (MissingZero!13020 (index!54475 (_ BitVec 32))) (Found!13020 (index!54476 (_ BitVec 32))) (Intermediate!13020 (undefined!13832 Bool) (index!54477 (_ BitVec 32)) (x!136176 (_ BitVec 32))) (Undefined!13020) (MissingVacant!13020 (index!54478 (_ BitVec 32))) )
))
(declare-fun lt!659302 () SeekEntryResult!13020)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101245 (_ BitVec 32)) SeekEntryResult!13020)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521056 (= lt!659302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48855 a!2804) j!70) mask!2512) (select (arr!48855 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521057 () Bool)

(declare-fun res!1040283 () Bool)

(assert (=> b!1521057 (=> (not res!1040283) (not e!848431))))

(declare-datatypes ((List!35338 0))(
  ( (Nil!35335) (Cons!35334 (h!36755 (_ BitVec 64)) (t!50032 List!35338)) )
))
(declare-fun arrayNoDuplicates!0 (array!101245 (_ BitVec 32) List!35338) Bool)

(assert (=> b!1521057 (= res!1040283 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35335))))

(declare-fun b!1521058 () Bool)

(declare-fun res!1040280 () Bool)

(assert (=> b!1521058 (=> (not res!1040280) (not e!848431))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1521058 (= res!1040280 (and (= (size!49405 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49405 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49405 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521059 () Bool)

(declare-fun res!1040282 () Bool)

(assert (=> b!1521059 (=> (not res!1040282) (not e!848431))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101245 (_ BitVec 32)) Bool)

(assert (=> b!1521059 (= res!1040282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun res!1040281 () Bool)

(assert (=> start!129570 (=> (not res!1040281) (not e!848431))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129570 (= res!1040281 (validMask!0 mask!2512))))

(assert (=> start!129570 e!848431))

(assert (=> start!129570 true))

(declare-fun array_inv!37883 (array!101245) Bool)

(assert (=> start!129570 (array_inv!37883 a!2804)))

(declare-fun b!1521060 () Bool)

(declare-fun res!1040278 () Bool)

(assert (=> b!1521060 (=> (not res!1040278) (not e!848431))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1521060 (= res!1040278 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49405 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49405 a!2804))))))

(declare-fun b!1521061 () Bool)

(declare-fun res!1040284 () Bool)

(assert (=> b!1521061 (=> (not res!1040284) (not e!848431))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521061 (= res!1040284 (validKeyInArray!0 (select (arr!48855 a!2804) i!961)))))

(declare-fun b!1521062 () Bool)

(declare-fun res!1040279 () Bool)

(assert (=> b!1521062 (=> (not res!1040279) (not e!848431))))

(assert (=> b!1521062 (= res!1040279 (validKeyInArray!0 (select (arr!48855 a!2804) j!70)))))

(assert (= (and start!129570 res!1040281) b!1521058))

(assert (= (and b!1521058 res!1040280) b!1521061))

(assert (= (and b!1521061 res!1040284) b!1521062))

(assert (= (and b!1521062 res!1040279) b!1521059))

(assert (= (and b!1521059 res!1040282) b!1521057))

(assert (= (and b!1521057 res!1040283) b!1521060))

(assert (= (and b!1521060 res!1040278) b!1521056))

(declare-fun m!1404181 () Bool)

(assert (=> b!1521057 m!1404181))

(declare-fun m!1404183 () Bool)

(assert (=> b!1521062 m!1404183))

(assert (=> b!1521062 m!1404183))

(declare-fun m!1404185 () Bool)

(assert (=> b!1521062 m!1404185))

(declare-fun m!1404187 () Bool)

(assert (=> b!1521061 m!1404187))

(assert (=> b!1521061 m!1404187))

(declare-fun m!1404189 () Bool)

(assert (=> b!1521061 m!1404189))

(assert (=> b!1521056 m!1404183))

(assert (=> b!1521056 m!1404183))

(declare-fun m!1404191 () Bool)

(assert (=> b!1521056 m!1404191))

(assert (=> b!1521056 m!1404191))

(assert (=> b!1521056 m!1404183))

(declare-fun m!1404193 () Bool)

(assert (=> b!1521056 m!1404193))

(declare-fun m!1404195 () Bool)

(assert (=> start!129570 m!1404195))

(declare-fun m!1404197 () Bool)

(assert (=> start!129570 m!1404197))

(declare-fun m!1404199 () Bool)

(assert (=> b!1521059 m!1404199))

(check-sat (not b!1521061) (not b!1521057) (not b!1521062) (not b!1521056) (not b!1521059) (not start!129570))
