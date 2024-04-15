; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124660 () Bool)

(assert start!124660)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1444856 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!813969 () Bool)

(declare-datatypes ((array!98086 0))(
  ( (array!98087 (arr!47332 (Array (_ BitVec 32) (_ BitVec 64))) (size!47884 (_ BitVec 32))) )
))
(declare-fun lt!634149 () array!98086)

(declare-datatypes ((SeekEntryResult!11609 0))(
  ( (MissingZero!11609 (index!48828 (_ BitVec 32))) (Found!11609 (index!48829 (_ BitVec 32))) (Intermediate!11609 (undefined!12421 Bool) (index!48830 (_ BitVec 32)) (x!130517 (_ BitVec 32))) (Undefined!11609) (MissingVacant!11609 (index!48831 (_ BitVec 32))) )
))
(declare-fun lt!634150 () SeekEntryResult!11609)

(declare-fun lt!634151 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98086 (_ BitVec 32)) SeekEntryResult!11609)

(assert (=> b!1444856 (= e!813969 (= lt!634150 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634151 lt!634149 mask!2687)))))

(declare-fun res!976895 () Bool)

(declare-fun e!813971 () Bool)

(assert (=> start!124660 (=> (not res!976895) (not e!813971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124660 (= res!976895 (validMask!0 mask!2687))))

(assert (=> start!124660 e!813971))

(assert (=> start!124660 true))

(declare-fun a!2862 () array!98086)

(declare-fun array_inv!36565 (array!98086) Bool)

(assert (=> start!124660 (array_inv!36565 a!2862)))

(declare-fun b!1444857 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98086 (_ BitVec 32)) SeekEntryResult!11609)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98086 (_ BitVec 32)) SeekEntryResult!11609)

(assert (=> b!1444857 (= e!813969 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634151 lt!634149 mask!2687) (seekEntryOrOpen!0 lt!634151 lt!634149 mask!2687)))))

(declare-fun b!1444858 () Bool)

(declare-fun res!976896 () Bool)

(assert (=> b!1444858 (=> (not res!976896) (not e!813971))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444858 (= res!976896 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47884 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47884 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47884 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1444859 () Bool)

(declare-fun e!813967 () Bool)

(assert (=> b!1444859 (= e!813967 (not true))))

(declare-fun e!813972 () Bool)

(assert (=> b!1444859 e!813972))

(declare-fun res!976898 () Bool)

(assert (=> b!1444859 (=> (not res!976898) (not e!813972))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98086 (_ BitVec 32)) Bool)

(assert (=> b!1444859 (= res!976898 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48555 0))(
  ( (Unit!48556) )
))
(declare-fun lt!634148 () Unit!48555)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48555)

(assert (=> b!1444859 (= lt!634148 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444860 () Bool)

(declare-fun res!976897 () Bool)

(declare-fun e!813968 () Bool)

(assert (=> b!1444860 (=> (not res!976897) (not e!813968))))

(declare-fun lt!634152 () SeekEntryResult!11609)

(assert (=> b!1444860 (= res!976897 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47332 a!2862) j!93) a!2862 mask!2687) lt!634152))))

(declare-fun b!1444861 () Bool)

(declare-fun res!976904 () Bool)

(assert (=> b!1444861 (=> (not res!976904) (not e!813967))))

(assert (=> b!1444861 (= res!976904 e!813969)))

(declare-fun c!133495 () Bool)

(assert (=> b!1444861 (= c!133495 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444862 () Bool)

(declare-fun e!813970 () Bool)

(assert (=> b!1444862 (= e!813970 e!813968)))

(declare-fun res!976893 () Bool)

(assert (=> b!1444862 (=> (not res!976893) (not e!813968))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444862 (= res!976893 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47332 a!2862) j!93) mask!2687) (select (arr!47332 a!2862) j!93) a!2862 mask!2687) lt!634152))))

