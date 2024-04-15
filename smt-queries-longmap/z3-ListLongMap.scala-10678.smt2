; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125176 () Bool)

(assert start!125176)

(declare-fun b!1460201 () Bool)

(declare-fun res!990102 () Bool)

(declare-fun e!821045 () Bool)

(assert (=> b!1460201 (=> (not res!990102) (not e!821045))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98602 0))(
  ( (array!98603 (arr!47590 (Array (_ BitVec 32) (_ BitVec 64))) (size!48142 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98602)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1460201 (= res!990102 (and (= (size!48142 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48142 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48142 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460202 () Bool)

(declare-fun res!990105 () Bool)

(assert (=> b!1460202 (=> (not res!990105) (not e!821045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98602 (_ BitVec 32)) Bool)

(assert (=> b!1460202 (= res!990105 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!821044 () Bool)

(declare-fun b!1460203 () Bool)

(assert (=> b!1460203 (= e!821044 (or (= (select (arr!47590 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47590 a!2862) intermediateBeforeIndex!19) (select (arr!47590 a!2862) j!93))))))

(declare-fun b!1460204 () Bool)

(declare-fun res!990107 () Bool)

(declare-fun e!821042 () Bool)

(assert (=> b!1460204 (=> (not res!990107) (not e!821042))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11867 0))(
  ( (MissingZero!11867 (index!49860 (_ BitVec 32))) (Found!11867 (index!49861 (_ BitVec 32))) (Intermediate!11867 (undefined!12679 Bool) (index!49862 (_ BitVec 32)) (x!131463 (_ BitVec 32))) (Undefined!11867) (MissingVacant!11867 (index!49863 (_ BitVec 32))) )
))
(declare-fun lt!639576 () SeekEntryResult!11867)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98602 (_ BitVec 32)) SeekEntryResult!11867)

(assert (=> b!1460204 (= res!990107 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47590 a!2862) j!93) a!2862 mask!2687) lt!639576))))

(declare-fun b!1460206 () Bool)

(declare-fun res!990109 () Bool)

(assert (=> b!1460206 (=> (not res!990109) (not e!821045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460206 (= res!990109 (validKeyInArray!0 (select (arr!47590 a!2862) j!93)))))

(declare-fun lt!639579 () array!98602)

(declare-fun e!821040 () Bool)

(declare-fun lt!639578 () (_ BitVec 64))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1460207 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98602 (_ BitVec 32)) SeekEntryResult!11867)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98602 (_ BitVec 32)) SeekEntryResult!11867)

(assert (=> b!1460207 (= e!821040 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639578 lt!639579 mask!2687) (seekEntryOrOpen!0 lt!639578 lt!639579 mask!2687)))))

(declare-fun b!1460208 () Bool)

(declare-fun res!990108 () Bool)

(assert (=> b!1460208 (=> (not res!990108) (not e!821045))))

(declare-datatypes ((List!34169 0))(
  ( (Nil!34166) (Cons!34165 (h!35515 (_ BitVec 64)) (t!48855 List!34169)) )
))
(declare-fun arrayNoDuplicates!0 (array!98602 (_ BitVec 32) List!34169) Bool)

(assert (=> b!1460208 (= res!990108 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34166))))

(declare-fun lt!639577 () SeekEntryResult!11867)

(declare-fun b!1460209 () Bool)

(assert (=> b!1460209 (= e!821040 (= lt!639577 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639578 lt!639579 mask!2687)))))

(declare-fun b!1460210 () Bool)

(declare-fun res!990100 () Bool)

