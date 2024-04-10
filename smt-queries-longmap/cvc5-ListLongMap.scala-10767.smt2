; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125920 () Bool)

(assert start!125920)

(declare-fun res!1001713 () Bool)

(declare-fun e!827306 () Bool)

(assert (=> start!125920 (=> (not res!1001713) (not e!827306))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125920 (= res!1001713 (validMask!0 mask!2687))))

(assert (=> start!125920 e!827306))

(assert (=> start!125920 true))

(declare-datatypes ((array!99197 0))(
  ( (array!99198 (arr!47882 (Array (_ BitVec 32) (_ BitVec 64))) (size!48432 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99197)

(declare-fun array_inv!36910 (array!99197) Bool)

(assert (=> start!125920 (array_inv!36910 a!2862)))

(declare-fun b!1474517 () Bool)

(declare-fun res!1001716 () Bool)

(assert (=> b!1474517 (=> (not res!1001716) (not e!827306))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1474517 (= res!1001716 (and (= (size!48432 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48432 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48432 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1474518 () Bool)

(declare-fun e!827307 () Bool)

(assert (=> b!1474518 (= e!827306 e!827307)))

(declare-fun res!1001720 () Bool)

(assert (=> b!1474518 (=> (not res!1001720) (not e!827307))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1474518 (= res!1001720 (= (select (store (arr!47882 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!644274 () array!99197)

(assert (=> b!1474518 (= lt!644274 (array!99198 (store (arr!47882 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48432 a!2862)))))

(declare-fun b!1474519 () Bool)

(declare-fun res!1001711 () Bool)

(declare-fun e!827309 () Bool)

(assert (=> b!1474519 (=> (not res!1001711) (not e!827309))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12122 0))(
  ( (MissingZero!12122 (index!50880 (_ BitVec 32))) (Found!12122 (index!50881 (_ BitVec 32))) (Intermediate!12122 (undefined!12934 Bool) (index!50882 (_ BitVec 32)) (x!132462 (_ BitVec 32))) (Undefined!12122) (MissingVacant!12122 (index!50883 (_ BitVec 32))) )
))
(declare-fun lt!644273 () SeekEntryResult!12122)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99197 (_ BitVec 32)) SeekEntryResult!12122)

(assert (=> b!1474519 (= res!1001711 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47882 a!2862) j!93) a!2862 mask!2687) lt!644273))))

(declare-fun b!1474520 () Bool)

(declare-fun res!1001723 () Bool)

(declare-fun e!827308 () Bool)

(assert (=> b!1474520 (=> (not res!1001723) (not e!827308))))

(declare-fun e!827303 () Bool)

(assert (=> b!1474520 (= res!1001723 e!827303)))

(declare-fun c!135918 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1474520 (= c!135918 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1474521 () Bool)

(assert (=> b!1474521 (= e!827309 e!827308)))

(declare-fun res!1001725 () Bool)

(assert (=> b!1474521 (=> (not res!1001725) (not e!827308))))

(declare-fun lt!644275 () SeekEntryResult!12122)

(assert (=> b!1474521 (= res!1001725 (= lt!644275 (Intermediate!12122 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!644276 () (_ BitVec 64))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1474521 (= lt!644275 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!644276 mask!2687) lt!644276 lt!644274 mask!2687))))

(assert (=> b!1474521 (= lt!644276 (select (store (arr!47882 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun e!827304 () Bool)

(declare-fun b!1474522 () Bool)

(assert (=> b!1474522 (= e!827304 (or (= (select (arr!47882 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47882 a!2862) intermediateBeforeIndex!19) (select (arr!47882 a!2862) j!93))))))

(declare-fun b!1474523 () Bool)

(declare-fun res!1001714 () Bool)

(assert (=> b!1474523 (=> (not res!1001714) (not e!827306))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99197 (_ BitVec 32)) Bool)

(assert (=> b!1474523 (= res!1001714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1474524 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99197 (_ BitVec 32)) SeekEntryResult!12122)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99197 (_ BitVec 32)) SeekEntryResult!12122)

(assert (=> b!1474524 (= e!827303 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!644276 lt!644274 mask!2687) (seekEntryOrOpen!0 lt!644276 lt!644274 mask!2687)))))

(declare-fun b!1474525 () Bool)

(declare-fun res!1001717 () Bool)

(assert (=> b!1474525 (=> (not res!1001717) (not e!827308))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1474525 (= res!1001717 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1474526 () Bool)

(assert (=> b!1474526 (= e!827307 e!827309)))

(declare-fun res!1001719 () Bool)

(assert (=> b!1474526 (=> (not res!1001719) (not e!827309))))

(assert (=> b!1474526 (= res!1001719 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47882 a!2862) j!93) mask!2687) (select (arr!47882 a!2862) j!93) a!2862 mask!2687) lt!644273))))

(assert (=> b!1474526 (= lt!644273 (Intermediate!12122 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1474527 () Bool)

(declare-fun res!1001718 () Bool)

(assert (=> b!1474527 (=> (not res!1001718) (not e!827306))))

(declare-datatypes ((List!34383 0))(
  ( (Nil!34380) (Cons!34379 (h!35738 (_ BitVec 64)) (t!49077 List!34383)) )
))
(declare-fun arrayNoDuplicates!0 (array!99197 (_ BitVec 32) List!34383) Bool)

(assert (=> b!1474527 (= res!1001718 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34380))))

(declare-fun b!1474528 () Bool)

(declare-fun res!1001724 () Bool)

(assert (=> b!1474528 (=> (not res!1001724) (not e!827306))))

(assert (=> b!1474528 (= res!1001724 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48432 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48432 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48432 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1474529 () Bool)

(assert (=> b!1474529 (= e!827308 (not true))))

(assert (=> b!1474529 e!827304))

(declare-fun res!1001721 () Bool)

(assert (=> b!1474529 (=> (not res!1001721) (not e!827304))))

(assert (=> b!1474529 (= res!1001721 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49584 0))(
  ( (Unit!49585) )
))
(declare-fun lt!644277 () Unit!49584)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99197 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49584)

(assert (=> b!1474529 (= lt!644277 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1474530 () Bool)

(declare-fun res!1001722 () Bool)

(assert (=> b!1474530 (=> (not res!1001722) (not e!827306))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1474530 (= res!1001722 (validKeyInArray!0 (select (arr!47882 a!2862) j!93)))))

(declare-fun b!1474531 () Bool)

(declare-fun res!1001715 () Bool)

(assert (=> b!1474531 (=> (not res!1001715) (not e!827304))))

(assert (=> b!1474531 (= res!1001715 (= (seekEntryOrOpen!0 (select (arr!47882 a!2862) j!93) a!2862 mask!2687) (Found!12122 j!93)))))

(declare-fun b!1474532 () Bool)

(declare-fun res!1001712 () Bool)

(assert (=> b!1474532 (=> (not res!1001712) (not e!827306))))

(assert (=> b!1474532 (= res!1001712 (validKeyInArray!0 (select (arr!47882 a!2862) i!1006)))))

(declare-fun b!1474533 () Bool)

(assert (=> b!1474533 (= e!827303 (= lt!644275 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!644276 lt!644274 mask!2687)))))

(assert (= (and start!125920 res!1001713) b!1474517))

(assert (= (and b!1474517 res!1001716) b!1474532))

(assert (= (and b!1474532 res!1001712) b!1474530))

(assert (= (and b!1474530 res!1001722) b!1474523))

(assert (= (and b!1474523 res!1001714) b!1474527))

(assert (= (and b!1474527 res!1001718) b!1474528))

(assert (= (and b!1474528 res!1001724) b!1474518))

(assert (= (and b!1474518 res!1001720) b!1474526))

(assert (= (and b!1474526 res!1001719) b!1474519))

(assert (= (and b!1474519 res!1001711) b!1474521))

(assert (= (and b!1474521 res!1001725) b!1474520))

(assert (= (and b!1474520 c!135918) b!1474533))

(assert (= (and b!1474520 (not c!135918)) b!1474524))

(assert (= (and b!1474520 res!1001723) b!1474525))

(assert (= (and b!1474525 res!1001717) b!1474529))

(assert (= (and b!1474529 res!1001721) b!1474531))

(assert (= (and b!1474531 res!1001715) b!1474522))

(declare-fun m!1360957 () Bool)

(assert (=> b!1474527 m!1360957))

(declare-fun m!1360959 () Bool)

(assert (=> b!1474518 m!1360959))

(declare-fun m!1360961 () Bool)

(assert (=> b!1474518 m!1360961))

(declare-fun m!1360963 () Bool)

(assert (=> b!1474530 m!1360963))

(assert (=> b!1474530 m!1360963))

(declare-fun m!1360965 () Bool)

(assert (=> b!1474530 m!1360965))

(declare-fun m!1360967 () Bool)

(assert (=> start!125920 m!1360967))

(declare-fun m!1360969 () Bool)

(assert (=> start!125920 m!1360969))

(declare-fun m!1360971 () Bool)

(assert (=> b!1474533 m!1360971))

(declare-fun m!1360973 () Bool)

(assert (=> b!1474521 m!1360973))

(assert (=> b!1474521 m!1360973))

(declare-fun m!1360975 () Bool)

(assert (=> b!1474521 m!1360975))

(assert (=> b!1474521 m!1360959))

(declare-fun m!1360977 () Bool)

(assert (=> b!1474521 m!1360977))

(declare-fun m!1360979 () Bool)

(assert (=> b!1474523 m!1360979))

(declare-fun m!1360981 () Bool)

(assert (=> b!1474524 m!1360981))

(declare-fun m!1360983 () Bool)

(assert (=> b!1474524 m!1360983))

(declare-fun m!1360985 () Bool)

(assert (=> b!1474532 m!1360985))

(assert (=> b!1474532 m!1360985))

(declare-fun m!1360987 () Bool)

(assert (=> b!1474532 m!1360987))

(assert (=> b!1474519 m!1360963))

(assert (=> b!1474519 m!1360963))

(declare-fun m!1360989 () Bool)

(assert (=> b!1474519 m!1360989))

(assert (=> b!1474526 m!1360963))

(assert (=> b!1474526 m!1360963))

(declare-fun m!1360991 () Bool)

(assert (=> b!1474526 m!1360991))

(assert (=> b!1474526 m!1360991))

(assert (=> b!1474526 m!1360963))

(declare-fun m!1360993 () Bool)

(assert (=> b!1474526 m!1360993))

(declare-fun m!1360995 () Bool)

(assert (=> b!1474522 m!1360995))

(assert (=> b!1474522 m!1360963))

(assert (=> b!1474531 m!1360963))

(assert (=> b!1474531 m!1360963))

(declare-fun m!1360997 () Bool)

(assert (=> b!1474531 m!1360997))

(declare-fun m!1360999 () Bool)

(assert (=> b!1474529 m!1360999))

(declare-fun m!1361001 () Bool)

(assert (=> b!1474529 m!1361001))

(push 1)

