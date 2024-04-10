; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126844 () Bool)

(assert start!126844)

(declare-fun b!1489464 () Bool)

(declare-fun e!834777 () Bool)

(declare-fun e!834775 () Bool)

(assert (=> b!1489464 (= e!834777 (not e!834775))))

(declare-fun res!1012905 () Bool)

(assert (=> b!1489464 (=> res!1012905 e!834775)))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99617 0))(
  ( (array!99618 (arr!48080 (Array (_ BitVec 32) (_ BitVec 64))) (size!48630 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99617)

(assert (=> b!1489464 (= res!1012905 (or (and (= (select (arr!48080 a!2862) index!646) (select (store (arr!48080 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48080 a!2862) index!646) (select (arr!48080 a!2862) j!93))) (= (select (arr!48080 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12320 0))(
  ( (MissingZero!12320 (index!51672 (_ BitVec 32))) (Found!12320 (index!51673 (_ BitVec 32))) (Intermediate!12320 (undefined!13132 Bool) (index!51674 (_ BitVec 32)) (x!133272 (_ BitVec 32))) (Undefined!12320) (MissingVacant!12320 (index!51675 (_ BitVec 32))) )
))
(declare-fun lt!649568 () SeekEntryResult!12320)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1489464 (and (= lt!649568 (Found!12320 j!93)) (or (= (select (arr!48080 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48080 a!2862) intermediateBeforeIndex!19) (select (arr!48080 a!2862) j!93))) (let ((bdg!54722 (select (store (arr!48080 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!48080 a!2862) index!646) bdg!54722) (= (select (arr!48080 a!2862) index!646) (select (arr!48080 a!2862) j!93))) (= (select (arr!48080 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!54722 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99617 (_ BitVec 32)) SeekEntryResult!12320)

(assert (=> b!1489464 (= lt!649568 (seekEntryOrOpen!0 (select (arr!48080 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99617 (_ BitVec 32)) Bool)

(assert (=> b!1489464 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49980 0))(
  ( (Unit!49981) )
))
(declare-fun lt!649565 () Unit!49980)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49980)

(assert (=> b!1489464 (= lt!649565 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1489465 () Bool)

(declare-fun res!1012909 () Bool)

(declare-fun e!834774 () Bool)

(assert (=> b!1489465 (=> res!1012909 e!834774)))

(declare-fun lt!649563 () (_ BitVec 32))

(declare-fun lt!649561 () SeekEntryResult!12320)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99617 (_ BitVec 32)) SeekEntryResult!12320)

(assert (=> b!1489465 (= res!1012909 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649563 (select (arr!48080 a!2862) j!93) a!2862 mask!2687) lt!649561)))))

(declare-fun lt!649567 () (_ BitVec 64))

(declare-fun b!1489466 () Bool)

(declare-fun e!834781 () Bool)

(declare-fun lt!649564 () SeekEntryResult!12320)

(declare-fun lt!649569 () array!99617)

(assert (=> b!1489466 (= e!834781 (not (= lt!649564 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649563 lt!649567 lt!649569 mask!2687))))))

(declare-fun e!834778 () Bool)

(declare-fun b!1489467 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99617 (_ BitVec 32)) SeekEntryResult!12320)

(assert (=> b!1489467 (= e!834778 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649567 lt!649569 mask!2687) (seekEntryOrOpen!0 lt!649567 lt!649569 mask!2687)))))

(declare-fun b!1489468 () Bool)

(assert (=> b!1489468 (= e!834775 e!834774)))

(declare-fun res!1012904 () Bool)

(assert (=> b!1489468 (=> res!1012904 e!834774)))

(assert (=> b!1489468 (= res!1012904 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!649563 #b00000000000000000000000000000000) (bvsge lt!649563 (size!48630 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489468 (= lt!649563 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun lt!649562 () SeekEntryResult!12320)

(assert (=> b!1489468 (= lt!649562 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649567 lt!649569 mask!2687))))

(assert (=> b!1489468 (= lt!649562 (seekEntryOrOpen!0 lt!649567 lt!649569 mask!2687))))

(declare-fun b!1489469 () Bool)

(declare-fun res!1012908 () Bool)

(assert (=> b!1489469 (=> res!1012908 e!834774)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1489469 (= res!1012908 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1489470 () Bool)

(declare-fun res!1012919 () Bool)

(assert (=> b!1489470 (=> (not res!1012919) (not e!834777))))

(assert (=> b!1489470 (= res!1012919 e!834778)))

(declare-fun c!137808 () Bool)

(assert (=> b!1489470 (= c!137808 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1489471 () Bool)

(declare-fun e!834779 () Bool)

(declare-fun e!834776 () Bool)

(assert (=> b!1489471 (= e!834779 e!834776)))

(declare-fun res!1012910 () Bool)

(assert (=> b!1489471 (=> (not res!1012910) (not e!834776))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1489471 (= res!1012910 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48080 a!2862) j!93) mask!2687) (select (arr!48080 a!2862) j!93) a!2862 mask!2687) lt!649561))))

(assert (=> b!1489471 (= lt!649561 (Intermediate!12320 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1489472 () Bool)

(declare-fun res!1012920 () Bool)

(assert (=> b!1489472 (=> (not res!1012920) (not e!834777))))

(assert (=> b!1489472 (= res!1012920 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1489473 () Bool)

(declare-fun res!1012914 () Bool)

(declare-fun e!834782 () Bool)

(assert (=> b!1489473 (=> (not res!1012914) (not e!834782))))

(assert (=> b!1489473 (= res!1012914 (and (= (size!48630 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48630 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48630 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1489474 () Bool)

(declare-fun res!1012911 () Bool)

(assert (=> b!1489474 (=> (not res!1012911) (not e!834776))))

(assert (=> b!1489474 (= res!1012911 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48080 a!2862) j!93) a!2862 mask!2687) lt!649561))))

(declare-fun b!1489475 () Bool)

(declare-fun res!1012918 () Bool)

(assert (=> b!1489475 (=> (not res!1012918) (not e!834782))))

(assert (=> b!1489475 (= res!1012918 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48630 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48630 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48630 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1489476 () Bool)

(assert (=> b!1489476 (= e!834774 true)))

(assert (=> b!1489476 (= lt!649568 lt!649562)))

(declare-fun lt!649566 () Unit!49980)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99617 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49980)

(assert (=> b!1489476 (= lt!649566 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!649563 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1489477 () Bool)

(declare-fun res!1012906 () Bool)

(assert (=> b!1489477 (=> (not res!1012906) (not e!834782))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1489477 (= res!1012906 (validKeyInArray!0 (select (arr!48080 a!2862) i!1006)))))

(declare-fun b!1489478 () Bool)

(declare-fun res!1012913 () Bool)

(assert (=> b!1489478 (=> (not res!1012913) (not e!834782))))

(assert (=> b!1489478 (= res!1012913 (validKeyInArray!0 (select (arr!48080 a!2862) j!93)))))

(declare-fun b!1489479 () Bool)

(assert (=> b!1489479 (= e!834781 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!649563 intermediateAfterIndex!19 lt!649567 lt!649569 mask!2687) lt!649562)))))

(declare-fun b!1489480 () Bool)

(declare-fun res!1012921 () Bool)

(assert (=> b!1489480 (=> res!1012921 e!834774)))

(assert (=> b!1489480 (= res!1012921 e!834781)))

(declare-fun c!137807 () Bool)

(assert (=> b!1489480 (= c!137807 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1489481 () Bool)

(assert (=> b!1489481 (= e!834782 e!834779)))

(declare-fun res!1012912 () Bool)

(assert (=> b!1489481 (=> (not res!1012912) (not e!834779))))

(assert (=> b!1489481 (= res!1012912 (= (select (store (arr!48080 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1489481 (= lt!649569 (array!99618 (store (arr!48080 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48630 a!2862)))))

(declare-fun b!1489482 () Bool)

(declare-fun res!1012907 () Bool)

(assert (=> b!1489482 (=> (not res!1012907) (not e!834782))))

(declare-datatypes ((List!34581 0))(
  ( (Nil!34578) (Cons!34577 (h!35960 (_ BitVec 64)) (t!49275 List!34581)) )
))
(declare-fun arrayNoDuplicates!0 (array!99617 (_ BitVec 32) List!34581) Bool)

(assert (=> b!1489482 (= res!1012907 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34578))))

(declare-fun b!1489483 () Bool)

(assert (=> b!1489483 (= e!834776 e!834777)))

(declare-fun res!1012916 () Bool)

(assert (=> b!1489483 (=> (not res!1012916) (not e!834777))))

(assert (=> b!1489483 (= res!1012916 (= lt!649564 (Intermediate!12320 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1489483 (= lt!649564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649567 mask!2687) lt!649567 lt!649569 mask!2687))))

(assert (=> b!1489483 (= lt!649567 (select (store (arr!48080 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun res!1012915 () Bool)

(assert (=> start!126844 (=> (not res!1012915) (not e!834782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126844 (= res!1012915 (validMask!0 mask!2687))))

(assert (=> start!126844 e!834782))

(assert (=> start!126844 true))

(declare-fun array_inv!37108 (array!99617) Bool)

(assert (=> start!126844 (array_inv!37108 a!2862)))

(declare-fun b!1489484 () Bool)

(declare-fun res!1012917 () Bool)

(assert (=> b!1489484 (=> (not res!1012917) (not e!834782))))

(assert (=> b!1489484 (= res!1012917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1489485 () Bool)

(assert (=> b!1489485 (= e!834778 (= lt!649564 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649567 lt!649569 mask!2687)))))

(assert (= (and start!126844 res!1012915) b!1489473))

(assert (= (and b!1489473 res!1012914) b!1489477))

(assert (= (and b!1489477 res!1012906) b!1489478))

(assert (= (and b!1489478 res!1012913) b!1489484))

(assert (= (and b!1489484 res!1012917) b!1489482))

(assert (= (and b!1489482 res!1012907) b!1489475))

(assert (= (and b!1489475 res!1012918) b!1489481))

(assert (= (and b!1489481 res!1012912) b!1489471))

(assert (= (and b!1489471 res!1012910) b!1489474))

(assert (= (and b!1489474 res!1012911) b!1489483))

(assert (= (and b!1489483 res!1012916) b!1489470))

(assert (= (and b!1489470 c!137808) b!1489485))

(assert (= (and b!1489470 (not c!137808)) b!1489467))

(assert (= (and b!1489470 res!1012919) b!1489472))

(assert (= (and b!1489472 res!1012920) b!1489464))

(assert (= (and b!1489464 (not res!1012905)) b!1489468))

(assert (= (and b!1489468 (not res!1012904)) b!1489465))

(assert (= (and b!1489465 (not res!1012909)) b!1489480))

(assert (= (and b!1489480 c!137807) b!1489466))

(assert (= (and b!1489480 (not c!137807)) b!1489479))

(assert (= (and b!1489480 (not res!1012921)) b!1489469))

(assert (= (and b!1489469 (not res!1012908)) b!1489476))

(declare-fun m!1373695 () Bool)

(assert (=> b!1489479 m!1373695))

(declare-fun m!1373697 () Bool)

(assert (=> b!1489466 m!1373697))

(declare-fun m!1373699 () Bool)

(assert (=> b!1489478 m!1373699))

(assert (=> b!1489478 m!1373699))

(declare-fun m!1373701 () Bool)

(assert (=> b!1489478 m!1373701))

(assert (=> b!1489474 m!1373699))

(assert (=> b!1489474 m!1373699))

(declare-fun m!1373703 () Bool)

(assert (=> b!1489474 m!1373703))

(declare-fun m!1373705 () Bool)

(assert (=> b!1489481 m!1373705))

(declare-fun m!1373707 () Bool)

(assert (=> b!1489481 m!1373707))

(declare-fun m!1373709 () Bool)

(assert (=> b!1489467 m!1373709))

(declare-fun m!1373711 () Bool)

(assert (=> b!1489467 m!1373711))

(assert (=> b!1489465 m!1373699))

(assert (=> b!1489465 m!1373699))

(declare-fun m!1373713 () Bool)

(assert (=> b!1489465 m!1373713))

(declare-fun m!1373715 () Bool)

(assert (=> b!1489468 m!1373715))

(assert (=> b!1489468 m!1373709))

(assert (=> b!1489468 m!1373711))

(declare-fun m!1373717 () Bool)

(assert (=> b!1489483 m!1373717))

(assert (=> b!1489483 m!1373717))

(declare-fun m!1373719 () Bool)

(assert (=> b!1489483 m!1373719))

(assert (=> b!1489483 m!1373705))

(declare-fun m!1373721 () Bool)

(assert (=> b!1489483 m!1373721))

(declare-fun m!1373723 () Bool)

(assert (=> b!1489477 m!1373723))

(assert (=> b!1489477 m!1373723))

(declare-fun m!1373725 () Bool)

(assert (=> b!1489477 m!1373725))

(declare-fun m!1373727 () Bool)

(assert (=> b!1489485 m!1373727))

(declare-fun m!1373729 () Bool)

(assert (=> b!1489482 m!1373729))

(declare-fun m!1373731 () Bool)

(assert (=> b!1489484 m!1373731))

(declare-fun m!1373733 () Bool)

(assert (=> b!1489464 m!1373733))

(assert (=> b!1489464 m!1373705))

(declare-fun m!1373735 () Bool)

(assert (=> b!1489464 m!1373735))

(declare-fun m!1373737 () Bool)

(assert (=> b!1489464 m!1373737))

(declare-fun m!1373739 () Bool)

(assert (=> b!1489464 m!1373739))

(assert (=> b!1489464 m!1373699))

(declare-fun m!1373741 () Bool)

(assert (=> b!1489464 m!1373741))

(declare-fun m!1373743 () Bool)

(assert (=> b!1489464 m!1373743))

(assert (=> b!1489464 m!1373699))

(declare-fun m!1373745 () Bool)

(assert (=> b!1489476 m!1373745))

(declare-fun m!1373747 () Bool)

(assert (=> start!126844 m!1373747))

(declare-fun m!1373749 () Bool)

(assert (=> start!126844 m!1373749))

(assert (=> b!1489471 m!1373699))

(assert (=> b!1489471 m!1373699))

(declare-fun m!1373751 () Bool)

(assert (=> b!1489471 m!1373751))

(assert (=> b!1489471 m!1373751))

(assert (=> b!1489471 m!1373699))

(declare-fun m!1373753 () Bool)

(assert (=> b!1489471 m!1373753))

(push 1)

