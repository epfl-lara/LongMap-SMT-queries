; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125130 () Bool)

(assert start!125130)

(declare-fun b!1452606 () Bool)

(declare-fun e!817989 () Bool)

(declare-fun e!817992 () Bool)

(assert (=> b!1452606 (= e!817989 e!817992)))

(declare-fun res!983044 () Bool)

(assert (=> b!1452606 (=> (not res!983044) (not e!817992))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11670 0))(
  ( (MissingZero!11670 (index!49072 (_ BitVec 32))) (Found!11670 (index!49073 (_ BitVec 32))) (Intermediate!11670 (undefined!12482 Bool) (index!49074 (_ BitVec 32)) (x!130903 (_ BitVec 32))) (Undefined!11670) (MissingVacant!11670 (index!49075 (_ BitVec 32))) )
))
(declare-fun lt!637087 () SeekEntryResult!11670)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452606 (= res!983044 (= lt!637087 (Intermediate!11670 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!637086 () (_ BitVec 64))

(declare-datatypes ((array!98473 0))(
  ( (array!98474 (arr!47521 (Array (_ BitVec 32) (_ BitVec 64))) (size!48072 (_ BitVec 32))) )
))
(declare-fun lt!637084 () array!98473)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98473 (_ BitVec 32)) SeekEntryResult!11670)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452606 (= lt!637087 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637086 mask!2687) lt!637086 lt!637084 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98473)

(assert (=> b!1452606 (= lt!637086 (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1452607 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!817994 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98473 (_ BitVec 32)) SeekEntryResult!11670)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98473 (_ BitVec 32)) SeekEntryResult!11670)

(assert (=> b!1452607 (= e!817994 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637086 lt!637084 mask!2687) (seekEntryOrOpen!0 lt!637086 lt!637084 mask!2687)))))

(declare-fun b!1452608 () Bool)

(declare-fun res!983039 () Bool)

(declare-fun e!817993 () Bool)

(assert (=> b!1452608 (=> (not res!983039) (not e!817993))))

(assert (=> b!1452608 (= res!983039 (= (seekEntryOrOpen!0 (select (arr!47521 a!2862) j!93) a!2862 mask!2687) (Found!11670 j!93)))))

(declare-fun b!1452609 () Bool)

(assert (=> b!1452609 (= e!817994 (= lt!637087 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637086 lt!637084 mask!2687)))))

(declare-fun b!1452610 () Bool)

(declare-fun res!983048 () Bool)

(declare-fun e!817990 () Bool)

