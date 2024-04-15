; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126226 () Bool)

(assert start!126226)

(declare-fun b!1479764 () Bool)

(declare-fun res!1005749 () Bool)

(declare-fun e!829993 () Bool)

(assert (=> b!1479764 (=> (not res!1005749) (not e!829993))))

(declare-datatypes ((array!99310 0))(
  ( (array!99311 (arr!47935 (Array (_ BitVec 32) (_ BitVec 64))) (size!48487 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99310)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479764 (= res!1005749 (validKeyInArray!0 (select (arr!47935 a!2862) i!1006)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!646001 () array!99310)

(declare-fun b!1479765 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!646000 () (_ BitVec 64))

(declare-fun e!829999 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12200 0))(
  ( (MissingZero!12200 (index!51192 (_ BitVec 32))) (Found!12200 (index!51193 (_ BitVec 32))) (Intermediate!12200 (undefined!13012 Bool) (index!51194 (_ BitVec 32)) (x!132770 (_ BitVec 32))) (Undefined!12200) (MissingVacant!12200 (index!51195 (_ BitVec 32))) )
))
(declare-fun lt!646004 () SeekEntryResult!12200)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99310 (_ BitVec 32)) SeekEntryResult!12200)

(assert (=> b!1479765 (= e!829999 (= lt!646004 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646000 lt!646001 mask!2687)))))

(declare-fun b!1479766 () Bool)

(declare-fun e!829992 () Bool)

(declare-fun e!830001 () Bool)

(assert (=> b!1479766 (= e!829992 e!830001)))

(declare-fun res!1005745 () Bool)

