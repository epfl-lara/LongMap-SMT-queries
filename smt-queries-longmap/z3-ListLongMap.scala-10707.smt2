; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125658 () Bool)

(assert start!125658)

(declare-fun b!1467721 () Bool)

(declare-fun e!824748 () Bool)

(declare-fun e!824750 () Bool)

(assert (=> b!1467721 (= e!824748 e!824750)))

(declare-fun res!995421 () Bool)

(assert (=> b!1467721 (=> res!995421 e!824750)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!642241 () (_ BitVec 32))

(declare-datatypes ((array!98944 0))(
  ( (array!98945 (arr!47755 (Array (_ BitVec 32) (_ BitVec 64))) (size!48306 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98944)

(assert (=> b!1467721 (= res!995421 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!642241 #b00000000000000000000000000000000) (bvsge lt!642241 (size!48306 a!2862))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467721 (= lt!642241 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1467722 () Bool)

(declare-fun res!995420 () Bool)

(declare-fun e!824747 () Bool)

(assert (=> b!1467722 (=> (not res!995420) (not e!824747))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1467722 (= res!995420 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1467723 () Bool)

(declare-fun res!995412 () Bool)

(assert (=> b!1467723 (=> (not res!995412) (not e!824747))))

(declare-fun e!824743 () Bool)

(assert (=> b!1467723 (= res!995412 e!824743)))

(declare-fun c!135678 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1467723 (= c!135678 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!995418 () Bool)

(declare-fun e!824744 () Bool)

(assert (=> start!125658 (=> (not res!995418) (not e!824744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125658 (= res!995418 (validMask!0 mask!2687))))

(assert (=> start!125658 e!824744))

(assert (=> start!125658 true))

(declare-fun array_inv!37036 (array!98944) Bool)

(assert (=> start!125658 (array_inv!37036 a!2862)))

(declare-fun b!1467724 () Bool)

(declare-fun res!995416 () Bool)

(assert (=> b!1467724 (=> res!995416 e!824750)))

(assert (=> b!1467724 (= res!995416 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1467725 () Bool)

(assert (=> b!1467725 (= e!824750 (bvsge mask!2687 #b00000000000000000000000000000000))))

(declare-fun lt!642236 () (_ BitVec 64))

(declare-fun lt!642235 () array!98944)

(declare-datatypes ((SeekEntryResult!11904 0))(
  ( (MissingZero!11904 (index!50008 (_ BitVec 32))) (Found!11904 (index!50009 (_ BitVec 32))) (Intermediate!11904 (undefined!12716 Bool) (index!50010 (_ BitVec 32)) (x!131770 (_ BitVec 32))) (Undefined!11904) (MissingVacant!11904 (index!50011 (_ BitVec 32))) )
))
(declare-fun lt!642237 () SeekEntryResult!11904)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98944 (_ BitVec 32)) SeekEntryResult!11904)

(assert (=> b!1467725 (= lt!642237 (seekEntryOrOpen!0 lt!642236 lt!642235 mask!2687))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-datatypes ((Unit!49337 0))(
  ( (Unit!49338) )
))
(declare-fun lt!642240 () Unit!49337)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49337)

(assert (=> b!1467725 (= lt!642240 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!642241 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1467726 () Bool)

(declare-fun res!995411 () Bool)

(assert (=> b!1467726 (=> (not res!995411) (not e!824744))))

(assert (=> b!1467726 (= res!995411 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48306 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48306 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48306 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1467727 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98944 (_ BitVec 32)) SeekEntryResult!11904)

(assert (=> b!1467727 (= e!824743 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642236 lt!642235 mask!2687) (seekEntryOrOpen!0 lt!642236 lt!642235 mask!2687)))))

(declare-fun b!1467728 () Bool)

(declare-fun res!995406 () Bool)

(declare-fun e!824745 () Bool)

(assert (=> b!1467728 (=> (not res!995406) (not e!824745))))

(declare-fun lt!642239 () SeekEntryResult!11904)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98944 (_ BitVec 32)) SeekEntryResult!11904)

(assert (=> b!1467728 (= res!995406 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47755 a!2862) j!93) a!2862 mask!2687) lt!642239))))

(declare-fun b!1467729 () Bool)

(declare-fun e!824751 () Bool)

(assert (=> b!1467729 (= e!824744 e!824751)))

(declare-fun res!995407 () Bool)

(assert (=> b!1467729 (=> (not res!995407) (not e!824751))))

(assert (=> b!1467729 (= res!995407 (= (select (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1467729 (= lt!642235 (array!98945 (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48306 a!2862)))))

(declare-fun e!824746 () Bool)

(declare-fun b!1467730 () Bool)

(assert (=> b!1467730 (= e!824746 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642241 intermediateAfterIndex!19 lt!642236 lt!642235 mask!2687) (seekEntryOrOpen!0 lt!642236 lt!642235 mask!2687))))))

(declare-fun b!1467731 () Bool)

(assert (=> b!1467731 (= e!824745 e!824747)))

(declare-fun res!995419 () Bool)

(assert (=> b!1467731 (=> (not res!995419) (not e!824747))))

(declare-fun lt!642238 () SeekEntryResult!11904)

(assert (=> b!1467731 (= res!995419 (= lt!642238 (Intermediate!11904 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1467731 (= lt!642238 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642236 mask!2687) lt!642236 lt!642235 mask!2687))))

(assert (=> b!1467731 (= lt!642236 (select (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1467732 () Bool)

(assert (=> b!1467732 (= e!824743 (= lt!642238 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642236 lt!642235 mask!2687)))))

(declare-fun b!1467733 () Bool)

(declare-fun res!995410 () Bool)

(assert (=> b!1467733 (=> res!995410 e!824750)))

(assert (=> b!1467733 (= res!995410 e!824746)))

(declare-fun c!135679 () Bool)

(assert (=> b!1467733 (= c!135679 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1467734 () Bool)

(declare-fun res!995413 () Bool)

(assert (=> b!1467734 (=> res!995413 e!824750)))

(assert (=> b!1467734 (= res!995413 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642241 (select (arr!47755 a!2862) j!93) a!2862 mask!2687) lt!642239)))))

(declare-fun b!1467735 () Bool)

(declare-fun res!995417 () Bool)

(assert (=> b!1467735 (=> (not res!995417) (not e!824744))))

(declare-datatypes ((List!34243 0))(
  ( (Nil!34240) (Cons!34239 (h!35603 (_ BitVec 64)) (t!48929 List!34243)) )
))
(declare-fun arrayNoDuplicates!0 (array!98944 (_ BitVec 32) List!34243) Bool)

(assert (=> b!1467735 (= res!995417 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34240))))

(declare-fun b!1467736 () Bool)

(assert (=> b!1467736 (= e!824747 (not e!824748))))

(declare-fun res!995415 () Bool)

(assert (=> b!1467736 (=> res!995415 e!824748)))

(assert (=> b!1467736 (= res!995415 (or (and (= (select (arr!47755 a!2862) index!646) (select (store (arr!47755 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47755 a!2862) index!646) (select (arr!47755 a!2862) j!93))) (= (select (arr!47755 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1467736 (and (= lt!642237 (Found!11904 j!93)) (or (= (select (arr!47755 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47755 a!2862) intermediateBeforeIndex!19) (select (arr!47755 a!2862) j!93))))))

(assert (=> b!1467736 (= lt!642237 (seekEntryOrOpen!0 (select (arr!47755 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98944 (_ BitVec 32)) Bool)

(assert (=> b!1467736 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!642234 () Unit!49337)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98944 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49337)

(assert (=> b!1467736 (= lt!642234 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1467737 () Bool)

(assert (=> b!1467737 (= e!824746 (not (= lt!642238 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!642241 lt!642236 lt!642235 mask!2687))))))

(declare-fun b!1467738 () Bool)

(declare-fun res!995409 () Bool)

(assert (=> b!1467738 (=> (not res!995409) (not e!824744))))

(assert (=> b!1467738 (= res!995409 (and (= (size!48306 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48306 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48306 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1467739 () Bool)

(declare-fun res!995408 () Bool)

(assert (=> b!1467739 (=> (not res!995408) (not e!824744))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1467739 (= res!995408 (validKeyInArray!0 (select (arr!47755 a!2862) i!1006)))))

(declare-fun b!1467740 () Bool)

(declare-fun res!995423 () Bool)

(assert (=> b!1467740 (=> (not res!995423) (not e!824744))))

(assert (=> b!1467740 (= res!995423 (validKeyInArray!0 (select (arr!47755 a!2862) j!93)))))

(declare-fun b!1467741 () Bool)

(assert (=> b!1467741 (= e!824751 e!824745)))

(declare-fun res!995414 () Bool)

(assert (=> b!1467741 (=> (not res!995414) (not e!824745))))

(assert (=> b!1467741 (= res!995414 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47755 a!2862) j!93) mask!2687) (select (arr!47755 a!2862) j!93) a!2862 mask!2687) lt!642239))))

(assert (=> b!1467741 (= lt!642239 (Intermediate!11904 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1467742 () Bool)

(declare-fun res!995422 () Bool)

(assert (=> b!1467742 (=> (not res!995422) (not e!824744))))

(assert (=> b!1467742 (= res!995422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(assert (= (and start!125658 res!995418) b!1467738))

(assert (= (and b!1467738 res!995409) b!1467739))

(assert (= (and b!1467739 res!995408) b!1467740))

(assert (= (and b!1467740 res!995423) b!1467742))

(assert (= (and b!1467742 res!995422) b!1467735))

(assert (= (and b!1467735 res!995417) b!1467726))

(assert (= (and b!1467726 res!995411) b!1467729))

(assert (= (and b!1467729 res!995407) b!1467741))

(assert (= (and b!1467741 res!995414) b!1467728))

(assert (= (and b!1467728 res!995406) b!1467731))

(assert (= (and b!1467731 res!995419) b!1467723))

(assert (= (and b!1467723 c!135678) b!1467732))

(assert (= (and b!1467723 (not c!135678)) b!1467727))

(assert (= (and b!1467723 res!995412) b!1467722))

(assert (= (and b!1467722 res!995420) b!1467736))

(assert (= (and b!1467736 (not res!995415)) b!1467721))

(assert (= (and b!1467721 (not res!995421)) b!1467734))

(assert (= (and b!1467734 (not res!995413)) b!1467733))

(assert (= (and b!1467733 c!135679) b!1467737))

(assert (= (and b!1467733 (not c!135679)) b!1467730))

(assert (= (and b!1467733 (not res!995410)) b!1467724))

(assert (= (and b!1467724 (not res!995416)) b!1467725))

(declare-fun m!1354729 () Bool)

(assert (=> b!1467727 m!1354729))

(declare-fun m!1354731 () Bool)

(assert (=> b!1467727 m!1354731))

(declare-fun m!1354733 () Bool)

(assert (=> b!1467742 m!1354733))

(declare-fun m!1354735 () Bool)

(assert (=> b!1467735 m!1354735))

(declare-fun m!1354737 () Bool)

(assert (=> b!1467740 m!1354737))

(assert (=> b!1467740 m!1354737))

(declare-fun m!1354739 () Bool)

(assert (=> b!1467740 m!1354739))

(declare-fun m!1354741 () Bool)

(assert (=> b!1467729 m!1354741))

(declare-fun m!1354743 () Bool)

(assert (=> b!1467729 m!1354743))

(assert (=> b!1467734 m!1354737))

(assert (=> b!1467734 m!1354737))

(declare-fun m!1354745 () Bool)

(assert (=> b!1467734 m!1354745))

(declare-fun m!1354747 () Bool)

(assert (=> b!1467730 m!1354747))

(assert (=> b!1467730 m!1354731))

(assert (=> b!1467725 m!1354731))

(declare-fun m!1354749 () Bool)

(assert (=> b!1467725 m!1354749))

(declare-fun m!1354751 () Bool)

(assert (=> b!1467737 m!1354751))

(declare-fun m!1354753 () Bool)

(assert (=> start!125658 m!1354753))

(declare-fun m!1354755 () Bool)

(assert (=> start!125658 m!1354755))

(assert (=> b!1467728 m!1354737))

(assert (=> b!1467728 m!1354737))

(declare-fun m!1354757 () Bool)

(assert (=> b!1467728 m!1354757))

(assert (=> b!1467741 m!1354737))

(assert (=> b!1467741 m!1354737))

(declare-fun m!1354759 () Bool)

(assert (=> b!1467741 m!1354759))

(assert (=> b!1467741 m!1354759))

(assert (=> b!1467741 m!1354737))

(declare-fun m!1354761 () Bool)

(assert (=> b!1467741 m!1354761))

(declare-fun m!1354763 () Bool)

(assert (=> b!1467736 m!1354763))

(assert (=> b!1467736 m!1354741))

(declare-fun m!1354765 () Bool)

(assert (=> b!1467736 m!1354765))

(declare-fun m!1354767 () Bool)

(assert (=> b!1467736 m!1354767))

(declare-fun m!1354769 () Bool)

(assert (=> b!1467736 m!1354769))

(assert (=> b!1467736 m!1354737))

(declare-fun m!1354771 () Bool)

(assert (=> b!1467736 m!1354771))

(declare-fun m!1354773 () Bool)

(assert (=> b!1467736 m!1354773))

(assert (=> b!1467736 m!1354737))

(declare-fun m!1354775 () Bool)

(assert (=> b!1467732 m!1354775))

(declare-fun m!1354777 () Bool)

(assert (=> b!1467731 m!1354777))

(assert (=> b!1467731 m!1354777))

(declare-fun m!1354779 () Bool)

(assert (=> b!1467731 m!1354779))

(assert (=> b!1467731 m!1354741))

(declare-fun m!1354781 () Bool)

(assert (=> b!1467731 m!1354781))

(declare-fun m!1354783 () Bool)

(assert (=> b!1467721 m!1354783))

(declare-fun m!1354785 () Bool)

(assert (=> b!1467739 m!1354785))

(assert (=> b!1467739 m!1354785))

(declare-fun m!1354787 () Bool)

(assert (=> b!1467739 m!1354787))

(check-sat (not b!1467735) (not b!1467727) (not b!1467725) (not b!1467739) (not b!1467731) (not b!1467721) (not b!1467736) (not b!1467730) (not b!1467741) (not b!1467734) (not b!1467728) (not b!1467732) (not b!1467740) (not start!125658) (not b!1467737) (not b!1467742))
(check-sat)
