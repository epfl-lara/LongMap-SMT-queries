; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125126 () Bool)

(assert start!125126)

(declare-fun b!1457802 () Bool)

(declare-fun e!820054 () Bool)

(assert (=> b!1457802 (= e!820054 true)))

(declare-fun lt!638817 () Bool)

(declare-fun e!820057 () Bool)

(assert (=> b!1457802 (= lt!638817 e!820057)))

(declare-fun c!134394 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1457802 (= c!134394 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1457803 () Bool)

(declare-fun res!988054 () Bool)

(assert (=> b!1457803 (=> res!988054 e!820054)))

(declare-datatypes ((array!98574 0))(
  ( (array!98575 (arr!47575 (Array (_ BitVec 32) (_ BitVec 64))) (size!48125 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98574)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11827 0))(
  ( (MissingZero!11827 (index!49700 (_ BitVec 32))) (Found!11827 (index!49701 (_ BitVec 32))) (Intermediate!11827 (undefined!12639 Bool) (index!49702 (_ BitVec 32)) (x!131316 (_ BitVec 32))) (Undefined!11827) (MissingVacant!11827 (index!49703 (_ BitVec 32))) )
))
(declare-fun lt!638814 () SeekEntryResult!11827)

(declare-fun lt!638811 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98574 (_ BitVec 32)) SeekEntryResult!11827)

(assert (=> b!1457803 (= res!988054 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638811 (select (arr!47575 a!2862) j!93) a!2862 mask!2687) lt!638814)))))

