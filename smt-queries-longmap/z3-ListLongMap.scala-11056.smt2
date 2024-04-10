; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129170 () Bool)

(assert start!129170)

(declare-fun b!1516114 () Bool)

(declare-fun res!1036020 () Bool)

(declare-fun e!846026 () Bool)

(assert (=> b!1516114 (=> (not res!1036020) (not e!846026))))

(declare-datatypes ((array!101026 0))(
  ( (array!101027 (arr!48750 (Array (_ BitVec 32) (_ BitVec 64))) (size!49300 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101026)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101026 (_ BitVec 32)) Bool)

(assert (=> b!1516114 (= res!1036020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1516115 () Bool)

(declare-fun res!1036017 () Bool)

(declare-fun e!846025 () Bool)

(assert (=> b!1516115 (=> (not res!1036017) (not e!846025))))

(declare-datatypes ((SeekEntryResult!12921 0))(
  ( (MissingZero!12921 (index!54079 (_ BitVec 32))) (Found!12921 (index!54080 (_ BitVec 32))) (Intermediate!12921 (undefined!13733 Bool) (index!54081 (_ BitVec 32)) (x!135775 (_ BitVec 32))) (Undefined!12921) (MissingVacant!12921 (index!54082 (_ BitVec 32))) )
))
(declare-fun lt!657304 () SeekEntryResult!12921)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101026 (_ BitVec 32)) SeekEntryResult!12921)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1516115 (= res!1036017 (= lt!657304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48750 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48750 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!101027 (store (arr!48750 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49300 a!2804)) mask!2512)))))

(declare-fun b!1516116 () Bool)

(declare-fun res!1036021 () Bool)

(assert (=> b!1516116 (=> (not res!1036021) (not e!846026))))

(declare-datatypes ((List!35233 0))(
  ( (Nil!35230) (Cons!35229 (h!36641 (_ BitVec 64)) (t!49927 List!35233)) )
))
(declare-fun arrayNoDuplicates!0 (array!101026 (_ BitVec 32) List!35233) Bool)

(assert (=> b!1516116 (= res!1036021 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35230))))

(declare-fun b!1516118 () Bool)

(declare-fun res!1036024 () Bool)

(assert (=> b!1516118 (=> (not res!1036024) (not e!846026))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1516118 (= res!1036024 (validKeyInArray!0 (select (arr!48750 a!2804) i!961)))))

(declare-fun b!1516119 () Bool)

(declare-fun res!1036025 () Bool)

(assert (=> b!1516119 (=> (not res!1036025) (not e!846026))))

(assert (=> b!1516119 (= res!1036025 (and (= (size!49300 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49300 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49300 a!2804)) (not (= i!961 j!70))))))

(declare-fun e!846028 () Bool)

(declare-fun b!1516120 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101026 (_ BitVec 32)) SeekEntryResult!12921)

(assert (=> b!1516120 (= e!846028 (= (seekEntry!0 (select (arr!48750 a!2804) j!70) a!2804 mask!2512) (Found!12921 j!70)))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun b!1516121 () Bool)

(assert (=> b!1516121 (= e!846025 (not (or (not (= (select (arr!48750 a!2804) j!70) (select (store (arr!48750 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))) (= x!534 resX!21) (bvsge mask!2512 #b00000000000000000000000000000000))))))

(assert (=> b!1516121 e!846028))

(declare-fun res!1036019 () Bool)

(assert (=> b!1516121 (=> (not res!1036019) (not e!846028))))

(assert (=> b!1516121 (= res!1036019 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50710 0))(
  ( (Unit!50711) )
))
(declare-fun lt!657302 () Unit!50710)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101026 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50710)

(assert (=> b!1516121 (= lt!657302 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1516122 () Bool)

(declare-fun res!1036026 () Bool)

(assert (=> b!1516122 (=> (not res!1036026) (not e!846025))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun lt!657303 () SeekEntryResult!12921)

(assert (=> b!1516122 (= res!1036026 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48750 a!2804) j!70) a!2804 mask!2512) lt!657303))))

(declare-fun b!1516123 () Bool)

(declare-fun res!1036022 () Bool)

(assert (=> b!1516123 (=> (not res!1036022) (not e!846026))))

(assert (=> b!1516123 (= res!1036022 (validKeyInArray!0 (select (arr!48750 a!2804) j!70)))))

(declare-fun b!1516124 () Bool)

(declare-fun res!1036027 () Bool)

(assert (=> b!1516124 (=> (not res!1036027) (not e!846026))))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1516124 (= res!1036027 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49300 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49300 a!2804))))))

(declare-fun b!1516117 () Bool)

(assert (=> b!1516117 (= e!846026 e!846025)))

(declare-fun res!1036023 () Bool)

(assert (=> b!1516117 (=> (not res!1036023) (not e!846025))))

(assert (=> b!1516117 (= res!1036023 (= lt!657304 lt!657303))))

(assert (=> b!1516117 (= lt!657303 (Intermediate!12921 false resIndex!21 resX!21))))

(assert (=> b!1516117 (= lt!657304 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48750 a!2804) j!70) mask!2512) (select (arr!48750 a!2804) j!70) a!2804 mask!2512))))

