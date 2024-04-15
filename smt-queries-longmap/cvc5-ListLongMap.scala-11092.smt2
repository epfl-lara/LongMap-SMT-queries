; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!129526 () Bool)

(assert start!129526)

(declare-fun b!1520808 () Bool)

(declare-fun res!1040240 () Bool)

(declare-fun e!848240 () Bool)

(assert (=> b!1520808 (=> (not res!1040240) (not e!848240))))

(declare-datatypes ((array!101201 0))(
  ( (array!101202 (arr!48834 (Array (_ BitVec 32) (_ BitVec 64))) (size!49386 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101201)

(declare-datatypes ((List!35395 0))(
  ( (Nil!35392) (Cons!35391 (h!36813 (_ BitVec 64)) (t!50081 List!35395)) )
))
(declare-fun arrayNoDuplicates!0 (array!101201 (_ BitVec 32) List!35395) Bool)

(assert (=> b!1520808 (= res!1040240 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35392))))

(declare-fun res!1040241 () Bool)

(assert (=> start!129526 (=> (not res!1040241) (not e!848240))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129526 (= res!1040241 (validMask!0 mask!2512))))

(assert (=> start!129526 e!848240))

(assert (=> start!129526 true))

(declare-fun array_inv!38067 (array!101201) Bool)

(assert (=> start!129526 (array_inv!38067 a!2804)))

(declare-fun b!1520809 () Bool)

(assert (=> b!1520809 (= e!848240 false)))

(declare-datatypes ((SeekEntryResult!13022 0))(
  ( (MissingZero!13022 (index!54483 (_ BitVec 32))) (Found!13022 (index!54484 (_ BitVec 32))) (Intermediate!13022 (undefined!13834 Bool) (index!54485 (_ BitVec 32)) (x!136180 (_ BitVec 32))) (Undefined!13022) (MissingVacant!13022 (index!54486 (_ BitVec 32))) )
))
(declare-fun lt!659019 () SeekEntryResult!13022)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101201 (_ BitVec 32)) SeekEntryResult!13022)

(assert (=> b!1520809 (= lt!659019 (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48834 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1520810 () Bool)

(declare-fun res!1040242 () Bool)

(assert (=> b!1520810 (=> (not res!1040242) (not e!848240))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1520810 (= res!1040242 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49386 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49386 a!2804))))))

(declare-fun b!1520811 () Bool)

(declare-fun res!1040243 () Bool)

(assert (=> b!1520811 (=> (not res!1040243) (not e!848240))))

(declare-fun i!961 () (_ BitVec 32))

(assert (=> b!1520811 (= res!1040243 (and (= (size!49386 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49386 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49386 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1520812 () Bool)

(declare-fun res!1040238 () Bool)

(assert (=> b!1520812 (=> (not res!1040238) (not e!848240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101201 (_ BitVec 32)) Bool)

(assert (=> b!1520812 (= res!1040238 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1520813 () Bool)

(declare-fun res!1040239 () Bool)

(assert (=> b!1520813 (=> (not res!1040239) (not e!848240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1520813 (= res!1040239 (validKeyInArray!0 (select (arr!48834 a!2804) j!70)))))

(declare-fun b!1520814 () Bool)

(declare-fun res!1040236 () Bool)

(assert (=> b!1520814 (=> (not res!1040236) (not e!848240))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1520814 (= res!1040236 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48834 a!2804) j!70) mask!2512) (select (arr!48834 a!2804) j!70) a!2804 mask!2512) (Intermediate!13022 false resIndex!21 resX!21)))))

(declare-fun b!1520815 () Bool)

(declare-fun res!1040237 () Bool)

(assert (=> b!1520815 (=> (not res!1040237) (not e!848240))))

(assert (=> b!1520815 (= res!1040237 (validKeyInArray!0 (select (arr!48834 a!2804) i!961)))))

(assert (= (and start!129526 res!1040241) b!1520811))

(assert (= (and b!1520811 res!1040243) b!1520815))

(assert (= (and b!1520815 res!1040237) b!1520813))

(assert (= (and b!1520813 res!1040239) b!1520812))

(assert (= (and b!1520812 res!1040238) b!1520808))

(assert (= (and b!1520808 res!1040240) b!1520810))

(assert (= (and b!1520810 res!1040242) b!1520814))

(assert (= (and b!1520814 res!1040236) b!1520809))

(declare-fun m!1403357 () Bool)

(assert (=> b!1520813 m!1403357))

(assert (=> b!1520813 m!1403357))

(declare-fun m!1403359 () Bool)

(assert (=> b!1520813 m!1403359))

(declare-fun m!1403361 () Bool)

(assert (=> b!1520812 m!1403361))

(assert (=> b!1520809 m!1403357))

(assert (=> b!1520809 m!1403357))

(declare-fun m!1403363 () Bool)

(assert (=> b!1520809 m!1403363))

(assert (=> b!1520814 m!1403357))

(assert (=> b!1520814 m!1403357))

(declare-fun m!1403365 () Bool)

(assert (=> b!1520814 m!1403365))

(assert (=> b!1520814 m!1403365))

(assert (=> b!1520814 m!1403357))

(declare-fun m!1403367 () Bool)

(assert (=> b!1520814 m!1403367))

(declare-fun m!1403369 () Bool)

(assert (=> b!1520808 m!1403369))

(declare-fun m!1403371 () Bool)

(assert (=> start!129526 m!1403371))

(declare-fun m!1403373 () Bool)

(assert (=> start!129526 m!1403373))

(declare-fun m!1403375 () Bool)

(assert (=> b!1520815 m!1403375))

(assert (=> b!1520815 m!1403375))

(declare-fun m!1403377 () Bool)

(assert (=> b!1520815 m!1403377))

(push 1)

(assert (not b!1520815))

(assert (not b!1520809))

(assert (not b!1520813))

(assert (not b!1520812))

(assert (not start!129526))

(assert (not b!1520814))

(assert (not b!1520808))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