(assert (=> b!1479766 (=> (not res!1005745) (not e!830001))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479766 (= res!1005745 (= lt!646004 (Intermediate!12200 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479766 (= lt!646004 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646000 mask!2687) lt!646000 lt!646001 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1479766 (= lt!646000 (select (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479767 () Bool)

(declare-fun res!1005748 () Bool)

(declare-fun e!830000 () Bool)

(assert (=> b!1479767 (=> res!1005748 e!830000)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!646003 () SeekEntryResult!12200)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99310 (_ BitVec 32)) SeekEntryResult!12200)

(assert (=> b!1479767 (= res!1005748 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47935 a!2862) j!93) a!2862 mask!2687) lt!646003)))))

(declare-fun b!1479768 () Bool)

(assert (=> b!1479768 (= e!830001 (not e!830000))))

(declare-fun res!1005735 () Bool)

(assert (=> b!1479768 (=> res!1005735 e!830000)))

(assert (=> b!1479768 (= res!1005735 (or (and (= (select (arr!47935 a!2862) index!646) (select (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47935 a!2862) index!646) (select (arr!47935 a!2862) j!93))) (not (= (select (arr!47935 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47935 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!829997 () Bool)

(assert (=> b!1479768 e!829997))

(declare-fun res!1005751 () Bool)

(assert (=> b!1479768 (=> (not res!1005751) (not e!829997))))

(declare-fun lt!645998 () SeekEntryResult!12200)

(assert (=> b!1479768 (= res!1005751 (and (= lt!645998 lt!646003) (or (= (select (arr!47935 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47935 a!2862) intermediateBeforeIndex!19) (select (arr!47935 a!2862) j!93)))))))

(assert (=> b!1479768 (= lt!646003 (Found!12200 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99310 (_ BitVec 32)) SeekEntryResult!12200)

(assert (=> b!1479768 (= lt!645998 (seekEntryOrOpen!0 (select (arr!47935 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99310 (_ BitVec 32)) Bool)

(assert (=> b!1479768 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49581 0))(
  ( (Unit!49582) )
))
(declare-fun lt!646002 () Unit!49581)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49581)

(assert (=> b!1479768 (= lt!646002 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479769 () Bool)

(assert (=> b!1479769 (= e!830000 true)))

(assert (=> b!1479769 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646000 lt!646001 mask!2687) lt!646003)))

(declare-fun lt!645999 () Unit!49581)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99310 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49581)

(assert (=> b!1479769 (= lt!645999 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479770 () Bool)

(declare-fun e!829995 () Bool)

(declare-fun e!829996 () Bool)

(assert (=> b!1479770 (= e!829995 e!829996)))

(declare-fun res!1005744 () Bool)

(assert (=> b!1479770 (=> (not res!1005744) (not e!829996))))

(assert (=> b!1479770 (= res!1005744 (= lt!645998 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47935 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479771 () Bool)

(declare-fun res!1005734 () Bool)

(assert (=> b!1479771 (=> (not res!1005734) (not e!829993))))

(assert (=> b!1479771 (= res!1005734 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479772 () Bool)

(assert (=> b!1479772 (= e!829999 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646000 lt!646001 mask!2687) (seekEntryOrOpen!0 lt!646000 lt!646001 mask!2687)))))

(declare-fun res!1005742 () Bool)

(assert (=> start!126226 (=> (not res!1005742) (not e!829993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126226 (= res!1005742 (validMask!0 mask!2687))))

(assert (=> start!126226 e!829993))

(assert (=> start!126226 true))

(declare-fun array_inv!37168 (array!99310) Bool)

(assert (=> start!126226 (array_inv!37168 a!2862)))

(declare-fun b!1479773 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479773 (= e!829996 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479774 () Bool)

(declare-fun res!1005736 () Bool)

(assert (=> b!1479774 (=> (not res!1005736) (not e!829992))))

(declare-fun lt!646005 () SeekEntryResult!12200)

(assert (=> b!1479774 (= res!1005736 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47935 a!2862) j!93) a!2862 mask!2687) lt!646005))))

(declare-fun b!1479775 () Bool)

(declare-fun res!1005743 () Bool)

(assert (=> b!1479775 (=> (not res!1005743) (not e!829993))))

(assert (=> b!1479775 (= res!1005743 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48487 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48487 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48487 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479776 () Bool)

(declare-fun res!1005740 () Bool)

(assert (=> b!1479776 (=> (not res!1005740) (not e!830001))))

(assert (=> b!1479776 (= res!1005740 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479777 () Bool)

(declare-fun e!829998 () Bool)

(assert (=> b!1479777 (= e!829993 e!829998)))

(declare-fun res!1005738 () Bool)

(assert (=> b!1479777 (=> (not res!1005738) (not e!829998))))

(assert (=> b!1479777 (= res!1005738 (= (select (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479777 (= lt!646001 (array!99311 (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48487 a!2862)))))

(declare-fun b!1479778 () Bool)

(declare-fun res!1005747 () Bool)

(assert (=> b!1479778 (=> (not res!1005747) (not e!829993))))

(assert (=> b!1479778 (= res!1005747 (and (= (size!48487 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48487 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48487 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479779 () Bool)

(assert (=> b!1479779 (= e!829998 e!829992)))

(declare-fun res!1005741 () Bool)

(assert (=> b!1479779 (=> (not res!1005741) (not e!829992))))

(assert (=> b!1479779 (= res!1005741 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47935 a!2862) j!93) mask!2687) (select (arr!47935 a!2862) j!93) a!2862 mask!2687) lt!646005))))

(assert (=> b!1479779 (= lt!646005 (Intermediate!12200 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479780 () Bool)

(assert (=> b!1479780 (= e!829997 e!829995)))

(declare-fun res!1005737 () Bool)

(assert (=> b!1479780 (=> res!1005737 e!829995)))

(assert (=> b!1479780 (= res!1005737 (or (and (= (select (arr!47935 a!2862) index!646) (select (store (arr!47935 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47935 a!2862) index!646) (select (arr!47935 a!2862) j!93))) (not (= (select (arr!47935 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479781 () Bool)

(declare-fun res!1005750 () Bool)

(assert (=> b!1479781 (=> (not res!1005750) (not e!829993))))

(declare-datatypes ((List!34514 0))(
  ( (Nil!34511) (Cons!34510 (h!35878 (_ BitVec 64)) (t!49200 List!34514)) )
))
(declare-fun arrayNoDuplicates!0 (array!99310 (_ BitVec 32) List!34514) Bool)

(assert (=> b!1479781 (= res!1005750 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34511))))

(declare-fun b!1479782 () Bool)

(declare-fun res!1005739 () Bool)

(assert (=> b!1479782 (=> (not res!1005739) (not e!829993))))

(assert (=> b!1479782 (= res!1005739 (validKeyInArray!0 (select (arr!47935 a!2862) j!93)))))

(declare-fun b!1479783 () Bool)

(declare-fun res!1005746 () Bool)

(assert (=> b!1479783 (=> (not res!1005746) (not e!830001))))

(assert (=> b!1479783 (= res!1005746 e!829999)))

(declare-fun c!136537 () Bool)

(assert (=> b!1479783 (= c!136537 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126226 res!1005742) b!1479778))

(assert (= (and b!1479778 res!1005747) b!1479764))

(assert (= (and b!1479764 res!1005749) b!1479782))

(assert (= (and b!1479782 res!1005739) b!1479771))

(assert (= (and b!1479771 res!1005734) b!1479781))

(assert (= (and b!1479781 res!1005750) b!1479775))

(assert (= (and b!1479775 res!1005743) b!1479777))

(assert (= (and b!1479777 res!1005738) b!1479779))

(assert (= (and b!1479779 res!1005741) b!1479774))

(assert (= (and b!1479774 res!1005736) b!1479766))

(assert (= (and b!1479766 res!1005745) b!1479783))

(assert (= (and b!1479783 c!136537) b!1479765))

(assert (= (and b!1479783 (not c!136537)) b!1479772))

(assert (= (and b!1479783 res!1005746) b!1479776))

(assert (= (and b!1479776 res!1005740) b!1479768))

(assert (= (and b!1479768 res!1005751) b!1479780))

(assert (= (and b!1479780 (not res!1005737)) b!1479770))

(assert (= (and b!1479770 res!1005744) b!1479773))

(assert (= (and b!1479768 (not res!1005735)) b!1479767))

(assert (= (and b!1479767 (not res!1005748)) b!1479769))

(declare-fun m!1365117 () Bool)

(assert (=> b!1479771 m!1365117))

(declare-fun m!1365119 () Bool)

(assert (=> b!1479782 m!1365119))

(assert (=> b!1479782 m!1365119))

(declare-fun m!1365121 () Bool)

(assert (=> b!1479782 m!1365121))

(declare-fun m!1365123 () Bool)

(assert (=> b!1479769 m!1365123))

(declare-fun m!1365125 () Bool)

(assert (=> b!1479769 m!1365125))

(declare-fun m!1365127 () Bool)

(assert (=> b!1479781 m!1365127))

(assert (=> b!1479767 m!1365119))

(assert (=> b!1479767 m!1365119))

(declare-fun m!1365129 () Bool)

(assert (=> b!1479767 m!1365129))

(declare-fun m!1365131 () Bool)

(assert (=> b!1479765 m!1365131))

(assert (=> b!1479779 m!1365119))

(assert (=> b!1479779 m!1365119))

(declare-fun m!1365133 () Bool)

(assert (=> b!1479779 m!1365133))

(assert (=> b!1479779 m!1365133))

(assert (=> b!1479779 m!1365119))

(declare-fun m!1365135 () Bool)

(assert (=> b!1479779 m!1365135))

(assert (=> b!1479772 m!1365123))

(declare-fun m!1365137 () Bool)

(assert (=> b!1479772 m!1365137))

(declare-fun m!1365139 () Bool)

(assert (=> b!1479777 m!1365139))

(declare-fun m!1365141 () Bool)

(assert (=> b!1479777 m!1365141))

(declare-fun m!1365143 () Bool)

(assert (=> b!1479764 m!1365143))

(assert (=> b!1479764 m!1365143))

(declare-fun m!1365145 () Bool)

(assert (=> b!1479764 m!1365145))

(assert (=> b!1479770 m!1365119))

(assert (=> b!1479770 m!1365119))

(declare-fun m!1365147 () Bool)

(assert (=> b!1479770 m!1365147))

(assert (=> b!1479774 m!1365119))

(assert (=> b!1479774 m!1365119))

(declare-fun m!1365149 () Bool)

(assert (=> b!1479774 m!1365149))

(declare-fun m!1365151 () Bool)

(assert (=> b!1479766 m!1365151))

(assert (=> b!1479766 m!1365151))

(declare-fun m!1365153 () Bool)

(assert (=> b!1479766 m!1365153))

(assert (=> b!1479766 m!1365139))

(declare-fun m!1365155 () Bool)

(assert (=> b!1479766 m!1365155))

(declare-fun m!1365157 () Bool)

(assert (=> b!1479768 m!1365157))

(assert (=> b!1479768 m!1365139))

(declare-fun m!1365159 () Bool)

(assert (=> b!1479768 m!1365159))

(declare-fun m!1365161 () Bool)

(assert (=> b!1479768 m!1365161))

(declare-fun m!1365163 () Bool)

(assert (=> b!1479768 m!1365163))

(assert (=> b!1479768 m!1365119))

(declare-fun m!1365165 () Bool)

(assert (=> b!1479768 m!1365165))

(declare-fun m!1365167 () Bool)

(assert (=> b!1479768 m!1365167))

(assert (=> b!1479768 m!1365119))

(assert (=> b!1479780 m!1365163))

(assert (=> b!1479780 m!1365139))

(assert (=> b!1479780 m!1365161))

(assert (=> b!1479780 m!1365119))

(declare-fun m!1365169 () Bool)

(assert (=> start!126226 m!1365169))

(declare-fun m!1365171 () Bool)

(assert (=> start!126226 m!1365171))

(check-sat (not b!1479769) (not b!1479767) (not b!1479766) (not b!1479771) (not b!1479768) (not b!1479765) (not b!1479782) (not b!1479772) (not b!1479770) (not b!1479764) (not b!1479774) (not start!126226) (not b!1479781) (not b!1479779))
(check-sat)
