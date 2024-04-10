; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126176 () Bool)

(assert start!126176)

(declare-fun b!1477733 () Bool)

(declare-fun e!828990 () Bool)

(declare-fun e!828992 () Bool)

(assert (=> b!1477733 (= e!828990 e!828992)))

(declare-fun res!1003832 () Bool)

(assert (=> b!1477733 (=> (not res!1003832) (not e!828992))))

(declare-datatypes ((SeekEntryResult!12160 0))(
  ( (MissingZero!12160 (index!51032 (_ BitVec 32))) (Found!12160 (index!51033 (_ BitVec 32))) (Intermediate!12160 (undefined!12972 Bool) (index!51034 (_ BitVec 32)) (x!132623 (_ BitVec 32))) (Undefined!12160) (MissingVacant!12160 (index!51035 (_ BitVec 32))) )
))
(declare-fun lt!645449 () SeekEntryResult!12160)

(declare-datatypes ((array!99282 0))(
  ( (array!99283 (arr!47920 (Array (_ BitVec 32) (_ BitVec 64))) (size!48470 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99282)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99282 (_ BitVec 32)) SeekEntryResult!12160)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1477733 (= res!1003832 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47920 a!2862) j!93) mask!2687) (select (arr!47920 a!2862) j!93) a!2862 mask!2687) lt!645449))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1477733 (= lt!645449 (Intermediate!12160 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1477734 () Bool)

(declare-fun res!1003828 () Bool)

(declare-fun e!828997 () Bool)

(assert (=> b!1477734 (=> (not res!1003828) (not e!828997))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1477734 (= res!1003828 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48470 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48470 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48470 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1477735 () Bool)

(declare-fun res!1003825 () Bool)

(assert (=> b!1477735 (=> (not res!1003825) (not e!828997))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1477735 (= res!1003825 (validKeyInArray!0 (select (arr!47920 a!2862) i!1006)))))

(declare-fun b!1477736 () Bool)

(declare-fun res!1003831 () Bool)

(assert (=> b!1477736 (=> (not res!1003831) (not e!828992))))

(assert (=> b!1477736 (= res!1003831 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47920 a!2862) j!93) a!2862 mask!2687) lt!645449))))

(declare-fun b!1477737 () Bool)

(declare-fun e!828995 () Bool)

