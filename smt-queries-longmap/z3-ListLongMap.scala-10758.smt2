; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125808 () Bool)

(assert start!125808)

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((array!99142 0))(
  ( (array!99143 (arr!47856 (Array (_ BitVec 32) (_ BitVec 64))) (size!48406 (_ BitVec 32))) )
))
(declare-fun lt!643674 () array!99142)

(declare-fun e!826488 () Bool)

(declare-fun lt!643672 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun b!1472774 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12096 0))(
  ( (MissingZero!12096 (index!50776 (_ BitVec 32))) (Found!12096 (index!50777 (_ BitVec 32))) (Intermediate!12096 (undefined!12908 Bool) (index!50778 (_ BitVec 32)) (x!132355 (_ BitVec 32))) (Undefined!12096) (MissingVacant!12096 (index!50779 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99142 (_ BitVec 32)) SeekEntryResult!12096)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99142 (_ BitVec 32)) SeekEntryResult!12096)

(assert (=> b!1472774 (= e!826488 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643672 lt!643674 mask!2687) (seekEntryOrOpen!0 lt!643672 lt!643674 mask!2687)))))

(declare-fun b!1472775 () Bool)

(declare-fun res!1000405 () Bool)

(declare-fun e!826487 () Bool)

(assert (=> b!1472775 (=> (not res!1000405) (not e!826487))))

(declare-fun a!2862 () array!99142)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1472775 (= res!1000405 (validKeyInArray!0 (select (arr!47856 a!2862) j!93)))))

(declare-fun b!1472776 () Bool)

(declare-fun res!1000398 () Bool)

(declare-fun e!826492 () Bool)

(assert (=> b!1472776 (=> (not res!1000398) (not e!826492))))

(assert (=> b!1472776 (= res!1000398 e!826488)))

(declare-fun c!135702 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1472776 (= c!135702 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1472777 () Bool)

(declare-fun res!1000399 () Bool)

(assert (=> b!1472777 (=> (not res!1000399) (not e!826487))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99142 (_ BitVec 32)) Bool)

(assert (=> b!1472777 (= res!1000399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1000410 () Bool)

(assert (=> start!125808 (=> (not res!1000410) (not e!826487))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125808 (= res!1000410 (validMask!0 mask!2687))))

(assert (=> start!125808 e!826487))

(assert (=> start!125808 true))

(declare-fun array_inv!36884 (array!99142) Bool)

(assert (=> start!125808 (array_inv!36884 a!2862)))

(declare-fun b!1472778 () Bool)

(declare-fun res!1000408 () Bool)

(declare-fun e!826491 () Bool)

(assert (=> b!1472778 (=> (not res!1000408) (not e!826491))))

(declare-fun lt!643670 () SeekEntryResult!12096)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99142 (_ BitVec 32)) SeekEntryResult!12096)

(assert (=> b!1472778 (= res!1000408 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47856 a!2862) j!93) a!2862 mask!2687) lt!643670))))

(declare-fun lt!643673 () SeekEntryResult!12096)

(declare-fun b!1472779 () Bool)

(assert (=> b!1472779 (= e!826488 (= lt!643673 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643672 lt!643674 mask!2687)))))

(declare-fun b!1472780 () Bool)

(declare-fun res!1000404 () Bool)

(assert (=> b!1472780 (=> (not res!1000404) (not e!826487))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1472780 (= res!1000404 (validKeyInArray!0 (select (arr!47856 a!2862) i!1006)))))

(declare-fun b!1472781 () Bool)

(declare-fun e!826490 () Bool)

(assert (=> b!1472781 (= e!826490 e!826491)))

(declare-fun res!1000401 () Bool)

