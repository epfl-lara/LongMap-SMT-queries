; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!123872 () Bool)

(assert start!123872)

(declare-fun b!1435502 () Bool)

(declare-fun e!810157 () Bool)

(declare-fun e!810158 () Bool)

(assert (=> b!1435502 (= e!810157 e!810158)))

(declare-fun res!968511 () Bool)

(assert (=> b!1435502 (=> (not res!968511) (not e!810158))))

(declare-datatypes ((array!97616 0))(
  ( (array!97617 (arr!47109 (Array (_ BitVec 32) (_ BitVec 64))) (size!47659 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97616)

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11388 0))(
  ( (MissingZero!11388 (index!47944 (_ BitVec 32))) (Found!11388 (index!47945 (_ BitVec 32))) (Intermediate!11388 (undefined!12200 Bool) (index!47946 (_ BitVec 32)) (x!129610 (_ BitVec 32))) (Undefined!11388) (MissingVacant!11388 (index!47947 (_ BitVec 32))) )
))
(declare-fun lt!631910 () SeekEntryResult!11388)

(declare-fun j!81 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97616 (_ BitVec 32)) SeekEntryResult!11388)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435502 (= res!968511 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47109 a!2831) j!81) mask!2608) (select (arr!47109 a!2831) j!81) a!2831 mask!2608) lt!631910))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1435502 (= lt!631910 (Intermediate!11388 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1435503 () Bool)

(declare-fun res!968521 () Bool)

(declare-fun e!810160 () Bool)

(assert (=> b!1435503 (=> res!968521 e!810160)))

(declare-fun lt!631909 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(assert (=> b!1435503 (= res!968521 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631909 (select (arr!47109 a!2831) j!81) a!2831 mask!2608) lt!631910)))))

(declare-fun b!1435504 () Bool)

(declare-fun res!968519 () Bool)

(declare-fun e!810155 () Bool)

(assert (=> b!1435504 (=> (not res!968519) (not e!810155))))

(declare-fun lt!631908 () SeekEntryResult!11388)

(declare-fun lt!631907 () (_ BitVec 64))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun lt!631906 () array!97616)

(assert (=> b!1435504 (= res!968519 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!631907 lt!631906 mask!2608) lt!631908))))

(declare-fun b!1435505 () Bool)