(assert (=> b!1444862 (= lt!634152 (Intermediate!11609 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444863 () Bool)

(declare-fun res!976892 () Bool)

(assert (=> b!1444863 (=> (not res!976892) (not e!813971))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444863 (= res!976892 (validKeyInArray!0 (select (arr!47332 a!2862) i!1006)))))

(declare-fun b!1444864 () Bool)

(declare-fun res!976900 () Bool)

(assert (=> b!1444864 (=> (not res!976900) (not e!813971))))

(assert (=> b!1444864 (= res!976900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444865 () Bool)

(declare-fun res!976905 () Bool)

(assert (=> b!1444865 (=> (not res!976905) (not e!813967))))

(assert (=> b!1444865 (= res!976905 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444866 () Bool)

(declare-fun res!976899 () Bool)

(assert (=> b!1444866 (=> (not res!976899) (not e!813971))))

(assert (=> b!1444866 (= res!976899 (validKeyInArray!0 (select (arr!47332 a!2862) j!93)))))

(declare-fun b!1444867 () Bool)

(declare-fun res!976901 () Bool)

(assert (=> b!1444867 (=> (not res!976901) (not e!813972))))

(assert (=> b!1444867 (= res!976901 (= (seekEntryOrOpen!0 (select (arr!47332 a!2862) j!93) a!2862 mask!2687) (Found!11609 j!93)))))

(declare-fun b!1444868 () Bool)

(declare-fun res!976894 () Bool)

(assert (=> b!1444868 (=> (not res!976894) (not e!813971))))

(assert (=> b!1444868 (= res!976894 (and (= (size!47884 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47884 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47884 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1444869 () Bool)

(assert (=> b!1444869 (= e!813968 e!813967)))

(declare-fun res!976903 () Bool)

(assert (=> b!1444869 (=> (not res!976903) (not e!813967))))

(assert (=> b!1444869 (= res!976903 (= lt!634150 (Intermediate!11609 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444869 (= lt!634150 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634151 mask!2687) lt!634151 lt!634149 mask!2687))))

(assert (=> b!1444869 (= lt!634151 (select (store (arr!47332 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444870 () Bool)

(assert (=> b!1444870 (= e!813971 e!813970)))

(declare-fun res!976902 () Bool)

(assert (=> b!1444870 (=> (not res!976902) (not e!813970))))

(assert (=> b!1444870 (= res!976902 (= (select (store (arr!47332 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1444870 (= lt!634149 (array!98087 (store (arr!47332 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47884 a!2862)))))

(declare-fun b!1444871 () Bool)

(assert (=> b!1444871 (= e!813972 (or (= (select (arr!47332 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47332 a!2862) intermediateBeforeIndex!19) (select (arr!47332 a!2862) j!93))))))

(declare-fun b!1444872 () Bool)

(declare-fun res!976906 () Bool)

(assert (=> b!1444872 (=> (not res!976906) (not e!813971))))

(declare-datatypes ((List!33911 0))(
  ( (Nil!33908) (Cons!33907 (h!35257 (_ BitVec 64)) (t!48597 List!33911)) )
))
(declare-fun arrayNoDuplicates!0 (array!98086 (_ BitVec 32) List!33911) Bool)

(assert (=> b!1444872 (= res!976906 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33908))))

(assert (= (and start!124660 res!976895) b!1444868))

(assert (= (and b!1444868 res!976894) b!1444863))

(assert (= (and b!1444863 res!976892) b!1444866))

(assert (= (and b!1444866 res!976899) b!1444864))

(assert (= (and b!1444864 res!976900) b!1444872))

(assert (= (and b!1444872 res!976906) b!1444858))

(assert (= (and b!1444858 res!976896) b!1444870))

(assert (= (and b!1444870 res!976902) b!1444862))

(assert (= (and b!1444862 res!976893) b!1444860))

(assert (= (and b!1444860 res!976897) b!1444869))

(assert (= (and b!1444869 res!976903) b!1444861))

(assert (= (and b!1444861 c!133495) b!1444856))

(assert (= (and b!1444861 (not c!133495)) b!1444857))

(assert (= (and b!1444861 res!976904) b!1444865))

(assert (= (and b!1444865 res!976905) b!1444859))

(assert (= (and b!1444859 res!976898) b!1444867))

(assert (= (and b!1444867 res!976901) b!1444871))

(declare-fun m!1333359 () Bool)

(assert (=> b!1444870 m!1333359))

(declare-fun m!1333361 () Bool)

(assert (=> b!1444870 m!1333361))

(declare-fun m!1333363 () Bool)

(assert (=> b!1444869 m!1333363))

(assert (=> b!1444869 m!1333363))

(declare-fun m!1333365 () Bool)

(assert (=> b!1444869 m!1333365))

(assert (=> b!1444869 m!1333359))

(declare-fun m!1333367 () Bool)

(assert (=> b!1444869 m!1333367))

(declare-fun m!1333369 () Bool)

(assert (=> b!1444864 m!1333369))

(declare-fun m!1333371 () Bool)

(assert (=> start!124660 m!1333371))

(declare-fun m!1333373 () Bool)

(assert (=> start!124660 m!1333373))

(declare-fun m!1333375 () Bool)

(assert (=> b!1444862 m!1333375))

(assert (=> b!1444862 m!1333375))

(declare-fun m!1333377 () Bool)

(assert (=> b!1444862 m!1333377))

(assert (=> b!1444862 m!1333377))

(assert (=> b!1444862 m!1333375))

(declare-fun m!1333379 () Bool)

(assert (=> b!1444862 m!1333379))

(assert (=> b!1444866 m!1333375))

(assert (=> b!1444866 m!1333375))

(declare-fun m!1333381 () Bool)

(assert (=> b!1444866 m!1333381))

(declare-fun m!1333383 () Bool)

(assert (=> b!1444872 m!1333383))

(declare-fun m!1333385 () Bool)

(assert (=> b!1444863 m!1333385))

(assert (=> b!1444863 m!1333385))

(declare-fun m!1333387 () Bool)

(assert (=> b!1444863 m!1333387))

(declare-fun m!1333389 () Bool)

(assert (=> b!1444856 m!1333389))

(declare-fun m!1333391 () Bool)

(assert (=> b!1444859 m!1333391))

(declare-fun m!1333393 () Bool)

(assert (=> b!1444859 m!1333393))

(assert (=> b!1444867 m!1333375))

(assert (=> b!1444867 m!1333375))

(declare-fun m!1333395 () Bool)

(assert (=> b!1444867 m!1333395))

(assert (=> b!1444860 m!1333375))

(assert (=> b!1444860 m!1333375))

(declare-fun m!1333397 () Bool)

(assert (=> b!1444860 m!1333397))

(declare-fun m!1333399 () Bool)

(assert (=> b!1444871 m!1333399))

(assert (=> b!1444871 m!1333375))

(declare-fun m!1333401 () Bool)

(assert (=> b!1444857 m!1333401))

(declare-fun m!1333403 () Bool)

(assert (=> b!1444857 m!1333403))

(check-sat (not b!1444860) (not b!1444862) (not b!1444856) (not b!1444872) (not start!124660) (not b!1444857) (not b!1444859) (not b!1444866) (not b!1444867) (not b!1444869) (not b!1444864) (not b!1444863))
(check-sat)
