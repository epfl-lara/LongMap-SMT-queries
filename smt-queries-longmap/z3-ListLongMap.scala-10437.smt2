; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123026 () Bool)

(assert start!123026)

(declare-fun b!1424904 () Bool)

(declare-fun res!959453 () Bool)

(declare-fun e!805517 () Bool)

(assert (=> b!1424904 (=> (not res!959453) (not e!805517))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-datatypes ((array!97262 0))(
  ( (array!97263 (arr!46945 (Array (_ BitVec 32) (_ BitVec 64))) (size!47496 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97262)

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1424904 (= res!959453 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47496 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47496 a!2831))))))

(declare-fun b!1424905 () Bool)

(declare-fun res!959464 () Bool)

(assert (=> b!1424905 (=> (not res!959464) (not e!805517))))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97262 (_ BitVec 32)) Bool)

(assert (=> b!1424905 (= res!959464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1424906 () Bool)

(declare-fun e!805513 () Bool)

(declare-fun e!805512 () Bool)

(assert (=> b!1424906 (= e!805513 e!805512)))

(declare-fun res!959460 () Bool)

(assert (=> b!1424906 (=> res!959460 e!805512)))

(declare-fun lt!627655 () (_ BitVec 32))

(assert (=> b!1424906 (= res!959460 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!627655 #b00000000000000000000000000000000) (bvsge lt!627655 (size!47496 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424906 (= lt!627655 (nextIndex!0 index!585 (bvadd #b00000000000000000000000000000001 x!605) mask!2608))))

(declare-fun b!1424907 () Bool)

(declare-fun e!805514 () Bool)

(declare-fun j!81 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11132 0))(
  ( (MissingZero!11132 (index!46920 (_ BitVec 32))) (Found!11132 (index!46921 (_ BitVec 32))) (Intermediate!11132 (undefined!11944 Bool) (index!46922 (_ BitVec 32)) (x!128719 (_ BitVec 32))) (Undefined!11132) (MissingVacant!11132 (index!46923 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97262 (_ BitVec 32)) SeekEntryResult!11132)

(assert (=> b!1424907 (= e!805514 (= (seekEntryOrOpen!0 (select (arr!46945 a!2831) j!81) a!2831 mask!2608) (Found!11132 j!81)))))

(declare-fun b!1424908 () Bool)

(declare-fun e!805516 () Bool)

(declare-fun e!805515 () Bool)

(assert (=> b!1424908 (= e!805516 e!805515)))

(declare-fun res!959458 () Bool)

(assert (=> b!1424908 (=> (not res!959458) (not e!805515))))

(declare-fun lt!627652 () (_ BitVec 64))

(declare-fun lt!627653 () array!97262)

(declare-fun lt!627654 () SeekEntryResult!11132)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97262 (_ BitVec 32)) SeekEntryResult!11132)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1424908 (= res!959458 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!627652 mask!2608) lt!627652 lt!627653 mask!2608) lt!627654))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1424908 (= lt!627654 (Intermediate!11132 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1424908 (= lt!627652 (select (store (arr!46945 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1424908 (= lt!627653 (array!97263 (store (arr!46945 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47496 a!2831)))))

(declare-fun b!1424909 () Bool)

(assert (=> b!1424909 (= e!805512 true)))

(declare-fun lt!627650 () SeekEntryResult!11132)

(assert (=> b!1424909 (= lt!627650 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627655 lt!627652 lt!627653 mask!2608))))

(declare-fun b!1424910 () Bool)

(declare-fun res!959466 () Bool)

(assert (=> b!1424910 (=> (not res!959466) (not e!805515))))

(assert (=> b!1424910 (= res!959466 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!627652 lt!627653 mask!2608) lt!627654))))

(declare-fun res!959452 () Bool)

(assert (=> start!123026 (=> (not res!959452) (not e!805517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123026 (= res!959452 (validMask!0 mask!2608))))

(assert (=> start!123026 e!805517))

(assert (=> start!123026 true))

(declare-fun array_inv!36226 (array!97262) Bool)

(assert (=> start!123026 (array_inv!36226 a!2831)))

(declare-fun b!1424911 () Bool)

(declare-fun res!959455 () Bool)

(assert (=> b!1424911 (=> (not res!959455) (not e!805517))))

(declare-datatypes ((List!33442 0))(
  ( (Nil!33439) (Cons!33438 (h!34751 (_ BitVec 64)) (t!48128 List!33442)) )
))
(declare-fun arrayNoDuplicates!0 (array!97262 (_ BitVec 32) List!33442) Bool)

(assert (=> b!1424911 (= res!959455 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33439))))

(declare-fun b!1424912 () Bool)

(declare-fun res!959456 () Bool)

(assert (=> b!1424912 (=> (not res!959456) (not e!805517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1424912 (= res!959456 (validKeyInArray!0 (select (arr!46945 a!2831) i!982)))))

(declare-fun b!1424913 () Bool)

(assert (=> b!1424913 (= e!805515 (not e!805513))))

(declare-fun res!959454 () Bool)

(assert (=> b!1424913 (=> res!959454 e!805513)))

(assert (=> b!1424913 (= res!959454 (or (= (select (arr!46945 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46945 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46945 a!2831) index!585) (select (arr!46945 a!2831) j!81)) (= (select (store (arr!46945 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1424913 e!805514))

(declare-fun res!959461 () Bool)

(assert (=> b!1424913 (=> (not res!959461) (not e!805514))))

(assert (=> b!1424913 (= res!959461 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48131 0))(
  ( (Unit!48132) )
))
(declare-fun lt!627651 () Unit!48131)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97262 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48131)

(assert (=> b!1424913 (= lt!627651 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1424914 () Bool)

(assert (=> b!1424914 (= e!805517 e!805516)))

(declare-fun res!959457 () Bool)

(assert (=> b!1424914 (=> (not res!959457) (not e!805516))))

(declare-fun lt!627656 () SeekEntryResult!11132)

(assert (=> b!1424914 (= res!959457 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46945 a!2831) j!81) mask!2608) (select (arr!46945 a!2831) j!81) a!2831 mask!2608) lt!627656))))

(assert (=> b!1424914 (= lt!627656 (Intermediate!11132 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1424915 () Bool)

(declare-fun res!959463 () Bool)

(assert (=> b!1424915 (=> (not res!959463) (not e!805517))))

(assert (=> b!1424915 (= res!959463 (and (= (size!47496 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47496 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47496 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1424916 () Bool)

(declare-fun res!959467 () Bool)

(assert (=> b!1424916 (=> (not res!959467) (not e!805515))))

(assert (=> b!1424916 (= res!959467 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46945 a!2831) j!81) a!2831 mask!2608) lt!627656))))

(declare-fun b!1424917 () Bool)

(declare-fun res!959465 () Bool)

(assert (=> b!1424917 (=> (not res!959465) (not e!805515))))

(assert (=> b!1424917 (= res!959465 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1424918 () Bool)

(declare-fun res!959459 () Bool)

(assert (=> b!1424918 (=> (not res!959459) (not e!805517))))

(assert (=> b!1424918 (= res!959459 (validKeyInArray!0 (select (arr!46945 a!2831) j!81)))))

(declare-fun b!1424919 () Bool)

(declare-fun res!959462 () Bool)

(assert (=> b!1424919 (=> res!959462 e!805512)))

(assert (=> b!1424919 (= res!959462 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!627655 (select (arr!46945 a!2831) j!81) a!2831 mask!2608) lt!627656)))))

(assert (= (and start!123026 res!959452) b!1424915))

(assert (= (and b!1424915 res!959463) b!1424912))

(assert (= (and b!1424912 res!959456) b!1424918))

(assert (= (and b!1424918 res!959459) b!1424905))

(assert (= (and b!1424905 res!959464) b!1424911))

(assert (= (and b!1424911 res!959455) b!1424904))

(assert (= (and b!1424904 res!959453) b!1424914))

(assert (= (and b!1424914 res!959457) b!1424908))

(assert (= (and b!1424908 res!959458) b!1424916))

(assert (= (and b!1424916 res!959467) b!1424910))

(assert (= (and b!1424910 res!959466) b!1424917))

(assert (= (and b!1424917 res!959465) b!1424913))

(assert (= (and b!1424913 res!959461) b!1424907))

(assert (= (and b!1424913 (not res!959454)) b!1424906))

(assert (= (and b!1424906 (not res!959460)) b!1424919))

(assert (= (and b!1424919 (not res!959462)) b!1424909))

(declare-fun m!1315569 () Bool)

(assert (=> b!1424906 m!1315569))

(declare-fun m!1315571 () Bool)

(assert (=> b!1424916 m!1315571))

(assert (=> b!1424916 m!1315571))

(declare-fun m!1315573 () Bool)

(assert (=> b!1424916 m!1315573))

(declare-fun m!1315575 () Bool)

(assert (=> b!1424912 m!1315575))

(assert (=> b!1424912 m!1315575))

(declare-fun m!1315577 () Bool)

(assert (=> b!1424912 m!1315577))

(declare-fun m!1315579 () Bool)

(assert (=> b!1424905 m!1315579))

(assert (=> b!1424919 m!1315571))

(assert (=> b!1424919 m!1315571))

(declare-fun m!1315581 () Bool)

(assert (=> b!1424919 m!1315581))

(assert (=> b!1424918 m!1315571))

(assert (=> b!1424918 m!1315571))

(declare-fun m!1315583 () Bool)

(assert (=> b!1424918 m!1315583))

(declare-fun m!1315585 () Bool)

(assert (=> b!1424913 m!1315585))

(declare-fun m!1315587 () Bool)

(assert (=> b!1424913 m!1315587))

(declare-fun m!1315589 () Bool)

(assert (=> b!1424913 m!1315589))

(declare-fun m!1315591 () Bool)

(assert (=> b!1424913 m!1315591))

(assert (=> b!1424913 m!1315571))

(declare-fun m!1315593 () Bool)

(assert (=> b!1424913 m!1315593))

(declare-fun m!1315595 () Bool)

(assert (=> b!1424908 m!1315595))

(assert (=> b!1424908 m!1315595))

(declare-fun m!1315597 () Bool)

(assert (=> b!1424908 m!1315597))

(assert (=> b!1424908 m!1315585))

(declare-fun m!1315599 () Bool)

(assert (=> b!1424908 m!1315599))

(declare-fun m!1315601 () Bool)

(assert (=> start!123026 m!1315601))

(declare-fun m!1315603 () Bool)

(assert (=> start!123026 m!1315603))

(assert (=> b!1424914 m!1315571))

(assert (=> b!1424914 m!1315571))

(declare-fun m!1315605 () Bool)

(assert (=> b!1424914 m!1315605))

(assert (=> b!1424914 m!1315605))

(assert (=> b!1424914 m!1315571))

(declare-fun m!1315607 () Bool)

(assert (=> b!1424914 m!1315607))

(declare-fun m!1315609 () Bool)

(assert (=> b!1424909 m!1315609))

(declare-fun m!1315611 () Bool)

(assert (=> b!1424911 m!1315611))

(assert (=> b!1424907 m!1315571))

(assert (=> b!1424907 m!1315571))

(declare-fun m!1315613 () Bool)

(assert (=> b!1424907 m!1315613))

(declare-fun m!1315615 () Bool)

(assert (=> b!1424910 m!1315615))

(check-sat (not b!1424906) (not b!1424908) (not start!123026) (not b!1424918) (not b!1424907) (not b!1424910) (not b!1424909) (not b!1424914) (not b!1424905) (not b!1424911) (not b!1424919) (not b!1424916) (not b!1424913) (not b!1424912))
(check-sat)