(assert (=> b!1460210 (=> (not res!990100) (not e!821045))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460210 (= res!990100 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48142 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48142 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48142 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460211 () Bool)

(declare-fun res!990097 () Bool)

(assert (=> b!1460211 (=> (not res!990097) (not e!821045))))

(assert (=> b!1460211 (= res!990097 (validKeyInArray!0 (select (arr!47590 a!2862) i!1006)))))

(declare-fun b!1460212 () Bool)

(declare-fun res!990099 () Bool)

(assert (=> b!1460212 (=> (not res!990099) (not e!821044))))

(assert (=> b!1460212 (= res!990099 (= (seekEntryOrOpen!0 (select (arr!47590 a!2862) j!93) a!2862 mask!2687) (Found!11867 j!93)))))

(declare-fun b!1460213 () Bool)

(declare-fun e!821041 () Bool)

(assert (=> b!1460213 (= e!821045 e!821041)))

(declare-fun res!990095 () Bool)

(assert (=> b!1460213 (=> (not res!990095) (not e!821041))))

(assert (=> b!1460213 (= res!990095 (= (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460213 (= lt!639579 (array!98603 (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48142 a!2862)))))

(declare-fun b!1460214 () Bool)

(declare-fun res!990106 () Bool)

(declare-fun e!821046 () Bool)

(assert (=> b!1460214 (=> (not res!990106) (not e!821046))))

(assert (=> b!1460214 (= res!990106 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460215 () Bool)

(assert (=> b!1460215 (= e!821041 e!821042)))

(declare-fun res!990096 () Bool)

(assert (=> b!1460215 (=> (not res!990096) (not e!821042))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460215 (= res!990096 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47590 a!2862) j!93) mask!2687) (select (arr!47590 a!2862) j!93) a!2862 mask!2687) lt!639576))))

(assert (=> b!1460215 (= lt!639576 (Intermediate!11867 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460216 () Bool)

(assert (=> b!1460216 (= e!821046 (not (or (and (= (select (arr!47590 a!2862) index!646) (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47590 a!2862) index!646) (select (arr!47590 a!2862) j!93))) (= (select (arr!47590 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1460216 e!821044))

(declare-fun res!990104 () Bool)

(assert (=> b!1460216 (=> (not res!990104) (not e!821044))))

(assert (=> b!1460216 (= res!990104 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49071 0))(
  ( (Unit!49072) )
))
(declare-fun lt!639575 () Unit!49071)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98602 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49071)

(assert (=> b!1460216 (= lt!639575 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460217 () Bool)

(assert (=> b!1460217 (= e!821042 e!821046)))

(declare-fun res!990098 () Bool)

(assert (=> b!1460217 (=> (not res!990098) (not e!821046))))

(assert (=> b!1460217 (= res!990098 (= lt!639577 (Intermediate!11867 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460217 (= lt!639577 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639578 mask!2687) lt!639578 lt!639579 mask!2687))))

(assert (=> b!1460217 (= lt!639578 (select (store (arr!47590 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460205 () Bool)

(declare-fun res!990103 () Bool)

(assert (=> b!1460205 (=> (not res!990103) (not e!821046))))

(assert (=> b!1460205 (= res!990103 e!821040)))

(declare-fun c!134566 () Bool)

(assert (=> b!1460205 (= c!134566 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!990101 () Bool)

(assert (=> start!125176 (=> (not res!990101) (not e!821045))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125176 (= res!990101 (validMask!0 mask!2687))))

(assert (=> start!125176 e!821045))

(assert (=> start!125176 true))

(declare-fun array_inv!36823 (array!98602) Bool)

(assert (=> start!125176 (array_inv!36823 a!2862)))

(assert (= (and start!125176 res!990101) b!1460201))

(assert (= (and b!1460201 res!990102) b!1460211))

(assert (= (and b!1460211 res!990097) b!1460206))

(assert (= (and b!1460206 res!990109) b!1460202))

(assert (= (and b!1460202 res!990105) b!1460208))

(assert (= (and b!1460208 res!990108) b!1460210))

(assert (= (and b!1460210 res!990100) b!1460213))

(assert (= (and b!1460213 res!990095) b!1460215))

(assert (= (and b!1460215 res!990096) b!1460204))

(assert (= (and b!1460204 res!990107) b!1460217))

(assert (= (and b!1460217 res!990098) b!1460205))

(assert (= (and b!1460205 c!134566) b!1460209))

(assert (= (and b!1460205 (not c!134566)) b!1460207))

(assert (= (and b!1460205 res!990103) b!1460214))

(assert (= (and b!1460214 res!990106) b!1460216))

(assert (= (and b!1460216 res!990104) b!1460212))

(assert (= (and b!1460212 res!990099) b!1460203))

(declare-fun m!1347399 () Bool)

(assert (=> b!1460207 m!1347399))

(declare-fun m!1347401 () Bool)

(assert (=> b!1460207 m!1347401))

(declare-fun m!1347403 () Bool)

(assert (=> b!1460204 m!1347403))

(assert (=> b!1460204 m!1347403))

(declare-fun m!1347405 () Bool)

(assert (=> b!1460204 m!1347405))

(declare-fun m!1347407 () Bool)

(assert (=> b!1460202 m!1347407))

(declare-fun m!1347409 () Bool)

(assert (=> b!1460208 m!1347409))

(declare-fun m!1347411 () Bool)

(assert (=> start!125176 m!1347411))

(declare-fun m!1347413 () Bool)

(assert (=> start!125176 m!1347413))

(assert (=> b!1460212 m!1347403))

(assert (=> b!1460212 m!1347403))

(declare-fun m!1347415 () Bool)

(assert (=> b!1460212 m!1347415))

(declare-fun m!1347417 () Bool)

(assert (=> b!1460217 m!1347417))

(assert (=> b!1460217 m!1347417))

(declare-fun m!1347419 () Bool)

(assert (=> b!1460217 m!1347419))

(declare-fun m!1347421 () Bool)

(assert (=> b!1460217 m!1347421))

(declare-fun m!1347423 () Bool)

(assert (=> b!1460217 m!1347423))

(declare-fun m!1347425 () Bool)

(assert (=> b!1460203 m!1347425))

(assert (=> b!1460203 m!1347403))

(assert (=> b!1460213 m!1347421))

(declare-fun m!1347427 () Bool)

(assert (=> b!1460213 m!1347427))

(declare-fun m!1347429 () Bool)

(assert (=> b!1460216 m!1347429))

(assert (=> b!1460216 m!1347421))

(declare-fun m!1347431 () Bool)

(assert (=> b!1460216 m!1347431))

(declare-fun m!1347433 () Bool)

(assert (=> b!1460216 m!1347433))

(declare-fun m!1347435 () Bool)

(assert (=> b!1460216 m!1347435))

(assert (=> b!1460216 m!1347403))

(declare-fun m!1347437 () Bool)

(assert (=> b!1460211 m!1347437))

(assert (=> b!1460211 m!1347437))

(declare-fun m!1347439 () Bool)

(assert (=> b!1460211 m!1347439))

(assert (=> b!1460215 m!1347403))

(assert (=> b!1460215 m!1347403))

(declare-fun m!1347441 () Bool)

(assert (=> b!1460215 m!1347441))

(assert (=> b!1460215 m!1347441))

(assert (=> b!1460215 m!1347403))

(declare-fun m!1347443 () Bool)

(assert (=> b!1460215 m!1347443))

(declare-fun m!1347445 () Bool)

(assert (=> b!1460209 m!1347445))

(assert (=> b!1460206 m!1347403))

(assert (=> b!1460206 m!1347403))

(declare-fun m!1347447 () Bool)

(assert (=> b!1460206 m!1347447))

(check-sat (not b!1460207) (not b!1460202) (not start!125176) (not b!1460215) (not b!1460209) (not b!1460212) (not b!1460217) (not b!1460204) (not b!1460211) (not b!1460216) (not b!1460206) (not b!1460208))
(check-sat)
