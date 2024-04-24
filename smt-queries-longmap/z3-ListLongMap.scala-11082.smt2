; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129680 () Bool)

(assert start!129680)

(declare-fun b!1521234 () Bool)

(declare-fun j!70 () (_ BitVec 32))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((array!101299 0))(
  ( (array!101300 (arr!48880 (Array (_ BitVec 32) (_ BitVec 64))) (size!49431 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!101299)

(declare-fun e!848729 () Bool)

(declare-datatypes ((SeekEntryResult!12944 0))(
  ( (MissingZero!12944 (index!54171 (_ BitVec 32))) (Found!12944 (index!54172 (_ BitVec 32))) (Intermediate!12944 (undefined!13756 Bool) (index!54173 (_ BitVec 32)) (x!136049 (_ BitVec 32))) (Undefined!12944) (MissingVacant!12944 (index!54174 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!101299 (_ BitVec 32)) SeekEntryResult!12944)

(assert (=> b!1521234 (= e!848729 (= (seekEntry!0 (select (arr!48880 a!2804) j!70) a!2804 mask!2512) (Found!12944 j!70)))))

(declare-fun res!1039784 () Bool)

(declare-fun e!848725 () Bool)

(assert (=> start!129680 (=> (not res!1039784) (not e!848725))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129680 (= res!1039784 (validMask!0 mask!2512))))

(assert (=> start!129680 e!848725))

(assert (=> start!129680 true))

(declare-fun array_inv!38161 (array!101299) Bool)

(assert (=> start!129680 (array_inv!38161 a!2804)))

(declare-fun b!1521235 () Bool)

(declare-fun e!848728 () Bool)

(assert (=> b!1521235 (= e!848725 e!848728)))

(declare-fun res!1039779 () Bool)

(assert (=> b!1521235 (=> (not res!1039779) (not e!848728))))

(declare-fun lt!659306 () SeekEntryResult!12944)

(declare-fun lt!659307 () SeekEntryResult!12944)

(assert (=> b!1521235 (= res!1039779 (= lt!659306 lt!659307))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1521235 (= lt!659307 (Intermediate!12944 false resIndex!21 resX!21))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101299 (_ BitVec 32)) SeekEntryResult!12944)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521235 (= lt!659306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48880 a!2804) j!70) mask!2512) (select (arr!48880 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1521236 () Bool)

(declare-fun res!1039790 () Bool)

(assert (=> b!1521236 (=> (not res!1039790) (not e!848725))))

(declare-datatypes ((List!35350 0))(
  ( (Nil!35347) (Cons!35346 (h!36776 (_ BitVec 64)) (t!50036 List!35350)) )
))
(declare-fun arrayNoDuplicates!0 (array!101299 (_ BitVec 32) List!35350) Bool)

(assert (=> b!1521236 (= res!1039790 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35347))))

(declare-fun b!1521237 () Bool)

(declare-fun res!1039789 () Bool)

(assert (=> b!1521237 (=> (not res!1039789) (not e!848728))))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1521237 (= res!1039789 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48880 a!2804) j!70) a!2804 mask!2512) lt!659307))))

(declare-fun b!1521238 () Bool)

(declare-fun res!1039777 () Bool)

(assert (=> b!1521238 (=> (not res!1039777) (not e!848725))))

(assert (=> b!1521238 (= res!1039777 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49431 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49431 a!2804))))))

(declare-fun b!1521239 () Bool)

(declare-fun e!848730 () Bool)

(declare-fun e!848727 () Bool)

(assert (=> b!1521239 (= e!848730 e!848727)))

(declare-fun res!1039781 () Bool)

(assert (=> b!1521239 (=> res!1039781 e!848727)))

(declare-fun lt!659309 () (_ BitVec 32))

