; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126830 () Bool)

(assert start!126830)

(declare-fun b!1490203 () Bool)

(declare-fun res!1013704 () Bool)

(declare-fun e!835019 () Bool)

(assert (=> b!1490203 (=> (not res!1013704) (not e!835019))))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99601 0))(
  ( (array!99602 (arr!48073 (Array (_ BitVec 32) (_ BitVec 64))) (size!48625 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99601)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12338 0))(
  ( (MissingZero!12338 (index!51744 (_ BitVec 32))) (Found!12338 (index!51745 (_ BitVec 32))) (Intermediate!12338 (undefined!13150 Bool) (index!51746 (_ BitVec 32)) (x!133331 (_ BitVec 32))) (Undefined!12338) (MissingVacant!12338 (index!51747 (_ BitVec 32))) )
))
(declare-fun lt!649687 () SeekEntryResult!12338)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99601 (_ BitVec 32)) SeekEntryResult!12338)

(assert (=> b!1490203 (= res!1013704 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48073 a!2862) j!93) a!2862 mask!2687) lt!649687))))

(declare-fun res!1013707 () Bool)

(declare-fun e!835013 () Bool)

(assert (=> start!126830 (=> (not res!1013707) (not e!835013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126830 (= res!1013707 (validMask!0 mask!2687))))

(assert (=> start!126830 e!835013))

(assert (=> start!126830 true))

(declare-fun array_inv!37306 (array!99601) Bool)

(assert (=> start!126830 (array_inv!37306 a!2862)))

(declare-fun e!835015 () Bool)

(declare-fun lt!649688 () (_ BitVec 64))

(declare-fun lt!649683 () SeekEntryResult!12338)

(declare-fun lt!649685 () array!99601)

(declare-fun b!1490204 () Bool)

(assert (=> b!1490204 (= e!835015 (= lt!649683 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!649688 lt!649685 mask!2687)))))

(declare-fun b!1490205 () Bool)

(declare-fun res!1013697 () Bool)

(assert (=> b!1490205 (=> (not res!1013697) (not e!835013))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1490205 (= res!1013697 (and (= (size!48625 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48625 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48625 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1490206 () Bool)

(declare-fun res!1013696 () Bool)

(declare-fun e!835014 () Bool)

(assert (=> b!1490206 (=> (not res!1013696) (not e!835014))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99601 (_ BitVec 32)) SeekEntryResult!12338)

(assert (=> b!1490206 (= res!1013696 (= (seekEntryOrOpen!0 (select (arr!48073 a!2862) j!93) a!2862 mask!2687) (Found!12338 j!93)))))

(declare-fun b!1490207 () Bool)

(declare-fun res!1013699 () Bool)

(assert (=> b!1490207 (=> (not res!1013699) (not e!835013))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99601 (_ BitVec 32)) Bool)

(assert (=> b!1490207 (= res!1013699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1490208 () Bool)

(declare-fun e!835016 () Bool)

(assert (=> b!1490208 (= e!835013 e!835016)))

(declare-fun res!1013706 () Bool)

(assert (=> b!1490208 (=> (not res!1013706) (not e!835016))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1490208 (= res!1013706 (= (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1490208 (= lt!649685 (array!99602 (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48625 a!2862)))))

(declare-fun b!1490209 () Bool)

(declare-fun res!1013705 () Bool)

(assert (=> b!1490209 (=> (not res!1013705) (not e!835013))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1490209 (= res!1013705 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48625 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48625 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48625 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1490210 () Bool)

(declare-fun e!835012 () Bool)

(declare-fun e!835018 () Bool)

(assert (=> b!1490210 (= e!835012 (not e!835018))))

(declare-fun res!1013698 () Bool)

(assert (=> b!1490210 (=> res!1013698 e!835018)))

(assert (=> b!1490210 (= res!1013698 (or (and (= (select (arr!48073 a!2862) index!646) (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48073 a!2862) index!646) (select (arr!48073 a!2862) j!93))) (= (select (arr!48073 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1490210 e!835014))

(declare-fun res!1013692 () Bool)

(assert (=> b!1490210 (=> (not res!1013692) (not e!835014))))

(assert (=> b!1490210 (= res!1013692 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49857 0))(
  ( (Unit!49858) )
))
(declare-fun lt!649684 () Unit!49857)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99601 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49857)

(assert (=> b!1490210 (= lt!649684 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1490211 () Bool)

(assert (=> b!1490211 (= e!835014 (or (= (select (arr!48073 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48073 a!2862) intermediateBeforeIndex!19) (select (arr!48073 a!2862) j!93))))))

(declare-fun b!1490212 () Bool)

(declare-fun res!1013701 () Bool)

(assert (=> b!1490212 (=> (not res!1013701) (not e!835013))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1490212 (= res!1013701 (validKeyInArray!0 (select (arr!48073 a!2862) i!1006)))))

(declare-fun b!1490213 () Bool)

(assert (=> b!1490213 (= e!835018 true)))

(declare-fun lt!649686 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490213 (= lt!649686 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1490214 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99601 (_ BitVec 32)) SeekEntryResult!12338)

(assert (=> b!1490214 (= e!835015 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!649688 lt!649685 mask!2687) (seekEntryOrOpen!0 lt!649688 lt!649685 mask!2687)))))

(declare-fun b!1490215 () Bool)

(declare-fun res!1013703 () Bool)

(assert (=> b!1490215 (=> (not res!1013703) (not e!835013))))

(assert (=> b!1490215 (= res!1013703 (validKeyInArray!0 (select (arr!48073 a!2862) j!93)))))

(declare-fun b!1490216 () Bool)

(declare-fun res!1013693 () Bool)

(assert (=> b!1490216 (=> (not res!1013693) (not e!835013))))

(declare-datatypes ((List!34652 0))(
  ( (Nil!34649) (Cons!34648 (h!36031 (_ BitVec 64)) (t!49338 List!34652)) )
))
(declare-fun arrayNoDuplicates!0 (array!99601 (_ BitVec 32) List!34652) Bool)

(assert (=> b!1490216 (= res!1013693 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34649))))

(declare-fun b!1490217 () Bool)

(assert (=> b!1490217 (= e!835019 e!835012)))

(declare-fun res!1013700 () Bool)

(assert (=> b!1490217 (=> (not res!1013700) (not e!835012))))

(assert (=> b!1490217 (= res!1013700 (= lt!649683 (Intermediate!12338 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1490217 (= lt!649683 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!649688 mask!2687) lt!649688 lt!649685 mask!2687))))

(assert (=> b!1490217 (= lt!649688 (select (store (arr!48073 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1490218 () Bool)

(declare-fun res!1013694 () Bool)

(assert (=> b!1490218 (=> (not res!1013694) (not e!835012))))

(assert (=> b!1490218 (= res!1013694 e!835015)))

(declare-fun c!137785 () Bool)

(assert (=> b!1490218 (= c!137785 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1490219 () Bool)

(assert (=> b!1490219 (= e!835016 e!835019)))

(declare-fun res!1013695 () Bool)

(assert (=> b!1490219 (=> (not res!1013695) (not e!835019))))

(assert (=> b!1490219 (= res!1013695 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48073 a!2862) j!93) mask!2687) (select (arr!48073 a!2862) j!93) a!2862 mask!2687) lt!649687))))

(assert (=> b!1490219 (= lt!649687 (Intermediate!12338 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1490220 () Bool)

(declare-fun res!1013702 () Bool)

(assert (=> b!1490220 (=> (not res!1013702) (not e!835012))))

(assert (=> b!1490220 (= res!1013702 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!126830 res!1013707) b!1490205))

(assert (= (and b!1490205 res!1013697) b!1490212))

(assert (= (and b!1490212 res!1013701) b!1490215))

(assert (= (and b!1490215 res!1013703) b!1490207))

(assert (= (and b!1490207 res!1013699) b!1490216))

(assert (= (and b!1490216 res!1013693) b!1490209))

(assert (= (and b!1490209 res!1013705) b!1490208))

(assert (= (and b!1490208 res!1013706) b!1490219))

(assert (= (and b!1490219 res!1013695) b!1490203))

(assert (= (and b!1490203 res!1013704) b!1490217))

(assert (= (and b!1490217 res!1013700) b!1490218))

(assert (= (and b!1490218 c!137785) b!1490204))

(assert (= (and b!1490218 (not c!137785)) b!1490214))

(assert (= (and b!1490218 res!1013694) b!1490220))

(assert (= (and b!1490220 res!1013702) b!1490210))

(assert (= (and b!1490210 res!1013692) b!1490206))

(assert (= (and b!1490206 res!1013696) b!1490211))

(assert (= (and b!1490210 (not res!1013698)) b!1490213))

(declare-fun m!1373823 () Bool)

(assert (=> b!1490214 m!1373823))

(declare-fun m!1373825 () Bool)

(assert (=> b!1490214 m!1373825))

(declare-fun m!1373827 () Bool)

(assert (=> b!1490212 m!1373827))

(assert (=> b!1490212 m!1373827))

(declare-fun m!1373829 () Bool)

(assert (=> b!1490212 m!1373829))

(declare-fun m!1373831 () Bool)

(assert (=> b!1490207 m!1373831))

(declare-fun m!1373833 () Bool)

(assert (=> b!1490211 m!1373833))

(declare-fun m!1373835 () Bool)

(assert (=> b!1490211 m!1373835))

(declare-fun m!1373837 () Bool)

(assert (=> b!1490216 m!1373837))

(declare-fun m!1373839 () Bool)

(assert (=> b!1490213 m!1373839))

(declare-fun m!1373841 () Bool)

(assert (=> b!1490208 m!1373841))

(declare-fun m!1373843 () Bool)

(assert (=> b!1490208 m!1373843))

(assert (=> b!1490206 m!1373835))

(assert (=> b!1490206 m!1373835))

(declare-fun m!1373845 () Bool)

(assert (=> b!1490206 m!1373845))

(assert (=> b!1490215 m!1373835))

(assert (=> b!1490215 m!1373835))

(declare-fun m!1373847 () Bool)

(assert (=> b!1490215 m!1373847))

(declare-fun m!1373849 () Bool)

(assert (=> start!126830 m!1373849))

(declare-fun m!1373851 () Bool)

(assert (=> start!126830 m!1373851))

(assert (=> b!1490219 m!1373835))

(assert (=> b!1490219 m!1373835))

(declare-fun m!1373853 () Bool)

(assert (=> b!1490219 m!1373853))

(assert (=> b!1490219 m!1373853))

(assert (=> b!1490219 m!1373835))

(declare-fun m!1373855 () Bool)

(assert (=> b!1490219 m!1373855))

(declare-fun m!1373857 () Bool)

(assert (=> b!1490217 m!1373857))

(assert (=> b!1490217 m!1373857))

(declare-fun m!1373859 () Bool)

(assert (=> b!1490217 m!1373859))

(assert (=> b!1490217 m!1373841))

(declare-fun m!1373861 () Bool)

(assert (=> b!1490217 m!1373861))

(declare-fun m!1373863 () Bool)

(assert (=> b!1490210 m!1373863))

(assert (=> b!1490210 m!1373841))

(declare-fun m!1373865 () Bool)

(assert (=> b!1490210 m!1373865))

(declare-fun m!1373867 () Bool)

(assert (=> b!1490210 m!1373867))

(declare-fun m!1373869 () Bool)

(assert (=> b!1490210 m!1373869))

(assert (=> b!1490210 m!1373835))

(assert (=> b!1490203 m!1373835))

(assert (=> b!1490203 m!1373835))

(declare-fun m!1373871 () Bool)

(assert (=> b!1490203 m!1373871))

(declare-fun m!1373873 () Bool)

(assert (=> b!1490204 m!1373873))

(check-sat (not b!1490207) (not start!126830) (not b!1490212) (not b!1490206) (not b!1490215) (not b!1490204) (not b!1490214) (not b!1490219) (not b!1490203) (not b!1490210) (not b!1490217) (not b!1490213) (not b!1490216))
(check-sat)
