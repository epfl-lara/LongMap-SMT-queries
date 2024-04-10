; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125892 () Bool)

(assert start!125892)

(declare-fun b!1473781 () Bool)

(declare-fun res!1001066 () Bool)

(declare-fun e!826994 () Bool)

(assert (=> b!1473781 (=> (not res!1001066) (not e!826994))))

(declare-fun e!826990 () Bool)

(assert (=> b!1473781 (= res!1001066 e!826990)))

(declare-fun c!135876 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1473781 (= c!135876 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1473782 () Bool)

(declare-fun res!1001069 () Bool)

(declare-fun e!826991 () Bool)

(assert (=> b!1473782 (=> (not res!1001069) (not e!826991))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99169 0))(
  ( (array!99170 (arr!47868 (Array (_ BitVec 32) (_ BitVec 64))) (size!48418 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99169)

(assert (=> b!1473782 (= res!1001069 (and (= (size!48418 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48418 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48418 a!2862)) (not (= i!1006 j!93))))))

(declare-fun e!826988 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun b!1473783 () Bool)

(assert (=> b!1473783 (= e!826988 (or (= (select (arr!47868 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47868 a!2862) intermediateBeforeIndex!19) (select (arr!47868 a!2862) j!93))))))

(declare-fun b!1473784 () Bool)

(declare-fun e!826989 () Bool)

(assert (=> b!1473784 (= e!826989 true)))

(declare-fun lt!644042 () array!99169)

(declare-datatypes ((SeekEntryResult!12108 0))(
  ( (MissingZero!12108 (index!50824 (_ BitVec 32))) (Found!12108 (index!50825 (_ BitVec 32))) (Intermediate!12108 (undefined!12920 Bool) (index!50826 (_ BitVec 32)) (x!132408 (_ BitVec 32))) (Undefined!12108) (MissingVacant!12108 (index!50827 (_ BitVec 32))) )
))
(declare-fun lt!644041 () SeekEntryResult!12108)

(declare-fun lt!644046 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99169 (_ BitVec 32)) SeekEntryResult!12108)

(assert (=> b!1473784 (= lt!644041 (seekEntryOrOpen!0 lt!644046 lt!644042 mask!2687))))

(declare-fun b!1473785 () Bool)

(declare-fun e!826992 () Bool)

(assert (=> b!1473785 (= e!826991 e!826992)))

(declare-fun res!1001064 () Bool)

(assert (=> b!1473785 (=> (not res!1001064) (not e!826992))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1473785 (= res!1001064 (= (select (store (arr!47868 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1473785 (= lt!644042 (array!99170 (store (arr!47868 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48418 a!2862)))))

(declare-fun b!1473786 () Bool)

(declare-fun res!1001059 () Bool)

(assert (=> b!1473786 (=> (not res!1001059) (not e!826988))))

(assert (=> b!1473786 (= res!1001059 (= (seekEntryOrOpen!0 (select (arr!47868 a!2862) j!93) a!2862 mask!2687) (Found!12108 j!93)))))

(declare-fun b!1473787 () Bool)

(declare-fun e!826987 () Bool)

(assert (=> b!1473787 (= e!826992 e!826987)))

(declare-fun res!1001072 () Bool)

(assert (=> b!1473787 (=> (not res!1001072) (not e!826987))))

(declare-fun lt!644044 () SeekEntryResult!12108)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99169 (_ BitVec 32)) SeekEntryResult!12108)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1473787 (= res!1001072 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47868 a!2862) j!93) mask!2687) (select (arr!47868 a!2862) j!93) a!2862 mask!2687) lt!644044))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1473787 (= lt!644044 (Intermediate!12108 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1473789 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99169 (_ BitVec 32)) SeekEntryResult!12108)

(assert (=> b!1473789 (= e!826990 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644046 lt!644042 mask!2687) (seekEntryOrOpen!0 lt!644046 lt!644042 mask!2687)))))

(declare-fun b!1473790 () Bool)

(declare-fun res!1001071 () Bool)

(assert (=> b!1473790 (=> (not res!1001071) (not e!826991))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1473790 (= res!1001071 (validKeyInArray!0 (select (arr!47868 a!2862) i!1006)))))

