; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126344 () Bool)

(assert start!126344)

(declare-fun b!1481504 () Bool)

(declare-fun e!830830 () Bool)

(declare-fun e!830831 () Bool)

(assert (=> b!1481504 (= e!830830 e!830831)))

(declare-fun res!1007017 () Bool)

(assert (=> b!1481504 (=> (not res!1007017) (not e!830831))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12224 0))(
  ( (MissingZero!12224 (index!51288 (_ BitVec 32))) (Found!12224 (index!51289 (_ BitVec 32))) (Intermediate!12224 (undefined!13036 Bool) (index!51290 (_ BitVec 32)) (x!132868 (_ BitVec 32))) (Undefined!12224) (MissingVacant!12224 (index!51291 (_ BitVec 32))) )
))
(declare-fun lt!646600 () SeekEntryResult!12224)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1481504 (= res!1007017 (= lt!646600 (Intermediate!12224 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646603 () (_ BitVec 64))

(declare-datatypes ((array!99361 0))(
  ( (array!99362 (arr!47959 (Array (_ BitVec 32) (_ BitVec 64))) (size!48511 (_ BitVec 32))) )
))
(declare-fun lt!646602 () array!99361)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99361 (_ BitVec 32)) SeekEntryResult!12224)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1481504 (= lt!646600 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646603 mask!2687) lt!646603 lt!646602 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!99361)