(assert (=> b!1452610 (=> (not res!983048) (not e!817990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98473 (_ BitVec 32)) Bool)

(assert (=> b!1452610 (= res!983048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1452611 () Bool)

(assert (=> b!1452611 (= e!817993 (and (or (= (select (arr!47521 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47521 a!2862) intermediateBeforeIndex!19) (select (arr!47521 a!2862) j!93))) (or (and (= (select (arr!47521 a!2862) index!646) (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47521 a!2862) index!646) (select (arr!47521 a!2862) j!93))) (= (select (arr!47521 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452612 () Bool)

(declare-fun res!983035 () Bool)

(assert (=> b!1452612 (=> (not res!983035) (not e!817990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452612 (= res!983035 (validKeyInArray!0 (select (arr!47521 a!2862) j!93)))))

(declare-fun b!1452613 () Bool)

(declare-fun res!983045 () Bool)

(assert (=> b!1452613 (=> (not res!983045) (not e!817992))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1452613 (= res!983045 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1452614 () Bool)

(declare-fun res!983047 () Bool)

(assert (=> b!1452614 (=> (not res!983047) (not e!817989))))

(declare-fun lt!637083 () SeekEntryResult!11670)

(assert (=> b!1452614 (= res!983047 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47521 a!2862) j!93) a!2862 mask!2687) lt!637083))))

(declare-fun b!1452615 () Bool)

(assert (=> b!1452615 (= e!817992 (not (or (and (= (select (arr!47521 a!2862) index!646) (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47521 a!2862) index!646) (select (arr!47521 a!2862) j!93))) (= (select (arr!47521 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvsge mask!2687 #b00000000000000000000000000000000))))))

(assert (=> b!1452615 e!817993))

(declare-fun res!983040 () Bool)

(assert (=> b!1452615 (=> (not res!983040) (not e!817993))))

(assert (=> b!1452615 (= res!983040 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48869 0))(
  ( (Unit!48870) )
))
(declare-fun lt!637085 () Unit!48869)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98473 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48869)

(assert (=> b!1452615 (= lt!637085 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452616 () Bool)

(declare-fun res!983038 () Bool)

(assert (=> b!1452616 (=> (not res!983038) (not e!817990))))

(assert (=> b!1452616 (= res!983038 (validKeyInArray!0 (select (arr!47521 a!2862) i!1006)))))

(declare-fun res!983043 () Bool)

(assert (=> start!125130 (=> (not res!983043) (not e!817990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125130 (= res!983043 (validMask!0 mask!2687))))

(assert (=> start!125130 e!817990))

(assert (=> start!125130 true))

(declare-fun array_inv!36802 (array!98473) Bool)

(assert (=> start!125130 (array_inv!36802 a!2862)))

(declare-fun b!1452617 () Bool)

(declare-fun e!817995 () Bool)

(assert (=> b!1452617 (= e!817995 e!817989)))

(declare-fun res!983037 () Bool)

(assert (=> b!1452617 (=> (not res!983037) (not e!817989))))

(assert (=> b!1452617 (= res!983037 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47521 a!2862) j!93) mask!2687) (select (arr!47521 a!2862) j!93) a!2862 mask!2687) lt!637083))))

(assert (=> b!1452617 (= lt!637083 (Intermediate!11670 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452618 () Bool)

(declare-fun res!983041 () Bool)

(assert (=> b!1452618 (=> (not res!983041) (not e!817990))))

(assert (=> b!1452618 (= res!983041 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48072 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48072 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48072 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1452619 () Bool)

(declare-fun res!983034 () Bool)

(assert (=> b!1452619 (=> (not res!983034) (not e!817990))))

(assert (=> b!1452619 (= res!983034 (and (= (size!48072 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48072 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48072 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452620 () Bool)

(declare-fun res!983042 () Bool)

(assert (=> b!1452620 (=> (not res!983042) (not e!817992))))

(assert (=> b!1452620 (= res!983042 e!817994)))

(declare-fun c!134305 () Bool)

(assert (=> b!1452620 (= c!134305 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452621 () Bool)

(declare-fun res!983036 () Bool)

(assert (=> b!1452621 (=> (not res!983036) (not e!817990))))

(declare-datatypes ((List!34009 0))(
  ( (Nil!34006) (Cons!34005 (h!35366 (_ BitVec 64)) (t!48695 List!34009)) )
))
(declare-fun arrayNoDuplicates!0 (array!98473 (_ BitVec 32) List!34009) Bool)

(assert (=> b!1452621 (= res!983036 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34006))))

(declare-fun b!1452622 () Bool)

(assert (=> b!1452622 (= e!817990 e!817995)))

(declare-fun res!983046 () Bool)

(assert (=> b!1452622 (=> (not res!983046) (not e!817995))))

(assert (=> b!1452622 (= res!983046 (= (select (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452622 (= lt!637084 (array!98474 (store (arr!47521 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48072 a!2862)))))

(assert (= (and start!125130 res!983043) b!1452619))

(assert (= (and b!1452619 res!983034) b!1452616))

(assert (= (and b!1452616 res!983038) b!1452612))

(assert (= (and b!1452612 res!983035) b!1452610))

(assert (= (and b!1452610 res!983048) b!1452621))

(assert (= (and b!1452621 res!983036) b!1452618))

(assert (= (and b!1452618 res!983041) b!1452622))

(assert (= (and b!1452622 res!983046) b!1452617))

(assert (= (and b!1452617 res!983037) b!1452614))

(assert (= (and b!1452614 res!983047) b!1452606))

(assert (= (and b!1452606 res!983044) b!1452620))

(assert (= (and b!1452620 c!134305) b!1452609))

(assert (= (and b!1452620 (not c!134305)) b!1452607))

(assert (= (and b!1452620 res!983042) b!1452613))

(assert (= (and b!1452613 res!983045) b!1452615))

(assert (= (and b!1452615 res!983040) b!1452608))

(assert (= (and b!1452608 res!983039) b!1452611))

(declare-fun m!1341319 () Bool)

(assert (=> b!1452607 m!1341319))

(declare-fun m!1341321 () Bool)

(assert (=> b!1452607 m!1341321))

(declare-fun m!1341323 () Bool)

(assert (=> b!1452614 m!1341323))

(assert (=> b!1452614 m!1341323))

(declare-fun m!1341325 () Bool)

(assert (=> b!1452614 m!1341325))

(declare-fun m!1341327 () Bool)

(assert (=> b!1452616 m!1341327))

(assert (=> b!1452616 m!1341327))

(declare-fun m!1341329 () Bool)

(assert (=> b!1452616 m!1341329))

(declare-fun m!1341331 () Bool)

(assert (=> b!1452611 m!1341331))

(declare-fun m!1341333 () Bool)

(assert (=> b!1452611 m!1341333))

(declare-fun m!1341335 () Bool)

(assert (=> b!1452611 m!1341335))

(declare-fun m!1341337 () Bool)

(assert (=> b!1452611 m!1341337))

(assert (=> b!1452611 m!1341323))

(assert (=> b!1452622 m!1341331))

(declare-fun m!1341339 () Bool)

(assert (=> b!1452622 m!1341339))

(declare-fun m!1341341 () Bool)

(assert (=> start!125130 m!1341341))

(declare-fun m!1341343 () Bool)

(assert (=> start!125130 m!1341343))

(declare-fun m!1341345 () Bool)

(assert (=> b!1452610 m!1341345))

(assert (=> b!1452612 m!1341323))

(assert (=> b!1452612 m!1341323))

(declare-fun m!1341347 () Bool)

(assert (=> b!1452612 m!1341347))

(assert (=> b!1452617 m!1341323))

(assert (=> b!1452617 m!1341323))

(declare-fun m!1341349 () Bool)

(assert (=> b!1452617 m!1341349))

(assert (=> b!1452617 m!1341349))

(assert (=> b!1452617 m!1341323))

(declare-fun m!1341351 () Bool)

(assert (=> b!1452617 m!1341351))

(declare-fun m!1341353 () Bool)

(assert (=> b!1452606 m!1341353))

(assert (=> b!1452606 m!1341353))

(declare-fun m!1341355 () Bool)

(assert (=> b!1452606 m!1341355))

(assert (=> b!1452606 m!1341331))

(declare-fun m!1341357 () Bool)

(assert (=> b!1452606 m!1341357))

(declare-fun m!1341359 () Bool)

(assert (=> b!1452615 m!1341359))

(assert (=> b!1452615 m!1341331))

(assert (=> b!1452615 m!1341335))

(assert (=> b!1452615 m!1341337))

(declare-fun m!1341361 () Bool)

(assert (=> b!1452615 m!1341361))

(assert (=> b!1452615 m!1341323))

(assert (=> b!1452608 m!1341323))

(assert (=> b!1452608 m!1341323))

(declare-fun m!1341363 () Bool)

(assert (=> b!1452608 m!1341363))

(declare-fun m!1341365 () Bool)

(assert (=> b!1452621 m!1341365))

(declare-fun m!1341367 () Bool)

(assert (=> b!1452609 m!1341367))

(check-sat (not b!1452614) (not b!1452615) (not b!1452606) (not b!1452609) (not b!1452612) (not b!1452610) (not start!125130) (not b!1452608) (not b!1452617) (not b!1452607) (not b!1452616) (not b!1452621))
(check-sat)
