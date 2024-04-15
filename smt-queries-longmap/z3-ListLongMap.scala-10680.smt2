; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125188 () Bool)

(assert start!125188)

(declare-fun b!1460507 () Bool)

(declare-fun res!990378 () Bool)

(declare-fun e!821172 () Bool)

(assert (=> b!1460507 (=> (not res!990378) (not e!821172))))

(declare-fun e!821170 () Bool)

(assert (=> b!1460507 (= res!990378 e!821170)))

(declare-fun c!134584 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1460507 (= c!134584 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1460508 () Bool)

(declare-fun res!990365 () Bool)

(declare-fun e!821167 () Bool)

(assert (=> b!1460508 (=> (not res!990365) (not e!821167))))

(declare-datatypes ((array!98614 0))(
  ( (array!98615 (arr!47596 (Array (_ BitVec 32) (_ BitVec 64))) (size!48148 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98614)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11873 0))(
  ( (MissingZero!11873 (index!49884 (_ BitVec 32))) (Found!11873 (index!49885 (_ BitVec 32))) (Intermediate!11873 (undefined!12685 Bool) (index!49886 (_ BitVec 32)) (x!131485 (_ BitVec 32))) (Undefined!11873) (MissingVacant!11873 (index!49887 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98614 (_ BitVec 32)) SeekEntryResult!11873)

(assert (=> b!1460508 (= res!990365 (= (seekEntryOrOpen!0 (select (arr!47596 a!2862) j!93) a!2862 mask!2687) (Found!11873 j!93)))))

(declare-fun b!1460509 () Bool)

(assert (=> b!1460509 (= e!821172 (not true))))

(assert (=> b!1460509 e!821167))

(declare-fun res!990375 () Bool)

(assert (=> b!1460509 (=> (not res!990375) (not e!821167))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98614 (_ BitVec 32)) Bool)

(assert (=> b!1460509 (= res!990375 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49083 0))(
  ( (Unit!49084) )
))
(declare-fun lt!639667 () Unit!49083)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98614 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49083)

(assert (=> b!1460509 (= lt!639667 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1460510 () Bool)

(declare-fun lt!639665 () array!98614)

(declare-fun lt!639669 () SeekEntryResult!11873)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!639668 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98614 (_ BitVec 32)) SeekEntryResult!11873)

(assert (=> b!1460510 (= e!821170 (= lt!639669 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!639668 lt!639665 mask!2687)))))

(declare-fun res!990374 () Bool)

(declare-fun e!821171 () Bool)

(assert (=> start!125188 (=> (not res!990374) (not e!821171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125188 (= res!990374 (validMask!0 mask!2687))))

(assert (=> start!125188 e!821171))

(assert (=> start!125188 true))

(declare-fun array_inv!36829 (array!98614) Bool)

(assert (=> start!125188 (array_inv!36829 a!2862)))

(declare-fun b!1460511 () Bool)

(declare-fun res!990372 () Bool)

(assert (=> b!1460511 (=> (not res!990372) (not e!821171))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1460511 (= res!990372 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48148 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48148 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48148 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1460512 () Bool)

(declare-fun e!821168 () Bool)

(declare-fun e!821166 () Bool)

(assert (=> b!1460512 (= e!821168 e!821166)))

(declare-fun res!990379 () Bool)

(assert (=> b!1460512 (=> (not res!990379) (not e!821166))))

(declare-fun lt!639666 () SeekEntryResult!11873)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1460512 (= res!990379 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47596 a!2862) j!93) mask!2687) (select (arr!47596 a!2862) j!93) a!2862 mask!2687) lt!639666))))