(declare-fun e!820058 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1457804 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1457804 (= e!820058 (and (or (= (select (arr!47575 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47575 a!2862) intermediateBeforeIndex!19) (select (arr!47575 a!2862) j!93))) (let ((bdg!53365 (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47575 a!2862) index!646) bdg!53365) (= (select (arr!47575 a!2862) index!646) (select (arr!47575 a!2862) j!93))) (= (select (arr!47575 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53365 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!1457805 () Bool)

(declare-fun res!988050 () Bool)

(declare-fun e!820052 () Bool)

(assert (=> b!1457805 (=> (not res!988050) (not e!820052))))

(declare-datatypes ((List!34076 0))(
  ( (Nil!34073) (Cons!34072 (h!35422 (_ BitVec 64)) (t!48770 List!34076)) )
))
(declare-fun arrayNoDuplicates!0 (array!98574 (_ BitVec 32) List!34076) Bool)

(assert (=> b!1457805 (= res!988050 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34073))))

(declare-fun res!988037 () Bool)

(assert (=> start!125126 (=> (not res!988037) (not e!820052))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125126 (= res!988037 (validMask!0 mask!2687))))

(assert (=> start!125126 e!820052))

(assert (=> start!125126 true))

(declare-fun array_inv!36603 (array!98574) Bool)

(assert (=> start!125126 (array_inv!36603 a!2862)))

(declare-fun b!1457806 () Bool)

(declare-fun e!820053 () Bool)

(declare-fun e!820055 () Bool)

(assert (=> b!1457806 (= e!820053 e!820055)))

(declare-fun res!988052 () Bool)

(assert (=> b!1457806 (=> (not res!988052) (not e!820055))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457806 (= res!988052 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47575 a!2862) j!93) mask!2687) (select (arr!47575 a!2862) j!93) a!2862 mask!2687) lt!638814))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1457806 (= lt!638814 (Intermediate!11827 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1457807 () Bool)

(declare-fun res!988046 () Bool)

(assert (=> b!1457807 (=> (not res!988046) (not e!820058))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98574 (_ BitVec 32)) SeekEntryResult!11827)

(assert (=> b!1457807 (= res!988046 (= (seekEntryOrOpen!0 (select (arr!47575 a!2862) j!93) a!2862 mask!2687) (Found!11827 j!93)))))

(declare-fun b!1457808 () Bool)

(declare-fun res!988044 () Bool)

(declare-fun e!820059 () Bool)

(assert (=> b!1457808 (=> (not res!988044) (not e!820059))))

(declare-fun e!820056 () Bool)

(assert (=> b!1457808 (= res!988044 e!820056)))

(declare-fun c!134393 () Bool)

(assert (=> b!1457808 (= c!134393 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!638815 () array!98574)

(declare-fun lt!638816 () (_ BitVec 64))

(declare-fun b!1457809 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98574 (_ BitVec 32)) SeekEntryResult!11827)

(assert (=> b!1457809 (= e!820056 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638816 lt!638815 mask!2687) (seekEntryOrOpen!0 lt!638816 lt!638815 mask!2687)))))

(declare-fun b!1457810 () Bool)

(declare-fun res!988038 () Bool)

(assert (=> b!1457810 (=> (not res!988038) (not e!820052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98574 (_ BitVec 32)) Bool)

(assert (=> b!1457810 (= res!988038 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun lt!638813 () SeekEntryResult!11827)

(declare-fun b!1457811 () Bool)

(assert (=> b!1457811 (= e!820057 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638811 intermediateAfterIndex!19 lt!638816 lt!638815 mask!2687) lt!638813)))))

(declare-fun b!1457812 () Bool)

(declare-fun res!988040 () Bool)

(assert (=> b!1457812 (=> (not res!988040) (not e!820059))))

(assert (=> b!1457812 (= res!988040 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1457813 () Bool)

(declare-fun lt!638810 () SeekEntryResult!11827)

(assert (=> b!1457813 (= e!820057 (not (= lt!638810 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!638811 lt!638816 lt!638815 mask!2687))))))

(declare-fun b!1457814 () Bool)

(assert (=> b!1457814 (= e!820056 (= lt!638810 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!638816 lt!638815 mask!2687)))))

(declare-fun b!1457815 () Bool)

(assert (=> b!1457815 (= e!820052 e!820053)))

(declare-fun res!988043 () Bool)

(assert (=> b!1457815 (=> (not res!988043) (not e!820053))))

(assert (=> b!1457815 (= res!988043 (= (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1457815 (= lt!638815 (array!98575 (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48125 a!2862)))))

(declare-fun b!1457816 () Bool)

(declare-fun res!988053 () Bool)

(assert (=> b!1457816 (=> (not res!988053) (not e!820052))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1457816 (= res!988053 (validKeyInArray!0 (select (arr!47575 a!2862) i!1006)))))

(declare-fun b!1457817 () Bool)

(declare-fun e!820061 () Bool)

(assert (=> b!1457817 (= e!820061 e!820054)))

(declare-fun res!988045 () Bool)

(assert (=> b!1457817 (=> res!988045 e!820054)))

(assert (=> b!1457817 (= res!988045 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!638811 #b00000000000000000000000000000000) (bvsge lt!638811 (size!48125 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1457817 (= lt!638811 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1457817 (= lt!638813 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!638816 lt!638815 mask!2687))))

(assert (=> b!1457817 (= lt!638813 (seekEntryOrOpen!0 lt!638816 lt!638815 mask!2687))))

(declare-fun b!1457818 () Bool)

(declare-fun res!988042 () Bool)

(assert (=> b!1457818 (=> (not res!988042) (not e!820052))))

(assert (=> b!1457818 (= res!988042 (validKeyInArray!0 (select (arr!47575 a!2862) j!93)))))

(declare-fun b!1457819 () Bool)

(declare-fun res!988048 () Bool)

(assert (=> b!1457819 (=> (not res!988048) (not e!820055))))

(assert (=> b!1457819 (= res!988048 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47575 a!2862) j!93) a!2862 mask!2687) lt!638814))))

(declare-fun b!1457820 () Bool)

(declare-fun res!988041 () Bool)

(assert (=> b!1457820 (=> (not res!988041) (not e!820052))))

(assert (=> b!1457820 (= res!988041 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48125 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48125 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48125 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1457821 () Bool)

(declare-fun res!988047 () Bool)

(assert (=> b!1457821 (=> (not res!988047) (not e!820052))))

(assert (=> b!1457821 (= res!988047 (and (= (size!48125 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48125 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48125 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1457822 () Bool)

(assert (=> b!1457822 (= e!820059 (not e!820061))))

(declare-fun res!988039 () Bool)

(assert (=> b!1457822 (=> res!988039 e!820061)))

(assert (=> b!1457822 (= res!988039 (or (and (= (select (arr!47575 a!2862) index!646) (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47575 a!2862) index!646) (select (arr!47575 a!2862) j!93))) (= (select (arr!47575 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1457822 e!820058))

(declare-fun res!988051 () Bool)

(assert (=> b!1457822 (=> (not res!988051) (not e!820058))))

(assert (=> b!1457822 (= res!988051 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49150 0))(
  ( (Unit!49151) )
))
(declare-fun lt!638812 () Unit!49150)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49150)

(assert (=> b!1457822 (= lt!638812 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1457823 () Bool)

(assert (=> b!1457823 (= e!820055 e!820059)))

(declare-fun res!988049 () Bool)

(assert (=> b!1457823 (=> (not res!988049) (not e!820059))))

(assert (=> b!1457823 (= res!988049 (= lt!638810 (Intermediate!11827 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1457823 (= lt!638810 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!638816 mask!2687) lt!638816 lt!638815 mask!2687))))

(assert (=> b!1457823 (= lt!638816 (select (store (arr!47575 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!125126 res!988037) b!1457821))

(assert (= (and b!1457821 res!988047) b!1457816))

(assert (= (and b!1457816 res!988053) b!1457818))

(assert (= (and b!1457818 res!988042) b!1457810))

(assert (= (and b!1457810 res!988038) b!1457805))

(assert (= (and b!1457805 res!988050) b!1457820))

(assert (= (and b!1457820 res!988041) b!1457815))

(assert (= (and b!1457815 res!988043) b!1457806))

(assert (= (and b!1457806 res!988052) b!1457819))

(assert (= (and b!1457819 res!988048) b!1457823))

(assert (= (and b!1457823 res!988049) b!1457808))

(assert (= (and b!1457808 c!134393) b!1457814))

(assert (= (and b!1457808 (not c!134393)) b!1457809))

(assert (= (and b!1457808 res!988044) b!1457812))

(assert (= (and b!1457812 res!988040) b!1457822))

(assert (= (and b!1457822 res!988051) b!1457807))

(assert (= (and b!1457807 res!988046) b!1457804))

(assert (= (and b!1457822 (not res!988039)) b!1457817))

(assert (= (and b!1457817 (not res!988045)) b!1457803))

(assert (= (and b!1457803 (not res!988054)) b!1457802))

(assert (= (and b!1457802 c!134394) b!1457813))

(assert (= (and b!1457802 (not c!134394)) b!1457811))

(declare-fun m!1345737 () Bool)

(assert (=> b!1457810 m!1345737))

(declare-fun m!1345739 () Bool)

(assert (=> b!1457818 m!1345739))

(assert (=> b!1457818 m!1345739))

(declare-fun m!1345741 () Bool)

(assert (=> b!1457818 m!1345741))

(assert (=> b!1457803 m!1345739))

(assert (=> b!1457803 m!1345739))

(declare-fun m!1345743 () Bool)

(assert (=> b!1457803 m!1345743))

(declare-fun m!1345745 () Bool)

(assert (=> b!1457817 m!1345745))

(declare-fun m!1345747 () Bool)

(assert (=> b!1457817 m!1345747))

(declare-fun m!1345749 () Bool)

(assert (=> b!1457817 m!1345749))

(assert (=> b!1457819 m!1345739))

(assert (=> b!1457819 m!1345739))

(declare-fun m!1345751 () Bool)

(assert (=> b!1457819 m!1345751))

(declare-fun m!1345753 () Bool)

(assert (=> b!1457805 m!1345753))

(declare-fun m!1345755 () Bool)

(assert (=> b!1457804 m!1345755))

(declare-fun m!1345757 () Bool)

(assert (=> b!1457804 m!1345757))

(declare-fun m!1345759 () Bool)

(assert (=> b!1457804 m!1345759))

(declare-fun m!1345761 () Bool)

(assert (=> b!1457804 m!1345761))

(assert (=> b!1457804 m!1345739))

(declare-fun m!1345763 () Bool)

(assert (=> b!1457816 m!1345763))

(assert (=> b!1457816 m!1345763))

(declare-fun m!1345765 () Bool)

(assert (=> b!1457816 m!1345765))

(declare-fun m!1345767 () Bool)

(assert (=> b!1457811 m!1345767))

(declare-fun m!1345769 () Bool)

(assert (=> b!1457814 m!1345769))

(assert (=> b!1457815 m!1345755))

(declare-fun m!1345771 () Bool)

(assert (=> b!1457815 m!1345771))

(declare-fun m!1345773 () Bool)

(assert (=> b!1457822 m!1345773))

(assert (=> b!1457822 m!1345755))

(assert (=> b!1457822 m!1345759))

(assert (=> b!1457822 m!1345761))

(declare-fun m!1345775 () Bool)

(assert (=> b!1457822 m!1345775))

(assert (=> b!1457822 m!1345739))

(assert (=> b!1457807 m!1345739))

(assert (=> b!1457807 m!1345739))

(declare-fun m!1345777 () Bool)

(assert (=> b!1457807 m!1345777))

(declare-fun m!1345779 () Bool)

(assert (=> start!125126 m!1345779))

(declare-fun m!1345781 () Bool)

(assert (=> start!125126 m!1345781))

(assert (=> b!1457809 m!1345747))

(assert (=> b!1457809 m!1345749))

(declare-fun m!1345783 () Bool)

(assert (=> b!1457813 m!1345783))

(declare-fun m!1345785 () Bool)

(assert (=> b!1457823 m!1345785))

(assert (=> b!1457823 m!1345785))

(declare-fun m!1345787 () Bool)

(assert (=> b!1457823 m!1345787))

(assert (=> b!1457823 m!1345755))

(declare-fun m!1345789 () Bool)

(assert (=> b!1457823 m!1345789))

(assert (=> b!1457806 m!1345739))

(assert (=> b!1457806 m!1345739))

(declare-fun m!1345791 () Bool)

(assert (=> b!1457806 m!1345791))

(assert (=> b!1457806 m!1345791))

(assert (=> b!1457806 m!1345739))

(declare-fun m!1345793 () Bool)

(assert (=> b!1457806 m!1345793))

(push 1)

