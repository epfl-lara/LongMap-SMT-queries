; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125272 () Bool)

(assert start!125272)

(declare-fun b!1462449 () Bool)

(declare-fun e!822076 () Bool)

(declare-fun e!822080 () Bool)

(assert (=> b!1462449 (= e!822076 e!822080)))

(declare-fun res!991881 () Bool)

(assert (=> b!1462449 (=> (not res!991881) (not e!822080))))

(declare-datatypes ((SeekEntryResult!11900 0))(
  ( (MissingZero!11900 (index!49992 (_ BitVec 32))) (Found!11900 (index!49993 (_ BitVec 32))) (Intermediate!11900 (undefined!12712 Bool) (index!49994 (_ BitVec 32)) (x!131589 (_ BitVec 32))) (Undefined!11900) (MissingVacant!11900 (index!49995 (_ BitVec 32))) )
))
(declare-fun lt!640457 () SeekEntryResult!11900)

(declare-datatypes ((array!98720 0))(
  ( (array!98721 (arr!47648 (Array (_ BitVec 32) (_ BitVec 64))) (size!48198 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98720)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98720 (_ BitVec 32)) SeekEntryResult!11900)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462449 (= res!991881 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47648 a!2862) j!93) mask!2687) (select (arr!47648 a!2862) j!93) a!2862 mask!2687) lt!640457))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1462449 (= lt!640457 (Intermediate!11900 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1462450 () Bool)

(declare-fun res!991884 () Bool)

(declare-fun e!822072 () Bool)

(assert (=> b!1462450 (=> res!991884 e!822072)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!640452 () (_ BitVec 32))

(assert (=> b!1462450 (= res!991884 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640452 (select (arr!47648 a!2862) j!93) a!2862 mask!2687) lt!640457)))))

(declare-fun lt!640454 () array!98720)

(declare-fun lt!640455 () (_ BitVec 64))

(declare-fun b!1462451 () Bool)

(declare-fun e!822073 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98720 (_ BitVec 32)) SeekEntryResult!11900)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98720 (_ BitVec 32)) SeekEntryResult!11900)

(assert (=> b!1462451 (= e!822073 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640452 intermediateAfterIndex!19 lt!640455 lt!640454 mask!2687) (seekEntryOrOpen!0 lt!640455 lt!640454 mask!2687))))))

(declare-fun lt!640453 () SeekEntryResult!11900)

(declare-fun b!1462452 () Bool)

(assert (=> b!1462452 (= e!822073 (not (= lt!640453 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640452 lt!640455 lt!640454 mask!2687))))))

(declare-fun e!822077 () Bool)

(declare-fun b!1462453 () Bool)

(assert (=> b!1462453 (= e!822077 (or (= (select (arr!47648 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47648 a!2862) intermediateBeforeIndex!19) (select (arr!47648 a!2862) j!93))))))

(declare-fun b!1462454 () Bool)

(declare-fun res!991887 () Bool)

(declare-fun e!822071 () Bool)

(assert (=> b!1462454 (=> (not res!991887) (not e!822071))))

(declare-datatypes ((List!34149 0))(
  ( (Nil!34146) (Cons!34145 (h!35495 (_ BitVec 64)) (t!48843 List!34149)) )
))
(declare-fun arrayNoDuplicates!0 (array!98720 (_ BitVec 32) List!34149) Bool)

(assert (=> b!1462454 (= res!991887 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34146))))

(declare-fun b!1462455 () Bool)

(declare-fun e!822075 () Bool)

(assert (=> b!1462455 (= e!822075 e!822072)))

(declare-fun res!991894 () Bool)

(assert (=> b!1462455 (=> res!991894 e!822072)))