(declare-fun lt!644043 () SeekEntryResult!12108)

(declare-fun b!1473791 () Bool)

(assert (=> b!1473791 (= e!826990 (= lt!644043 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644046 lt!644042 mask!2687)))))

(declare-fun b!1473792 () Bool)

(assert (=> b!1473792 (= e!826994 (not e!826989))))

(declare-fun res!1001067 () Bool)

(assert (=> b!1473792 (=> res!1001067 e!826989)))

(assert (=> b!1473792 (= res!1001067 (or (not (= (select (arr!47868 a!2862) index!646) (select (store (arr!47868 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47868 a!2862) index!646) (select (arr!47868 a!2862) j!93)))))))

(assert (=> b!1473792 e!826988))

(declare-fun res!1001065 () Bool)

(assert (=> b!1473792 (=> (not res!1001065) (not e!826988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99169 (_ BitVec 32)) Bool)

(assert (=> b!1473792 (= res!1001065 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49556 0))(
  ( (Unit!49557) )
))
(declare-fun lt!644045 () Unit!49556)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99169 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49556)

(assert (=> b!1473792 (= lt!644045 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1473793 () Bool)

(declare-fun res!1001068 () Bool)

(assert (=> b!1473793 (=> (not res!1001068) (not e!826991))))

(assert (=> b!1473793 (= res!1001068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1473794 () Bool)

(declare-fun res!1001063 () Bool)

(assert (=> b!1473794 (=> (not res!1001063) (not e!826991))))

(assert (=> b!1473794 (= res!1001063 (validKeyInArray!0 (select (arr!47868 a!2862) j!93)))))

(declare-fun b!1473788 () Bool)

(declare-fun res!1001070 () Bool)

(assert (=> b!1473788 (=> (not res!1001070) (not e!826987))))

(assert (=> b!1473788 (= res!1001070 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47868 a!2862) j!93) a!2862 mask!2687) lt!644044))))

(declare-fun res!1001062 () Bool)

(assert (=> start!125892 (=> (not res!1001062) (not e!826991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125892 (= res!1001062 (validMask!0 mask!2687))))

(assert (=> start!125892 e!826991))

(assert (=> start!125892 true))

(declare-fun array_inv!36896 (array!99169) Bool)

(assert (=> start!125892 (array_inv!36896 a!2862)))

(declare-fun b!1473795 () Bool)

(declare-fun res!1001074 () Bool)

(assert (=> b!1473795 (=> (not res!1001074) (not e!826991))))

(assert (=> b!1473795 (= res!1001074 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48418 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48418 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48418 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1473796 () Bool)

(assert (=> b!1473796 (= e!826987 e!826994)))

(declare-fun res!1001060 () Bool)

(assert (=> b!1473796 (=> (not res!1001060) (not e!826994))))

(assert (=> b!1473796 (= res!1001060 (= lt!644043 (Intermediate!12108 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1473796 (= lt!644043 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644046 mask!2687) lt!644046 lt!644042 mask!2687))))

(assert (=> b!1473796 (= lt!644046 (select (store (arr!47868 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1473797 () Bool)

(declare-fun res!1001061 () Bool)

(assert (=> b!1473797 (=> (not res!1001061) (not e!826991))))

(declare-datatypes ((List!34369 0))(
  ( (Nil!34366) (Cons!34365 (h!35724 (_ BitVec 64)) (t!49063 List!34369)) )
))
(declare-fun arrayNoDuplicates!0 (array!99169 (_ BitVec 32) List!34369) Bool)

(assert (=> b!1473797 (= res!1001061 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34366))))

(declare-fun b!1473798 () Bool)

(declare-fun res!1001073 () Bool)

(assert (=> b!1473798 (=> (not res!1001073) (not e!826994))))

(assert (=> b!1473798 (= res!1001073 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125892 res!1001062) b!1473782))

(assert (= (and b!1473782 res!1001069) b!1473790))

(assert (= (and b!1473790 res!1001071) b!1473794))

(assert (= (and b!1473794 res!1001063) b!1473793))

(assert (= (and b!1473793 res!1001068) b!1473797))

(assert (= (and b!1473797 res!1001061) b!1473795))

(assert (= (and b!1473795 res!1001074) b!1473785))

(assert (= (and b!1473785 res!1001064) b!1473787))

(assert (= (and b!1473787 res!1001072) b!1473788))

(assert (= (and b!1473788 res!1001070) b!1473796))

(assert (= (and b!1473796 res!1001060) b!1473781))

(assert (= (and b!1473781 c!135876) b!1473791))

(assert (= (and b!1473781 (not c!135876)) b!1473789))

(assert (= (and b!1473781 res!1001066) b!1473798))

(assert (= (and b!1473798 res!1001073) b!1473792))

(assert (= (and b!1473792 res!1001065) b!1473786))

(assert (= (and b!1473786 res!1001059) b!1473783))

(assert (= (and b!1473792 (not res!1001067)) b!1473784))

(declare-fun m!1360281 () Bool)

(assert (=> b!1473788 m!1360281))

(assert (=> b!1473788 m!1360281))

(declare-fun m!1360283 () Bool)

(assert (=> b!1473788 m!1360283))

(declare-fun m!1360285 () Bool)

(assert (=> start!125892 m!1360285))

(declare-fun m!1360287 () Bool)

(assert (=> start!125892 m!1360287))

(declare-fun m!1360289 () Bool)

(assert (=> b!1473791 m!1360289))

(declare-fun m!1360291 () Bool)

(assert (=> b!1473793 m!1360291))

(declare-fun m!1360293 () Bool)

(assert (=> b!1473785 m!1360293))

(declare-fun m!1360295 () Bool)

(assert (=> b!1473785 m!1360295))

(assert (=> b!1473787 m!1360281))

(assert (=> b!1473787 m!1360281))

(declare-fun m!1360297 () Bool)

(assert (=> b!1473787 m!1360297))

(assert (=> b!1473787 m!1360297))

(assert (=> b!1473787 m!1360281))

(declare-fun m!1360299 () Bool)

(assert (=> b!1473787 m!1360299))

(declare-fun m!1360301 () Bool)

(assert (=> b!1473796 m!1360301))

(assert (=> b!1473796 m!1360301))

(declare-fun m!1360303 () Bool)

(assert (=> b!1473796 m!1360303))

(assert (=> b!1473796 m!1360293))

(declare-fun m!1360305 () Bool)

(assert (=> b!1473796 m!1360305))

(declare-fun m!1360307 () Bool)

(assert (=> b!1473789 m!1360307))

(declare-fun m!1360309 () Bool)

(assert (=> b!1473789 m!1360309))

(declare-fun m!1360311 () Bool)

(assert (=> b!1473792 m!1360311))

(assert (=> b!1473792 m!1360293))

(declare-fun m!1360313 () Bool)

(assert (=> b!1473792 m!1360313))

(declare-fun m!1360315 () Bool)

(assert (=> b!1473792 m!1360315))

(declare-fun m!1360317 () Bool)

(assert (=> b!1473792 m!1360317))

(assert (=> b!1473792 m!1360281))

(assert (=> b!1473794 m!1360281))

(assert (=> b!1473794 m!1360281))

(declare-fun m!1360319 () Bool)

(assert (=> b!1473794 m!1360319))

(declare-fun m!1360321 () Bool)

(assert (=> b!1473783 m!1360321))

(assert (=> b!1473783 m!1360281))

(declare-fun m!1360323 () Bool)

(assert (=> b!1473790 m!1360323))

(assert (=> b!1473790 m!1360323))

(declare-fun m!1360325 () Bool)

(assert (=> b!1473790 m!1360325))

(declare-fun m!1360327 () Bool)

(assert (=> b!1473797 m!1360327))

(assert (=> b!1473786 m!1360281))

(assert (=> b!1473786 m!1360281))

(declare-fun m!1360329 () Bool)

(assert (=> b!1473786 m!1360329))

(assert (=> b!1473784 m!1360309))

(check-sat (not b!1473796) (not b!1473786) (not b!1473788) (not b!1473794) (not b!1473793) (not b!1473789) (not b!1473787) (not b!1473791) (not b!1473784) (not start!125892) (not b!1473792) (not b!1473797) (not b!1473790))
(check-sat)
