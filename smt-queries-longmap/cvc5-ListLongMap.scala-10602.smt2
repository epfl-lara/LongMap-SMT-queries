; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124750 () Bool)

(assert start!124750)

(declare-fun b!1446603 () Bool)

(declare-fun res!978346 () Bool)

(declare-fun e!814746 () Bool)

(assert (=> b!1446603 (=> (not res!978346) (not e!814746))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98198 0))(
  ( (array!98199 (arr!47387 (Array (_ BitVec 32) (_ BitVec 64))) (size!47937 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98198)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1446603 (= res!978346 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47937 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47937 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47937 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!814750 () Bool)

(declare-fun lt!634857 () (_ BitVec 64))

(declare-fun b!1446604 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!634858 () array!98198)

(declare-datatypes ((SeekEntryResult!11639 0))(
  ( (MissingZero!11639 (index!48948 (_ BitVec 32))) (Found!11639 (index!48949 (_ BitVec 32))) (Intermediate!11639 (undefined!12451 Bool) (index!48950 (_ BitVec 32)) (x!130632 (_ BitVec 32))) (Undefined!11639) (MissingVacant!11639 (index!48951 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98198 (_ BitVec 32)) SeekEntryResult!11639)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98198 (_ BitVec 32)) SeekEntryResult!11639)

(assert (=> b!1446604 (= e!814750 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634857 lt!634858 mask!2687) (seekEntryOrOpen!0 lt!634857 lt!634858 mask!2687)))))

(declare-fun b!1446605 () Bool)

(declare-fun res!978347 () Bool)

(assert (=> b!1446605 (=> (not res!978347) (not e!814746))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446605 (= res!978347 (validKeyInArray!0 (select (arr!47387 a!2862) i!1006)))))

(declare-fun b!1446606 () Bool)

(declare-fun e!814748 () Bool)

(declare-fun e!814745 () Bool)

(assert (=> b!1446606 (= e!814748 e!814745)))

(declare-fun res!978350 () Bool)

(assert (=> b!1446606 (=> (not res!978350) (not e!814745))))

(declare-fun lt!634860 () SeekEntryResult!11639)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1446606 (= res!978350 (= lt!634860 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47387 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446607 () Bool)

(declare-fun res!978348 () Bool)

(assert (=> b!1446607 (=> (not res!978348) (not e!814746))))

(declare-datatypes ((List!33888 0))(
  ( (Nil!33885) (Cons!33884 (h!35234 (_ BitVec 64)) (t!48582 List!33888)) )
))
(declare-fun arrayNoDuplicates!0 (array!98198 (_ BitVec 32) List!33888) Bool)

(assert (=> b!1446607 (= res!978348 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33885))))

(declare-fun b!1446608 () Bool)

(declare-fun res!978354 () Bool)

(declare-fun e!814749 () Bool)

(assert (=> b!1446608 (=> (not res!978354) (not e!814749))))

(assert (=> b!1446608 (= res!978354 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1446609 () Bool)

(declare-fun res!978358 () Bool)

(assert (=> b!1446609 (=> (not res!978358) (not e!814749))))

(assert (=> b!1446609 (= res!978358 e!814750)))

(declare-fun c!133641 () Bool)

(assert (=> b!1446609 (= c!133641 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!978343 () Bool)

(assert (=> start!124750 (=> (not res!978343) (not e!814746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124750 (= res!978343 (validMask!0 mask!2687))))

(assert (=> start!124750 e!814746))

(assert (=> start!124750 true))

(declare-fun array_inv!36415 (array!98198) Bool)

(assert (=> start!124750 (array_inv!36415 a!2862)))

(declare-fun b!1446610 () Bool)

(declare-fun e!814747 () Bool)

(assert (=> b!1446610 (= e!814749 (not e!814747))))

(declare-fun res!978351 () Bool)

(assert (=> b!1446610 (=> res!978351 e!814747)))

(assert (=> b!1446610 (= res!978351 (or (and (= (select (arr!47387 a!2862) index!646) (select (store (arr!47387 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47387 a!2862) index!646) (select (arr!47387 a!2862) j!93))) (not (= (select (arr!47387 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47387 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!814751 () Bool)

(assert (=> b!1446610 e!814751))

(declare-fun res!978349 () Bool)

(assert (=> b!1446610 (=> (not res!978349) (not e!814751))))

(assert (=> b!1446610 (= res!978349 (and (= lt!634860 (Found!11639 j!93)) (or (= (select (arr!47387 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47387 a!2862) intermediateBeforeIndex!19) (select (arr!47387 a!2862) j!93)))))))

(assert (=> b!1446610 (= lt!634860 (seekEntryOrOpen!0 (select (arr!47387 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98198 (_ BitVec 32)) Bool)

(assert (=> b!1446610 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48774 0))(
  ( (Unit!48775) )
))
(declare-fun lt!634855 () Unit!48774)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98198 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48774)

(assert (=> b!1446610 (= lt!634855 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446611 () Bool)

(assert (=> b!1446611 (= e!814747 true)))

(declare-fun lt!634859 () SeekEntryResult!11639)

(assert (=> b!1446611 (= lt!634859 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47387 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446612 () Bool)

(declare-fun e!814753 () Bool)

(assert (=> b!1446612 (= e!814746 e!814753)))

(declare-fun res!978355 () Bool)

(assert (=> b!1446612 (=> (not res!978355) (not e!814753))))

(assert (=> b!1446612 (= res!978355 (= (select (store (arr!47387 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1446612 (= lt!634858 (array!98199 (store (arr!47387 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47937 a!2862)))))

(declare-fun b!1446613 () Bool)

(declare-fun res!978357 () Bool)

(assert (=> b!1446613 (=> (not res!978357) (not e!814746))))

(assert (=> b!1446613 (= res!978357 (validKeyInArray!0 (select (arr!47387 a!2862) j!93)))))

(declare-fun b!1446614 () Bool)

(declare-fun e!814752 () Bool)

(assert (=> b!1446614 (= e!814753 e!814752)))

(declare-fun res!978352 () Bool)

(assert (=> b!1446614 (=> (not res!978352) (not e!814752))))

(declare-fun lt!634854 () SeekEntryResult!11639)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98198 (_ BitVec 32)) SeekEntryResult!11639)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446614 (= res!978352 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47387 a!2862) j!93) mask!2687) (select (arr!47387 a!2862) j!93) a!2862 mask!2687) lt!634854))))

(assert (=> b!1446614 (= lt!634854 (Intermediate!11639 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446615 () Bool)

(assert (=> b!1446615 (= e!814751 e!814748)))

(declare-fun res!978342 () Bool)

(assert (=> b!1446615 (=> res!978342 e!814748)))

(assert (=> b!1446615 (= res!978342 (or (and (= (select (arr!47387 a!2862) index!646) (select (store (arr!47387 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47387 a!2862) index!646) (select (arr!47387 a!2862) j!93))) (not (= (select (arr!47387 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446616 () Bool)

(assert (=> b!1446616 (= e!814745 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446617 () Bool)

(declare-fun res!978345 () Bool)

(assert (=> b!1446617 (=> (not res!978345) (not e!814746))))

(assert (=> b!1446617 (= res!978345 (and (= (size!47937 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47937 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47937 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446618 () Bool)

(assert (=> b!1446618 (= e!814752 e!814749)))

(declare-fun res!978344 () Bool)

(assert (=> b!1446618 (=> (not res!978344) (not e!814749))))

(declare-fun lt!634856 () SeekEntryResult!11639)

(assert (=> b!1446618 (= res!978344 (= lt!634856 (Intermediate!11639 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1446618 (= lt!634856 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634857 mask!2687) lt!634857 lt!634858 mask!2687))))

(assert (=> b!1446618 (= lt!634857 (select (store (arr!47387 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446619 () Bool)

(declare-fun res!978356 () Bool)

(assert (=> b!1446619 (=> (not res!978356) (not e!814746))))

(assert (=> b!1446619 (= res!978356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446620 () Bool)

(assert (=> b!1446620 (= e!814750 (= lt!634856 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634857 lt!634858 mask!2687)))))

(declare-fun b!1446621 () Bool)

(declare-fun res!978353 () Bool)

(assert (=> b!1446621 (=> (not res!978353) (not e!814752))))

(assert (=> b!1446621 (= res!978353 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47387 a!2862) j!93) a!2862 mask!2687) lt!634854))))

(assert (= (and start!124750 res!978343) b!1446617))

(assert (= (and b!1446617 res!978345) b!1446605))

(assert (= (and b!1446605 res!978347) b!1446613))

(assert (= (and b!1446613 res!978357) b!1446619))

(assert (= (and b!1446619 res!978356) b!1446607))

(assert (= (and b!1446607 res!978348) b!1446603))

(assert (= (and b!1446603 res!978346) b!1446612))

(assert (= (and b!1446612 res!978355) b!1446614))

(assert (= (and b!1446614 res!978352) b!1446621))

(assert (= (and b!1446621 res!978353) b!1446618))

(assert (= (and b!1446618 res!978344) b!1446609))

(assert (= (and b!1446609 c!133641) b!1446620))

(assert (= (and b!1446609 (not c!133641)) b!1446604))

(assert (= (and b!1446609 res!978358) b!1446608))

(assert (= (and b!1446608 res!978354) b!1446610))

(assert (= (and b!1446610 res!978349) b!1446615))

(assert (= (and b!1446615 (not res!978342)) b!1446606))

(assert (= (and b!1446606 res!978350) b!1446616))

(assert (= (and b!1446610 (not res!978351)) b!1446611))

(declare-fun m!1335463 () Bool)

(assert (=> b!1446621 m!1335463))

(assert (=> b!1446621 m!1335463))

(declare-fun m!1335465 () Bool)

(assert (=> b!1446621 m!1335465))

(declare-fun m!1335467 () Bool)

(assert (=> b!1446618 m!1335467))

(assert (=> b!1446618 m!1335467))

(declare-fun m!1335469 () Bool)

(assert (=> b!1446618 m!1335469))

(declare-fun m!1335471 () Bool)

(assert (=> b!1446618 m!1335471))

(declare-fun m!1335473 () Bool)

(assert (=> b!1446618 m!1335473))

(declare-fun m!1335475 () Bool)

(assert (=> b!1446619 m!1335475))

(declare-fun m!1335477 () Bool)

(assert (=> start!124750 m!1335477))

(declare-fun m!1335479 () Bool)

(assert (=> start!124750 m!1335479))

(assert (=> b!1446612 m!1335471))

(declare-fun m!1335481 () Bool)

(assert (=> b!1446612 m!1335481))

(assert (=> b!1446606 m!1335463))

(assert (=> b!1446606 m!1335463))

(declare-fun m!1335483 () Bool)

(assert (=> b!1446606 m!1335483))

(declare-fun m!1335485 () Bool)

(assert (=> b!1446605 m!1335485))

(assert (=> b!1446605 m!1335485))

(declare-fun m!1335487 () Bool)

(assert (=> b!1446605 m!1335487))

(declare-fun m!1335489 () Bool)

(assert (=> b!1446607 m!1335489))

(declare-fun m!1335491 () Bool)

(assert (=> b!1446615 m!1335491))

(assert (=> b!1446615 m!1335471))

(declare-fun m!1335493 () Bool)

(assert (=> b!1446615 m!1335493))

(assert (=> b!1446615 m!1335463))

(assert (=> b!1446614 m!1335463))

(assert (=> b!1446614 m!1335463))

(declare-fun m!1335495 () Bool)

(assert (=> b!1446614 m!1335495))

(assert (=> b!1446614 m!1335495))

(assert (=> b!1446614 m!1335463))

(declare-fun m!1335497 () Bool)

(assert (=> b!1446614 m!1335497))

(assert (=> b!1446613 m!1335463))

(assert (=> b!1446613 m!1335463))

(declare-fun m!1335499 () Bool)

(assert (=> b!1446613 m!1335499))

(declare-fun m!1335501 () Bool)

(assert (=> b!1446604 m!1335501))

(declare-fun m!1335503 () Bool)

(assert (=> b!1446604 m!1335503))

(declare-fun m!1335505 () Bool)

(assert (=> b!1446620 m!1335505))

(declare-fun m!1335507 () Bool)

(assert (=> b!1446610 m!1335507))

(assert (=> b!1446610 m!1335471))

(declare-fun m!1335509 () Bool)

(assert (=> b!1446610 m!1335509))

(assert (=> b!1446610 m!1335493))

(assert (=> b!1446610 m!1335491))

(assert (=> b!1446610 m!1335463))

(declare-fun m!1335511 () Bool)

(assert (=> b!1446610 m!1335511))

(declare-fun m!1335513 () Bool)

(assert (=> b!1446610 m!1335513))

(assert (=> b!1446610 m!1335463))

(assert (=> b!1446611 m!1335463))

(assert (=> b!1446611 m!1335463))

(declare-fun m!1335515 () Bool)

(assert (=> b!1446611 m!1335515))

(push 1)