(assert (=> b!1481504 (= lt!646603 (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1481505 () Bool)

(declare-fun res!1007006 () Bool)

(assert (=> b!1481505 (=> (not res!1007006) (not e!830831))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1481505 (= res!1007006 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1481506 () Bool)

(declare-fun res!1007004 () Bool)

(declare-fun e!830829 () Bool)

(assert (=> b!1481506 (=> (not res!1007004) (not e!830829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99361 (_ BitVec 32)) Bool)

(assert (=> b!1481506 (= res!1007004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1007012 () Bool)

(assert (=> start!126344 (=> (not res!1007012) (not e!830829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126344 (= res!1007012 (validMask!0 mask!2687))))

(assert (=> start!126344 e!830829))

(assert (=> start!126344 true))

(declare-fun array_inv!37192 (array!99361) Bool)

(assert (=> start!126344 (array_inv!37192 a!2862)))

(declare-fun b!1481507 () Bool)

(declare-fun res!1007005 () Bool)

(assert (=> b!1481507 (=> (not res!1007005) (not e!830829))))

(assert (=> b!1481507 (= res!1007005 (and (= (size!48511 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48511 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48511 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1481508 () Bool)

(declare-fun e!830828 () Bool)

(assert (=> b!1481508 (= e!830828 e!830830)))

(declare-fun res!1007007 () Bool)

(assert (=> b!1481508 (=> (not res!1007007) (not e!830830))))

(declare-fun lt!646601 () SeekEntryResult!12224)

(assert (=> b!1481508 (= res!1007007 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47959 a!2862) j!93) mask!2687) (select (arr!47959 a!2862) j!93) a!2862 mask!2687) lt!646601))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1481508 (= lt!646601 (Intermediate!12224 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1481509 () Bool)

(assert (=> b!1481509 (= e!830831 (not true))))

(declare-fun e!830825 () Bool)

(assert (=> b!1481509 e!830825))

(declare-fun res!1007008 () Bool)

(assert (=> b!1481509 (=> (not res!1007008) (not e!830825))))

(assert (=> b!1481509 (= res!1007008 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49629 0))(
  ( (Unit!49630) )
))
(declare-fun lt!646604 () Unit!49629)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99361 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49629)

(assert (=> b!1481509 (= lt!646604 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1481510 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1481510 (= e!830825 (and (or (= (select (arr!47959 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47959 a!2862) intermediateBeforeIndex!19) (select (arr!47959 a!2862) j!93))) (or (and (= (select (arr!47959 a!2862) index!646) (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47959 a!2862) index!646) (select (arr!47959 a!2862) j!93))) (= (select (arr!47959 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1481511 () Bool)

(declare-fun e!830827 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99361 (_ BitVec 32)) SeekEntryResult!12224)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99361 (_ BitVec 32)) SeekEntryResult!12224)

(assert (=> b!1481511 (= e!830827 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646603 lt!646602 mask!2687) (seekEntryOrOpen!0 lt!646603 lt!646602 mask!2687)))))

(declare-fun b!1481512 () Bool)

(declare-fun res!1007010 () Bool)

(assert (=> b!1481512 (=> (not res!1007010) (not e!830829))))

(assert (=> b!1481512 (= res!1007010 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48511 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48511 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48511 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1481513 () Bool)

(assert (=> b!1481513 (= e!830827 (= lt!646600 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646603 lt!646602 mask!2687)))))

(declare-fun b!1481514 () Bool)

(declare-fun res!1007013 () Bool)

(assert (=> b!1481514 (=> (not res!1007013) (not e!830829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1481514 (= res!1007013 (validKeyInArray!0 (select (arr!47959 a!2862) i!1006)))))

(declare-fun b!1481515 () Bool)

(assert (=> b!1481515 (= e!830829 e!830828)))

(declare-fun res!1007009 () Bool)

(assert (=> b!1481515 (=> (not res!1007009) (not e!830828))))

(assert (=> b!1481515 (= res!1007009 (= (select (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1481515 (= lt!646602 (array!99362 (store (arr!47959 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48511 a!2862)))))

(declare-fun b!1481516 () Bool)

(declare-fun res!1007003 () Bool)

(assert (=> b!1481516 (=> (not res!1007003) (not e!830829))))

(declare-datatypes ((List!34538 0))(
  ( (Nil!34535) (Cons!34534 (h!35905 (_ BitVec 64)) (t!49224 List!34538)) )
))
(declare-fun arrayNoDuplicates!0 (array!99361 (_ BitVec 32) List!34538) Bool)

(assert (=> b!1481516 (= res!1007003 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34535))))

(declare-fun b!1481517 () Bool)

(declare-fun res!1007014 () Bool)

(assert (=> b!1481517 (=> (not res!1007014) (not e!830831))))

(assert (=> b!1481517 (= res!1007014 e!830827)))

(declare-fun c!136774 () Bool)

(assert (=> b!1481517 (= c!136774 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1481518 () Bool)

(declare-fun res!1007016 () Bool)

(assert (=> b!1481518 (=> (not res!1007016) (not e!830830))))

(assert (=> b!1481518 (= res!1007016 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47959 a!2862) j!93) a!2862 mask!2687) lt!646601))))

(declare-fun b!1481519 () Bool)

(declare-fun res!1007011 () Bool)

(assert (=> b!1481519 (=> (not res!1007011) (not e!830829))))

(assert (=> b!1481519 (= res!1007011 (validKeyInArray!0 (select (arr!47959 a!2862) j!93)))))

(declare-fun b!1481520 () Bool)

(declare-fun res!1007015 () Bool)

(assert (=> b!1481520 (=> (not res!1007015) (not e!830825))))

(assert (=> b!1481520 (= res!1007015 (= (seekEntryOrOpen!0 (select (arr!47959 a!2862) j!93) a!2862 mask!2687) (Found!12224 j!93)))))

(assert (= (and start!126344 res!1007012) b!1481507))

(assert (= (and b!1481507 res!1007005) b!1481514))

(assert (= (and b!1481514 res!1007013) b!1481519))

(assert (= (and b!1481519 res!1007011) b!1481506))

(assert (= (and b!1481506 res!1007004) b!1481516))

(assert (= (and b!1481516 res!1007003) b!1481512))

(assert (= (and b!1481512 res!1007010) b!1481515))

(assert (= (and b!1481515 res!1007009) b!1481508))

(assert (= (and b!1481508 res!1007007) b!1481518))

(assert (= (and b!1481518 res!1007016) b!1481504))

(assert (= (and b!1481504 res!1007017) b!1481517))

(assert (= (and b!1481517 c!136774) b!1481513))

(assert (= (and b!1481517 (not c!136774)) b!1481511))

(assert (= (and b!1481517 res!1007014) b!1481505))

(assert (= (and b!1481505 res!1007006) b!1481509))

(assert (= (and b!1481509 res!1007008) b!1481520))

(assert (= (and b!1481520 res!1007015) b!1481510))

(declare-fun m!1366701 () Bool)

(assert (=> b!1481508 m!1366701))

(assert (=> b!1481508 m!1366701))

(declare-fun m!1366703 () Bool)

(assert (=> b!1481508 m!1366703))

(assert (=> b!1481508 m!1366703))

(assert (=> b!1481508 m!1366701))

(declare-fun m!1366705 () Bool)

(assert (=> b!1481508 m!1366705))

(declare-fun m!1366707 () Bool)

(assert (=> b!1481513 m!1366707))

(declare-fun m!1366709 () Bool)

(assert (=> b!1481504 m!1366709))

(assert (=> b!1481504 m!1366709))

(declare-fun m!1366711 () Bool)

(assert (=> b!1481504 m!1366711))

(declare-fun m!1366713 () Bool)

(assert (=> b!1481504 m!1366713))

(declare-fun m!1366715 () Bool)

(assert (=> b!1481504 m!1366715))

(declare-fun m!1366717 () Bool)

(assert (=> start!126344 m!1366717))

(declare-fun m!1366719 () Bool)

(assert (=> start!126344 m!1366719))

(declare-fun m!1366721 () Bool)

(assert (=> b!1481514 m!1366721))

(assert (=> b!1481514 m!1366721))

(declare-fun m!1366723 () Bool)

(assert (=> b!1481514 m!1366723))

(assert (=> b!1481519 m!1366701))

(assert (=> b!1481519 m!1366701))

(declare-fun m!1366725 () Bool)

(assert (=> b!1481519 m!1366725))

(declare-fun m!1366727 () Bool)

(assert (=> b!1481509 m!1366727))

(declare-fun m!1366729 () Bool)

(assert (=> b!1481509 m!1366729))

(declare-fun m!1366731 () Bool)

(assert (=> b!1481516 m!1366731))

(declare-fun m!1366733 () Bool)

(assert (=> b!1481511 m!1366733))

(declare-fun m!1366735 () Bool)

(assert (=> b!1481511 m!1366735))

(assert (=> b!1481515 m!1366713))

(declare-fun m!1366737 () Bool)

(assert (=> b!1481515 m!1366737))

(assert (=> b!1481518 m!1366701))

(assert (=> b!1481518 m!1366701))

(declare-fun m!1366739 () Bool)

(assert (=> b!1481518 m!1366739))

(declare-fun m!1366741 () Bool)

(assert (=> b!1481506 m!1366741))

(assert (=> b!1481510 m!1366713))

(declare-fun m!1366743 () Bool)

(assert (=> b!1481510 m!1366743))

(declare-fun m!1366745 () Bool)

(assert (=> b!1481510 m!1366745))

(declare-fun m!1366747 () Bool)

(assert (=> b!1481510 m!1366747))

(assert (=> b!1481510 m!1366701))

(assert (=> b!1481520 m!1366701))

(assert (=> b!1481520 m!1366701))

(declare-fun m!1366749 () Bool)

(assert (=> b!1481520 m!1366749))

(check-sat (not b!1481509) (not b!1481506) (not b!1481520) (not b!1481511) (not b!1481516) (not b!1481504) (not b!1481508) (not b!1481519) (not start!126344) (not b!1481514) (not b!1481518) (not b!1481513))
(check-sat)
