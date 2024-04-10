; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124752 () Bool)

(assert start!124752)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1446660 () Bool)

(declare-fun e!814779 () Bool)

(assert (=> b!1446660 (= e!814779 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1446661 () Bool)

(declare-fun e!814777 () Bool)

(declare-fun e!814783 () Bool)

(assert (=> b!1446661 (= e!814777 e!814783)))

(declare-fun res!978398 () Bool)

(assert (=> b!1446661 (=> (not res!978398) (not e!814783))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98200 0))(
  ( (array!98201 (arr!47388 (Array (_ BitVec 32) (_ BitVec 64))) (size!47938 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98200)

(assert (=> b!1446661 (= res!978398 (= (select (store (arr!47388 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634876 () array!98200)

(assert (=> b!1446661 (= lt!634876 (array!98201 (store (arr!47388 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47938 a!2862)))))

(declare-fun b!1446662 () Bool)

(declare-fun e!814784 () Bool)

(assert (=> b!1446662 (= e!814784 e!814779)))

(declare-fun res!978401 () Bool)

(assert (=> b!1446662 (=> (not res!978401) (not e!814779))))

(declare-datatypes ((SeekEntryResult!11640 0))(
  ( (MissingZero!11640 (index!48952 (_ BitVec 32))) (Found!11640 (index!48953 (_ BitVec 32))) (Intermediate!11640 (undefined!12452 Bool) (index!48954 (_ BitVec 32)) (x!130633 (_ BitVec 32))) (Undefined!11640) (MissingVacant!11640 (index!48955 (_ BitVec 32))) )
))
(declare-fun lt!634879 () SeekEntryResult!11640)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98200 (_ BitVec 32)) SeekEntryResult!11640)

(assert (=> b!1446662 (= res!978401 (= lt!634879 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47388 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1446663 () Bool)

(declare-fun res!978406 () Bool)

(declare-fun e!814776 () Bool)

(assert (=> b!1446663 (=> (not res!978406) (not e!814776))))

(assert (=> b!1446663 (= res!978406 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!978396 () Bool)

(assert (=> start!124752 (=> (not res!978396) (not e!814777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124752 (= res!978396 (validMask!0 mask!2687))))

(assert (=> start!124752 e!814777))

(assert (=> start!124752 true))

(declare-fun array_inv!36416 (array!98200) Bool)

(assert (=> start!124752 (array_inv!36416 a!2862)))

(declare-fun b!1446664 () Bool)

(declare-fun e!814781 () Bool)

(assert (=> b!1446664 (= e!814781 e!814776)))

(declare-fun res!978407 () Bool)

(assert (=> b!1446664 (=> (not res!978407) (not e!814776))))

(declare-fun lt!634878 () SeekEntryResult!11640)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1446664 (= res!978407 (= lt!634878 (Intermediate!11640 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!634881 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98200 (_ BitVec 32)) SeekEntryResult!11640)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1446664 (= lt!634878 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634881 mask!2687) lt!634881 lt!634876 mask!2687))))

(assert (=> b!1446664 (= lt!634881 (select (store (arr!47388 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1446665 () Bool)

(declare-fun res!978405 () Bool)

(assert (=> b!1446665 (=> (not res!978405) (not e!814777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98200 (_ BitVec 32)) Bool)

(assert (=> b!1446665 (= res!978405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1446666 () Bool)

(declare-fun res!978395 () Bool)

(assert (=> b!1446666 (=> (not res!978395) (not e!814777))))

(assert (=> b!1446666 (= res!978395 (and (= (size!47938 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47938 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47938 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1446667 () Bool)

(declare-fun res!978403 () Bool)

(assert (=> b!1446667 (=> (not res!978403) (not e!814777))))

(assert (=> b!1446667 (= res!978403 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47938 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47938 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47938 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1446668 () Bool)

(declare-fun res!978408 () Bool)

(assert (=> b!1446668 (=> (not res!978408) (not e!814777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1446668 (= res!978408 (validKeyInArray!0 (select (arr!47388 a!2862) i!1006)))))

(declare-fun b!1446669 () Bool)

(declare-fun e!814780 () Bool)

(assert (=> b!1446669 (= e!814780 true)))

(declare-fun lt!634880 () SeekEntryResult!11640)

(assert (=> b!1446669 (= lt!634880 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47388 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1446670 () Bool)

(declare-fun res!978402 () Bool)

(assert (=> b!1446670 (=> (not res!978402) (not e!814777))))

(assert (=> b!1446670 (= res!978402 (validKeyInArray!0 (select (arr!47388 a!2862) j!93)))))

(declare-fun b!1446671 () Bool)

(declare-fun res!978399 () Bool)

(assert (=> b!1446671 (=> (not res!978399) (not e!814776))))

(declare-fun e!814782 () Bool)

(assert (=> b!1446671 (= res!978399 e!814782)))

(declare-fun c!133644 () Bool)

(assert (=> b!1446671 (= c!133644 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1446672 () Bool)

(declare-fun e!814775 () Bool)

(assert (=> b!1446672 (= e!814775 e!814784)))

(declare-fun res!978400 () Bool)

(assert (=> b!1446672 (=> res!978400 e!814784)))

(assert (=> b!1446672 (= res!978400 (or (and (= (select (arr!47388 a!2862) index!646) (select (store (arr!47388 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47388 a!2862) index!646) (select (arr!47388 a!2862) j!93))) (not (= (select (arr!47388 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1446673 () Bool)

(assert (=> b!1446673 (= e!814776 (not e!814780))))

(declare-fun res!978394 () Bool)

(assert (=> b!1446673 (=> res!978394 e!814780)))

(assert (=> b!1446673 (= res!978394 (or (and (= (select (arr!47388 a!2862) index!646) (select (store (arr!47388 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47388 a!2862) index!646) (select (arr!47388 a!2862) j!93))) (not (= (select (arr!47388 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47388 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1446673 e!814775))

(declare-fun res!978409 () Bool)

(assert (=> b!1446673 (=> (not res!978409) (not e!814775))))

(assert (=> b!1446673 (= res!978409 (and (= lt!634879 (Found!11640 j!93)) (or (= (select (arr!47388 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47388 a!2862) intermediateBeforeIndex!19) (select (arr!47388 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98200 (_ BitVec 32)) SeekEntryResult!11640)

(assert (=> b!1446673 (= lt!634879 (seekEntryOrOpen!0 (select (arr!47388 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1446673 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48776 0))(
  ( (Unit!48777) )
))
(declare-fun lt!634875 () Unit!48776)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98200 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48776)

(assert (=> b!1446673 (= lt!634875 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1446674 () Bool)

(declare-fun res!978393 () Bool)

(assert (=> b!1446674 (=> (not res!978393) (not e!814777))))

(declare-datatypes ((List!33889 0))(
  ( (Nil!33886) (Cons!33885 (h!35235 (_ BitVec 64)) (t!48583 List!33889)) )
))
(declare-fun arrayNoDuplicates!0 (array!98200 (_ BitVec 32) List!33889) Bool)

(assert (=> b!1446674 (= res!978393 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33886))))

(declare-fun b!1446675 () Bool)

(declare-fun res!978404 () Bool)

(assert (=> b!1446675 (=> (not res!978404) (not e!814781))))

(declare-fun lt!634877 () SeekEntryResult!11640)

(assert (=> b!1446675 (= res!978404 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47388 a!2862) j!93) a!2862 mask!2687) lt!634877))))

(declare-fun b!1446676 () Bool)

(assert (=> b!1446676 (= e!814782 (= lt!634878 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634881 lt!634876 mask!2687)))))

(declare-fun b!1446677 () Bool)

(assert (=> b!1446677 (= e!814783 e!814781)))

(declare-fun res!978397 () Bool)

(assert (=> b!1446677 (=> (not res!978397) (not e!814781))))

(assert (=> b!1446677 (= res!978397 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47388 a!2862) j!93) mask!2687) (select (arr!47388 a!2862) j!93) a!2862 mask!2687) lt!634877))))

(assert (=> b!1446677 (= lt!634877 (Intermediate!11640 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1446678 () Bool)

(assert (=> b!1446678 (= e!814782 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634881 lt!634876 mask!2687) (seekEntryOrOpen!0 lt!634881 lt!634876 mask!2687)))))

(assert (= (and start!124752 res!978396) b!1446666))

(assert (= (and b!1446666 res!978395) b!1446668))

(assert (= (and b!1446668 res!978408) b!1446670))

(assert (= (and b!1446670 res!978402) b!1446665))

(assert (= (and b!1446665 res!978405) b!1446674))

(assert (= (and b!1446674 res!978393) b!1446667))

(assert (= (and b!1446667 res!978403) b!1446661))

(assert (= (and b!1446661 res!978398) b!1446677))

(assert (= (and b!1446677 res!978397) b!1446675))

(assert (= (and b!1446675 res!978404) b!1446664))

(assert (= (and b!1446664 res!978407) b!1446671))

(assert (= (and b!1446671 c!133644) b!1446676))

(assert (= (and b!1446671 (not c!133644)) b!1446678))

(assert (= (and b!1446671 res!978399) b!1446663))

(assert (= (and b!1446663 res!978406) b!1446673))

(assert (= (and b!1446673 res!978409) b!1446672))

(assert (= (and b!1446672 (not res!978400)) b!1446662))

(assert (= (and b!1446662 res!978401) b!1446660))

(assert (= (and b!1446673 (not res!978394)) b!1446669))

(declare-fun m!1335517 () Bool)

(assert (=> b!1446662 m!1335517))

(assert (=> b!1446662 m!1335517))

(declare-fun m!1335519 () Bool)

(assert (=> b!1446662 m!1335519))

(declare-fun m!1335521 () Bool)

(assert (=> b!1446664 m!1335521))

(assert (=> b!1446664 m!1335521))

(declare-fun m!1335523 () Bool)

(assert (=> b!1446664 m!1335523))

(declare-fun m!1335525 () Bool)

(assert (=> b!1446664 m!1335525))

(declare-fun m!1335527 () Bool)

(assert (=> b!1446664 m!1335527))

(declare-fun m!1335529 () Bool)

(assert (=> b!1446665 m!1335529))

(declare-fun m!1335531 () Bool)

(assert (=> b!1446673 m!1335531))

(assert (=> b!1446673 m!1335525))

(declare-fun m!1335533 () Bool)

(assert (=> b!1446673 m!1335533))

(declare-fun m!1335535 () Bool)

(assert (=> b!1446673 m!1335535))

(declare-fun m!1335537 () Bool)

(assert (=> b!1446673 m!1335537))

(assert (=> b!1446673 m!1335517))

(declare-fun m!1335539 () Bool)

(assert (=> b!1446673 m!1335539))

(declare-fun m!1335541 () Bool)

(assert (=> b!1446673 m!1335541))

(assert (=> b!1446673 m!1335517))

(declare-fun m!1335543 () Bool)

(assert (=> b!1446668 m!1335543))

(assert (=> b!1446668 m!1335543))

(declare-fun m!1335545 () Bool)

(assert (=> b!1446668 m!1335545))

(assert (=> b!1446677 m!1335517))

(assert (=> b!1446677 m!1335517))

(declare-fun m!1335547 () Bool)

(assert (=> b!1446677 m!1335547))

(assert (=> b!1446677 m!1335547))

(assert (=> b!1446677 m!1335517))

(declare-fun m!1335549 () Bool)

(assert (=> b!1446677 m!1335549))

(assert (=> b!1446661 m!1335525))

(declare-fun m!1335551 () Bool)

(assert (=> b!1446661 m!1335551))

(declare-fun m!1335553 () Bool)

(assert (=> start!124752 m!1335553))

(declare-fun m!1335555 () Bool)

(assert (=> start!124752 m!1335555))

(assert (=> b!1446675 m!1335517))

(assert (=> b!1446675 m!1335517))

(declare-fun m!1335557 () Bool)

(assert (=> b!1446675 m!1335557))

(declare-fun m!1335559 () Bool)

(assert (=> b!1446678 m!1335559))

(declare-fun m!1335561 () Bool)

(assert (=> b!1446678 m!1335561))

(declare-fun m!1335563 () Bool)

(assert (=> b!1446676 m!1335563))

(assert (=> b!1446672 m!1335537))

(assert (=> b!1446672 m!1335525))

(assert (=> b!1446672 m!1335535))

(assert (=> b!1446672 m!1335517))

(declare-fun m!1335565 () Bool)

(assert (=> b!1446674 m!1335565))

(assert (=> b!1446669 m!1335517))

(assert (=> b!1446669 m!1335517))

(declare-fun m!1335567 () Bool)

(assert (=> b!1446669 m!1335567))

(assert (=> b!1446670 m!1335517))

(assert (=> b!1446670 m!1335517))

(declare-fun m!1335569 () Bool)

(assert (=> b!1446670 m!1335569))

(check-sat (not b!1446675) (not b!1446674) (not b!1446668) (not b!1446662) (not b!1446676) (not b!1446664) (not b!1446669) (not b!1446665) (not b!1446678) (not b!1446670) (not b!1446673) (not b!1446677) (not start!124752))
(check-sat)