(assert (=> b!1521239 (= res!1039781 (or (bvslt (bvadd #b00000000000000000000000000000001 x!534) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!534) #b01111111111111111111111111111110) (bvslt lt!659309 #b00000000000000000000000000000000) (bvsge lt!659309 (size!49431 a!2804))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1521239 (= lt!659309 (nextIndex!0 index!487 (bvadd #b00000000000000000000000000000001 x!534) mask!2512))))

(declare-fun b!1521240 () Bool)

(declare-fun res!1039788 () Bool)

(assert (=> b!1521240 (=> (not res!1039788) (not e!848725))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1521240 (= res!1039788 (validKeyInArray!0 (select (arr!48880 a!2804) j!70)))))

(declare-fun b!1521241 () Bool)

(assert (=> b!1521241 (= e!848727 (bvsge mask!2512 #b00000000000000000000000000000000))))

(declare-fun lt!659308 () (_ BitVec 64))

(declare-fun lt!659310 () array!101299)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101299 (_ BitVec 32)) SeekEntryResult!12944)

(assert (=> b!1521241 (= (seekEntryOrOpen!0 (select (arr!48880 a!2804) j!70) a!2804 mask!2512) (seekEntryOrOpen!0 lt!659308 lt!659310 mask!2512))))

(declare-fun i!961 () (_ BitVec 32))

(declare-datatypes ((Unit!50791 0))(
  ( (Unit!50792) )
))
(declare-fun lt!659305 () Unit!50791)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!101299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50791)

(assert (=> b!1521241 (= lt!659305 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2804 i!961 j!70 (bvadd #b00000000000000000000000000000001 x!534) lt!659309 resX!21 resIndex!21 mask!2512))))

(declare-fun b!1521242 () Bool)

(declare-fun e!848724 () Bool)

(assert (=> b!1521242 (= e!848728 e!848724)))

(declare-fun res!1039786 () Bool)

(assert (=> b!1521242 (=> (not res!1039786) (not e!848724))))

(assert (=> b!1521242 (= res!1039786 (= lt!659306 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!659308 mask!2512) lt!659308 lt!659310 mask!2512)))))

(assert (=> b!1521242 (= lt!659308 (select (store (arr!48880 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1521242 (= lt!659310 (array!101300 (store (arr!48880 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49431 a!2804)))))

(declare-fun b!1521243 () Bool)

(declare-fun res!1039785 () Bool)

(assert (=> b!1521243 (=> res!1039785 e!848727)))

(assert (=> b!1521243 (= res!1039785 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!534) lt!659309 (select (arr!48880 a!2804) j!70) a!2804 mask!2512) lt!659307)))))

(declare-fun b!1521244 () Bool)

(declare-fun res!1039782 () Bool)

(assert (=> b!1521244 (=> (not res!1039782) (not e!848725))))

(assert (=> b!1521244 (= res!1039782 (validKeyInArray!0 (select (arr!48880 a!2804) i!961)))))

(declare-fun b!1521245 () Bool)

(assert (=> b!1521245 (= e!848724 (not e!848730))))

(declare-fun res!1039780 () Bool)

(assert (=> b!1521245 (=> res!1039780 e!848730)))

(assert (=> b!1521245 (= res!1039780 (or (not (= (select (arr!48880 a!2804) j!70) lt!659308)) (= x!534 resX!21)))))

(assert (=> b!1521245 e!848729))

(declare-fun res!1039783 () Bool)

(assert (=> b!1521245 (=> (not res!1039783) (not e!848729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101299 (_ BitVec 32)) Bool)

(assert (=> b!1521245 (= res!1039783 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-fun lt!659311 () Unit!50791)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101299 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50791)

(assert (=> b!1521245 (= lt!659311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1521246 () Bool)

(declare-fun res!1039778 () Bool)

(assert (=> b!1521246 (=> (not res!1039778) (not e!848725))))

(assert (=> b!1521246 (= res!1039778 (and (= (size!49431 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49431 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49431 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1521247 () Bool)

(declare-fun res!1039787 () Bool)

(assert (=> b!1521247 (=> (not res!1039787) (not e!848725))))

(assert (=> b!1521247 (= res!1039787 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(assert (= (and start!129680 res!1039784) b!1521246))

(assert (= (and b!1521246 res!1039778) b!1521244))

(assert (= (and b!1521244 res!1039782) b!1521240))

(assert (= (and b!1521240 res!1039788) b!1521247))

(assert (= (and b!1521247 res!1039787) b!1521236))

(assert (= (and b!1521236 res!1039790) b!1521238))

(assert (= (and b!1521238 res!1039777) b!1521235))

(assert (= (and b!1521235 res!1039779) b!1521237))

(assert (= (and b!1521237 res!1039789) b!1521242))

(assert (= (and b!1521242 res!1039786) b!1521245))

(assert (= (and b!1521245 res!1039783) b!1521234))

(assert (= (and b!1521245 (not res!1039780)) b!1521239))

(assert (= (and b!1521239 (not res!1039781)) b!1521243))

(assert (= (and b!1521243 (not res!1039785)) b!1521241))

(declare-fun m!1404459 () Bool)

(assert (=> b!1521235 m!1404459))

(assert (=> b!1521235 m!1404459))

(declare-fun m!1404461 () Bool)

(assert (=> b!1521235 m!1404461))

(assert (=> b!1521235 m!1404461))

(assert (=> b!1521235 m!1404459))

(declare-fun m!1404463 () Bool)

(assert (=> b!1521235 m!1404463))

(declare-fun m!1404465 () Bool)

(assert (=> b!1521239 m!1404465))

(assert (=> b!1521243 m!1404459))

(assert (=> b!1521243 m!1404459))

(declare-fun m!1404467 () Bool)

(assert (=> b!1521243 m!1404467))

(assert (=> b!1521240 m!1404459))

(assert (=> b!1521240 m!1404459))

(declare-fun m!1404469 () Bool)

(assert (=> b!1521240 m!1404469))

(declare-fun m!1404471 () Bool)

(assert (=> b!1521236 m!1404471))

(assert (=> b!1521241 m!1404459))

(assert (=> b!1521241 m!1404459))

(declare-fun m!1404473 () Bool)

(assert (=> b!1521241 m!1404473))

(declare-fun m!1404475 () Bool)

(assert (=> b!1521241 m!1404475))

(declare-fun m!1404477 () Bool)

(assert (=> b!1521241 m!1404477))

(declare-fun m!1404479 () Bool)

(assert (=> start!129680 m!1404479))

(declare-fun m!1404481 () Bool)

(assert (=> start!129680 m!1404481))

(assert (=> b!1521234 m!1404459))

(assert (=> b!1521234 m!1404459))

(declare-fun m!1404483 () Bool)

(assert (=> b!1521234 m!1404483))

(assert (=> b!1521237 m!1404459))

(assert (=> b!1521237 m!1404459))

(declare-fun m!1404485 () Bool)

(assert (=> b!1521237 m!1404485))

(declare-fun m!1404487 () Bool)

(assert (=> b!1521244 m!1404487))

(assert (=> b!1521244 m!1404487))

(declare-fun m!1404489 () Bool)

(assert (=> b!1521244 m!1404489))

(declare-fun m!1404491 () Bool)

(assert (=> b!1521247 m!1404491))

(declare-fun m!1404493 () Bool)

(assert (=> b!1521242 m!1404493))

(assert (=> b!1521242 m!1404493))

(declare-fun m!1404495 () Bool)

(assert (=> b!1521242 m!1404495))

(declare-fun m!1404497 () Bool)

(assert (=> b!1521242 m!1404497))

(declare-fun m!1404499 () Bool)

(assert (=> b!1521242 m!1404499))

(assert (=> b!1521245 m!1404459))

(declare-fun m!1404501 () Bool)

(assert (=> b!1521245 m!1404501))

(declare-fun m!1404503 () Bool)

(assert (=> b!1521245 m!1404503))

(check-sat (not b!1521247) (not b!1521244) (not b!1521242) (not b!1521235) (not b!1521234) (not b!1521245) (not start!129680) (not b!1521239) (not b!1521236) (not b!1521241) (not b!1521243) (not b!1521237) (not b!1521240))
(check-sat)