(assert (=> b!1462455 (= res!991894 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640452 #b00000000000000000000000000000000) (bvsge lt!640452 (size!48198 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1462455 (= lt!640452 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1462456 () Bool)

(declare-fun res!991895 () Bool)

(assert (=> b!1462456 (=> (not res!991895) (not e!822071))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98720 (_ BitVec 32)) Bool)

(assert (=> b!1462456 (= res!991895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1462457 () Bool)

(declare-fun res!991883 () Bool)

(declare-fun e!822074 () Bool)

(assert (=> b!1462457 (=> (not res!991883) (not e!822074))))

(declare-fun e!822078 () Bool)

(assert (=> b!1462457 (= res!991883 e!822078)))

(declare-fun c!134796 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1462457 (= c!134796 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1462458 () Bool)

(assert (=> b!1462458 (= e!822080 e!822074)))

(declare-fun res!991897 () Bool)

(assert (=> b!1462458 (=> (not res!991897) (not e!822074))))

(assert (=> b!1462458 (= res!991897 (= lt!640453 (Intermediate!11900 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1462458 (= lt!640453 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640455 mask!2687) lt!640455 lt!640454 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1462458 (= lt!640455 (select (store (arr!47648 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1462459 () Bool)

(assert (=> b!1462459 (= e!822071 e!822076)))

(declare-fun res!991885 () Bool)

(assert (=> b!1462459 (=> (not res!991885) (not e!822076))))

(assert (=> b!1462459 (= res!991885 (= (select (store (arr!47648 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1462459 (= lt!640454 (array!98721 (store (arr!47648 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48198 a!2862)))))

(declare-fun b!1462460 () Bool)

(declare-fun res!991882 () Bool)

(assert (=> b!1462460 (=> (not res!991882) (not e!822071))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1462460 (= res!991882 (validKeyInArray!0 (select (arr!47648 a!2862) i!1006)))))

(declare-fun b!1462461 () Bool)

(declare-fun res!991891 () Bool)

(assert (=> b!1462461 (=> (not res!991891) (not e!822071))))

(assert (=> b!1462461 (= res!991891 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48198 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48198 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48198 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1462462 () Bool)

(declare-fun res!991888 () Bool)

(assert (=> b!1462462 (=> (not res!991888) (not e!822077))))

(assert (=> b!1462462 (= res!991888 (= (seekEntryOrOpen!0 (select (arr!47648 a!2862) j!93) a!2862 mask!2687) (Found!11900 j!93)))))

(declare-fun b!1462463 () Bool)

(declare-fun res!991893 () Bool)

(assert (=> b!1462463 (=> (not res!991893) (not e!822074))))

(assert (=> b!1462463 (= res!991893 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1462464 () Bool)

(declare-fun res!991890 () Bool)

(assert (=> b!1462464 (=> (not res!991890) (not e!822080))))

(assert (=> b!1462464 (= res!991890 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47648 a!2862) j!93) a!2862 mask!2687) lt!640457))))

(declare-fun res!991896 () Bool)

(assert (=> start!125272 (=> (not res!991896) (not e!822071))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125272 (= res!991896 (validMask!0 mask!2687))))

(assert (=> start!125272 e!822071))

(assert (=> start!125272 true))

(declare-fun array_inv!36676 (array!98720) Bool)

(assert (=> start!125272 (array_inv!36676 a!2862)))

(declare-fun b!1462465 () Bool)

(assert (=> b!1462465 (= e!822078 (= lt!640453 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640455 lt!640454 mask!2687)))))

(declare-fun b!1462466 () Bool)

(declare-fun res!991889 () Bool)

(assert (=> b!1462466 (=> (not res!991889) (not e!822071))))

(assert (=> b!1462466 (= res!991889 (validKeyInArray!0 (select (arr!47648 a!2862) j!93)))))

(declare-fun b!1462467 () Bool)

(assert (=> b!1462467 (= e!822078 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640455 lt!640454 mask!2687) (seekEntryOrOpen!0 lt!640455 lt!640454 mask!2687)))))

(declare-fun b!1462468 () Bool)

(declare-fun res!991880 () Bool)

(assert (=> b!1462468 (=> (not res!991880) (not e!822071))))

(assert (=> b!1462468 (= res!991880 (and (= (size!48198 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48198 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48198 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1462469 () Bool)

(assert (=> b!1462469 (= e!822074 (not e!822075))))

(declare-fun res!991892 () Bool)

(assert (=> b!1462469 (=> res!991892 e!822075)))

(assert (=> b!1462469 (= res!991892 (or (and (= (select (arr!47648 a!2862) index!646) (select (store (arr!47648 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47648 a!2862) index!646) (select (arr!47648 a!2862) j!93))) (= (select (arr!47648 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1462469 e!822077))

(declare-fun res!991886 () Bool)

(assert (=> b!1462469 (=> (not res!991886) (not e!822077))))

(assert (=> b!1462469 (= res!991886 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49296 0))(
  ( (Unit!49297) )
))
(declare-fun lt!640458 () Unit!49296)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49296)

(assert (=> b!1462469 (= lt!640458 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1462470 () Bool)

(assert (=> b!1462470 (= e!822072 true)))

(declare-fun lt!640456 () Bool)

(assert (=> b!1462470 (= lt!640456 e!822073)))

(declare-fun c!134795 () Bool)

(assert (=> b!1462470 (= c!134795 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(assert (= (and start!125272 res!991896) b!1462468))

(assert (= (and b!1462468 res!991880) b!1462460))

(assert (= (and b!1462460 res!991882) b!1462466))

(assert (= (and b!1462466 res!991889) b!1462456))

(assert (= (and b!1462456 res!991895) b!1462454))

(assert (= (and b!1462454 res!991887) b!1462461))

(assert (= (and b!1462461 res!991891) b!1462459))

(assert (= (and b!1462459 res!991885) b!1462449))

(assert (= (and b!1462449 res!991881) b!1462464))

(assert (= (and b!1462464 res!991890) b!1462458))

(assert (= (and b!1462458 res!991897) b!1462457))

(assert (= (and b!1462457 c!134796) b!1462465))

(assert (= (and b!1462457 (not c!134796)) b!1462467))

(assert (= (and b!1462457 res!991883) b!1462463))

(assert (= (and b!1462463 res!991893) b!1462469))

(assert (= (and b!1462469 res!991886) b!1462462))

(assert (= (and b!1462462 res!991888) b!1462453))

(assert (= (and b!1462469 (not res!991892)) b!1462455))

(assert (= (and b!1462455 (not res!991894)) b!1462450))

(assert (= (and b!1462450 (not res!991884)) b!1462470))

(assert (= (and b!1462470 c!134795) b!1462452))

(assert (= (and b!1462470 (not c!134795)) b!1462451))

(declare-fun m!1349905 () Bool)

(assert (=> b!1462462 m!1349905))

(assert (=> b!1462462 m!1349905))

(declare-fun m!1349907 () Bool)

(assert (=> b!1462462 m!1349907))

(declare-fun m!1349909 () Bool)

(assert (=> b!1462469 m!1349909))

(declare-fun m!1349911 () Bool)

(assert (=> b!1462469 m!1349911))

(declare-fun m!1349913 () Bool)

(assert (=> b!1462469 m!1349913))

(declare-fun m!1349915 () Bool)

(assert (=> b!1462469 m!1349915))

(declare-fun m!1349917 () Bool)

(assert (=> b!1462469 m!1349917))

(assert (=> b!1462469 m!1349905))

(declare-fun m!1349919 () Bool)

(assert (=> b!1462451 m!1349919))

(declare-fun m!1349921 () Bool)

(assert (=> b!1462451 m!1349921))

(declare-fun m!1349923 () Bool)

(assert (=> start!125272 m!1349923))

(declare-fun m!1349925 () Bool)

(assert (=> start!125272 m!1349925))

(declare-fun m!1349927 () Bool)

(assert (=> b!1462454 m!1349927))

(assert (=> b!1462464 m!1349905))

(assert (=> b!1462464 m!1349905))

(declare-fun m!1349929 () Bool)

(assert (=> b!1462464 m!1349929))

(declare-fun m!1349931 () Bool)

(assert (=> b!1462453 m!1349931))

(assert (=> b!1462453 m!1349905))

(declare-fun m!1349933 () Bool)

(assert (=> b!1462467 m!1349933))

(assert (=> b!1462467 m!1349921))

(declare-fun m!1349935 () Bool)

(assert (=> b!1462460 m!1349935))

(assert (=> b!1462460 m!1349935))

(declare-fun m!1349937 () Bool)

(assert (=> b!1462460 m!1349937))

(assert (=> b!1462466 m!1349905))

(assert (=> b!1462466 m!1349905))

(declare-fun m!1349939 () Bool)

(assert (=> b!1462466 m!1349939))

(assert (=> b!1462450 m!1349905))

(assert (=> b!1462450 m!1349905))

(declare-fun m!1349941 () Bool)

(assert (=> b!1462450 m!1349941))

(assert (=> b!1462459 m!1349911))

(declare-fun m!1349943 () Bool)

(assert (=> b!1462459 m!1349943))

(declare-fun m!1349945 () Bool)

(assert (=> b!1462456 m!1349945))

(declare-fun m!1349947 () Bool)

(assert (=> b!1462455 m!1349947))

(declare-fun m!1349949 () Bool)

(assert (=> b!1462465 m!1349949))

(declare-fun m!1349951 () Bool)

(assert (=> b!1462458 m!1349951))

(assert (=> b!1462458 m!1349951))

(declare-fun m!1349953 () Bool)

(assert (=> b!1462458 m!1349953))

(assert (=> b!1462458 m!1349911))

(declare-fun m!1349955 () Bool)

(assert (=> b!1462458 m!1349955))

(assert (=> b!1462449 m!1349905))

(assert (=> b!1462449 m!1349905))

(declare-fun m!1349957 () Bool)

(assert (=> b!1462449 m!1349957))

(assert (=> b!1462449 m!1349957))

(assert (=> b!1462449 m!1349905))

(declare-fun m!1349959 () Bool)

(assert (=> b!1462449 m!1349959))

(declare-fun m!1349961 () Bool)

(assert (=> b!1462452 m!1349961))

(push 1)

