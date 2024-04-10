; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127194 () Bool)

(assert start!127194)

(declare-fun b!1494888 () Bool)

(declare-fun res!1016971 () Bool)

(declare-fun e!837340 () Bool)

(assert (=> b!1494888 (=> (not res!1016971) (not e!837340))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!99778 0))(
  ( (array!99779 (arr!48156 (Array (_ BitVec 32) (_ BitVec 64))) (size!48706 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99778)

(assert (=> b!1494888 (= res!1016971 (and (= (size!48706 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48706 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48706 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1494889 () Bool)

(declare-fun e!837341 () Bool)

(declare-fun e!837342 () Bool)

(assert (=> b!1494889 (= e!837341 e!837342)))

(declare-fun res!1016978 () Bool)

(assert (=> b!1494889 (=> (not res!1016978) (not e!837342))))

(declare-datatypes ((SeekEntryResult!12396 0))(
  ( (MissingZero!12396 (index!51976 (_ BitVec 32))) (Found!12396 (index!51977 (_ BitVec 32))) (Intermediate!12396 (undefined!13208 Bool) (index!51978 (_ BitVec 32)) (x!133584 (_ BitVec 32))) (Undefined!12396) (MissingVacant!12396 (index!51979 (_ BitVec 32))) )
))
(declare-fun lt!651550 () SeekEntryResult!12396)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99778 (_ BitVec 32)) SeekEntryResult!12396)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494889 (= res!1016978 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48156 a!2862) j!93) mask!2687) (select (arr!48156 a!2862) j!93) a!2862 mask!2687) lt!651550))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1494889 (= lt!651550 (Intermediate!12396 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1494890 () Bool)

(assert (=> b!1494890 (= e!837340 e!837341)))

(declare-fun res!1016967 () Bool)

(assert (=> b!1494890 (=> (not res!1016967) (not e!837341))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1494890 (= res!1016967 (= (select (store (arr!48156 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!651549 () array!99778)

(assert (=> b!1494890 (= lt!651549 (array!99779 (store (arr!48156 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48706 a!2862)))))

(declare-fun b!1494891 () Bool)

(declare-fun res!1016983 () Bool)

(declare-fun e!837344 () Bool)

(assert (=> b!1494891 (=> (not res!1016983) (not e!837344))))

(declare-fun x!665 () (_ BitVec 32))

(assert (=> b!1494891 (= res!1016983 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1494892 () Bool)

(declare-fun res!1016975 () Bool)

(assert (=> b!1494892 (=> (not res!1016975) (not e!837340))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1494892 (= res!1016975 (validKeyInArray!0 (select (arr!48156 a!2862) j!93)))))

(declare-fun e!837338 () Bool)

(declare-fun b!1494893 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!651551 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99778 (_ BitVec 32)) SeekEntryResult!12396)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99778 (_ BitVec 32)) SeekEntryResult!12396)

(assert (=> b!1494893 (= e!837338 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!651551 lt!651549 mask!2687) (seekEntryOrOpen!0 lt!651551 lt!651549 mask!2687)))))

(declare-fun res!1016968 () Bool)

(assert (=> start!127194 (=> (not res!1016968) (not e!837340))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127194 (= res!1016968 (validMask!0 mask!2687))))

(assert (=> start!127194 e!837340))

(assert (=> start!127194 true))

(declare-fun array_inv!37184 (array!99778) Bool)

(assert (=> start!127194 (array_inv!37184 a!2862)))

(declare-fun b!1494894 () Bool)

(declare-fun res!1016982 () Bool)

(declare-fun e!837336 () Bool)

(assert (=> b!1494894 (=> (not res!1016982) (not e!837336))))

(assert (=> b!1494894 (= res!1016982 (= (seekEntryOrOpen!0 (select (arr!48156 a!2862) j!93) a!2862 mask!2687) (Found!12396 j!93)))))

(declare-fun lt!651548 () SeekEntryResult!12396)

(declare-fun b!1494895 () Bool)

(assert (=> b!1494895 (= e!837338 (= lt!651548 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!651551 lt!651549 mask!2687)))))

(declare-fun b!1494896 () Bool)

(declare-fun res!1016981 () Bool)

(assert (=> b!1494896 (=> (not res!1016981) (not e!837344))))

(assert (=> b!1494896 (= res!1016981 e!837338)))

(declare-fun c!138492 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1494896 (= c!138492 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1494897 () Bool)

(assert (=> b!1494897 (= e!837342 e!837344)))

(declare-fun res!1016970 () Bool)

(assert (=> b!1494897 (=> (not res!1016970) (not e!837344))))

(assert (=> b!1494897 (= res!1016970 (= lt!651548 (Intermediate!12396 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1494897 (= lt!651548 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!651551 mask!2687) lt!651551 lt!651549 mask!2687))))

(assert (=> b!1494897 (= lt!651551 (select (store (arr!48156 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1494898 () Bool)

(declare-fun res!1016980 () Bool)

(assert (=> b!1494898 (=> (not res!1016980) (not e!837340))))

(assert (=> b!1494898 (= res!1016980 (validKeyInArray!0 (select (arr!48156 a!2862) i!1006)))))

(declare-fun b!1494899 () Bool)

(declare-fun e!837337 () Bool)

(declare-fun e!837343 () Bool)

(assert (=> b!1494899 (= e!837337 e!837343)))

(declare-fun res!1016976 () Bool)

(assert (=> b!1494899 (=> res!1016976 e!837343)))

(declare-fun lt!651552 () (_ BitVec 32))

(assert (=> b!1494899 (= res!1016976 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!651552 #b00000000000000000000000000000000) (bvsge lt!651552 (size!48706 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1494899 (= lt!651552 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1494900 () Bool)

(declare-fun res!1016974 () Bool)

(assert (=> b!1494900 (=> (not res!1016974) (not e!837340))))

(declare-datatypes ((List!34657 0))(
  ( (Nil!34654) (Cons!34653 (h!36045 (_ BitVec 64)) (t!49351 List!34657)) )
))
(declare-fun arrayNoDuplicates!0 (array!99778 (_ BitVec 32) List!34657) Bool)

(assert (=> b!1494900 (= res!1016974 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34654))))

(declare-fun b!1494901 () Bool)

(assert (=> b!1494901 (= e!837343 true)))

(declare-fun lt!651546 () SeekEntryResult!12396)

(assert (=> b!1494901 (= lt!651546 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!651552 (select (arr!48156 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1494902 () Bool)

(declare-fun res!1016977 () Bool)

(assert (=> b!1494902 (=> (not res!1016977) (not e!837342))))

(assert (=> b!1494902 (= res!1016977 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48156 a!2862) j!93) a!2862 mask!2687) lt!651550))))

(declare-fun b!1494903 () Bool)

(assert (=> b!1494903 (= e!837336 (or (= (select (arr!48156 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48156 a!2862) intermediateBeforeIndex!19) (select (arr!48156 a!2862) j!93))))))

(declare-fun b!1494904 () Bool)

(declare-fun res!1016969 () Bool)

(assert (=> b!1494904 (=> (not res!1016969) (not e!837340))))

(assert (=> b!1494904 (= res!1016969 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48706 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48706 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48706 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1494905 () Bool)

(declare-fun res!1016972 () Bool)

(assert (=> b!1494905 (=> (not res!1016972) (not e!837340))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99778 (_ BitVec 32)) Bool)

(assert (=> b!1494905 (= res!1016972 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1494906 () Bool)

(assert (=> b!1494906 (= e!837344 (not e!837337))))

(declare-fun res!1016979 () Bool)

(assert (=> b!1494906 (=> res!1016979 e!837337)))

(assert (=> b!1494906 (= res!1016979 (or (and (= (select (arr!48156 a!2862) index!646) (select (store (arr!48156 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48156 a!2862) index!646) (select (arr!48156 a!2862) j!93))) (= (select (arr!48156 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1494906 e!837336))

(declare-fun res!1016973 () Bool)

(assert (=> b!1494906 (=> (not res!1016973) (not e!837336))))

(assert (=> b!1494906 (= res!1016973 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50132 0))(
  ( (Unit!50133) )
))
(declare-fun lt!651547 () Unit!50132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99778 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50132)

(assert (=> b!1494906 (= lt!651547 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(assert (= (and start!127194 res!1016968) b!1494888))

(assert (= (and b!1494888 res!1016971) b!1494898))

(assert (= (and b!1494898 res!1016980) b!1494892))

(assert (= (and b!1494892 res!1016975) b!1494905))

(assert (= (and b!1494905 res!1016972) b!1494900))

(assert (= (and b!1494900 res!1016974) b!1494904))

(assert (= (and b!1494904 res!1016969) b!1494890))

(assert (= (and b!1494890 res!1016967) b!1494889))

(assert (= (and b!1494889 res!1016978) b!1494902))

(assert (= (and b!1494902 res!1016977) b!1494897))

(assert (= (and b!1494897 res!1016970) b!1494896))

(assert (= (and b!1494896 c!138492) b!1494895))

(assert (= (and b!1494896 (not c!138492)) b!1494893))

(assert (= (and b!1494896 res!1016981) b!1494891))

(assert (= (and b!1494891 res!1016983) b!1494906))

(assert (= (and b!1494906 res!1016973) b!1494894))

(assert (= (and b!1494894 res!1016982) b!1494903))

(assert (= (and b!1494906 (not res!1016979)) b!1494899))

(assert (= (and b!1494899 (not res!1016976)) b!1494901))

(declare-fun m!1378477 () Bool)

(assert (=> start!127194 m!1378477))

(declare-fun m!1378479 () Bool)

(assert (=> start!127194 m!1378479))

(declare-fun m!1378481 () Bool)

(assert (=> b!1494900 m!1378481))

(declare-fun m!1378483 () Bool)

(assert (=> b!1494899 m!1378483))

(declare-fun m!1378485 () Bool)

(assert (=> b!1494889 m!1378485))

(assert (=> b!1494889 m!1378485))

(declare-fun m!1378487 () Bool)

(assert (=> b!1494889 m!1378487))

(assert (=> b!1494889 m!1378487))

(assert (=> b!1494889 m!1378485))

(declare-fun m!1378489 () Bool)

(assert (=> b!1494889 m!1378489))

(declare-fun m!1378491 () Bool)

(assert (=> b!1494898 m!1378491))

(assert (=> b!1494898 m!1378491))

(declare-fun m!1378493 () Bool)

(assert (=> b!1494898 m!1378493))

(declare-fun m!1378495 () Bool)

(assert (=> b!1494890 m!1378495))

(declare-fun m!1378497 () Bool)

(assert (=> b!1494890 m!1378497))

(assert (=> b!1494901 m!1378485))

(assert (=> b!1494901 m!1378485))

(declare-fun m!1378499 () Bool)

(assert (=> b!1494901 m!1378499))

(assert (=> b!1494894 m!1378485))

(assert (=> b!1494894 m!1378485))

(declare-fun m!1378501 () Bool)

(assert (=> b!1494894 m!1378501))

(assert (=> b!1494892 m!1378485))

(assert (=> b!1494892 m!1378485))

(declare-fun m!1378503 () Bool)

(assert (=> b!1494892 m!1378503))

(declare-fun m!1378505 () Bool)

(assert (=> b!1494906 m!1378505))

(assert (=> b!1494906 m!1378495))

(declare-fun m!1378507 () Bool)

(assert (=> b!1494906 m!1378507))

(declare-fun m!1378509 () Bool)

(assert (=> b!1494906 m!1378509))

(declare-fun m!1378511 () Bool)

(assert (=> b!1494906 m!1378511))

(assert (=> b!1494906 m!1378485))

(declare-fun m!1378513 () Bool)

(assert (=> b!1494905 m!1378513))

(declare-fun m!1378515 () Bool)

(assert (=> b!1494897 m!1378515))

(assert (=> b!1494897 m!1378515))

(declare-fun m!1378517 () Bool)

(assert (=> b!1494897 m!1378517))

(assert (=> b!1494897 m!1378495))

(declare-fun m!1378519 () Bool)

(assert (=> b!1494897 m!1378519))

(assert (=> b!1494902 m!1378485))

(assert (=> b!1494902 m!1378485))

(declare-fun m!1378521 () Bool)

(assert (=> b!1494902 m!1378521))

(declare-fun m!1378523 () Bool)

(assert (=> b!1494893 m!1378523))

(declare-fun m!1378525 () Bool)

(assert (=> b!1494893 m!1378525))

(declare-fun m!1378527 () Bool)

(assert (=> b!1494903 m!1378527))

(assert (=> b!1494903 m!1378485))

(declare-fun m!1378529 () Bool)

(assert (=> b!1494895 m!1378529))

(check-sat (not b!1494898) (not b!1494905) (not b!1494901) (not b!1494889) (not b!1494902) (not b!1494899) (not b!1494906) (not start!127194) (not b!1494897) (not b!1494892) (not b!1494895) (not b!1494894) (not b!1494893) (not b!1494900))
(check-sat)
