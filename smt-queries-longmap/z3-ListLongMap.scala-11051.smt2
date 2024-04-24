; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!129440 () Bool)

(assert start!129440)

(declare-fun b!1517341 () Bool)

(declare-fun e!846861 () Bool)

(declare-fun e!846858 () Bool)

(assert (=> b!1517341 (= e!846861 e!846858)))

(declare-fun res!1036068 () Bool)

(assert (=> b!1517341 (=> (not res!1036068) (not e!846858))))

(declare-datatypes ((array!101110 0))(
  ( (array!101111 (arr!48787 (Array (_ BitVec 32) (_ BitVec 64))) (size!49338 (_ BitVec 32))) )
))
(declare-fun lt!657586 () array!101110)

(declare-fun lt!657592 () (_ BitVec 64))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12851 0))(
  ( (MissingZero!12851 (index!53799 (_ BitVec 32))) (Found!12851 (index!53800 (_ BitVec 32))) (Intermediate!12851 (undefined!13663 Bool) (index!53801 (_ BitVec 32)) (x!135702 (_ BitVec 32))) (Undefined!12851) (MissingVacant!12851 (index!53802 (_ BitVec 32))) )
))
(declare-fun lt!657591 () SeekEntryResult!12851)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101110 (_ BitVec 32)) SeekEntryResult!12851)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1517341 (= res!1036068 (= lt!657591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!657592 mask!2512) lt!657592 lt!657586 mask!2512)))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun a!2804 () array!101110)

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1517341 (= lt!657592 (select (store (arr!48787 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70))))

(assert (=> b!1517341 (= lt!657586 (array!101111 (store (arr!48787 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49338 a!2804)))))

(declare-fun b!1517342 () Bool)

(declare-fun res!1036071 () Bool)

(declare-fun e!846859 () Bool)

(assert (=> b!1517342 (=> (not res!1036071) (not e!846859))))

(declare-fun resX!21 () (_ BitVec 32))

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(declare-fun resIndex!21 () (_ BitVec 32))

(assert (=> b!1517342 (= res!1036071 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49338 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49338 a!2804))))))

(declare-fun b!1517343 () Bool)

(declare-fun res!1036069 () Bool)

(assert (=> b!1517343 (=> (not res!1036069) (not e!846859))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1517343 (= res!1036069 (validKeyInArray!0 (select (arr!48787 a!2804) i!961)))))

(declare-fun res!1036077 () Bool)

(assert (=> start!129440 (=> (not res!1036077) (not e!846859))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!129440 (= res!1036077 (validMask!0 mask!2512))))

(assert (=> start!129440 e!846859))

(assert (=> start!129440 true))

(declare-fun array_inv!38068 (array!101110) Bool)

(assert (=> start!129440 (array_inv!38068 a!2804)))

(declare-fun b!1517344 () Bool)

(declare-fun res!1036078 () Bool)

(assert (=> b!1517344 (=> (not res!1036078) (not e!846861))))

(declare-fun lt!657583 () SeekEntryResult!12851)

(assert (=> b!1517344 (= res!1036078 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48787 a!2804) j!70) a!2804 mask!2512) lt!657583))))

(declare-fun e!846860 () Bool)

(declare-fun b!1517345 () Bool)

(declare-fun seekEntry!0 ((_ BitVec 64) array!101110 (_ BitVec 32)) SeekEntryResult!12851)

(assert (=> b!1517345 (= e!846860 (= (seekEntry!0 (select (arr!48787 a!2804) j!70) a!2804 mask!2512) (Found!12851 j!70)))))

(declare-fun b!1517346 () Bool)

(declare-fun e!846864 () Bool)

(declare-fun e!846862 () Bool)

(assert (=> b!1517346 (= e!846864 e!846862)))

(declare-fun res!1036076 () Bool)

(assert (=> b!1517346 (=> res!1036076 e!846862)))

(declare-fun lt!657589 () SeekEntryResult!12851)

(assert (=> b!1517346 (= res!1036076 (not (= lt!657589 (Found!12851 j!70))))))

(declare-fun lt!657587 () SeekEntryResult!12851)

(declare-fun lt!657588 () SeekEntryResult!12851)

(assert (=> b!1517346 (= lt!657587 lt!657588)))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!101110 (_ BitVec 32)) SeekEntryResult!12851)

