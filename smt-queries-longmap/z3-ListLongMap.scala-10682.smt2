; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125232 () Bool)

(assert start!125232)

(declare-fun b!1461129 () Bool)

(declare-fun e!821471 () Bool)

(declare-fun e!821474 () Bool)

(assert (=> b!1461129 (= e!821471 (not e!821474))))

(declare-fun res!990813 () Bool)

(assert (=> b!1461129 (=> res!990813 e!821474)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98680 0))(
  ( (array!98681 (arr!47628 (Array (_ BitVec 32) (_ BitVec 64))) (size!48178 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98680)

(assert (=> b!1461129 (= res!990813 (or (and (= (select (arr!47628 a!2862) index!646) (select (store (arr!47628 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47628 a!2862) index!646) (select (arr!47628 a!2862) j!93))) (= (select (arr!47628 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun e!821480 () Bool)

(assert (=> b!1461129 e!821480))

(declare-fun res!990804 () Bool)

(assert (=> b!1461129 (=> (not res!990804) (not e!821480))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98680 (_ BitVec 32)) Bool)

(assert (=> b!1461129 (= res!990804 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49256 0))(
  ( (Unit!49257) )
))
(declare-fun lt!640037 () Unit!49256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98680 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49256)

(assert (=> b!1461129 (= lt!640037 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1461130 () Bool)

(declare-fun e!821479 () Bool)

(declare-fun e!821473 () Bool)

(assert (=> b!1461130 (= e!821479 e!821473)))

(declare-fun res!990810 () Bool)

(assert (=> b!1461130 (=> (not res!990810) (not e!821473))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1461130 (= res!990810 (= (select (store (arr!47628 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!640033 () array!98680)

(assert (=> b!1461130 (= lt!640033 (array!98681 (store (arr!47628 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48178 a!2862)))))

(declare-fun b!1461131 () Bool)

(declare-fun res!990806 () Bool)

(declare-fun e!821475 () Bool)

(assert (=> b!1461131 (=> (not res!990806) (not e!821475))))

(declare-datatypes ((SeekEntryResult!11880 0))(
  ( (MissingZero!11880 (index!49912 (_ BitVec 32))) (Found!11880 (index!49913 (_ BitVec 32))) (Intermediate!11880 (undefined!12692 Bool) (index!49914 (_ BitVec 32)) (x!131513 (_ BitVec 32))) (Undefined!11880) (MissingVacant!11880 (index!49915 (_ BitVec 32))) )
))
(declare-fun lt!640038 () SeekEntryResult!11880)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98680 (_ BitVec 32)) SeekEntryResult!11880)

(assert (=> b!1461131 (= res!990806 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47628 a!2862) j!93) a!2862 mask!2687) lt!640038))))

(declare-fun b!1461132 () Bool)

(declare-fun e!821478 () Bool)

(assert (=> b!1461132 (= e!821478 true)))

(declare-fun lt!640032 () Bool)

(declare-fun e!821476 () Bool)

(assert (=> b!1461132 (= lt!640032 e!821476)))

(declare-fun c!134676 () Bool)

(assert (=> b!1461132 (= c!134676 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1461133 () Bool)

(assert (=> b!1461133 (= e!821480 (or (= (select (arr!47628 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47628 a!2862) intermediateBeforeIndex!19) (select (arr!47628 a!2862) j!93))))))

(declare-fun b!1461134 () Bool)

(declare-fun res!990809 () Bool)

(assert (=> b!1461134 (=> (not res!990809) (not e!821479))))

(assert (=> b!1461134 (= res!990809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1461135 () Bool)

(declare-fun lt!640036 () (_ BitVec 32))

(declare-fun lt!640035 () (_ BitVec 64))

(declare-fun lt!640034 () SeekEntryResult!11880)

(assert (=> b!1461135 (= e!821476 (not (= lt!640034 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640036 lt!640035 lt!640033 mask!2687))))))

(declare-fun b!1461136 () Bool)

(declare-fun res!990811 () Bool)

(assert (=> b!1461136 (=> (not res!990811) (not e!821479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1461136 (= res!990811 (validKeyInArray!0 (select (arr!47628 a!2862) i!1006)))))

(declare-fun b!1461137 () Bool)

(assert (=> b!1461137 (= e!821475 e!821471)))

(declare-fun res!990814 () Bool)

(assert (=> b!1461137 (=> (not res!990814) (not e!821471))))

(assert (=> b!1461137 (= res!990814 (= lt!640034 (Intermediate!11880 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461137 (= lt!640034 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!640035 mask!2687) lt!640035 lt!640033 mask!2687))))

(assert (=> b!1461137 (= lt!640035 (select (store (arr!47628 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1461138 () Bool)

(declare-fun res!990802 () Bool)

(assert (=> b!1461138 (=> (not res!990802) (not e!821471))))

(declare-fun e!821472 () Bool)

(assert (=> b!1461138 (= res!990802 e!821472)))

(declare-fun c!134675 () Bool)

(assert (=> b!1461138 (= c!134675 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1461139 () Bool)

(declare-fun res!990803 () Bool)

(assert (=> b!1461139 (=> res!990803 e!821478)))

(assert (=> b!1461139 (= res!990803 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640036 (select (arr!47628 a!2862) j!93) a!2862 mask!2687) lt!640038)))))

(declare-fun b!1461140 () Bool)

(assert (=> b!1461140 (= e!821472 (= lt!640034 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!640035 lt!640033 mask!2687)))))

(declare-fun res!990812 () Bool)

(assert (=> start!125232 (=> (not res!990812) (not e!821479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125232 (= res!990812 (validMask!0 mask!2687))))

(assert (=> start!125232 e!821479))

(assert (=> start!125232 true))

(declare-fun array_inv!36656 (array!98680) Bool)

(assert (=> start!125232 (array_inv!36656 a!2862)))

(declare-fun b!1461141 () Bool)

(declare-fun res!990807 () Bool)

(assert (=> b!1461141 (=> (not res!990807) (not e!821479))))

(assert (=> b!1461141 (= res!990807 (and (= (size!48178 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48178 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48178 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1461142 () Bool)

(assert (=> b!1461142 (= e!821473 e!821475)))

(declare-fun res!990808 () Bool)

(assert (=> b!1461142 (=> (not res!990808) (not e!821475))))

(assert (=> b!1461142 (= res!990808 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47628 a!2862) j!93) mask!2687) (select (arr!47628 a!2862) j!93) a!2862 mask!2687) lt!640038))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1461142 (= lt!640038 (Intermediate!11880 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1461143 () Bool)

(assert (=> b!1461143 (= e!821474 e!821478)))

(declare-fun res!990815 () Bool)

(assert (=> b!1461143 (=> res!990815 e!821478)))

(assert (=> b!1461143 (= res!990815 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!640036 #b00000000000000000000000000000000) (bvsge lt!640036 (size!48178 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1461143 (= lt!640036 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1461144 () Bool)

(declare-fun res!990816 () Bool)

(assert (=> b!1461144 (=> (not res!990816) (not e!821480))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98680 (_ BitVec 32)) SeekEntryResult!11880)

(assert (=> b!1461144 (= res!990816 (= (seekEntryOrOpen!0 (select (arr!47628 a!2862) j!93) a!2862 mask!2687) (Found!11880 j!93)))))

(declare-fun b!1461145 () Bool)

(declare-fun res!990805 () Bool)

(assert (=> b!1461145 (=> (not res!990805) (not e!821479))))

(assert (=> b!1461145 (= res!990805 (validKeyInArray!0 (select (arr!47628 a!2862) j!93)))))

(declare-fun b!1461146 () Bool)

(declare-fun res!990800 () Bool)

(assert (=> b!1461146 (=> (not res!990800) (not e!821479))))

(declare-datatypes ((List!34129 0))(
  ( (Nil!34126) (Cons!34125 (h!35475 (_ BitVec 64)) (t!48823 List!34129)) )
))
(declare-fun arrayNoDuplicates!0 (array!98680 (_ BitVec 32) List!34129) Bool)

(assert (=> b!1461146 (= res!990800 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34126))))

(declare-fun b!1461147 () Bool)

(declare-fun res!990801 () Bool)

(assert (=> b!1461147 (=> (not res!990801) (not e!821479))))

(assert (=> b!1461147 (= res!990801 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48178 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48178 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48178 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1461148 () Bool)

(declare-fun res!990817 () Bool)

(assert (=> b!1461148 (=> (not res!990817) (not e!821471))))

(assert (=> b!1461148 (= res!990817 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1461149 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98680 (_ BitVec 32)) SeekEntryResult!11880)

(assert (=> b!1461149 (= e!821472 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!640035 lt!640033 mask!2687) (seekEntryOrOpen!0 lt!640035 lt!640033 mask!2687)))))

(declare-fun b!1461150 () Bool)

(assert (=> b!1461150 (= e!821476 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!640036 intermediateAfterIndex!19 lt!640035 lt!640033 mask!2687) (seekEntryOrOpen!0 lt!640035 lt!640033 mask!2687))))))

(assert (= (and start!125232 res!990812) b!1461141))

(assert (= (and b!1461141 res!990807) b!1461136))

(assert (= (and b!1461136 res!990811) b!1461145))

(assert (= (and b!1461145 res!990805) b!1461134))

(assert (= (and b!1461134 res!990809) b!1461146))

(assert (= (and b!1461146 res!990800) b!1461147))

(assert (= (and b!1461147 res!990801) b!1461130))

(assert (= (and b!1461130 res!990810) b!1461142))

(assert (= (and b!1461142 res!990808) b!1461131))

(assert (= (and b!1461131 res!990806) b!1461137))

(assert (= (and b!1461137 res!990814) b!1461138))

(assert (= (and b!1461138 c!134675) b!1461140))

(assert (= (and b!1461138 (not c!134675)) b!1461149))

(assert (= (and b!1461138 res!990802) b!1461148))

(assert (= (and b!1461148 res!990817) b!1461129))

(assert (= (and b!1461129 res!990804) b!1461144))

(assert (= (and b!1461144 res!990816) b!1461133))

(assert (= (and b!1461129 (not res!990813)) b!1461143))

(assert (= (and b!1461143 (not res!990815)) b!1461139))

(assert (= (and b!1461139 (not res!990803)) b!1461132))

(assert (= (and b!1461132 c!134676) b!1461135))

(assert (= (and b!1461132 (not c!134676)) b!1461150))

(declare-fun m!1348745 () Bool)

(assert (=> b!1461142 m!1348745))

(assert (=> b!1461142 m!1348745))

(declare-fun m!1348747 () Bool)

(assert (=> b!1461142 m!1348747))

(assert (=> b!1461142 m!1348747))

(assert (=> b!1461142 m!1348745))

(declare-fun m!1348749 () Bool)

(assert (=> b!1461142 m!1348749))

(declare-fun m!1348751 () Bool)

(assert (=> b!1461130 m!1348751))

(declare-fun m!1348753 () Bool)

(assert (=> b!1461130 m!1348753))

(declare-fun m!1348755 () Bool)

(assert (=> b!1461146 m!1348755))

(declare-fun m!1348757 () Bool)

(assert (=> b!1461137 m!1348757))

(assert (=> b!1461137 m!1348757))

(declare-fun m!1348759 () Bool)

(assert (=> b!1461137 m!1348759))

(assert (=> b!1461137 m!1348751))

(declare-fun m!1348761 () Bool)

(assert (=> b!1461137 m!1348761))

(declare-fun m!1348763 () Bool)

(assert (=> b!1461149 m!1348763))

(declare-fun m!1348765 () Bool)

(assert (=> b!1461149 m!1348765))

(assert (=> b!1461139 m!1348745))

(assert (=> b!1461139 m!1348745))

(declare-fun m!1348767 () Bool)

(assert (=> b!1461139 m!1348767))

(assert (=> b!1461144 m!1348745))

(assert (=> b!1461144 m!1348745))

(declare-fun m!1348769 () Bool)

(assert (=> b!1461144 m!1348769))

(assert (=> b!1461131 m!1348745))

(assert (=> b!1461131 m!1348745))

(declare-fun m!1348771 () Bool)

(assert (=> b!1461131 m!1348771))

(declare-fun m!1348773 () Bool)

(assert (=> b!1461136 m!1348773))

(assert (=> b!1461136 m!1348773))

(declare-fun m!1348775 () Bool)

(assert (=> b!1461136 m!1348775))

(declare-fun m!1348777 () Bool)

(assert (=> b!1461140 m!1348777))

(declare-fun m!1348779 () Bool)

(assert (=> b!1461134 m!1348779))

(declare-fun m!1348781 () Bool)

(assert (=> b!1461143 m!1348781))

(declare-fun m!1348783 () Bool)

(assert (=> b!1461135 m!1348783))

(declare-fun m!1348785 () Bool)

(assert (=> b!1461129 m!1348785))

(assert (=> b!1461129 m!1348751))

(declare-fun m!1348787 () Bool)

(assert (=> b!1461129 m!1348787))

(declare-fun m!1348789 () Bool)

(assert (=> b!1461129 m!1348789))

(declare-fun m!1348791 () Bool)

(assert (=> b!1461129 m!1348791))

(assert (=> b!1461129 m!1348745))

(declare-fun m!1348793 () Bool)

(assert (=> start!125232 m!1348793))

(declare-fun m!1348795 () Bool)

(assert (=> start!125232 m!1348795))

(declare-fun m!1348797 () Bool)

(assert (=> b!1461150 m!1348797))

(assert (=> b!1461150 m!1348765))

(declare-fun m!1348799 () Bool)

(assert (=> b!1461133 m!1348799))

(assert (=> b!1461133 m!1348745))

(assert (=> b!1461145 m!1348745))

(assert (=> b!1461145 m!1348745))

(declare-fun m!1348801 () Bool)

(assert (=> b!1461145 m!1348801))

(check-sat (not b!1461144) (not b!1461139) (not b!1461136) (not b!1461142) (not b!1461149) (not b!1461137) (not b!1461146) (not start!125232) (not b!1461129) (not b!1461145) (not b!1461143) (not b!1461131) (not b!1461135) (not b!1461134) (not b!1461140) (not b!1461150))
(check-sat)
