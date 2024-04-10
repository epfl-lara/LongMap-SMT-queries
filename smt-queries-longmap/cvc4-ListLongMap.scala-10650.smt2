; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125042 () Bool)

(assert start!125042)

(declare-fun b!1455030 () Bool)

(declare-fun res!985777 () Bool)

(declare-fun e!818801 () Bool)

(assert (=> b!1455030 (=> res!985777 e!818801)))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11785 0))(
  ( (MissingZero!11785 (index!49532 (_ BitVec 32))) (Found!11785 (index!49533 (_ BitVec 32))) (Intermediate!11785 (undefined!12597 Bool) (index!49534 (_ BitVec 32)) (x!131162 (_ BitVec 32))) (Undefined!11785) (MissingVacant!11785 (index!49535 (_ BitVec 32))) )
))
(declare-fun lt!637804 () SeekEntryResult!11785)

(declare-datatypes ((array!98490 0))(
  ( (array!98491 (arr!47533 (Array (_ BitVec 32) (_ BitVec 64))) (size!48083 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98490)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lt!637809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98490 (_ BitVec 32)) SeekEntryResult!11785)

(assert (=> b!1455030 (= res!985777 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637809 (select (arr!47533 a!2862) j!93) a!2862 mask!2687) lt!637804)))))

(declare-fun b!1455031 () Bool)

(declare-fun res!985784 () Bool)

(declare-fun e!818800 () Bool)

