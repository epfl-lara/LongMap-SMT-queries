; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126804 () Bool)

(assert start!126804)

(declare-fun b!1486067 () Bool)

(declare-fun res!1009772 () Bool)

(declare-fun e!833303 () Bool)

(assert (=> b!1486067 (=> (not res!1009772) (not e!833303))))

(declare-fun e!833310 () Bool)

(assert (=> b!1486067 (= res!1009772 e!833310)))

(declare-fun c!137689 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486067 (= c!137689 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486068 () Bool)

(declare-datatypes ((array!99604 0))(
  ( (array!99605 (arr!48073 (Array (_ BitVec 32) (_ BitVec 64))) (size!48624 (_ BitVec 32))) )
))
(declare-fun lt!648371 () array!99604)

(declare-fun lt!648370 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun e!833308 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12210 0))(
  ( (MissingZero!12210 (index!51232 (_ BitVec 32))) (Found!12210 (index!51233 (_ BitVec 32))) (Intermediate!12210 (undefined!13022 Bool) (index!51234 (_ BitVec 32)) (x!132999 (_ BitVec 32))) (Undefined!12210) (MissingVacant!12210 (index!51235 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99604 (_ BitVec 32)) SeekEntryResult!12210)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99604 (_ BitVec 32)) SeekEntryResult!12210)

(assert (=> b!1486068 (= e!833308 (= (seekEntryOrOpen!0 lt!648370 lt!648371 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648370 lt!648371 mask!2687)))))

(declare-fun b!1486069 () Bool)

(declare-fun res!1009755 () Bool)

(declare-fun e!833307 () Bool)

(assert (=> b!1486069 (=> (not res!1009755) (not e!833307))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun a!2862 () array!99604)

(assert (=> b!1486069 (= res!1009755 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48624 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48624 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48624 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486070 () Bool)

(declare-fun lt!648376 () SeekEntryResult!12210)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99604 (_ BitVec 32)) SeekEntryResult!12210)

(assert (=> b!1486070 (= e!833310 (= lt!648376 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648370 lt!648371 mask!2687)))))

(declare-fun b!1486071 () Bool)

(declare-fun res!1009754 () Bool)

(assert (=> b!1486071 (=> (not res!1009754) (not e!833303))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1486071 (= res!1009754 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486072 () Bool)

(declare-fun res!1009769 () Bool)

(assert (=> b!1486072 (=> (not res!1009769) (not e!833307))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486072 (= res!1009769 (validKeyInArray!0 (select (arr!48073 a!2862) i!1006)))))

(declare-fun b!1486073 () Bool)

(declare-fun e!833305 () Bool)

(assert (=> b!1486073 (= e!833305 e!833308)))

(declare-fun res!1009758 () Bool)

(assert (=> b!1486073 (=> (not res!1009758) (not e!833308))))

(declare-fun lt!648373 () (_ BitVec 64))

(assert (=> b!1486073 (= res!1009758 (and (= index!646 intermediateAfterIndex!19) (= lt!648373 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486074 () Bool)

(declare-fun res!1009771 () Bool)

(declare-fun e!833301 () Bool)

(assert (=> b!1486074 (=> (not res!1009771) (not e!833301))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1486074 (= res!1009771 (or (= (select (arr!48073 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48073 a!2862) intermediateBeforeIndex!19) (select (arr!48073 a!2862) j!93))))))

(declare-fun res!1009770 () Bool)

(assert (=> start!126804 (=> (not res!1009770) (not e!833307))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126804 (= res!1009770 (validMask!0 mask!2687))))

(assert (=> start!126804 e!833307))

(assert (=> start!126804 true))

(declare-fun array_inv!37354 (array!99604) Bool)

(assert (=> start!126804 (array_inv!37354 a!2862)))

(declare-fun b!1486075 () Bool)

(declare-fun e!833304 () Bool)

(declare-fun e!833302 () Bool)

(assert (=> b!1486075 (= e!833304 e!833302)))

(declare-fun res!1009768 () Bool)

(assert (=> b!1486075 (=> (not res!1009768) (not e!833302))))

(declare-fun lt!648375 () SeekEntryResult!12210)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486075 (= res!1009768 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48073 a!2862) j!93) mask!2687) (select (arr!48073 a!2862) j!93) a!2862 mask!2687) lt!648375))))