(assert (=> b!1435505 (= e!810160 (bvslt (bvsub #b01111111111111111111111111111110 (bvadd #b00000000000000000000000000000001 x!605)) (bvsub #b01111111111111111111111111111110 x!605)))))

(declare-fun b!1435506 () Bool)

(declare-fun res!968517 () Bool)

(assert (=> b!1435506 (=> (not res!968517) (not e!810155))))

(assert (=> b!1435506 (= res!968517 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47109 a!2831) j!81) a!2831 mask!2608) lt!631910))))

(declare-fun b!1435507 () Bool)

(declare-fun res!968515 () Bool)

(assert (=> b!1435507 (=> (not res!968515) (not e!810157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1435507 (= res!968515 (validKeyInArray!0 (select (arr!47109 a!2831) j!81)))))

(declare-fun b!1435509 () Bool)

(declare-fun res!968518 () Bool)

(assert (=> b!1435509 (=> (not res!968518) (not e!810157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97616 (_ BitVec 32)) Bool)

(assert (=> b!1435509 (= res!968518 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1435510 () Bool)

(declare-fun e!810159 () Bool)

(assert (=> b!1435510 (= e!810155 (not e!810159))))

(declare-fun res!968514 () Bool)

(assert (=> b!1435510 (=> res!968514 e!810159)))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1435510 (= res!968514 (or (= (select (arr!47109 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47109 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47109 a!2831) index!585) (select (arr!47109 a!2831) j!81)) (= (select (store (arr!47109 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!810161 () Bool)

(assert (=> b!1435510 e!810161))

(declare-fun res!968512 () Bool)

(assert (=> b!1435510 (=> (not res!968512) (not e!810161))))

(assert (=> b!1435510 (= res!968512 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48522 0))(
  ( (Unit!48523) )
))
(declare-fun lt!631911 () Unit!48522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97616 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48522)

(assert (=> b!1435510 (= lt!631911 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1435511 () Bool)

(assert (=> b!1435511 (= e!810158 e!810155)))

(declare-fun res!968522 () Bool)

(assert (=> b!1435511 (=> (not res!968522) (not e!810155))))

(assert (=> b!1435511 (= res!968522 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!631907 mask!2608) lt!631907 lt!631906 mask!2608) lt!631908))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1435511 (= lt!631908 (Intermediate!11388 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1435511 (= lt!631907 (select (store (arr!47109 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1435511 (= lt!631906 (array!97617 (store (arr!47109 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47659 a!2831)))))

(declare-fun b!1435512 () Bool)

(declare-fun res!968513 () Bool)

(assert (=> b!1435512 (=> (not res!968513) (not e!810157))))

(assert (=> b!1435512 (= res!968513 (and (= (size!47659 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47659 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47659 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1435513 () Bool)

(declare-fun res!968516 () Bool)

(assert (=> b!1435513 (=> (not res!968516) (not e!810157))))

(assert (=> b!1435513 (= res!968516 (validKeyInArray!0 (select (arr!47109 a!2831) i!982)))))

(declare-fun b!1435514 () Bool)

(declare-fun res!968509 () Bool)

(assert (=> b!1435514 (=> (not res!968509) (not e!810157))))

(declare-datatypes ((List!33619 0))(
  ( (Nil!33616) (Cons!33615 (h!34950 (_ BitVec 64)) (t!48313 List!33619)) )
))
(declare-fun arrayNoDuplicates!0 (array!97616 (_ BitVec 32) List!33619) Bool)

(assert (=> b!1435514 (= res!968509 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33616))))

(declare-fun res!968524 () Bool)

(assert (=> start!123872 (=> (not res!968524) (not e!810157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123872 (= res!968524 (validMask!0 mask!2608))))

(assert (=> start!123872 e!810157))

(assert (=> start!123872 true))

(declare-fun array_inv!36137 (array!97616) Bool)

(assert (=> start!123872 (array_inv!36137 a!2831)))

(declare-fun b!1435508 () Bool)

(declare-fun res!968520 () Bool)

(assert (=> b!1435508 (=> res!968520 e!810160)))

(assert (=> b!1435508 (= res!968520 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!631909 lt!631907 lt!631906 mask!2608) lt!631908)))))

(declare-fun b!1435515 () Bool)

(assert (=> b!1435515 (= e!810159 e!810160)))

(declare-fun res!968523 () Bool)

(assert (=> b!1435515 (=> res!968523 e!810160)))

(assert (=> b!1435515 (= res!968523 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!631909 #b00000000000000000000000000000000) (bvsge lt!631909 (size!47659 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1435515 (= lt!631909 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1435516 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97616 (_ BitVec 32)) SeekEntryResult!11388)

(assert (=> b!1435516 (= e!810161 (= (seekEntryOrOpen!0 (select (arr!47109 a!2831) j!81) a!2831 mask!2608) (Found!11388 j!81)))))

(declare-fun b!1435517 () Bool)

(declare-fun res!968508 () Bool)

(assert (=> b!1435517 (=> (not res!968508) (not e!810155))))

(assert (=> b!1435517 (= res!968508 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1435518 () Bool)

(declare-fun res!968510 () Bool)

(assert (=> b!1435518 (=> (not res!968510) (not e!810157))))

(assert (=> b!1435518 (= res!968510 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47659 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47659 a!2831))))))

(assert (= (and start!123872 res!968524) b!1435512))

(assert (= (and b!1435512 res!968513) b!1435513))

(assert (= (and b!1435513 res!968516) b!1435507))

(assert (= (and b!1435507 res!968515) b!1435509))

(assert (= (and b!1435509 res!968518) b!1435514))

(assert (= (and b!1435514 res!968509) b!1435518))

(assert (= (and b!1435518 res!968510) b!1435502))

(assert (= (and b!1435502 res!968511) b!1435511))

(assert (= (and b!1435511 res!968522) b!1435506))

(assert (= (and b!1435506 res!968517) b!1435504))

(assert (= (and b!1435504 res!968519) b!1435517))

(assert (= (and b!1435517 res!968508) b!1435510))

(assert (= (and b!1435510 res!968512) b!1435516))

(assert (= (and b!1435510 (not res!968514)) b!1435515))

(assert (= (and b!1435515 (not res!968523)) b!1435503))

(assert (= (and b!1435503 (not res!968521)) b!1435508))

(assert (= (and b!1435508 (not res!968520)) b!1435505))

(declare-fun m!1324857 () Bool)

(assert (=> b!1435516 m!1324857))

(assert (=> b!1435516 m!1324857))

(declare-fun m!1324859 () Bool)

(assert (=> b!1435516 m!1324859))

(declare-fun m!1324861 () Bool)

(assert (=> b!1435510 m!1324861))

(declare-fun m!1324863 () Bool)

(assert (=> b!1435510 m!1324863))

(declare-fun m!1324865 () Bool)

(assert (=> b!1435510 m!1324865))

(declare-fun m!1324867 () Bool)

(assert (=> b!1435510 m!1324867))

(assert (=> b!1435510 m!1324857))

(declare-fun m!1324869 () Bool)

(assert (=> b!1435510 m!1324869))

(declare-fun m!1324871 () Bool)

(assert (=> b!1435504 m!1324871))

(assert (=> b!1435506 m!1324857))

(assert (=> b!1435506 m!1324857))

(declare-fun m!1324873 () Bool)

(assert (=> b!1435506 m!1324873))

(assert (=> b!1435502 m!1324857))

(assert (=> b!1435502 m!1324857))

(declare-fun m!1324875 () Bool)

(assert (=> b!1435502 m!1324875))

(assert (=> b!1435502 m!1324875))

(assert (=> b!1435502 m!1324857))

(declare-fun m!1324877 () Bool)

(assert (=> b!1435502 m!1324877))

(assert (=> b!1435503 m!1324857))

(assert (=> b!1435503 m!1324857))

(declare-fun m!1324879 () Bool)

(assert (=> b!1435503 m!1324879))

(declare-fun m!1324881 () Bool)

(assert (=> b!1435514 m!1324881))

(declare-fun m!1324883 () Bool)

(assert (=> b!1435515 m!1324883))

(declare-fun m!1324885 () Bool)

(assert (=> start!123872 m!1324885))

(declare-fun m!1324887 () Bool)

(assert (=> start!123872 m!1324887))

(declare-fun m!1324889 () Bool)

(assert (=> b!1435511 m!1324889))

(assert (=> b!1435511 m!1324889))

(declare-fun m!1324891 () Bool)

(assert (=> b!1435511 m!1324891))

(assert (=> b!1435511 m!1324861))

(declare-fun m!1324893 () Bool)

(assert (=> b!1435511 m!1324893))

(declare-fun m!1324895 () Bool)

(assert (=> b!1435508 m!1324895))

(assert (=> b!1435507 m!1324857))

(assert (=> b!1435507 m!1324857))

(declare-fun m!1324897 () Bool)

(assert (=> b!1435507 m!1324897))

(declare-fun m!1324899 () Bool)

(assert (=> b!1435509 m!1324899))

(declare-fun m!1324901 () Bool)

(assert (=> b!1435513 m!1324901))

(assert (=> b!1435513 m!1324901))

(declare-fun m!1324903 () Bool)

(assert (=> b!1435513 m!1324903))

(check-sat (not b!1435507) (not b!1435503) (not b!1435502) (not b!1435504) (not b!1435514) (not b!1435506) (not b!1435516) (not b!1435510) (not b!1435511) (not b!1435508) (not start!123872) (not b!1435509) (not b!1435513) (not b!1435515))
(check-sat)
