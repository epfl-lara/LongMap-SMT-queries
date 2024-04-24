; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126774 () Bool)

(assert start!126774)

(declare-fun b!1485122 () Bool)

(declare-fun res!1008907 () Bool)

(declare-fun e!832857 () Bool)

(assert (=> b!1485122 (=> (not res!1008907) (not e!832857))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((array!99574 0))(
  ( (array!99575 (arr!48058 (Array (_ BitVec 32) (_ BitVec 64))) (size!48609 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99574)

(assert (=> b!1485122 (= res!1008907 (or (= (select (arr!48058 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48058 a!2862) intermediateBeforeIndex!19) (select (arr!48058 a!2862) j!93))))))

(declare-fun b!1485123 () Bool)

(declare-fun res!1008909 () Bool)

(declare-fun e!832855 () Bool)

(assert (=> b!1485123 (=> (not res!1008909) (not e!832855))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99574 (_ BitVec 32)) Bool)

(assert (=> b!1485123 (= res!1008909 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun res!1008916 () Bool)

(assert (=> start!126774 (=> (not res!1008916) (not e!832855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126774 (= res!1008916 (validMask!0 mask!2687))))

(assert (=> start!126774 e!832855))

(assert (=> start!126774 true))

(declare-fun array_inv!37339 (array!99574) Bool)

(assert (=> start!126774 (array_inv!37339 a!2862)))

(declare-fun b!1485124 () Bool)

(declare-fun res!1008900 () Bool)

(assert (=> b!1485124 (=> (not res!1008900) (not e!832857))))

(declare-datatypes ((SeekEntryResult!12195 0))(
  ( (MissingZero!12195 (index!51172 (_ BitVec 32))) (Found!12195 (index!51173 (_ BitVec 32))) (Intermediate!12195 (undefined!13007 Bool) (index!51174 (_ BitVec 32)) (x!132944 (_ BitVec 32))) (Undefined!12195) (MissingVacant!12195 (index!51175 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99574 (_ BitVec 32)) SeekEntryResult!12195)

(assert (=> b!1485124 (= res!1008900 (= (seekEntryOrOpen!0 (select (arr!48058 a!2862) j!93) a!2862 mask!2687) (Found!12195 j!93)))))

(declare-fun b!1485125 () Bool)

(declare-fun res!1008917 () Bool)

(assert (=> b!1485125 (=> (not res!1008917) (not e!832855))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1485125 (= res!1008917 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48609 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48609 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48609 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1485126 () Bool)

(declare-fun res!1008906 () Bool)

(declare-fun e!832853 () Bool)

(assert (=> b!1485126 (=> (not res!1008906) (not e!832853))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1485126 (= res!1008906 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1485127 () Bool)

(declare-fun res!1008908 () Bool)

(declare-fun e!832854 () Bool)

(assert (=> b!1485127 (=> (not res!1008908) (not e!832854))))

(declare-fun lt!648056 () SeekEntryResult!12195)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99574 (_ BitVec 32)) SeekEntryResult!12195)

(assert (=> b!1485127 (= res!1008908 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48058 a!2862) j!93) a!2862 mask!2687) lt!648056))))

(declare-fun b!1485128 () Bool)

(assert (=> b!1485128 (= e!832854 e!832853)))

(declare-fun res!1008902 () Bool)

(assert (=> b!1485128 (=> (not res!1008902) (not e!832853))))

(declare-fun lt!648057 () SeekEntryResult!12195)

(assert (=> b!1485128 (= res!1008902 (= lt!648057 (Intermediate!12195 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!648061 () (_ BitVec 64))

(declare-fun lt!648060 () array!99574)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485128 (= lt!648057 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648061 mask!2687) lt!648061 lt!648060 mask!2687))))

(assert (=> b!1485128 (= lt!648061 (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1485129 () Bool)

(declare-fun e!832860 () Bool)

(assert (=> b!1485129 (= e!832860 (= lt!648057 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648061 lt!648060 mask!2687)))))

(declare-fun b!1485130 () Bool)

(declare-fun res!1008915 () Bool)

(assert (=> b!1485130 (=> (not res!1008915) (not e!832855))))

(declare-datatypes ((List!34546 0))(
  ( (Nil!34543) (Cons!34542 (h!35930 (_ BitVec 64)) (t!49232 List!34546)) )
))
(declare-fun arrayNoDuplicates!0 (array!99574 (_ BitVec 32) List!34546) Bool)

(assert (=> b!1485130 (= res!1008915 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34543))))

(declare-fun b!1485131 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99574 (_ BitVec 32)) SeekEntryResult!12195)

(assert (=> b!1485131 (= e!832860 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648061 lt!648060 mask!2687) (seekEntryOrOpen!0 lt!648061 lt!648060 mask!2687)))))

(declare-fun b!1485132 () Bool)

(declare-fun e!832856 () Bool)

(assert (=> b!1485132 (= e!832853 (not e!832856))))

(declare-fun res!1008911 () Bool)

(assert (=> b!1485132 (=> res!1008911 e!832856)))

(assert (=> b!1485132 (= res!1008911 (or (and (= (select (arr!48058 a!2862) index!646) (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48058 a!2862) index!646) (select (arr!48058 a!2862) j!93))) (= (select (arr!48058 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485132 e!832857))

(declare-fun res!1008912 () Bool)

(assert (=> b!1485132 (=> (not res!1008912) (not e!832857))))

(assert (=> b!1485132 (= res!1008912 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49763 0))(
  ( (Unit!49764) )
))
(declare-fun lt!648058 () Unit!49763)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99574 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49763)

(assert (=> b!1485132 (= lt!648058 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1485133 () Bool)

(declare-fun e!832851 () Bool)

(assert (=> b!1485133 (= e!832855 e!832851)))

(declare-fun res!1008913 () Bool)

(assert (=> b!1485133 (=> (not res!1008913) (not e!832851))))

(assert (=> b!1485133 (= res!1008913 (= (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1485133 (= lt!648060 (array!99575 (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48609 a!2862)))))

(declare-fun b!1485134 () Bool)

(declare-fun e!832858 () Bool)

(declare-fun e!832859 () Bool)

(assert (=> b!1485134 (= e!832858 e!832859)))

(declare-fun res!1008914 () Bool)

(assert (=> b!1485134 (=> (not res!1008914) (not e!832859))))

(declare-fun lt!648059 () (_ BitVec 64))

(assert (=> b!1485134 (= res!1008914 (and (= index!646 intermediateAfterIndex!19) (= lt!648059 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1485135 () Bool)

(declare-fun res!1008905 () Bool)

(assert (=> b!1485135 (=> (not res!1008905) (not e!832855))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1485135 (= res!1008905 (validKeyInArray!0 (select (arr!48058 a!2862) j!93)))))

(declare-fun b!1485136 () Bool)

(assert (=> b!1485136 (= e!832857 e!832858)))

(declare-fun res!1008904 () Bool)

(assert (=> b!1485136 (=> res!1008904 e!832858)))

(assert (=> b!1485136 (= res!1008904 (or (and (= (select (arr!48058 a!2862) index!646) lt!648059) (= (select (arr!48058 a!2862) index!646) (select (arr!48058 a!2862) j!93))) (= (select (arr!48058 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1485136 (= lt!648059 (select (store (arr!48058 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1485137 () Bool)

(assert (=> b!1485137 (= e!832851 e!832854)))

(declare-fun res!1008910 () Bool)

(assert (=> b!1485137 (=> (not res!1008910) (not e!832854))))

(assert (=> b!1485137 (= res!1008910 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48058 a!2862) j!93) mask!2687) (select (arr!48058 a!2862) j!93) a!2862 mask!2687) lt!648056))))

(assert (=> b!1485137 (= lt!648056 (Intermediate!12195 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1485138 () Bool)

(declare-fun res!1008901 () Bool)

(assert (=> b!1485138 (=> (not res!1008901) (not e!832855))))

(assert (=> b!1485138 (= res!1008901 (and (= (size!48609 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48609 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48609 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1485139 () Bool)

(assert (=> b!1485139 (= e!832856 true)))

(declare-fun lt!648055 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1485139 (= lt!648055 (nextIndex!0 index!646 (bvadd #b00000000000000000000000000000001 x!665) mask!2687))))

(declare-fun b!1485140 () Bool)

(declare-fun res!1008899 () Bool)

(assert (=> b!1485140 (=> (not res!1008899) (not e!832855))))

(assert (=> b!1485140 (= res!1008899 (validKeyInArray!0 (select (arr!48058 a!2862) i!1006)))))

(declare-fun b!1485141 () Bool)

(assert (=> b!1485141 (= e!832859 (= (seekEntryOrOpen!0 lt!648061 lt!648060 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648061 lt!648060 mask!2687)))))

(declare-fun b!1485142 () Bool)

(declare-fun res!1008903 () Bool)

(assert (=> b!1485142 (=> (not res!1008903) (not e!832853))))

(assert (=> b!1485142 (= res!1008903 e!832860)))

(declare-fun c!137644 () Bool)

(assert (=> b!1485142 (= c!137644 (bvsle x!665 intermediateAfterX!19))))

(assert (= (and start!126774 res!1008916) b!1485138))

(assert (= (and b!1485138 res!1008901) b!1485140))

(assert (= (and b!1485140 res!1008899) b!1485135))

(assert (= (and b!1485135 res!1008905) b!1485123))

(assert (= (and b!1485123 res!1008909) b!1485130))

(assert (= (and b!1485130 res!1008915) b!1485125))

(assert (= (and b!1485125 res!1008917) b!1485133))

(assert (= (and b!1485133 res!1008913) b!1485137))

(assert (= (and b!1485137 res!1008910) b!1485127))

(assert (= (and b!1485127 res!1008908) b!1485128))

(assert (= (and b!1485128 res!1008902) b!1485142))

(assert (= (and b!1485142 c!137644) b!1485129))

(assert (= (and b!1485142 (not c!137644)) b!1485131))

(assert (= (and b!1485142 res!1008903) b!1485126))

(assert (= (and b!1485126 res!1008906) b!1485132))

(assert (= (and b!1485132 res!1008912) b!1485124))

(assert (= (and b!1485124 res!1008900) b!1485122))

(assert (= (and b!1485122 res!1008907) b!1485136))

(assert (= (and b!1485136 (not res!1008904)) b!1485134))

(assert (= (and b!1485134 res!1008914) b!1485141))

(assert (= (and b!1485132 (not res!1008911)) b!1485139))

(declare-fun m!1370587 () Bool)

(assert (=> b!1485139 m!1370587))

(declare-fun m!1370589 () Bool)

(assert (=> b!1485129 m!1370589))

(declare-fun m!1370591 () Bool)

(assert (=> b!1485137 m!1370591))

(assert (=> b!1485137 m!1370591))

(declare-fun m!1370593 () Bool)

(assert (=> b!1485137 m!1370593))

(assert (=> b!1485137 m!1370593))

(assert (=> b!1485137 m!1370591))

(declare-fun m!1370595 () Bool)

(assert (=> b!1485137 m!1370595))

(declare-fun m!1370597 () Bool)

(assert (=> b!1485141 m!1370597))

(declare-fun m!1370599 () Bool)

(assert (=> b!1485141 m!1370599))

(declare-fun m!1370601 () Bool)

(assert (=> b!1485130 m!1370601))

(declare-fun m!1370603 () Bool)

(assert (=> b!1485132 m!1370603))

(declare-fun m!1370605 () Bool)

(assert (=> b!1485132 m!1370605))

(declare-fun m!1370607 () Bool)

(assert (=> b!1485132 m!1370607))

(declare-fun m!1370609 () Bool)

(assert (=> b!1485132 m!1370609))

(declare-fun m!1370611 () Bool)

(assert (=> b!1485132 m!1370611))

(assert (=> b!1485132 m!1370591))

(declare-fun m!1370613 () Bool)

(assert (=> b!1485140 m!1370613))

(assert (=> b!1485140 m!1370613))

(declare-fun m!1370615 () Bool)

(assert (=> b!1485140 m!1370615))

(declare-fun m!1370617 () Bool)

(assert (=> start!126774 m!1370617))

(declare-fun m!1370619 () Bool)

(assert (=> start!126774 m!1370619))

(declare-fun m!1370621 () Bool)

(assert (=> b!1485122 m!1370621))

(assert (=> b!1485122 m!1370591))

(assert (=> b!1485131 m!1370599))

(assert (=> b!1485131 m!1370597))

(assert (=> b!1485133 m!1370605))

(declare-fun m!1370623 () Bool)

(assert (=> b!1485133 m!1370623))

(assert (=> b!1485136 m!1370609))

(assert (=> b!1485136 m!1370591))

(assert (=> b!1485136 m!1370605))

(assert (=> b!1485136 m!1370607))

(declare-fun m!1370625 () Bool)

(assert (=> b!1485123 m!1370625))

(assert (=> b!1485124 m!1370591))

(assert (=> b!1485124 m!1370591))

(declare-fun m!1370627 () Bool)

(assert (=> b!1485124 m!1370627))

(assert (=> b!1485127 m!1370591))

(assert (=> b!1485127 m!1370591))

(declare-fun m!1370629 () Bool)

(assert (=> b!1485127 m!1370629))

(assert (=> b!1485135 m!1370591))

(assert (=> b!1485135 m!1370591))

(declare-fun m!1370631 () Bool)

(assert (=> b!1485135 m!1370631))

(declare-fun m!1370633 () Bool)

(assert (=> b!1485128 m!1370633))

(assert (=> b!1485128 m!1370633))

(declare-fun m!1370635 () Bool)

(assert (=> b!1485128 m!1370635))

(assert (=> b!1485128 m!1370605))

(declare-fun m!1370637 () Bool)

(assert (=> b!1485128 m!1370637))

(check-sat (not b!1485139) (not b!1485132) (not b!1485124) (not start!126774) (not b!1485130) (not b!1485135) (not b!1485140) (not b!1485129) (not b!1485141) (not b!1485127) (not b!1485123) (not b!1485137) (not b!1485128) (not b!1485131))
(check-sat)
