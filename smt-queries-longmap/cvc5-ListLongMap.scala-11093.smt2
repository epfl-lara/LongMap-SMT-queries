; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129532 () Bool)

(assert start!129532)

(declare-fun b!1520880 () Bool)

(declare-fun res!1040310 () Bool)

(declare-fun e!848259 () Bool)

(assert (=> b!1520880 (=> (not res!1040310) (not e!848259))))

(declare-datatypes ((array!101207 0))(
  ( (array!101208 (arr!48837 (Array (_ BitVec 32) (_ BitVec 64))) (size!49389 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101207)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101207 (_ BitVec 32)) Bool)

(assert (=> b!1520880 (= res!1040310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520881 () Bool)

(declare-fun res!1040315 () Bool)

(assert (=> b!1520881 (=> (not res!1040315) (not e!848259))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520881 (= res!1040315 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49389 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49389 a!2804))))))

(declare-fun b!1520882 () Bool)

(declare-fun res!1040308 () Bool)

(assert (=> b!1520882 (=> (not res!1040308) (not e!848259))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1520882 (= res!1040308 (and (= (size!49389 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49389 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49389 a!2804)) (not (= i!961 j!70))))))

(declare-fun res!1040313 () Bool)

(assert (=> start!129532 (=> (not res!1040313) (not e!848259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129532 (= res!1040313 (validMask!0 mask!2512))))

(assert (=> start!129532 e!848259))

(assert (=> start!129532 true))

(declare-fun array_inv!38070 (array!101207) Bool)

(assert (=> start!129532 (array_inv!38070 a!2804)))

(declare-fun b!1520883 () Bool)

(declare-fun res!1040309 () Bool)

(assert (=> b!1520883 (=> (not res!1040309) (not e!848259))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520883 (= res!1040309 (validKeyInArray!0 (select (arr!48837 a!2804) j!70)))))

(declare-fun b!1520884 () Bool)

(declare-fun res!1040312 () Bool)

(assert (=> b!1520884 (=> (not res!1040312) (not e!848259))))

(assert (=> b!1520884 (= res!1040312 (validKeyInArray!0 (select (arr!48837 a!2804) i!961)))))

(declare-fun b!1520885 () Bool)

(assert (=> b!1520885 (= e!848259 false)))

(declare-datatypes ((SeekEntryResult!13025 0))(
  ( (MissingZero!13025 (index!54495 (_ BitVec 32))) (Found!13025 (index!54496 (_ BitVec 32))) (Intermediate!13025 (undefined!13837 Bool) (index!54497 (_ BitVec 32)) (x!136191 (_ BitVec 32))) (Undefined!13025) (MissingVacant!13025 (index!54498 (_ BitVec 32))) )
))
(declare-fun lt!659028 () SeekEntryResult!13025)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101207 (_ BitVec 32)) SeekEntryResult!13025)

(assert (=> b!1520885 (= lt!659028 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48837 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520886 () Bool)

(declare-fun res!1040314 () Bool)

(assert (=> b!1520886 (=> (not res!1040314) (not e!848259))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520886 (= res!1040314 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48837 a!2804) j!70) mask!2512) (select (arr!48837 a!2804) j!70) a!2804 mask!2512) (Intermediate!13025 false resIndex!21 resX!21)))))

(declare-fun b!1520887 () Bool)

(declare-fun res!1040311 () Bool)

(assert (=> b!1520887 (=> (not res!1040311) (not e!848259))))

(declare-datatypes ((List!35398 0))(
  ( (Nil!35395) (Cons!35394 (h!36816 (_ BitVec 64)) (t!50084 List!35398)) )
))
(declare-fun arrayNoDuplicates!0 (array!101207 (_ BitVec 32) List!35398) Bool)

(assert (=> b!1520887 (= res!1040311 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35395))))

(assert (= (and start!129532 res!1040313) b!1520882))

(assert (= (and b!1520882 res!1040308) b!1520884))

(assert (= (and b!1520884 res!1040312) b!1520883))

(assert (= (and b!1520883 res!1040309) b!1520880))

(assert (= (and b!1520880 res!1040310) b!1520887))

(assert (= (and b!1520887 res!1040311) b!1520881))

(assert (= (and b!1520881 res!1040315) b!1520886))

(assert (= (and b!1520886 res!1040314) b!1520885))

(declare-fun m!1403423 () Bool)

(assert (=> start!129532 m!1403423))

(declare-fun m!1403425 () Bool)

(assert (=> start!129532 m!1403425))

(declare-fun m!1403427 () Bool)

(assert (=> b!1520885 m!1403427))

(assert (=> b!1520885 m!1403427))

(declare-fun m!1403429 () Bool)

(assert (=> b!1520885 m!1403429))

(declare-fun m!1403431 () Bool)

(assert (=> b!1520884 m!1403431))

(assert (=> b!1520884 m!1403431))

(declare-fun m!1403433 () Bool)

(assert (=> b!1520884 m!1403433))

(assert (=> b!1520886 m!1403427))

(assert (=> b!1520886 m!1403427))

(declare-fun m!1403435 () Bool)

(assert (=> b!1520886 m!1403435))

(assert (=> b!1520886 m!1403435))

(assert (=> b!1520886 m!1403427))

(declare-fun m!1403437 () Bool)

(assert (=> b!1520886 m!1403437))

(assert (=> b!1520883 m!1403427))

(assert (=> b!1520883 m!1403427))

(declare-fun m!1403439 () Bool)

(assert (=> b!1520883 m!1403439))

(declare-fun m!1403441 () Bool)

(assert (=> b!1520887 m!1403441))

(declare-fun m!1403443 () Bool)

(assert (=> b!1520880 m!1403443))

(push 1)

(assert (not b!1520883))

(assert (not b!1520884))

(assert (not start!129532))

(assert (not b!1520880))

(assert (not b!1520885))

(assert (not b!1520886))

(assert (not b!1520887))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