(declare-fun res!1036018 () Bool)

(assert (=> start!129170 (=> (not res!1036018) (not e!846026))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129170 (= res!1036018 (validMask!0 mask!2512))))

(assert (=> start!129170 e!846026))

(assert (=> start!129170 true))

(declare-fun array_inv!37778 (array!101026) Bool)

(assert (=> start!129170 (array_inv!37778 a!2804)))

(assert (= (and start!129170 res!1036018) b!1516119))

(assert (= (and b!1516119 res!1036025) b!1516118))

(assert (= (and b!1516118 res!1036024) b!1516123))

(assert (= (and b!1516123 res!1036022) b!1516114))

(assert (= (and b!1516114 res!1036020) b!1516116))

(assert (= (and b!1516116 res!1036021) b!1516124))

(assert (= (and b!1516124 res!1036027) b!1516117))

(assert (= (and b!1516117 res!1036023) b!1516122))

(assert (= (and b!1516122 res!1036026) b!1516115))

(assert (= (and b!1516115 res!1036017) b!1516121))

(assert (= (and b!1516121 res!1036019) b!1516120))

(declare-fun m!1399357 () Bool)

(assert (=> b!1516116 m!1399357))

(declare-fun m!1399359 () Bool)

(assert (=> b!1516121 m!1399359))

(declare-fun m!1399361 () Bool)

(assert (=> b!1516121 m!1399361))

(declare-fun m!1399363 () Bool)

(assert (=> b!1516121 m!1399363))

(declare-fun m!1399365 () Bool)

(assert (=> b!1516121 m!1399365))

(declare-fun m!1399367 () Bool)

(assert (=> b!1516121 m!1399367))

(assert (=> b!1516117 m!1399359))

(assert (=> b!1516117 m!1399359))

(declare-fun m!1399369 () Bool)

(assert (=> b!1516117 m!1399369))

(assert (=> b!1516117 m!1399369))

(assert (=> b!1516117 m!1399359))

(declare-fun m!1399371 () Bool)

(assert (=> b!1516117 m!1399371))

(declare-fun m!1399373 () Bool)

(assert (=> b!1516114 m!1399373))

(assert (=> b!1516123 m!1399359))

(assert (=> b!1516123 m!1399359))

(declare-fun m!1399375 () Bool)

(assert (=> b!1516123 m!1399375))

(assert (=> b!1516120 m!1399359))

(assert (=> b!1516120 m!1399359))

(declare-fun m!1399377 () Bool)

(assert (=> b!1516120 m!1399377))

(declare-fun m!1399379 () Bool)

(assert (=> start!129170 m!1399379))

(declare-fun m!1399381 () Bool)

(assert (=> start!129170 m!1399381))

(declare-fun m!1399383 () Bool)

(assert (=> b!1516118 m!1399383))

(assert (=> b!1516118 m!1399383))

(declare-fun m!1399385 () Bool)

(assert (=> b!1516118 m!1399385))

(assert (=> b!1516122 m!1399359))

(assert (=> b!1516122 m!1399359))

(declare-fun m!1399387 () Bool)

(assert (=> b!1516122 m!1399387))

(assert (=> b!1516115 m!1399363))

(assert (=> b!1516115 m!1399365))

(assert (=> b!1516115 m!1399365))

(declare-fun m!1399389 () Bool)

(assert (=> b!1516115 m!1399389))

(assert (=> b!1516115 m!1399389))

(assert (=> b!1516115 m!1399365))

(declare-fun m!1399391 () Bool)

(assert (=> b!1516115 m!1399391))

(check-sat (not b!1516115) (not b!1516118) (not start!129170) (not b!1516121) (not b!1516122) (not b!1516114) (not b!1516120) (not b!1516123) (not b!1516116) (not b!1516117))
(check-sat)
