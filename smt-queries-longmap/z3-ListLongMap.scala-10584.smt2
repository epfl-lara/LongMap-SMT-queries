; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124644 () Bool)

(assert start!124644)

(declare-fun b!1443847 () Bool)

(declare-fun e!813577 () Bool)

(declare-fun e!813582 () Bool)

(assert (=> b!1443847 (= e!813577 e!813582)))

(declare-fun res!975912 () Bool)

(assert (=> b!1443847 (=> (not res!975912) (not e!813582))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98092 0))(
  ( (array!98093 (arr!47334 (Array (_ BitVec 32) (_ BitVec 64))) (size!47884 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98092)

(assert (=> b!1443847 (= res!975912 (= (select (store (arr!47334 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634002 () array!98092)

(assert (=> b!1443847 (= lt!634002 (array!98093 (store (arr!47334 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47884 a!2862)))))

(declare-fun b!1443848 () Bool)

(declare-fun e!813583 () Bool)

(assert (=> b!1443848 (= e!813583 true)))

(declare-fun lt!633998 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!11586 0))(
  ( (MissingZero!11586 (index!48736 (_ BitVec 32))) (Found!11586 (index!48737 (_ BitVec 32))) (Intermediate!11586 (undefined!12398 Bool) (index!48738 (_ BitVec 32)) (x!130435 (_ BitVec 32))) (Undefined!11586) (MissingVacant!11586 (index!48739 (_ BitVec 32))) )
))
(declare-fun lt!633999 () SeekEntryResult!11586)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98092 (_ BitVec 32)) SeekEntryResult!11586)

(assert (=> b!1443848 (= lt!633999 (seekEntryOrOpen!0 lt!633998 lt!634002 mask!2687))))

(declare-fun b!1443849 () Bool)

(declare-fun e!813584 () Bool)

(declare-fun e!813578 () Bool)

(assert (=> b!1443849 (= e!813584 e!813578)))

(declare-fun res!975906 () Bool)

(assert (=> b!1443849 (=> (not res!975906) (not e!813578))))

(declare-fun lt!633997 () SeekEntryResult!11586)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1443849 (= res!975906 (= lt!633997 (Intermediate!11586 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98092 (_ BitVec 32)) SeekEntryResult!11586)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1443849 (= lt!633997 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!633998 mask!2687) lt!633998 lt!634002 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1443849 (= lt!633998 (select (store (arr!47334 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1443850 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!813581 () Bool)

(assert (=> b!1443850 (= e!813581 (= lt!633997 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!633998 lt!634002 mask!2687)))))

(declare-fun b!1443852 () Bool)

(declare-fun res!975909 () Bool)

(assert (=> b!1443852 (=> (not res!975909) (not e!813577))))

(assert (=> b!1443852 (= res!975909 (and (= (size!47884 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47884 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47884 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1443853 () Bool)

(assert (=> b!1443853 (= e!813582 e!813584)))

(declare-fun res!975919 () Bool)

(assert (=> b!1443853 (=> (not res!975919) (not e!813584))))

(declare-fun lt!634000 () SeekEntryResult!11586)

(assert (=> b!1443853 (= res!975919 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47334 a!2862) j!93) mask!2687) (select (arr!47334 a!2862) j!93) a!2862 mask!2687) lt!634000))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1443853 (= lt!634000 (Intermediate!11586 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1443854 () Bool)

(declare-fun res!975917 () Bool)

(assert (=> b!1443854 (=> (not res!975917) (not e!813577))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1443854 (= res!975917 (validKeyInArray!0 (select (arr!47334 a!2862) i!1006)))))

(declare-fun b!1443855 () Bool)

(declare-fun res!975907 () Bool)

(declare-fun e!813579 () Bool)

(assert (=> b!1443855 (=> (not res!975907) (not e!813579))))

(assert (=> b!1443855 (= res!975907 (= (seekEntryOrOpen!0 (select (arr!47334 a!2862) j!93) a!2862 mask!2687) (Found!11586 j!93)))))

(declare-fun b!1443856 () Bool)

(declare-fun res!975918 () Bool)

(assert (=> b!1443856 (=> (not res!975918) (not e!813578))))

(assert (=> b!1443856 (= res!975918 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1443857 () Bool)

(declare-fun res!975911 () Bool)

(assert (=> b!1443857 (=> (not res!975911) (not e!813578))))

(assert (=> b!1443857 (= res!975911 e!813581)))

(declare-fun c!133482 () Bool)

(assert (=> b!1443857 (= c!133482 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1443858 () Bool)

(assert (=> b!1443858 (= e!813579 (or (= (select (arr!47334 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47334 a!2862) intermediateBeforeIndex!19) (select (arr!47334 a!2862) j!93))))))

(declare-fun b!1443859 () Bool)

(declare-fun res!975913 () Bool)

(assert (=> b!1443859 (=> (not res!975913) (not e!813577))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98092 (_ BitVec 32)) Bool)

(assert (=> b!1443859 (= res!975913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1443860 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98092 (_ BitVec 32)) SeekEntryResult!11586)

(assert (=> b!1443860 (= e!813581 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!633998 lt!634002 mask!2687) (seekEntryOrOpen!0 lt!633998 lt!634002 mask!2687)))))

(declare-fun res!975904 () Bool)

(assert (=> start!124644 (=> (not res!975904) (not e!813577))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124644 (= res!975904 (validMask!0 mask!2687))))

(assert (=> start!124644 e!813577))

(assert (=> start!124644 true))

(declare-fun array_inv!36362 (array!98092) Bool)

(assert (=> start!124644 (array_inv!36362 a!2862)))

(declare-fun b!1443851 () Bool)

(declare-fun res!975910 () Bool)

(assert (=> b!1443851 (=> (not res!975910) (not e!813577))))

(assert (=> b!1443851 (= res!975910 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47884 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47884 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47884 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1443861 () Bool)

(declare-fun res!975916 () Bool)

(assert (=> b!1443861 (=> (not res!975916) (not e!813577))))

(declare-datatypes ((List!33835 0))(
  ( (Nil!33832) (Cons!33831 (h!35181 (_ BitVec 64)) (t!48529 List!33835)) )
))
(declare-fun arrayNoDuplicates!0 (array!98092 (_ BitVec 32) List!33835) Bool)

(assert (=> b!1443861 (= res!975916 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33832))))

(declare-fun b!1443862 () Bool)

(declare-fun res!975914 () Bool)

(assert (=> b!1443862 (=> (not res!975914) (not e!813577))))

(assert (=> b!1443862 (= res!975914 (validKeyInArray!0 (select (arr!47334 a!2862) j!93)))))

(declare-fun b!1443863 () Bool)

(declare-fun res!975908 () Bool)

(assert (=> b!1443863 (=> (not res!975908) (not e!813584))))

(assert (=> b!1443863 (= res!975908 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47334 a!2862) j!93) a!2862 mask!2687) lt!634000))))

(declare-fun b!1443864 () Bool)

(assert (=> b!1443864 (= e!813578 (not e!813583))))

(declare-fun res!975915 () Bool)

(assert (=> b!1443864 (=> res!975915 e!813583)))

(assert (=> b!1443864 (= res!975915 (or (not (= (select (arr!47334 a!2862) index!646) (select (store (arr!47334 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47334 a!2862) index!646) (select (arr!47334 a!2862) j!93)))))))

(assert (=> b!1443864 e!813579))

(declare-fun res!975905 () Bool)

(assert (=> b!1443864 (=> (not res!975905) (not e!813579))))

(assert (=> b!1443864 (= res!975905 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48668 0))(
  ( (Unit!48669) )
))
(declare-fun lt!634001 () Unit!48668)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98092 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48668)

(assert (=> b!1443864 (= lt!634001 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!124644 res!975904) b!1443852))

(assert (= (and b!1443852 res!975909) b!1443854))

(assert (= (and b!1443854 res!975917) b!1443862))

(assert (= (and b!1443862 res!975914) b!1443859))

(assert (= (and b!1443859 res!975913) b!1443861))

(assert (= (and b!1443861 res!975916) b!1443851))

(assert (= (and b!1443851 res!975910) b!1443847))

(assert (= (and b!1443847 res!975912) b!1443853))

(assert (= (and b!1443853 res!975919) b!1443863))

(assert (= (and b!1443863 res!975908) b!1443849))

(assert (= (and b!1443849 res!975906) b!1443857))

(assert (= (and b!1443857 c!133482) b!1443850))

(assert (= (and b!1443857 (not c!133482)) b!1443860))

(assert (= (and b!1443857 res!975911) b!1443856))

(assert (= (and b!1443856 res!975918) b!1443864))

(assert (= (and b!1443864 res!975905) b!1443855))

(assert (= (and b!1443855 res!975907) b!1443858))

(assert (= (and b!1443864 (not res!975915)) b!1443848))

(declare-fun m!1332903 () Bool)

(assert (=> b!1443855 m!1332903))

(assert (=> b!1443855 m!1332903))

(declare-fun m!1332905 () Bool)

(assert (=> b!1443855 m!1332905))

(declare-fun m!1332907 () Bool)

(assert (=> b!1443859 m!1332907))

(assert (=> b!1443853 m!1332903))

(assert (=> b!1443853 m!1332903))

(declare-fun m!1332909 () Bool)

(assert (=> b!1443853 m!1332909))

(assert (=> b!1443853 m!1332909))

(assert (=> b!1443853 m!1332903))

(declare-fun m!1332911 () Bool)

(assert (=> b!1443853 m!1332911))

(assert (=> b!1443863 m!1332903))

(assert (=> b!1443863 m!1332903))

(declare-fun m!1332913 () Bool)

(assert (=> b!1443863 m!1332913))

(declare-fun m!1332915 () Bool)

(assert (=> start!124644 m!1332915))

(declare-fun m!1332917 () Bool)

(assert (=> start!124644 m!1332917))

(declare-fun m!1332919 () Bool)

(assert (=> b!1443849 m!1332919))

(assert (=> b!1443849 m!1332919))

(declare-fun m!1332921 () Bool)

(assert (=> b!1443849 m!1332921))

(declare-fun m!1332923 () Bool)

(assert (=> b!1443849 m!1332923))

(declare-fun m!1332925 () Bool)

(assert (=> b!1443849 m!1332925))

(declare-fun m!1332927 () Bool)

(assert (=> b!1443860 m!1332927))

(declare-fun m!1332929 () Bool)

(assert (=> b!1443860 m!1332929))

(declare-fun m!1332931 () Bool)

(assert (=> b!1443861 m!1332931))

(declare-fun m!1332933 () Bool)

(assert (=> b!1443850 m!1332933))

(declare-fun m!1332935 () Bool)

(assert (=> b!1443864 m!1332935))

(assert (=> b!1443864 m!1332923))

(declare-fun m!1332937 () Bool)

(assert (=> b!1443864 m!1332937))

(declare-fun m!1332939 () Bool)

(assert (=> b!1443864 m!1332939))

(declare-fun m!1332941 () Bool)

(assert (=> b!1443864 m!1332941))

(assert (=> b!1443864 m!1332903))

(declare-fun m!1332943 () Bool)

(assert (=> b!1443854 m!1332943))

(assert (=> b!1443854 m!1332943))

(declare-fun m!1332945 () Bool)

(assert (=> b!1443854 m!1332945))

(declare-fun m!1332947 () Bool)

(assert (=> b!1443858 m!1332947))

(assert (=> b!1443858 m!1332903))

(assert (=> b!1443862 m!1332903))

(assert (=> b!1443862 m!1332903))

(declare-fun m!1332949 () Bool)

(assert (=> b!1443862 m!1332949))

(assert (=> b!1443847 m!1332923))

(declare-fun m!1332951 () Bool)

(assert (=> b!1443847 m!1332951))

(assert (=> b!1443848 m!1332929))

(check-sat (not b!1443861) (not b!1443859) (not b!1443863) (not b!1443862) (not b!1443860) (not b!1443848) (not b!1443854) (not b!1443850) (not start!124644) (not b!1443849) (not b!1443855) (not b!1443853) (not b!1443864))
(check-sat)