(assert (=> b!1486075 (= lt!648375 (Intermediate!12210 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486076 () Bool)

(assert (=> b!1486076 (= e!833301 e!833305)))

(declare-fun res!1009760 () Bool)

(assert (=> b!1486076 (=> res!1009760 e!833305)))

(assert (=> b!1486076 (= res!1009760 (or (and (= (select (arr!48073 a!2862) index!646) lt!648373) (= (select (arr!48073 a!2862) index!646) (select (arr!48073 a!2862) j!93))) (= (select (arr!48073 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486076 (= lt!648373 (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486077 () Bool)

(declare-fun res!1009764 () Bool)

(assert (=> b!1486077 (=> (not res!1009764) (not e!833301))))

(assert (=> b!1486077 (= res!1009764 (= (seekEntryOrOpen!0 (select (arr!48073 a!2862) j!93) a!2862 mask!2687) (Found!12210 j!93)))))

(declare-fun b!1486078 () Bool)

(declare-fun res!1009762 () Bool)

(assert (=> b!1486078 (=> (not res!1009762) (not e!833307))))

(assert (=> b!1486078 (= res!1009762 (validKeyInArray!0 (select (arr!48073 a!2862) j!93)))))

(declare-fun b!1486079 () Bool)

(declare-fun e!833306 () Bool)

(assert (=> b!1486079 (= e!833303 (not e!833306))))

(declare-fun res!1009756 () Bool)

(assert (=> b!1486079 (=> res!1009756 e!833306)))

(assert (=> b!1486079 (= res!1009756 (or (and (= (select (arr!48073 a!2862) index!646) (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48073 a!2862) index!646) (select (arr!48073 a!2862) j!93))) (= (select (arr!48073 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486079 e!833301))

(declare-fun res!1009763 () Bool)

(assert (=> b!1486079 (=> (not res!1009763) (not e!833301))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99604 (_ BitVec 32)) Bool)

(assert (=> b!1486079 (= res!1009763 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49793 0))(
  ( (Unit!49794) )
))
(declare-fun lt!648372 () Unit!49793)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99604 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49793)

(assert (=> b!1486079 (= lt!648372 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486080 () Bool)

(declare-fun res!1009759 () Bool)

(assert (=> b!1486080 (=> (not res!1009759) (not e!833302))))

(assert (=> b!1486080 (= res!1009759 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48073 a!2862) j!93) a!2862 mask!2687) lt!648375))))

(declare-fun b!1486081 () Bool)

(assert (=> b!1486081 (= e!833302 e!833303)))

(declare-fun res!1009757 () Bool)

(assert (=> b!1486081 (=> (not res!1009757) (not e!833303))))

(assert (=> b!1486081 (= res!1009757 (= lt!648376 (Intermediate!12210 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486081 (= lt!648376 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648370 mask!2687) lt!648370 lt!648371 mask!2687))))

(assert (=> b!1486081 (= lt!648370 (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486082 () Bool)

(declare-fun res!1009765 () Bool)

(assert (=> b!1486082 (=> (not res!1009765) (not e!833307))))

(assert (=> b!1486082 (= res!1009765 (and (= (size!48624 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48624 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48624 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486083 () Bool)

(declare-fun res!1009761 () Bool)

(assert (=> b!1486083 (=> (not res!1009761) (not e!833307))))

(assert (=> b!1486083 (= res!1009761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486084 () Bool)

(assert (=> b!1486084 (= e!833306 true)))

(declare-fun lt!648374 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486084 (= lt!648374 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1486085 () Bool)

(assert (=> b!1486085 (= e!833307 e!833304)))

(declare-fun res!1009766 () Bool)

(assert (=> b!1486085 (=> (not res!1009766) (not e!833304))))

(assert (=> b!1486085 (= res!1009766 (= (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486085 (= lt!648371 (array!99605 (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48624 a!2862)))))

(declare-fun b!1486086 () Bool)

(declare-fun res!1009767 () Bool)

(assert (=> b!1486086 (=> (not res!1009767) (not e!833307))))

(declare-datatypes ((List!34561 0))(
  ( (Nil!34558) (Cons!34557 (h!35945 (_ BitVec 64)) (t!49247 List!34561)) )
))
(declare-fun arrayNoDuplicates!0 (array!99604 (_ BitVec 32) List!34561) Bool)

(assert (=> b!1486086 (= res!1009767 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34558))))

(declare-fun b!1486087 () Bool)

(assert (=> b!1486087 (= e!833310 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648370 lt!648371 mask!2687) (seekEntryOrOpen!0 lt!648370 lt!648371 mask!2687)))))

(assert (= (and start!126804 res!1009770) b!1486082))

(assert (= (and b!1486082 res!1009765) b!1486072))

(assert (= (and b!1486072 res!1009769) b!1486078))

(assert (= (and b!1486078 res!1009762) b!1486083))

(assert (= (and b!1486083 res!1009761) b!1486086))

(assert (= (and b!1486086 res!1009767) b!1486069))

(assert (= (and b!1486069 res!1009755) b!1486085))

(assert (= (and b!1486085 res!1009766) b!1486075))

(assert (= (and b!1486075 res!1009768) b!1486080))

(assert (= (and b!1486080 res!1009759) b!1486081))

(assert (= (and b!1486081 res!1009757) b!1486067))

(assert (= (and b!1486067 c!137689) b!1486070))

(assert (= (and b!1486067 (not c!137689)) b!1486087))

(assert (= (and b!1486067 res!1009772) b!1486071))

(assert (= (and b!1486071 res!1009754) b!1486079))

(assert (= (and b!1486079 res!1009763) b!1486077))

(assert (= (and b!1486077 res!1009764) b!1486074))

(assert (= (and b!1486074 res!1009771) b!1486076))

(assert (= (and b!1486076 (not res!1009760)) b!1486073))

(assert (= (and b!1486073 res!1009758) b!1486068))

(assert (= (and b!1486079 (not res!1009756)) b!1486084))

(declare-fun m!1371367 () Bool)

(assert (=> b!1486087 m!1371367))

(declare-fun m!1371369 () Bool)

(assert (=> b!1486087 m!1371369))

(declare-fun m!1371371 () Bool)

(assert (=> b!1486086 m!1371371))

(assert (=> b!1486068 m!1371369))

(assert (=> b!1486068 m!1371367))

(declare-fun m!1371373 () Bool)

(assert (=> b!1486079 m!1371373))

(declare-fun m!1371375 () Bool)

(assert (=> b!1486079 m!1371375))

(declare-fun m!1371377 () Bool)

(assert (=> b!1486079 m!1371377))

(declare-fun m!1371379 () Bool)

(assert (=> b!1486079 m!1371379))

(declare-fun m!1371381 () Bool)

(assert (=> b!1486079 m!1371381))

(declare-fun m!1371383 () Bool)

(assert (=> b!1486079 m!1371383))

(assert (=> b!1486080 m!1371383))

(assert (=> b!1486080 m!1371383))

(declare-fun m!1371385 () Bool)

(assert (=> b!1486080 m!1371385))

(declare-fun m!1371387 () Bool)

(assert (=> b!1486074 m!1371387))

(assert (=> b!1486074 m!1371383))

(assert (=> b!1486075 m!1371383))

(assert (=> b!1486075 m!1371383))

(declare-fun m!1371389 () Bool)

(assert (=> b!1486075 m!1371389))

(assert (=> b!1486075 m!1371389))

(assert (=> b!1486075 m!1371383))

(declare-fun m!1371391 () Bool)

(assert (=> b!1486075 m!1371391))

(declare-fun m!1371393 () Bool)

(assert (=> b!1486070 m!1371393))

(assert (=> b!1486076 m!1371379))

(assert (=> b!1486076 m!1371383))

(assert (=> b!1486076 m!1371375))

(assert (=> b!1486076 m!1371377))

(assert (=> b!1486077 m!1371383))

(assert (=> b!1486077 m!1371383))

(declare-fun m!1371395 () Bool)

(assert (=> b!1486077 m!1371395))

(declare-fun m!1371397 () Bool)

(assert (=> b!1486081 m!1371397))

(assert (=> b!1486081 m!1371397))

(declare-fun m!1371399 () Bool)

(assert (=> b!1486081 m!1371399))

(assert (=> b!1486081 m!1371375))

(declare-fun m!1371401 () Bool)

(assert (=> b!1486081 m!1371401))

(declare-fun m!1371403 () Bool)

(assert (=> start!126804 m!1371403))

(declare-fun m!1371405 () Bool)

(assert (=> start!126804 m!1371405))

(declare-fun m!1371407 () Bool)

(assert (=> b!1486072 m!1371407))

(assert (=> b!1486072 m!1371407))

(declare-fun m!1371409 () Bool)

(assert (=> b!1486072 m!1371409))

(assert (=> b!1486078 m!1371383))

(assert (=> b!1486078 m!1371383))

(declare-fun m!1371411 () Bool)

(assert (=> b!1486078 m!1371411))

(declare-fun m!1371413 () Bool)

(assert (=> b!1486083 m!1371413))

(assert (=> b!1486085 m!1371375))

(declare-fun m!1371415 () Bool)

(assert (=> b!1486085 m!1371415))

(declare-fun m!1371417 () Bool)

(assert (=> b!1486084 m!1371417))

(check-sat (not b!1486070) (not b!1486087) (not start!126804) (not b!1486083) (not b!1486077) (not b!1486078) (not b!1486081) (not b!1486068) (not b!1486072) (not b!1486079) (not b!1486075) (not b!1486084) (not b!1486086) (not b!1486080))
(check-sat)