(assert (=> b!1472781 (=> (not res!1000401) (not e!826491))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1472781 (= res!1000401 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47856 a!2862) j!93) mask!2687) (select (arr!47856 a!2862) j!93) a!2862 mask!2687) lt!643670))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1472781 (= lt!643670 (Intermediate!12096 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1472782 () Bool)

(declare-fun res!1000407 () Bool)

(assert (=> b!1472782 (=> (not res!1000407) (not e!826487))))

(assert (=> b!1472782 (= res!1000407 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48406 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48406 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48406 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1472783 () Bool)

(assert (=> b!1472783 (= e!826492 (not true))))

(declare-fun e!826493 () Bool)

(assert (=> b!1472783 e!826493))

(declare-fun res!1000402 () Bool)

(assert (=> b!1472783 (=> (not res!1000402) (not e!826493))))

(assert (=> b!1472783 (= res!1000402 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49532 0))(
  ( (Unit!49533) )
))
(declare-fun lt!643671 () Unit!49532)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99142 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49532)

(assert (=> b!1472783 (= lt!643671 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1472784 () Bool)

(declare-fun res!1000400 () Bool)

(assert (=> b!1472784 (=> (not res!1000400) (not e!826493))))

(assert (=> b!1472784 (= res!1000400 (= (seekEntryOrOpen!0 (select (arr!47856 a!2862) j!93) a!2862 mask!2687) (Found!12096 j!93)))))

(declare-fun b!1472785 () Bool)

(assert (=> b!1472785 (= e!826491 e!826492)))

(declare-fun res!1000409 () Bool)

(assert (=> b!1472785 (=> (not res!1000409) (not e!826492))))

(assert (=> b!1472785 (= res!1000409 (= lt!643673 (Intermediate!12096 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1472785 (= lt!643673 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643672 mask!2687) lt!643672 lt!643674 mask!2687))))

(assert (=> b!1472785 (= lt!643672 (select (store (arr!47856 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1472786 () Bool)

(declare-fun res!1000397 () Bool)

(assert (=> b!1472786 (=> (not res!1000397) (not e!826487))))

(declare-datatypes ((List!34357 0))(
  ( (Nil!34354) (Cons!34353 (h!35709 (_ BitVec 64)) (t!49051 List!34357)) )
))
(declare-fun arrayNoDuplicates!0 (array!99142 (_ BitVec 32) List!34357) Bool)

(assert (=> b!1472786 (= res!1000397 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34354))))

(declare-fun b!1472787 () Bool)

(declare-fun res!1000403 () Bool)

(assert (=> b!1472787 (=> (not res!1000403) (not e!826487))))

(assert (=> b!1472787 (= res!1000403 (and (= (size!48406 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48406 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48406 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1472788 () Bool)

(assert (=> b!1472788 (= e!826487 e!826490)))

(declare-fun res!1000411 () Bool)

(assert (=> b!1472788 (=> (not res!1000411) (not e!826490))))

(assert (=> b!1472788 (= res!1000411 (= (select (store (arr!47856 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1472788 (= lt!643674 (array!99143 (store (arr!47856 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48406 a!2862)))))

(declare-fun b!1472789 () Bool)

(assert (=> b!1472789 (= e!826493 (or (= (select (arr!47856 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47856 a!2862) intermediateBeforeIndex!19) (select (arr!47856 a!2862) j!93))))))

(declare-fun b!1472790 () Bool)

(declare-fun res!1000406 () Bool)

(assert (=> b!1472790 (=> (not res!1000406) (not e!826492))))

(assert (=> b!1472790 (= res!1000406 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125808 res!1000410) b!1472787))

(assert (= (and b!1472787 res!1000403) b!1472780))

(assert (= (and b!1472780 res!1000404) b!1472775))

(assert (= (and b!1472775 res!1000405) b!1472777))

(assert (= (and b!1472777 res!1000399) b!1472786))

(assert (= (and b!1472786 res!1000397) b!1472782))

(assert (= (and b!1472782 res!1000407) b!1472788))

(assert (= (and b!1472788 res!1000411) b!1472781))

(assert (= (and b!1472781 res!1000401) b!1472778))

(assert (= (and b!1472778 res!1000408) b!1472785))

(assert (= (and b!1472785 res!1000409) b!1472776))

(assert (= (and b!1472776 c!135702) b!1472779))

(assert (= (and b!1472776 (not c!135702)) b!1472774))

(assert (= (and b!1472776 res!1000398) b!1472790))

(assert (= (and b!1472790 res!1000406) b!1472783))

(assert (= (and b!1472783 res!1000402) b!1472784))

(assert (= (and b!1472784 res!1000400) b!1472789))

(declare-fun m!1359455 () Bool)

(assert (=> b!1472779 m!1359455))

(declare-fun m!1359457 () Bool)

(assert (=> b!1472783 m!1359457))

(declare-fun m!1359459 () Bool)

(assert (=> b!1472783 m!1359459))

(declare-fun m!1359461 () Bool)

(assert (=> b!1472788 m!1359461))

(declare-fun m!1359463 () Bool)

(assert (=> b!1472788 m!1359463))

(declare-fun m!1359465 () Bool)

(assert (=> start!125808 m!1359465))

(declare-fun m!1359467 () Bool)

(assert (=> start!125808 m!1359467))

(declare-fun m!1359469 () Bool)

(assert (=> b!1472778 m!1359469))

(assert (=> b!1472778 m!1359469))

(declare-fun m!1359471 () Bool)

(assert (=> b!1472778 m!1359471))

(declare-fun m!1359473 () Bool)

(assert (=> b!1472774 m!1359473))

(declare-fun m!1359475 () Bool)

(assert (=> b!1472774 m!1359475))

(declare-fun m!1359477 () Bool)

(assert (=> b!1472780 m!1359477))

(assert (=> b!1472780 m!1359477))

(declare-fun m!1359479 () Bool)

(assert (=> b!1472780 m!1359479))

(assert (=> b!1472784 m!1359469))

(assert (=> b!1472784 m!1359469))

(declare-fun m!1359481 () Bool)

(assert (=> b!1472784 m!1359481))

(declare-fun m!1359483 () Bool)

(assert (=> b!1472785 m!1359483))

(assert (=> b!1472785 m!1359483))

(declare-fun m!1359485 () Bool)

(assert (=> b!1472785 m!1359485))

(assert (=> b!1472785 m!1359461))

(declare-fun m!1359487 () Bool)

(assert (=> b!1472785 m!1359487))

(assert (=> b!1472781 m!1359469))

(assert (=> b!1472781 m!1359469))

(declare-fun m!1359489 () Bool)

(assert (=> b!1472781 m!1359489))

(assert (=> b!1472781 m!1359489))

(assert (=> b!1472781 m!1359469))

(declare-fun m!1359491 () Bool)

(assert (=> b!1472781 m!1359491))

(declare-fun m!1359493 () Bool)

(assert (=> b!1472789 m!1359493))

(assert (=> b!1472789 m!1359469))

(declare-fun m!1359495 () Bool)

(assert (=> b!1472777 m!1359495))

(declare-fun m!1359497 () Bool)

(assert (=> b!1472786 m!1359497))

(assert (=> b!1472775 m!1359469))

(assert (=> b!1472775 m!1359469))

(declare-fun m!1359499 () Bool)

(assert (=> b!1472775 m!1359499))

(check-sat (not b!1472780) (not b!1472785) (not b!1472778) (not b!1472779) (not b!1472786) (not b!1472781) (not b!1472777) (not b!1472783) (not start!125808) (not b!1472774) (not b!1472775) (not b!1472784))