(assert (=> b!1477737 (= e!828995 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1477738 () Bool)

(declare-fun res!1003836 () Bool)

(assert (=> b!1477738 (=> (not res!1003836) (not e!828997))))

(assert (=> b!1477738 (= res!1003836 (validKeyInArray!0 (select (arr!47920 a!2862) j!93)))))

(declare-fun b!1477739 () Bool)

(declare-fun e!828996 () Bool)

(assert (=> b!1477739 (= e!828996 (not true))))

(declare-fun e!828994 () Bool)

(assert (=> b!1477739 e!828994))

(declare-fun res!1003840 () Bool)

(assert (=> b!1477739 (=> (not res!1003840) (not e!828994))))

(declare-fun lt!645447 () SeekEntryResult!12160)

(assert (=> b!1477739 (= res!1003840 (and (= lt!645447 (Found!12160 j!93)) (or (= (select (arr!47920 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47920 a!2862) intermediateBeforeIndex!19) (select (arr!47920 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99282 (_ BitVec 32)) SeekEntryResult!12160)

(assert (=> b!1477739 (= lt!645447 (seekEntryOrOpen!0 (select (arr!47920 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99282 (_ BitVec 32)) Bool)

(assert (=> b!1477739 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49660 0))(
  ( (Unit!49661) )
))
(declare-fun lt!645446 () Unit!49660)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99282 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49660)

(assert (=> b!1477739 (= lt!645446 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1477740 () Bool)

(declare-fun res!1003826 () Bool)

(assert (=> b!1477740 (=> (not res!1003826) (not e!828996))))

(declare-fun e!828998 () Bool)

(assert (=> b!1477740 (= res!1003826 e!828998)))

(declare-fun c!136473 () Bool)

(assert (=> b!1477740 (= c!136473 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1477741 () Bool)

(declare-fun e!828993 () Bool)

(assert (=> b!1477741 (= e!828994 e!828993)))

(declare-fun res!1003833 () Bool)

(assert (=> b!1477741 (=> res!1003833 e!828993)))

(assert (=> b!1477741 (= res!1003833 (or (and (= (select (arr!47920 a!2862) index!646) (select (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47920 a!2862) index!646) (select (arr!47920 a!2862) j!93))) (not (= (select (arr!47920 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1477732 () Bool)

(declare-fun res!1003837 () Bool)

(assert (=> b!1477732 (=> (not res!1003837) (not e!828996))))

(assert (=> b!1477732 (= res!1003837 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1003834 () Bool)

(assert (=> start!126176 (=> (not res!1003834) (not e!828997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126176 (= res!1003834 (validMask!0 mask!2687))))

(assert (=> start!126176 e!828997))

(assert (=> start!126176 true))

(declare-fun array_inv!36948 (array!99282) Bool)

(assert (=> start!126176 (array_inv!36948 a!2862)))

(declare-fun lt!645450 () array!99282)

(declare-fun b!1477742 () Bool)

(declare-fun lt!645448 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99282 (_ BitVec 32)) SeekEntryResult!12160)

(assert (=> b!1477742 (= e!828998 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645448 lt!645450 mask!2687) (seekEntryOrOpen!0 lt!645448 lt!645450 mask!2687)))))

(declare-fun b!1477743 () Bool)

(assert (=> b!1477743 (= e!828997 e!828990)))

(declare-fun res!1003835 () Bool)

(assert (=> b!1477743 (=> (not res!1003835) (not e!828990))))

(assert (=> b!1477743 (= res!1003835 (= (select (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1477743 (= lt!645450 (array!99283 (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48470 a!2862)))))

(declare-fun b!1477744 () Bool)

(declare-fun res!1003829 () Bool)

(assert (=> b!1477744 (=> (not res!1003829) (not e!828997))))

(assert (=> b!1477744 (= res!1003829 (and (= (size!48470 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48470 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48470 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1477745 () Bool)

(declare-fun res!1003839 () Bool)

(assert (=> b!1477745 (=> (not res!1003839) (not e!828997))))

(declare-datatypes ((List!34421 0))(
  ( (Nil!34418) (Cons!34417 (h!35785 (_ BitVec 64)) (t!49115 List!34421)) )
))
(declare-fun arrayNoDuplicates!0 (array!99282 (_ BitVec 32) List!34421) Bool)

(assert (=> b!1477745 (= res!1003839 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34418))))

(declare-fun b!1477746 () Bool)

(declare-fun lt!645445 () SeekEntryResult!12160)

(assert (=> b!1477746 (= e!828998 (= lt!645445 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645448 lt!645450 mask!2687)))))

(declare-fun b!1477747 () Bool)

(assert (=> b!1477747 (= e!828992 e!828996)))

(declare-fun res!1003827 () Bool)

(assert (=> b!1477747 (=> (not res!1003827) (not e!828996))))

(assert (=> b!1477747 (= res!1003827 (= lt!645445 (Intermediate!12160 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1477747 (= lt!645445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645448 mask!2687) lt!645448 lt!645450 mask!2687))))

(assert (=> b!1477747 (= lt!645448 (select (store (arr!47920 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1477748 () Bool)

(declare-fun res!1003830 () Bool)

(assert (=> b!1477748 (=> (not res!1003830) (not e!828997))))

(assert (=> b!1477748 (= res!1003830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1477749 () Bool)

(assert (=> b!1477749 (= e!828993 e!828995)))

(declare-fun res!1003838 () Bool)

(assert (=> b!1477749 (=> (not res!1003838) (not e!828995))))

(assert (=> b!1477749 (= res!1003838 (= lt!645447 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47920 a!2862) j!93) a!2862 mask!2687)))))

(assert (= (and start!126176 res!1003834) b!1477744))

(assert (= (and b!1477744 res!1003829) b!1477735))

(assert (= (and b!1477735 res!1003825) b!1477738))

(assert (= (and b!1477738 res!1003836) b!1477748))

(assert (= (and b!1477748 res!1003830) b!1477745))

(assert (= (and b!1477745 res!1003839) b!1477734))

(assert (= (and b!1477734 res!1003828) b!1477743))

(assert (= (and b!1477743 res!1003835) b!1477733))

(assert (= (and b!1477733 res!1003832) b!1477736))

(assert (= (and b!1477736 res!1003831) b!1477747))

(assert (= (and b!1477747 res!1003827) b!1477740))

(assert (= (and b!1477740 c!136473) b!1477746))

(assert (= (and b!1477740 (not c!136473)) b!1477742))

(assert (= (and b!1477740 res!1003826) b!1477732))

(assert (= (and b!1477732 res!1003837) b!1477739))

(assert (= (and b!1477739 res!1003840) b!1477741))

(assert (= (and b!1477741 (not res!1003833)) b!1477749))

(assert (= (and b!1477749 res!1003838) b!1477737))

(declare-fun m!1363671 () Bool)

(assert (=> b!1477735 m!1363671))

(assert (=> b!1477735 m!1363671))

(declare-fun m!1363673 () Bool)

(assert (=> b!1477735 m!1363673))

(declare-fun m!1363675 () Bool)

(assert (=> b!1477739 m!1363675))

(declare-fun m!1363677 () Bool)

(assert (=> b!1477739 m!1363677))

(declare-fun m!1363679 () Bool)

(assert (=> b!1477739 m!1363679))

(declare-fun m!1363681 () Bool)

(assert (=> b!1477739 m!1363681))

(declare-fun m!1363683 () Bool)

(assert (=> b!1477739 m!1363683))

(assert (=> b!1477739 m!1363679))

(assert (=> b!1477733 m!1363679))

(assert (=> b!1477733 m!1363679))

(declare-fun m!1363685 () Bool)

(assert (=> b!1477733 m!1363685))

(assert (=> b!1477733 m!1363685))

(assert (=> b!1477733 m!1363679))

(declare-fun m!1363687 () Bool)

(assert (=> b!1477733 m!1363687))

(declare-fun m!1363689 () Bool)

(assert (=> b!1477741 m!1363689))

(declare-fun m!1363691 () Bool)

(assert (=> b!1477741 m!1363691))

(declare-fun m!1363693 () Bool)

(assert (=> b!1477741 m!1363693))

(assert (=> b!1477741 m!1363679))

(declare-fun m!1363695 () Bool)

(assert (=> b!1477745 m!1363695))

(declare-fun m!1363697 () Bool)

(assert (=> b!1477746 m!1363697))

(declare-fun m!1363699 () Bool)

(assert (=> b!1477747 m!1363699))

(assert (=> b!1477747 m!1363699))

(declare-fun m!1363701 () Bool)

(assert (=> b!1477747 m!1363701))

(assert (=> b!1477747 m!1363691))

(declare-fun m!1363703 () Bool)

(assert (=> b!1477747 m!1363703))

(assert (=> b!1477743 m!1363691))

(declare-fun m!1363705 () Bool)

(assert (=> b!1477743 m!1363705))

(declare-fun m!1363707 () Bool)

(assert (=> b!1477742 m!1363707))

(declare-fun m!1363709 () Bool)

(assert (=> b!1477742 m!1363709))

(declare-fun m!1363711 () Bool)

(assert (=> b!1477748 m!1363711))

(declare-fun m!1363713 () Bool)

(assert (=> start!126176 m!1363713))

(declare-fun m!1363715 () Bool)

(assert (=> start!126176 m!1363715))

(assert (=> b!1477738 m!1363679))

(assert (=> b!1477738 m!1363679))

(declare-fun m!1363717 () Bool)

(assert (=> b!1477738 m!1363717))

(assert (=> b!1477749 m!1363679))

(assert (=> b!1477749 m!1363679))

(declare-fun m!1363719 () Bool)

(assert (=> b!1477749 m!1363719))

(assert (=> b!1477736 m!1363679))

(assert (=> b!1477736 m!1363679))

(declare-fun m!1363721 () Bool)

(assert (=> b!1477736 m!1363721))

(push 1)

