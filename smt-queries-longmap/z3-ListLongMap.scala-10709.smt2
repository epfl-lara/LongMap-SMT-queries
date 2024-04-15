; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125362 () Bool)

(assert start!125362)

(declare-fun b!1466214 () Bool)

(declare-fun res!995053 () Bool)

(declare-fun e!823731 () Bool)

(assert (=> b!1466214 (=> (not res!995053) (not e!823731))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98788 0))(
  ( (array!98789 (arr!47683 (Array (_ BitVec 32) (_ BitVec 64))) (size!48235 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98788)

(assert (=> b!1466214 (= res!995053 (and (= (size!48235 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48235 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48235 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1466215 () Bool)

(declare-fun e!823733 () Bool)

(assert (=> b!1466215 (= e!823733 true)))

(declare-datatypes ((SeekEntryResult!11960 0))(
  ( (MissingZero!11960 (index!50232 (_ BitVec 32))) (Found!11960 (index!50233 (_ BitVec 32))) (Intermediate!11960 (undefined!12772 Bool) (index!50234 (_ BitVec 32)) (x!131804 (_ BitVec 32))) (Undefined!11960) (MissingVacant!11960 (index!50235 (_ BitVec 32))) )
))
(declare-fun lt!641507 () SeekEntryResult!11960)

(declare-fun lt!641513 () array!98788)

(declare-fun lt!641514 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98788 (_ BitVec 32)) SeekEntryResult!11960)

(assert (=> b!1466215 (= lt!641507 (seekEntryOrOpen!0 lt!641514 lt!641513 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49257 0))(
  ( (Unit!49258) )
))
(declare-fun lt!641508 () Unit!49257)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!641512 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49257)

(assert (=> b!1466215 (= lt!641508 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641512 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466216 () Bool)

(declare-fun e!823727 () Bool)

(assert (=> b!1466216 (= e!823731 e!823727)))

(declare-fun res!995046 () Bool)

(assert (=> b!1466216 (=> (not res!995046) (not e!823727))))

(assert (=> b!1466216 (= res!995046 (= (select (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466216 (= lt!641513 (array!98789 (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48235 a!2862)))))

(declare-fun res!995045 () Bool)

(assert (=> start!125362 (=> (not res!995045) (not e!823731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125362 (= res!995045 (validMask!0 mask!2687))))

(assert (=> start!125362 e!823731))

(assert (=> start!125362 true))

(declare-fun array_inv!36916 (array!98788) Bool)

(assert (=> start!125362 (array_inv!36916 a!2862)))

(declare-fun e!823732 () Bool)

(declare-fun b!1466217 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98788 (_ BitVec 32)) SeekEntryResult!11960)

(assert (=> b!1466217 (= e!823732 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641512 intermediateAfterIndex!19 lt!641514 lt!641513 mask!2687) (seekEntryOrOpen!0 lt!641514 lt!641513 mask!2687))))))

(declare-fun b!1466218 () Bool)

(declare-fun res!995054 () Bool)

(declare-fun e!823734 () Bool)

(assert (=> b!1466218 (=> (not res!995054) (not e!823734))))

(assert (=> b!1466218 (= res!995054 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466219 () Bool)

(declare-fun res!995055 () Bool)

(assert (=> b!1466219 (=> (not res!995055) (not e!823731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466219 (= res!995055 (validKeyInArray!0 (select (arr!47683 a!2862) i!1006)))))

(declare-fun b!1466220 () Bool)

(declare-fun res!995049 () Bool)

(assert (=> b!1466220 (=> (not res!995049) (not e!823731))))

(declare-datatypes ((List!34262 0))(
  ( (Nil!34259) (Cons!34258 (h!35608 (_ BitVec 64)) (t!48948 List!34262)) )
))
(declare-fun arrayNoDuplicates!0 (array!98788 (_ BitVec 32) List!34262) Bool)

(assert (=> b!1466220 (= res!995049 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34259))))

(declare-fun b!1466221 () Bool)

(declare-fun res!995047 () Bool)

(assert (=> b!1466221 (=> res!995047 e!823733)))

(declare-fun lt!641510 () SeekEntryResult!11960)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98788 (_ BitVec 32)) SeekEntryResult!11960)

(assert (=> b!1466221 (= res!995047 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641512 (select (arr!47683 a!2862) j!93) a!2862 mask!2687) lt!641510)))))

(declare-fun b!1466222 () Bool)

(declare-fun e!823730 () Bool)

(assert (=> b!1466222 (= e!823730 e!823733)))

(declare-fun res!995044 () Bool)

(assert (=> b!1466222 (=> res!995044 e!823733)))

(assert (=> b!1466222 (= res!995044 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641512 #b00000000000000000000000000000000) (bvsge lt!641512 (size!48235 a!2862))))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466222 (= lt!641512 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466223 () Bool)

(declare-fun e!823729 () Bool)

(assert (=> b!1466223 (= e!823727 e!823729)))

(declare-fun res!995051 () Bool)

(assert (=> b!1466223 (=> (not res!995051) (not e!823729))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466223 (= res!995051 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47683 a!2862) j!93) mask!2687) (select (arr!47683 a!2862) j!93) a!2862 mask!2687) lt!641510))))

(assert (=> b!1466223 (= lt!641510 (Intermediate!11960 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1466224 () Bool)

(declare-fun res!995042 () Bool)

(assert (=> b!1466224 (=> (not res!995042) (not e!823731))))

(assert (=> b!1466224 (= res!995042 (validKeyInArray!0 (select (arr!47683 a!2862) j!93)))))

(declare-fun b!1466225 () Bool)

(assert (=> b!1466225 (= e!823734 (not e!823730))))

(declare-fun res!995048 () Bool)

(assert (=> b!1466225 (=> res!995048 e!823730)))

(assert (=> b!1466225 (= res!995048 (or (and (= (select (arr!47683 a!2862) index!646) (select (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47683 a!2862) index!646) (select (arr!47683 a!2862) j!93))) (= (select (arr!47683 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1466225 (and (= lt!641507 (Found!11960 j!93)) (or (= (select (arr!47683 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47683 a!2862) intermediateBeforeIndex!19) (select (arr!47683 a!2862) j!93))))))

(assert (=> b!1466225 (= lt!641507 (seekEntryOrOpen!0 (select (arr!47683 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98788 (_ BitVec 32)) Bool)

(assert (=> b!1466225 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!641509 () Unit!49257)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98788 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49257)

(assert (=> b!1466225 (= lt!641509 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466226 () Bool)

(declare-fun res!995052 () Bool)

(assert (=> b!1466226 (=> (not res!995052) (not e!823734))))

(declare-fun e!823728 () Bool)

(assert (=> b!1466226 (= res!995052 e!823728)))

(declare-fun c!135099 () Bool)

(assert (=> b!1466226 (= c!135099 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!641511 () SeekEntryResult!11960)

(declare-fun b!1466227 () Bool)

(assert (=> b!1466227 (= e!823728 (= lt!641511 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641514 lt!641513 mask!2687)))))

(declare-fun b!1466228 () Bool)

(declare-fun res!995058 () Bool)

(assert (=> b!1466228 (=> res!995058 e!823733)))

(assert (=> b!1466228 (= res!995058 e!823732)))

(declare-fun c!135100 () Bool)

(assert (=> b!1466228 (= c!135100 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466229 () Bool)

(assert (=> b!1466229 (= e!823728 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641514 lt!641513 mask!2687) (seekEntryOrOpen!0 lt!641514 lt!641513 mask!2687)))))

(declare-fun b!1466230 () Bool)

(assert (=> b!1466230 (= e!823732 (not (= lt!641511 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641512 lt!641514 lt!641513 mask!2687))))))

(declare-fun b!1466231 () Bool)

(declare-fun res!995043 () Bool)

(assert (=> b!1466231 (=> (not res!995043) (not e!823731))))

(assert (=> b!1466231 (= res!995043 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48235 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48235 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48235 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466232 () Bool)

(declare-fun res!995056 () Bool)

(assert (=> b!1466232 (=> res!995056 e!823733)))

(assert (=> b!1466232 (= res!995056 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466233 () Bool)

(declare-fun res!995057 () Bool)

(assert (=> b!1466233 (=> (not res!995057) (not e!823729))))

(assert (=> b!1466233 (= res!995057 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47683 a!2862) j!93) a!2862 mask!2687) lt!641510))))

(declare-fun b!1466234 () Bool)

(declare-fun res!995050 () Bool)

(assert (=> b!1466234 (=> (not res!995050) (not e!823731))))

(assert (=> b!1466234 (= res!995050 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466235 () Bool)

(assert (=> b!1466235 (= e!823729 e!823734)))

(declare-fun res!995059 () Bool)

(assert (=> b!1466235 (=> (not res!995059) (not e!823734))))

(assert (=> b!1466235 (= res!995059 (= lt!641511 (Intermediate!11960 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1466235 (= lt!641511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641514 mask!2687) lt!641514 lt!641513 mask!2687))))

(assert (=> b!1466235 (= lt!641514 (select (store (arr!47683 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125362 res!995045) b!1466214))

(assert (= (and b!1466214 res!995053) b!1466219))

(assert (= (and b!1466219 res!995055) b!1466224))

(assert (= (and b!1466224 res!995042) b!1466234))

(assert (= (and b!1466234 res!995050) b!1466220))

(assert (= (and b!1466220 res!995049) b!1466231))

(assert (= (and b!1466231 res!995043) b!1466216))

(assert (= (and b!1466216 res!995046) b!1466223))

(assert (= (and b!1466223 res!995051) b!1466233))

(assert (= (and b!1466233 res!995057) b!1466235))

(assert (= (and b!1466235 res!995059) b!1466226))

(assert (= (and b!1466226 c!135099) b!1466227))

(assert (= (and b!1466226 (not c!135099)) b!1466229))

(assert (= (and b!1466226 res!995052) b!1466218))

(assert (= (and b!1466218 res!995054) b!1466225))

(assert (= (and b!1466225 (not res!995048)) b!1466222))

(assert (= (and b!1466222 (not res!995044)) b!1466221))

(assert (= (and b!1466221 (not res!995047)) b!1466228))

(assert (= (and b!1466228 c!135100) b!1466230))

(assert (= (and b!1466228 (not c!135100)) b!1466217))

(assert (= (and b!1466228 (not res!995058)) b!1466232))

(assert (= (and b!1466232 (not res!995056)) b!1466215))

(declare-fun m!1352727 () Bool)

(assert (=> b!1466233 m!1352727))

(assert (=> b!1466233 m!1352727))

(declare-fun m!1352729 () Bool)

(assert (=> b!1466233 m!1352729))

(declare-fun m!1352731 () Bool)

(assert (=> b!1466229 m!1352731))

(declare-fun m!1352733 () Bool)

(assert (=> b!1466229 m!1352733))

(declare-fun m!1352735 () Bool)

(assert (=> start!125362 m!1352735))

(declare-fun m!1352737 () Bool)

(assert (=> start!125362 m!1352737))

(declare-fun m!1352739 () Bool)

(assert (=> b!1466230 m!1352739))

(declare-fun m!1352741 () Bool)

(assert (=> b!1466225 m!1352741))

(declare-fun m!1352743 () Bool)

(assert (=> b!1466225 m!1352743))

(declare-fun m!1352745 () Bool)

(assert (=> b!1466225 m!1352745))

(declare-fun m!1352747 () Bool)

(assert (=> b!1466225 m!1352747))

(declare-fun m!1352749 () Bool)

(assert (=> b!1466225 m!1352749))

(assert (=> b!1466225 m!1352727))

(declare-fun m!1352751 () Bool)

(assert (=> b!1466225 m!1352751))

(declare-fun m!1352753 () Bool)

(assert (=> b!1466225 m!1352753))

(assert (=> b!1466225 m!1352727))

(declare-fun m!1352755 () Bool)

(assert (=> b!1466217 m!1352755))

(assert (=> b!1466217 m!1352733))

(assert (=> b!1466215 m!1352733))

(declare-fun m!1352757 () Bool)

(assert (=> b!1466215 m!1352757))

(declare-fun m!1352759 () Bool)

(assert (=> b!1466220 m!1352759))

(declare-fun m!1352761 () Bool)

(assert (=> b!1466234 m!1352761))

(assert (=> b!1466223 m!1352727))

(assert (=> b!1466223 m!1352727))

(declare-fun m!1352763 () Bool)

(assert (=> b!1466223 m!1352763))

(assert (=> b!1466223 m!1352763))

(assert (=> b!1466223 m!1352727))

(declare-fun m!1352765 () Bool)

(assert (=> b!1466223 m!1352765))

(assert (=> b!1466221 m!1352727))

(assert (=> b!1466221 m!1352727))

(declare-fun m!1352767 () Bool)

(assert (=> b!1466221 m!1352767))

(declare-fun m!1352769 () Bool)

(assert (=> b!1466227 m!1352769))

(declare-fun m!1352771 () Bool)

(assert (=> b!1466222 m!1352771))

(assert (=> b!1466216 m!1352743))

(declare-fun m!1352773 () Bool)

(assert (=> b!1466216 m!1352773))

(assert (=> b!1466224 m!1352727))

(assert (=> b!1466224 m!1352727))

(declare-fun m!1352775 () Bool)

(assert (=> b!1466224 m!1352775))

(declare-fun m!1352777 () Bool)

(assert (=> b!1466235 m!1352777))

(assert (=> b!1466235 m!1352777))

(declare-fun m!1352779 () Bool)

(assert (=> b!1466235 m!1352779))

(assert (=> b!1466235 m!1352743))

(declare-fun m!1352781 () Bool)

(assert (=> b!1466235 m!1352781))

(declare-fun m!1352783 () Bool)

(assert (=> b!1466219 m!1352783))

(assert (=> b!1466219 m!1352783))

(declare-fun m!1352785 () Bool)

(assert (=> b!1466219 m!1352785))

(check-sat (not b!1466215) (not b!1466235) (not b!1466233) (not start!125362) (not b!1466225) (not b!1466230) (not b!1466221) (not b!1466224) (not b!1466220) (not b!1466229) (not b!1466234) (not b!1466223) (not b!1466222) (not b!1466227) (not b!1466217) (not b!1466219))
(check-sat)