(assert (=> b!1455031 (=> (not res!985784) (not e!818800))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1455031 (= res!985784 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1455032 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!818795 () Bool)

(assert (=> b!1455032 (= e!818795 (and (or (= (select (arr!47533 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47533 a!2862) intermediateBeforeIndex!19) (select (arr!47533 a!2862) j!93))) (let ((bdg!53113 (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47533 a!2862) index!646) bdg!53113) (= (select (arr!47533 a!2862) index!646) (select (arr!47533 a!2862) j!93))) (= (select (arr!47533 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53113 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1455033 () Bool)

(declare-fun res!985782 () Bool)

(declare-fun e!818796 () Bool)

(assert (=> b!1455033 (=> (not res!985782) (not e!818796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98490 (_ BitVec 32)) Bool)

(assert (=> b!1455033 (= res!985782 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!637807 () array!98490)

(declare-fun e!818797 () Bool)

(declare-fun lt!637806 () (_ BitVec 64))

(declare-fun b!1455034 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98490 (_ BitVec 32)) SeekEntryResult!11785)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98490 (_ BitVec 32)) SeekEntryResult!11785)

(assert (=> b!1455034 (= e!818797 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637806 lt!637807 mask!2687) (seekEntryOrOpen!0 lt!637806 lt!637807 mask!2687)))))

(declare-fun e!818794 () Bool)

(declare-fun lt!637802 () SeekEntryResult!11785)

(declare-fun b!1455035 () Bool)

(assert (=> b!1455035 (= e!818794 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637809 intermediateAfterIndex!19 lt!637806 lt!637807 mask!2687) lt!637802)))))

(declare-fun b!1455036 () Bool)

(declare-fun lt!637803 () SeekEntryResult!11785)

(assert (=> b!1455036 (= e!818797 (= lt!637803 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637806 lt!637807 mask!2687)))))

(declare-fun b!1455037 () Bool)

(declare-fun res!985769 () Bool)

(assert (=> b!1455037 (=> (not res!985769) (not e!818796))))

(declare-datatypes ((List!34034 0))(
  ( (Nil!34031) (Cons!34030 (h!35380 (_ BitVec 64)) (t!48728 List!34034)) )
))
(declare-fun arrayNoDuplicates!0 (array!98490 (_ BitVec 32) List!34034) Bool)

(assert (=> b!1455037 (= res!985769 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34031))))

(declare-fun b!1455038 () Bool)

(declare-fun res!985778 () Bool)

(assert (=> b!1455038 (=> (not res!985778) (not e!818796))))

(assert (=> b!1455038 (= res!985778 (and (= (size!48083 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48083 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48083 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1455039 () Bool)

(declare-fun res!985773 () Bool)

(assert (=> b!1455039 (=> (not res!985773) (not e!818796))))

(assert (=> b!1455039 (= res!985773 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48083 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48083 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48083 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1455040 () Bool)

(declare-fun e!818792 () Bool)

(assert (=> b!1455040 (= e!818796 e!818792)))

(declare-fun res!985771 () Bool)

(assert (=> b!1455040 (=> (not res!985771) (not e!818792))))

(assert (=> b!1455040 (= res!985771 (= (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1455040 (= lt!637807 (array!98491 (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48083 a!2862)))))

(declare-fun b!1455041 () Bool)

(declare-fun res!985779 () Bool)

(assert (=> b!1455041 (=> (not res!985779) (not e!818800))))

(assert (=> b!1455041 (= res!985779 e!818797)))

(declare-fun c!134142 () Bool)

(assert (=> b!1455041 (= c!134142 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1455043 () Bool)

(declare-fun e!818793 () Bool)

(assert (=> b!1455043 (= e!818800 (not e!818793))))

(declare-fun res!985781 () Bool)

(assert (=> b!1455043 (=> res!985781 e!818793)))

(assert (=> b!1455043 (= res!985781 (or (and (= (select (arr!47533 a!2862) index!646) (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47533 a!2862) index!646) (select (arr!47533 a!2862) j!93))) (= (select (arr!47533 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1455043 e!818795))

(declare-fun res!985775 () Bool)

(assert (=> b!1455043 (=> (not res!985775) (not e!818795))))

(assert (=> b!1455043 (= res!985775 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49066 0))(
  ( (Unit!49067) )
))
(declare-fun lt!637805 () Unit!49066)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49066)

(assert (=> b!1455043 (= lt!637805 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1455044 () Bool)

(assert (=> b!1455044 (= e!818793 e!818801)))

(declare-fun res!985772 () Bool)

(assert (=> b!1455044 (=> res!985772 e!818801)))

(assert (=> b!1455044 (= res!985772 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637809 #b00000000000000000000000000000000) (bvsge lt!637809 (size!48083 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455044 (= lt!637809 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1455044 (= lt!637802 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637806 lt!637807 mask!2687))))

(assert (=> b!1455044 (= lt!637802 (seekEntryOrOpen!0 lt!637806 lt!637807 mask!2687))))

(declare-fun b!1455045 () Bool)

(assert (=> b!1455045 (= e!818794 (not (= lt!637803 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637809 lt!637806 lt!637807 mask!2687))))))

(declare-fun b!1455046 () Bool)

(declare-fun e!818798 () Bool)

(assert (=> b!1455046 (= e!818792 e!818798)))

(declare-fun res!985776 () Bool)

(assert (=> b!1455046 (=> (not res!985776) (not e!818798))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1455046 (= res!985776 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47533 a!2862) j!93) mask!2687) (select (arr!47533 a!2862) j!93) a!2862 mask!2687) lt!637804))))

(assert (=> b!1455046 (= lt!637804 (Intermediate!11785 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1455047 () Bool)

(declare-fun res!985780 () Bool)

(assert (=> b!1455047 (=> (not res!985780) (not e!818796))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1455047 (= res!985780 (validKeyInArray!0 (select (arr!47533 a!2862) j!93)))))

(declare-fun b!1455048 () Bool)

(declare-fun res!985774 () Bool)

(assert (=> b!1455048 (=> (not res!985774) (not e!818795))))

(assert (=> b!1455048 (= res!985774 (= (seekEntryOrOpen!0 (select (arr!47533 a!2862) j!93) a!2862 mask!2687) (Found!11785 j!93)))))

(declare-fun b!1455049 () Bool)

(assert (=> b!1455049 (= e!818801 true)))

(declare-fun lt!637808 () Bool)

(assert (=> b!1455049 (= lt!637808 e!818794)))

(declare-fun c!134141 () Bool)

(assert (=> b!1455049 (= c!134141 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1455042 () Bool)

(declare-fun res!985770 () Bool)

(assert (=> b!1455042 (=> (not res!985770) (not e!818796))))

(assert (=> b!1455042 (= res!985770 (validKeyInArray!0 (select (arr!47533 a!2862) i!1006)))))

(declare-fun res!985783 () Bool)

(assert (=> start!125042 (=> (not res!985783) (not e!818796))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125042 (= res!985783 (validMask!0 mask!2687))))

(assert (=> start!125042 e!818796))

(assert (=> start!125042 true))

(declare-fun array_inv!36561 (array!98490) Bool)

(assert (=> start!125042 (array_inv!36561 a!2862)))

(declare-fun b!1455050 () Bool)

(assert (=> b!1455050 (= e!818798 e!818800)))

(declare-fun res!985786 () Bool)

(assert (=> b!1455050 (=> (not res!985786) (not e!818800))))

(assert (=> b!1455050 (= res!985786 (= lt!637803 (Intermediate!11785 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1455050 (= lt!637803 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637806 mask!2687) lt!637806 lt!637807 mask!2687))))

(assert (=> b!1455050 (= lt!637806 (select (store (arr!47533 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1455051 () Bool)

(declare-fun res!985785 () Bool)

(assert (=> b!1455051 (=> (not res!985785) (not e!818798))))

(assert (=> b!1455051 (= res!985785 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47533 a!2862) j!93) a!2862 mask!2687) lt!637804))))

(assert (= (and start!125042 res!985783) b!1455038))

(assert (= (and b!1455038 res!985778) b!1455042))

(assert (= (and b!1455042 res!985770) b!1455047))

(assert (= (and b!1455047 res!985780) b!1455033))

(assert (= (and b!1455033 res!985782) b!1455037))

(assert (= (and b!1455037 res!985769) b!1455039))

(assert (= (and b!1455039 res!985773) b!1455040))

(assert (= (and b!1455040 res!985771) b!1455046))

(assert (= (and b!1455046 res!985776) b!1455051))

(assert (= (and b!1455051 res!985785) b!1455050))

(assert (= (and b!1455050 res!985786) b!1455041))

(assert (= (and b!1455041 c!134142) b!1455036))

(assert (= (and b!1455041 (not c!134142)) b!1455034))

(assert (= (and b!1455041 res!985779) b!1455031))

(assert (= (and b!1455031 res!985784) b!1455043))

(assert (= (and b!1455043 res!985775) b!1455048))

(assert (= (and b!1455048 res!985774) b!1455032))

(assert (= (and b!1455043 (not res!985781)) b!1455044))

(assert (= (and b!1455044 (not res!985772)) b!1455030))

(assert (= (and b!1455030 (not res!985777)) b!1455049))

(assert (= (and b!1455049 c!134141) b!1455045))

(assert (= (and b!1455049 (not c!134141)) b!1455035))

(declare-fun m!1343301 () Bool)

(assert (=> b!1455034 m!1343301))

(declare-fun m!1343303 () Bool)

(assert (=> b!1455034 m!1343303))

(declare-fun m!1343305 () Bool)

(assert (=> b!1455051 m!1343305))

(assert (=> b!1455051 m!1343305))

(declare-fun m!1343307 () Bool)

(assert (=> b!1455051 m!1343307))

(declare-fun m!1343309 () Bool)

(assert (=> b!1455035 m!1343309))

(declare-fun m!1343311 () Bool)

(assert (=> b!1455040 m!1343311))

(declare-fun m!1343313 () Bool)

(assert (=> b!1455040 m!1343313))

(declare-fun m!1343315 () Bool)

(assert (=> b!1455037 m!1343315))

(declare-fun m!1343317 () Bool)

(assert (=> start!125042 m!1343317))

(declare-fun m!1343319 () Bool)

(assert (=> start!125042 m!1343319))

(declare-fun m!1343321 () Bool)

(assert (=> b!1455044 m!1343321))

(assert (=> b!1455044 m!1343301))

(assert (=> b!1455044 m!1343303))

(declare-fun m!1343323 () Bool)

(assert (=> b!1455043 m!1343323))

(assert (=> b!1455043 m!1343311))

(declare-fun m!1343325 () Bool)

(assert (=> b!1455043 m!1343325))

(declare-fun m!1343327 () Bool)

(assert (=> b!1455043 m!1343327))

(declare-fun m!1343329 () Bool)

(assert (=> b!1455043 m!1343329))

(assert (=> b!1455043 m!1343305))

(declare-fun m!1343331 () Bool)

(assert (=> b!1455045 m!1343331))

(assert (=> b!1455048 m!1343305))

(assert (=> b!1455048 m!1343305))

(declare-fun m!1343333 () Bool)

(assert (=> b!1455048 m!1343333))

(assert (=> b!1455032 m!1343311))

(declare-fun m!1343335 () Bool)

(assert (=> b!1455032 m!1343335))

(assert (=> b!1455032 m!1343325))

(assert (=> b!1455032 m!1343327))

(assert (=> b!1455032 m!1343305))

(declare-fun m!1343337 () Bool)

(assert (=> b!1455033 m!1343337))

(assert (=> b!1455047 m!1343305))

(assert (=> b!1455047 m!1343305))

(declare-fun m!1343339 () Bool)

(assert (=> b!1455047 m!1343339))

(assert (=> b!1455030 m!1343305))

(assert (=> b!1455030 m!1343305))

(declare-fun m!1343341 () Bool)

(assert (=> b!1455030 m!1343341))

(declare-fun m!1343343 () Bool)

(assert (=> b!1455042 m!1343343))

(assert (=> b!1455042 m!1343343))

(declare-fun m!1343345 () Bool)

(assert (=> b!1455042 m!1343345))

(assert (=> b!1455046 m!1343305))

(assert (=> b!1455046 m!1343305))

(declare-fun m!1343347 () Bool)

(assert (=> b!1455046 m!1343347))

(assert (=> b!1455046 m!1343347))

(assert (=> b!1455046 m!1343305))

(declare-fun m!1343349 () Bool)

(assert (=> b!1455046 m!1343349))

(declare-fun m!1343351 () Bool)

(assert (=> b!1455036 m!1343351))

(declare-fun m!1343353 () Bool)

(assert (=> b!1455050 m!1343353))

(assert (=> b!1455050 m!1343353))

(declare-fun m!1343355 () Bool)

(assert (=> b!1455050 m!1343355))

(assert (=> b!1455050 m!1343311))

(declare-fun m!1343357 () Bool)

(assert (=> b!1455050 m!1343357))

(push 1)

