; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125220 () Bool)

(assert start!125220)

(declare-fun b!1460753 () Bool)

(declare-fun res!990492 () Bool)

(declare-fun e!821306 () Bool)

(assert (=> b!1460753 (=> (not res!990492) (not e!821306))))

(declare-datatypes ((array!98668 0))(
  ( (array!98669 (arr!47622 (Array (_ BitVec 32) (_ BitVec 64))) (size!48172 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98668)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460753 (= res!990492 (validKeyInArray!0 (select (arr!47622 a!2862) i!1006)))))

(declare-fun b!1460754 () Bool)

(declare-fun res!990502 () Bool)

(assert (=> b!1460754 (=> (not res!990502) (not e!821306))))

(declare-datatypes ((List!34123 0))(
  ( (Nil!34120) (Cons!34119 (h!35469 (_ BitVec 64)) (t!48817 List!34123)) )
))
(declare-fun arrayNoDuplicates!0 (array!98668 (_ BitVec 32) List!34123) Bool)

(assert (=> b!1460754 (= res!990502 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34120))))

(declare-fun b!1460755 () Bool)

(declare-fun e!821304 () Bool)

(declare-fun e!821303 () Bool)

(assert (=> b!1460755 (= e!821304 e!821303)))

(declare-fun res!990491 () Bool)

(assert (=> b!1460755 (=> (not res!990491) (not e!821303))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11874 0))(
  ( (MissingZero!11874 (index!49888 (_ BitVec 32))) (Found!11874 (index!49889 (_ BitVec 32))) (Intermediate!11874 (undefined!12686 Bool) (index!49890 (_ BitVec 32)) (x!131491 (_ BitVec 32))) (Undefined!11874) (MissingVacant!11874 (index!49891 (_ BitVec 32))) )
))
(declare-fun lt!639917 () SeekEntryResult!11874)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98668 (_ BitVec 32)) SeekEntryResult!11874)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460755 (= res!990491 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47622 a!2862) j!93) mask!2687) (select (arr!47622 a!2862) j!93) a!2862 mask!2687) lt!639917))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1460755 (= lt!639917 (Intermediate!11874 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460756 () Bool)

(declare-fun res!990493 () Bool)

(assert (=> b!1460756 (=> (not res!990493) (not e!821306))))

(assert (=> b!1460756 (= res!990493 (validKeyInArray!0 (select (arr!47622 a!2862) j!93)))))

(declare-fun b!1460757 () Bool)

(assert (=> b!1460757 (= e!821306 e!821304)))

(declare-fun res!990499 () Bool)

(assert (=> b!1460757 (=> (not res!990499) (not e!821304))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460757 (= res!990499 (= (select (store (arr!47622 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!639914 () array!98668)

(assert (=> b!1460757 (= lt!639914 (array!98669 (store (arr!47622 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48172 a!2862)))))

(declare-fun b!1460758 () Bool)

(declare-fun res!990496 () Bool)

(assert (=> b!1460758 (=> (not res!990496) (not e!821303))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1460758 (= res!990496 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47622 a!2862) j!93) a!2862 mask!2687) lt!639917))))

(declare-fun e!821307 () Bool)

(declare-fun b!1460759 () Bool)

(assert (=> b!1460759 (= e!821307 (or (= (select (arr!47622 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47622 a!2862) intermediateBeforeIndex!19) (select (arr!47622 a!2862) j!93))))))

(declare-fun res!990498 () Bool)

(assert (=> start!125220 (=> (not res!990498) (not e!821306))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125220 (= res!990498 (validMask!0 mask!2687))))

(assert (=> start!125220 e!821306))

(assert (=> start!125220 true))

(declare-fun array_inv!36650 (array!98668) Bool)

(assert (=> start!125220 (array_inv!36650 a!2862)))

(declare-fun b!1460760 () Bool)

(declare-fun e!821308 () Bool)

(assert (=> b!1460760 (= e!821308 (not true))))

(assert (=> b!1460760 e!821307))

(declare-fun res!990495 () Bool)

(assert (=> b!1460760 (=> (not res!990495) (not e!821307))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98668 (_ BitVec 32)) Bool)

(assert (=> b!1460760 (= res!990495 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49244 0))(
  ( (Unit!49245) )
))
(declare-fun lt!639915 () Unit!49244)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98668 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49244)

(assert (=> b!1460760 (= lt!639915 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460761 () Bool)

(declare-fun res!990501 () Bool)

(assert (=> b!1460761 (=> (not res!990501) (not e!821307))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98668 (_ BitVec 32)) SeekEntryResult!11874)

(assert (=> b!1460761 (= res!990501 (= (seekEntryOrOpen!0 (select (arr!47622 a!2862) j!93) a!2862 mask!2687) (Found!11874 j!93)))))

(declare-fun b!1460762 () Bool)

(declare-fun res!990490 () Bool)

(assert (=> b!1460762 (=> (not res!990490) (not e!821306))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460762 (= res!990490 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48172 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48172 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48172 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460763 () Bool)

(declare-fun res!990494 () Bool)

(assert (=> b!1460763 (=> (not res!990494) (not e!821306))))

(assert (=> b!1460763 (= res!990494 (and (= (size!48172 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48172 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48172 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1460764 () Bool)

(declare-fun res!990500 () Bool)

(assert (=> b!1460764 (=> (not res!990500) (not e!821308))))

(declare-fun e!821305 () Bool)

(assert (=> b!1460764 (= res!990500 e!821305)))

(declare-fun c!134643 () Bool)

(assert (=> b!1460764 (= c!134643 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460765 () Bool)

(declare-fun lt!639916 () SeekEntryResult!11874)

(declare-fun lt!639918 () (_ BitVec 64))

(assert (=> b!1460765 (= e!821305 (= lt!639916 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639918 lt!639914 mask!2687)))))

(declare-fun b!1460766 () Bool)

(declare-fun res!990497 () Bool)

(assert (=> b!1460766 (=> (not res!990497) (not e!821306))))

(assert (=> b!1460766 (= res!990497 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460767 () Bool)

(declare-fun res!990489 () Bool)

(assert (=> b!1460767 (=> (not res!990489) (not e!821308))))

(assert (=> b!1460767 (= res!990489 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460768 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98668 (_ BitVec 32)) SeekEntryResult!11874)

(assert (=> b!1460768 (= e!821305 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639918 lt!639914 mask!2687) (seekEntryOrOpen!0 lt!639918 lt!639914 mask!2687)))))

(declare-fun b!1460769 () Bool)

(assert (=> b!1460769 (= e!821303 e!821308)))

(declare-fun res!990488 () Bool)

(assert (=> b!1460769 (=> (not res!990488) (not e!821308))))

(assert (=> b!1460769 (= res!990488 (= lt!639916 (Intermediate!11874 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460769 (= lt!639916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639918 mask!2687) lt!639918 lt!639914 mask!2687))))

(assert (=> b!1460769 (= lt!639918 (select (store (arr!47622 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125220 res!990498) b!1460763))

(assert (= (and b!1460763 res!990494) b!1460753))

(assert (= (and b!1460753 res!990492) b!1460756))

(assert (= (and b!1460756 res!990493) b!1460766))

(assert (= (and b!1460766 res!990497) b!1460754))

(assert (= (and b!1460754 res!990502) b!1460762))

(assert (= (and b!1460762 res!990490) b!1460757))

(assert (= (and b!1460757 res!990499) b!1460755))

(assert (= (and b!1460755 res!990491) b!1460758))

(assert (= (and b!1460758 res!990496) b!1460769))

(assert (= (and b!1460769 res!990488) b!1460764))

(assert (= (and b!1460764 c!134643) b!1460765))

(assert (= (and b!1460764 (not c!134643)) b!1460768))

(assert (= (and b!1460764 res!990500) b!1460767))

(assert (= (and b!1460767 res!990489) b!1460760))

(assert (= (and b!1460760 res!990495) b!1460761))

(assert (= (and b!1460761 res!990501) b!1460759))

(declare-fun m!1348421 () Bool)

(assert (=> b!1460766 m!1348421))

(declare-fun m!1348423 () Bool)

(assert (=> b!1460756 m!1348423))

(assert (=> b!1460756 m!1348423))

(declare-fun m!1348425 () Bool)

(assert (=> b!1460756 m!1348425))

(declare-fun m!1348427 () Bool)

(assert (=> start!125220 m!1348427))

(declare-fun m!1348429 () Bool)

(assert (=> start!125220 m!1348429))

(declare-fun m!1348431 () Bool)

(assert (=> b!1460757 m!1348431))

(declare-fun m!1348433 () Bool)

(assert (=> b!1460757 m!1348433))

(declare-fun m!1348435 () Bool)

(assert (=> b!1460769 m!1348435))

(assert (=> b!1460769 m!1348435))

(declare-fun m!1348437 () Bool)

(assert (=> b!1460769 m!1348437))

(assert (=> b!1460769 m!1348431))

(declare-fun m!1348439 () Bool)

(assert (=> b!1460769 m!1348439))

(assert (=> b!1460761 m!1348423))

(assert (=> b!1460761 m!1348423))

(declare-fun m!1348441 () Bool)

(assert (=> b!1460761 m!1348441))

(assert (=> b!1460758 m!1348423))

(assert (=> b!1460758 m!1348423))

(declare-fun m!1348443 () Bool)

(assert (=> b!1460758 m!1348443))

(declare-fun m!1348445 () Bool)

(assert (=> b!1460765 m!1348445))

(assert (=> b!1460755 m!1348423))

(assert (=> b!1460755 m!1348423))

(declare-fun m!1348447 () Bool)

(assert (=> b!1460755 m!1348447))

(assert (=> b!1460755 m!1348447))

(assert (=> b!1460755 m!1348423))

(declare-fun m!1348449 () Bool)

(assert (=> b!1460755 m!1348449))

(declare-fun m!1348451 () Bool)

(assert (=> b!1460754 m!1348451))

(declare-fun m!1348453 () Bool)

(assert (=> b!1460753 m!1348453))

(assert (=> b!1460753 m!1348453))

(declare-fun m!1348455 () Bool)

(assert (=> b!1460753 m!1348455))

(declare-fun m!1348457 () Bool)

(assert (=> b!1460759 m!1348457))

(assert (=> b!1460759 m!1348423))

(declare-fun m!1348459 () Bool)

(assert (=> b!1460768 m!1348459))

(declare-fun m!1348461 () Bool)

(assert (=> b!1460768 m!1348461))

(declare-fun m!1348463 () Bool)

(assert (=> b!1460760 m!1348463))

(declare-fun m!1348465 () Bool)

(assert (=> b!1460760 m!1348465))

(check-sat (not b!1460769) (not start!125220) (not b!1460755) (not b!1460765) (not b!1460760) (not b!1460756) (not b!1460758) (not b!1460761) (not b!1460768) (not b!1460753) (not b!1460766) (not b!1460754))
(check-sat)
