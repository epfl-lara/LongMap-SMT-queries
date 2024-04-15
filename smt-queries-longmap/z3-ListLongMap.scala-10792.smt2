; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126220 () Bool)

(assert start!126220)

(declare-fun b!1479584 () Bool)

(declare-fun res!1005573 () Bool)

(declare-fun e!829906 () Bool)

(assert (=> b!1479584 (=> (not res!1005573) (not e!829906))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99304 0))(
  ( (array!99305 (arr!47932 (Array (_ BitVec 32) (_ BitVec 64))) (size!48484 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99304)

(assert (=> b!1479584 (= res!1005573 (and (= (size!48484 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48484 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48484 a!2862)) (not (= i!1006 j!93))))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun lt!645927 () array!99304)

(declare-fun lt!645931 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12197 0))(
  ( (MissingZero!12197 (index!51180 (_ BitVec 32))) (Found!12197 (index!51181 (_ BitVec 32))) (Intermediate!12197 (undefined!13009 Bool) (index!51182 (_ BitVec 32)) (x!132759 (_ BitVec 32))) (Undefined!12197) (MissingVacant!12197 (index!51183 (_ BitVec 32))) )
))
(declare-fun lt!645926 () SeekEntryResult!12197)

(declare-fun e!829904 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1479585 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99304 (_ BitVec 32)) SeekEntryResult!12197)

(assert (=> b!1479585 (= e!829904 (= lt!645926 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645931 lt!645927 mask!2687)))))

(declare-fun b!1479586 () Bool)

(declare-fun res!1005575 () Bool)

(declare-fun e!829902 () Bool)

(assert (=> b!1479586 (=> (not res!1005575) (not e!829902))))

(declare-fun lt!645932 () SeekEntryResult!12197)

(assert (=> b!1479586 (= res!1005575 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47932 a!2862) j!93) a!2862 mask!2687) lt!645932))))

(declare-fun res!1005586 () Bool)

(assert (=> start!126220 (=> (not res!1005586) (not e!829906))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126220 (= res!1005586 (validMask!0 mask!2687))))

(assert (=> start!126220 e!829906))

(assert (=> start!126220 true))

(declare-fun array_inv!37165 (array!99304) Bool)

(assert (=> start!126220 (array_inv!37165 a!2862)))

(declare-fun b!1479587 () Bool)

(declare-fun e!829905 () Bool)

(assert (=> b!1479587 (= e!829906 e!829905)))

(declare-fun res!1005574 () Bool)

(assert (=> b!1479587 (=> (not res!1005574) (not e!829905))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479587 (= res!1005574 (= (select (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479587 (= lt!645927 (array!99305 (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48484 a!2862)))))

(declare-fun b!1479588 () Bool)

(declare-fun res!1005572 () Bool)

(assert (=> b!1479588 (=> (not res!1005572) (not e!829906))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99304 (_ BitVec 32)) Bool)

(assert (=> b!1479588 (= res!1005572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479589 () Bool)

(declare-fun res!1005578 () Bool)

(assert (=> b!1479589 (=> (not res!1005578) (not e!829906))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479589 (= res!1005578 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48484 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48484 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48484 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479590 () Bool)

(declare-fun res!1005576 () Bool)

(assert (=> b!1479590 (=> (not res!1005576) (not e!829906))))

(declare-datatypes ((List!34511 0))(
  ( (Nil!34508) (Cons!34507 (h!35875 (_ BitVec 64)) (t!49197 List!34511)) )
))
(declare-fun arrayNoDuplicates!0 (array!99304 (_ BitVec 32) List!34511) Bool)

(assert (=> b!1479590 (= res!1005576 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34508))))

(declare-fun b!1479591 () Bool)

(declare-fun e!829911 () Bool)

(declare-fun e!829907 () Bool)

(assert (=> b!1479591 (= e!829911 e!829907)))

(declare-fun res!1005579 () Bool)

(assert (=> b!1479591 (=> (not res!1005579) (not e!829907))))

(declare-fun lt!645929 () SeekEntryResult!12197)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99304 (_ BitVec 32)) SeekEntryResult!12197)

(assert (=> b!1479591 (= res!1005579 (= lt!645929 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47932 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479592 () Bool)

(assert (=> b!1479592 (= e!829905 e!829902)))

(declare-fun res!1005584 () Bool)

(assert (=> b!1479592 (=> (not res!1005584) (not e!829902))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479592 (= res!1005584 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47932 a!2862) j!93) mask!2687) (select (arr!47932 a!2862) j!93) a!2862 mask!2687) lt!645932))))

(assert (=> b!1479592 (= lt!645932 (Intermediate!12197 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479593 () Bool)

(declare-fun e!829910 () Bool)

(assert (=> b!1479593 (= e!829910 true)))

(declare-fun lt!645933 () SeekEntryResult!12197)

(assert (=> b!1479593 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645931 lt!645927 mask!2687) lt!645933)))

(declare-datatypes ((Unit!49575 0))(
  ( (Unit!49576) )
))
(declare-fun lt!645928 () Unit!49575)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49575)

(assert (=> b!1479593 (= lt!645928 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479594 () Bool)

(declare-fun res!1005582 () Bool)

(declare-fun e!829909 () Bool)

(assert (=> b!1479594 (=> (not res!1005582) (not e!829909))))

(assert (=> b!1479594 (= res!1005582 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479595 () Bool)

(declare-fun res!1005589 () Bool)

(assert (=> b!1479595 (=> res!1005589 e!829910)))

(assert (=> b!1479595 (= res!1005589 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47932 a!2862) j!93) a!2862 mask!2687) lt!645933)))))

(declare-fun b!1479596 () Bool)

(declare-fun res!1005583 () Bool)

(assert (=> b!1479596 (=> (not res!1005583) (not e!829906))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479596 (= res!1005583 (validKeyInArray!0 (select (arr!47932 a!2862) i!1006)))))

(declare-fun b!1479597 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99304 (_ BitVec 32)) SeekEntryResult!12197)

(assert (=> b!1479597 (= e!829904 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645931 lt!645927 mask!2687) (seekEntryOrOpen!0 lt!645931 lt!645927 mask!2687)))))