(assert (=> b!1460512 (= lt!639666 (Intermediate!11873 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1460513 () Bool)

(declare-fun res!990368 () Bool)

(assert (=> b!1460513 (=> (not res!990368) (not e!821171))))

(declare-datatypes ((List!34175 0))(
  ( (Nil!34172) (Cons!34171 (h!35521 (_ BitVec 64)) (t!48861 List!34175)) )
))
(declare-fun arrayNoDuplicates!0 (array!98614 (_ BitVec 32) List!34175) Bool)

(assert (=> b!1460513 (= res!990368 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34172))))

(declare-fun b!1460514 () Bool)

(assert (=> b!1460514 (= e!821167 (or (= (select (arr!47596 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47596 a!2862) intermediateBeforeIndex!19) (select (arr!47596 a!2862) j!93))))))

(declare-fun b!1460515 () Bool)

(assert (=> b!1460515 (= e!821171 e!821168)))

(declare-fun res!990370 () Bool)

(assert (=> b!1460515 (=> (not res!990370) (not e!821168))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1460515 (= res!990370 (= (select (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1460515 (= lt!639665 (array!98615 (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48148 a!2862)))))

(declare-fun b!1460516 () Bool)

(declare-fun res!990377 () Bool)

(assert (=> b!1460516 (=> (not res!990377) (not e!821171))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1460516 (= res!990377 (validKeyInArray!0 (select (arr!47596 a!2862) j!93)))))

(declare-fun b!1460517 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98614 (_ BitVec 32)) SeekEntryResult!11873)

(assert (=> b!1460517 (= e!821170 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!639668 lt!639665 mask!2687) (seekEntryOrOpen!0 lt!639668 lt!639665 mask!2687)))))

(declare-fun b!1460518 () Bool)

(assert (=> b!1460518 (= e!821166 e!821172)))

(declare-fun res!990373 () Bool)

(assert (=> b!1460518 (=> (not res!990373) (not e!821172))))

(assert (=> b!1460518 (= res!990373 (= lt!639669 (Intermediate!11873 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1460518 (= lt!639669 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!639668 mask!2687) lt!639668 lt!639665 mask!2687))))

(assert (=> b!1460518 (= lt!639668 (select (store (arr!47596 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1460519 () Bool)

(declare-fun res!990366 () Bool)

(assert (=> b!1460519 (=> (not res!990366) (not e!821171))))

(assert (=> b!1460519 (= res!990366 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1460520 () Bool)

(declare-fun res!990371 () Bool)

(assert (=> b!1460520 (=> (not res!990371) (not e!821171))))

(assert (=> b!1460520 (= res!990371 (validKeyInArray!0 (select (arr!47596 a!2862) i!1006)))))

(declare-fun b!1460521 () Bool)

(declare-fun res!990369 () Bool)

(assert (=> b!1460521 (=> (not res!990369) (not e!821172))))

(assert (=> b!1460521 (= res!990369 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1460522 () Bool)

(declare-fun res!990376 () Bool)

(assert (=> b!1460522 (=> (not res!990376) (not e!821166))))

(assert (=> b!1460522 (= res!990376 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47596 a!2862) j!93) a!2862 mask!2687) lt!639666))))

(declare-fun b!1460523 () Bool)

(declare-fun res!990367 () Bool)

(assert (=> b!1460523 (=> (not res!990367) (not e!821171))))

(assert (=> b!1460523 (= res!990367 (and (= (size!48148 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48148 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48148 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!125188 res!990374) b!1460523))

(assert (= (and b!1460523 res!990367) b!1460520))

(assert (= (and b!1460520 res!990371) b!1460516))

(assert (= (and b!1460516 res!990377) b!1460519))

(assert (= (and b!1460519 res!990366) b!1460513))

(assert (= (and b!1460513 res!990368) b!1460511))

(assert (= (and b!1460511 res!990372) b!1460515))

(assert (= (and b!1460515 res!990370) b!1460512))

(assert (= (and b!1460512 res!990379) b!1460522))

(assert (= (and b!1460522 res!990376) b!1460518))

(assert (= (and b!1460518 res!990373) b!1460507))

(assert (= (and b!1460507 c!134584) b!1460510))

(assert (= (and b!1460507 (not c!134584)) b!1460517))

(assert (= (and b!1460507 res!990378) b!1460521))

(assert (= (and b!1460521 res!990369) b!1460509))

(assert (= (and b!1460509 res!990375) b!1460508))

(assert (= (and b!1460508 res!990365) b!1460514))

(declare-fun m!1347699 () Bool)

(assert (=> b!1460517 m!1347699))

(declare-fun m!1347701 () Bool)

(assert (=> b!1460517 m!1347701))

(declare-fun m!1347703 () Bool)

(assert (=> b!1460512 m!1347703))

(assert (=> b!1460512 m!1347703))

(declare-fun m!1347705 () Bool)

(assert (=> b!1460512 m!1347705))

(assert (=> b!1460512 m!1347705))

(assert (=> b!1460512 m!1347703))

(declare-fun m!1347707 () Bool)

(assert (=> b!1460512 m!1347707))

(assert (=> b!1460508 m!1347703))

(assert (=> b!1460508 m!1347703))

(declare-fun m!1347709 () Bool)

(assert (=> b!1460508 m!1347709))

(declare-fun m!1347711 () Bool)

(assert (=> start!125188 m!1347711))

(declare-fun m!1347713 () Bool)

(assert (=> start!125188 m!1347713))

(assert (=> b!1460522 m!1347703))

(assert (=> b!1460522 m!1347703))

(declare-fun m!1347715 () Bool)

(assert (=> b!1460522 m!1347715))

(declare-fun m!1347717 () Bool)

(assert (=> b!1460520 m!1347717))

(assert (=> b!1460520 m!1347717))

(declare-fun m!1347719 () Bool)

(assert (=> b!1460520 m!1347719))

(declare-fun m!1347721 () Bool)

(assert (=> b!1460513 m!1347721))

(assert (=> b!1460516 m!1347703))

(assert (=> b!1460516 m!1347703))

(declare-fun m!1347723 () Bool)

(assert (=> b!1460516 m!1347723))

(declare-fun m!1347725 () Bool)

(assert (=> b!1460515 m!1347725))

(declare-fun m!1347727 () Bool)

(assert (=> b!1460515 m!1347727))

(declare-fun m!1347729 () Bool)

(assert (=> b!1460518 m!1347729))

(assert (=> b!1460518 m!1347729))

(declare-fun m!1347731 () Bool)

(assert (=> b!1460518 m!1347731))

(assert (=> b!1460518 m!1347725))

(declare-fun m!1347733 () Bool)

(assert (=> b!1460518 m!1347733))

(declare-fun m!1347735 () Bool)

(assert (=> b!1460509 m!1347735))

(declare-fun m!1347737 () Bool)

(assert (=> b!1460509 m!1347737))

(declare-fun m!1347739 () Bool)

(assert (=> b!1460519 m!1347739))

(declare-fun m!1347741 () Bool)

(assert (=> b!1460510 m!1347741))

(declare-fun m!1347743 () Bool)

(assert (=> b!1460514 m!1347743))

(assert (=> b!1460514 m!1347703))

(check-sat (not start!125188) (not b!1460509) (not b!1460519) (not b!1460520) (not b!1460513) (not b!1460516) (not b!1460510) (not b!1460517) (not b!1460512) (not b!1460522) (not b!1460518) (not b!1460508))
(check-sat)