(assert (=> b!1517346 (= lt!657588 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 lt!657592 lt!657586 mask!2512))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!101110 (_ BitVec 32)) SeekEntryResult!12851)

(assert (=> b!1517346 (= lt!657587 (seekEntryOrOpen!0 lt!657592 lt!657586 mask!2512))))

(declare-fun lt!657585 () SeekEntryResult!12851)

(assert (=> b!1517346 (= lt!657585 lt!657589)))

(assert (=> b!1517346 (= lt!657589 (seekKeyOrZeroReturnVacant!0 x!534 index!487 index!487 (select (arr!48787 a!2804) j!70) a!2804 mask!2512))))

(assert (=> b!1517346 (= lt!657585 (seekEntryOrOpen!0 (select (arr!48787 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517347 () Bool)

(assert (=> b!1517347 (= e!846858 (not e!846864))))

(declare-fun res!1036074 () Bool)

(assert (=> b!1517347 (=> res!1036074 e!846864)))

(assert (=> b!1517347 (= res!1036074 (or (not (= (select (arr!48787 a!2804) j!70) lt!657592)) (not (= x!534 resX!21)) (not (= index!487 resIndex!21)) (= (select (arr!48787 a!2804) index!487) (select (arr!48787 a!2804) j!70)) (not (= (select (arr!48787 a!2804) index!487) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1517347 e!846860))

(declare-fun res!1036070 () Bool)

(assert (=> b!1517347 (=> (not res!1036070) (not e!846860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!101110 (_ BitVec 32)) Bool)

(assert (=> b!1517347 (= res!1036070 (arrayForallSeekEntryOrOpenFound!0 j!70 a!2804 mask!2512))))

(declare-datatypes ((Unit!50605 0))(
  ( (Unit!50606) )
))
(declare-fun lt!657584 () Unit!50605)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!101110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50605)

(assert (=> b!1517347 (= lt!657584 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2804 mask!2512 #b00000000000000000000000000000000 j!70))))

(declare-fun b!1517348 () Bool)

(assert (=> b!1517348 (= e!846859 e!846861)))

(declare-fun res!1036075 () Bool)

(assert (=> b!1517348 (=> (not res!1036075) (not e!846861))))

(assert (=> b!1517348 (= res!1036075 (= lt!657591 lt!657583))))

(assert (=> b!1517348 (= lt!657583 (Intermediate!12851 false resIndex!21 resX!21))))

(assert (=> b!1517348 (= lt!657591 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48787 a!2804) j!70) mask!2512) (select (arr!48787 a!2804) j!70) a!2804 mask!2512))))

(declare-fun b!1517349 () Bool)

(declare-fun res!1036067 () Bool)

(assert (=> b!1517349 (=> (not res!1036067) (not e!846859))))

(assert (=> b!1517349 (= res!1036067 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1517350 () Bool)

(assert (=> b!1517350 (= e!846862 true)))

(assert (=> b!1517350 (= lt!657588 lt!657589)))

(declare-fun lt!657590 () Unit!50605)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 (array!101110 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50605)

(assert (=> b!1517350 (= lt!657590 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1Helper!0 a!2804 i!961 j!70 x!534 index!487 index!487 mask!2512))))

(declare-fun b!1517351 () Bool)

(declare-fun res!1036079 () Bool)

(assert (=> b!1517351 (=> (not res!1036079) (not e!846859))))

(assert (=> b!1517351 (= res!1036079 (validKeyInArray!0 (select (arr!48787 a!2804) j!70)))))

(declare-fun b!1517352 () Bool)

(declare-fun res!1036072 () Bool)

(assert (=> b!1517352 (=> (not res!1036072) (not e!846859))))

(declare-datatypes ((List!35257 0))(
  ( (Nil!35254) (Cons!35253 (h!36680 (_ BitVec 64)) (t!49943 List!35257)) )
))
(declare-fun arrayNoDuplicates!0 (array!101110 (_ BitVec 32) List!35257) Bool)

(assert (=> b!1517352 (= res!1036072 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35254))))

(declare-fun b!1517353 () Bool)

(declare-fun res!1036073 () Bool)

(assert (=> b!1517353 (=> (not res!1036073) (not e!846859))))

(assert (=> b!1517353 (= res!1036073 (and (= (size!49338 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49338 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49338 a!2804)) (not (= i!961 j!70))))))

(assert (= (and start!129440 res!1036077) b!1517353))

(assert (= (and b!1517353 res!1036073) b!1517343))

(assert (= (and b!1517343 res!1036069) b!1517351))

(assert (= (and b!1517351 res!1036079) b!1517349))

(assert (= (and b!1517349 res!1036067) b!1517352))

(assert (= (and b!1517352 res!1036072) b!1517342))

(assert (= (and b!1517342 res!1036071) b!1517348))

(assert (= (and b!1517348 res!1036075) b!1517344))

(assert (= (and b!1517344 res!1036078) b!1517341))

(assert (= (and b!1517341 res!1036068) b!1517347))

(assert (= (and b!1517347 res!1036070) b!1517345))

(assert (= (and b!1517347 (not res!1036074)) b!1517346))

(assert (= (and b!1517346 (not res!1036076)) b!1517350))

(declare-fun m!1400427 () Bool)

(assert (=> b!1517351 m!1400427))

(assert (=> b!1517351 m!1400427))

(declare-fun m!1400429 () Bool)

(assert (=> b!1517351 m!1400429))

(assert (=> b!1517348 m!1400427))

(assert (=> b!1517348 m!1400427))

(declare-fun m!1400431 () Bool)

(assert (=> b!1517348 m!1400431))

(assert (=> b!1517348 m!1400431))

(assert (=> b!1517348 m!1400427))

(declare-fun m!1400433 () Bool)

(assert (=> b!1517348 m!1400433))

(declare-fun m!1400435 () Bool)

(assert (=> start!129440 m!1400435))

(declare-fun m!1400437 () Bool)

(assert (=> start!129440 m!1400437))

(declare-fun m!1400439 () Bool)

(assert (=> b!1517341 m!1400439))

(assert (=> b!1517341 m!1400439))

(declare-fun m!1400441 () Bool)

(assert (=> b!1517341 m!1400441))

(declare-fun m!1400443 () Bool)

(assert (=> b!1517341 m!1400443))

(declare-fun m!1400445 () Bool)

(assert (=> b!1517341 m!1400445))

(declare-fun m!1400447 () Bool)

(assert (=> b!1517352 m!1400447))

(declare-fun m!1400449 () Bool)

(assert (=> b!1517349 m!1400449))

(assert (=> b!1517344 m!1400427))

(assert (=> b!1517344 m!1400427))

(declare-fun m!1400451 () Bool)

(assert (=> b!1517344 m!1400451))

(declare-fun m!1400453 () Bool)

(assert (=> b!1517343 m!1400453))

(assert (=> b!1517343 m!1400453))

(declare-fun m!1400455 () Bool)

(assert (=> b!1517343 m!1400455))

(declare-fun m!1400457 () Bool)

(assert (=> b!1517350 m!1400457))

(assert (=> b!1517347 m!1400427))

(declare-fun m!1400459 () Bool)

(assert (=> b!1517347 m!1400459))

(declare-fun m!1400461 () Bool)

(assert (=> b!1517347 m!1400461))

(declare-fun m!1400463 () Bool)

(assert (=> b!1517347 m!1400463))

(assert (=> b!1517346 m!1400427))

(declare-fun m!1400465 () Bool)

(assert (=> b!1517346 m!1400465))

(assert (=> b!1517346 m!1400427))

(declare-fun m!1400467 () Bool)

(assert (=> b!1517346 m!1400467))

(declare-fun m!1400469 () Bool)

(assert (=> b!1517346 m!1400469))

(assert (=> b!1517346 m!1400427))

(declare-fun m!1400471 () Bool)

(assert (=> b!1517346 m!1400471))

(assert (=> b!1517345 m!1400427))

(assert (=> b!1517345 m!1400427))

(declare-fun m!1400473 () Bool)

(assert (=> b!1517345 m!1400473))

(check-sat (not b!1517350) (not b!1517344) (not b!1517348) (not start!129440) (not b!1517345) (not b!1517347) (not b!1517351) (not b!1517341) (not b!1517349) (not b!1517352) (not b!1517343) (not b!1517346))
(check-sat)