(declare-fun b!1479598 () Bool)

(assert (=> b!1479598 (= e!829909 (not e!829910))))

(declare-fun res!1005587 () Bool)

(assert (=> b!1479598 (=> res!1005587 e!829910)))

(assert (=> b!1479598 (= res!1005587 (or (and (= (select (arr!47932 a!2862) index!646) (select (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47932 a!2862) index!646) (select (arr!47932 a!2862) j!93))) (not (= (select (arr!47932 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47932 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!829908 () Bool)

(assert (=> b!1479598 e!829908))

(declare-fun res!1005588 () Bool)

(assert (=> b!1479598 (=> (not res!1005588) (not e!829908))))

(assert (=> b!1479598 (= res!1005588 (and (= lt!645929 lt!645933) (or (= (select (arr!47932 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47932 a!2862) intermediateBeforeIndex!19) (select (arr!47932 a!2862) j!93)))))))

(assert (=> b!1479598 (= lt!645933 (Found!12197 j!93))))

(assert (=> b!1479598 (= lt!645929 (seekEntryOrOpen!0 (select (arr!47932 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479598 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!645930 () Unit!49575)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99304 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49575)

(assert (=> b!1479598 (= lt!645930 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479599 () Bool)

(assert (=> b!1479599 (= e!829908 e!829911)))

(declare-fun res!1005581 () Bool)

(assert (=> b!1479599 (=> res!1005581 e!829911)))

(assert (=> b!1479599 (= res!1005581 (or (and (= (select (arr!47932 a!2862) index!646) (select (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47932 a!2862) index!646) (select (arr!47932 a!2862) j!93))) (not (= (select (arr!47932 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479600 () Bool)

(declare-fun res!1005585 () Bool)

(assert (=> b!1479600 (=> (not res!1005585) (not e!829906))))

(assert (=> b!1479600 (= res!1005585 (validKeyInArray!0 (select (arr!47932 a!2862) j!93)))))

(declare-fun b!1479601 () Bool)

(assert (=> b!1479601 (= e!829907 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479602 () Bool)

(declare-fun res!1005580 () Bool)

(assert (=> b!1479602 (=> (not res!1005580) (not e!829909))))

(assert (=> b!1479602 (= res!1005580 e!829904)))

(declare-fun c!136528 () Bool)

(assert (=> b!1479602 (= c!136528 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479603 () Bool)

(assert (=> b!1479603 (= e!829902 e!829909)))

(declare-fun res!1005577 () Bool)

(assert (=> b!1479603 (=> (not res!1005577) (not e!829909))))

(assert (=> b!1479603 (= res!1005577 (= lt!645926 (Intermediate!12197 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1479603 (= lt!645926 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645931 mask!2687) lt!645931 lt!645927 mask!2687))))

(assert (=> b!1479603 (= lt!645931 (select (store (arr!47932 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(assert (= (and start!126220 res!1005586) b!1479584))

(assert (= (and b!1479584 res!1005573) b!1479596))

(assert (= (and b!1479596 res!1005583) b!1479600))

(assert (= (and b!1479600 res!1005585) b!1479588))

(assert (= (and b!1479588 res!1005572) b!1479590))

(assert (= (and b!1479590 res!1005576) b!1479589))

(assert (= (and b!1479589 res!1005578) b!1479587))

(assert (= (and b!1479587 res!1005574) b!1479592))

(assert (= (and b!1479592 res!1005584) b!1479586))

(assert (= (and b!1479586 res!1005575) b!1479603))

(assert (= (and b!1479603 res!1005577) b!1479602))

(assert (= (and b!1479602 c!136528) b!1479585))

(assert (= (and b!1479602 (not c!136528)) b!1479597))

(assert (= (and b!1479602 res!1005580) b!1479594))

(assert (= (and b!1479594 res!1005582) b!1479598))

(assert (= (and b!1479598 res!1005588) b!1479599))

(assert (= (and b!1479599 (not res!1005581)) b!1479591))

(assert (= (and b!1479591 res!1005579) b!1479601))

(assert (= (and b!1479598 (not res!1005587)) b!1479595))

(assert (= (and b!1479595 (not res!1005589)) b!1479593))

(declare-fun m!1364949 () Bool)

(assert (=> start!126220 m!1364949))

(declare-fun m!1364951 () Bool)

(assert (=> start!126220 m!1364951))

(declare-fun m!1364953 () Bool)

(assert (=> b!1479586 m!1364953))

(assert (=> b!1479586 m!1364953))

(declare-fun m!1364955 () Bool)

(assert (=> b!1479586 m!1364955))

(declare-fun m!1364957 () Bool)

(assert (=> b!1479603 m!1364957))

(assert (=> b!1479603 m!1364957))

(declare-fun m!1364959 () Bool)

(assert (=> b!1479603 m!1364959))

(declare-fun m!1364961 () Bool)

(assert (=> b!1479603 m!1364961))

(declare-fun m!1364963 () Bool)

(assert (=> b!1479603 m!1364963))

(declare-fun m!1364965 () Bool)

(assert (=> b!1479599 m!1364965))

(assert (=> b!1479599 m!1364961))

(declare-fun m!1364967 () Bool)

(assert (=> b!1479599 m!1364967))

(assert (=> b!1479599 m!1364953))

(declare-fun m!1364969 () Bool)

(assert (=> b!1479593 m!1364969))

(declare-fun m!1364971 () Bool)

(assert (=> b!1479593 m!1364971))

(assert (=> b!1479597 m!1364969))

(declare-fun m!1364973 () Bool)

(assert (=> b!1479597 m!1364973))

(declare-fun m!1364975 () Bool)

(assert (=> b!1479598 m!1364975))

(assert (=> b!1479598 m!1364961))

(declare-fun m!1364977 () Bool)

(assert (=> b!1479598 m!1364977))

(assert (=> b!1479598 m!1364967))

(assert (=> b!1479598 m!1364965))

(assert (=> b!1479598 m!1364953))

(declare-fun m!1364979 () Bool)

(assert (=> b!1479598 m!1364979))

(declare-fun m!1364981 () Bool)

(assert (=> b!1479598 m!1364981))

(assert (=> b!1479598 m!1364953))

(declare-fun m!1364983 () Bool)

(assert (=> b!1479590 m!1364983))

(declare-fun m!1364985 () Bool)

(assert (=> b!1479585 m!1364985))

(assert (=> b!1479587 m!1364961))

(declare-fun m!1364987 () Bool)

(assert (=> b!1479587 m!1364987))

(assert (=> b!1479591 m!1364953))

(assert (=> b!1479591 m!1364953))

(declare-fun m!1364989 () Bool)

(assert (=> b!1479591 m!1364989))

(assert (=> b!1479595 m!1364953))

(assert (=> b!1479595 m!1364953))

(declare-fun m!1364991 () Bool)

(assert (=> b!1479595 m!1364991))

(assert (=> b!1479592 m!1364953))

(assert (=> b!1479592 m!1364953))

(declare-fun m!1364993 () Bool)

(assert (=> b!1479592 m!1364993))

(assert (=> b!1479592 m!1364993))

(assert (=> b!1479592 m!1364953))

(declare-fun m!1364995 () Bool)

(assert (=> b!1479592 m!1364995))

(declare-fun m!1364997 () Bool)

(assert (=> b!1479596 m!1364997))

(assert (=> b!1479596 m!1364997))

(declare-fun m!1364999 () Bool)

(assert (=> b!1479596 m!1364999))

(declare-fun m!1365001 () Bool)

(assert (=> b!1479588 m!1365001))

(assert (=> b!1479600 m!1364953))

(assert (=> b!1479600 m!1364953))

(declare-fun m!1365003 () Bool)

(assert (=> b!1479600 m!1365003))

(check-sat (not b!1479591) (not b!1479590) (not b!1479586) (not b!1479593) (not b!1479585) (not b!1479597) (not b!1479592) (not start!126220) (not b!1479603) (not b!1479596) (not b!1479598) (not b!1479588) (not b!1479600) (not b!1479595))
(check-sat)
