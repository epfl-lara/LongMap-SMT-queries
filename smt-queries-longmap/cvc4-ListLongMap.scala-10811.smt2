; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126518 () Bool)

(assert start!126518)

(declare-fun b!1484107 () Bool)

(declare-fun res!1008917 () Bool)

(declare-fun e!832119 () Bool)

(assert (=> b!1484107 (=> (not res!1008917) (not e!832119))))

(declare-datatypes ((array!99480 0))(
  ( (array!99481 (arr!48016 (Array (_ BitVec 32) (_ BitVec 64))) (size!48566 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99480)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12256 0))(
  ( (MissingZero!12256 (index!51416 (_ BitVec 32))) (Found!12256 (index!51417 (_ BitVec 32))) (Intermediate!12256 (undefined!13068 Bool) (index!51418 (_ BitVec 32)) (x!132996 (_ BitVec 32))) (Undefined!12256) (MissingVacant!12256 (index!51419 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99480 (_ BitVec 32)) SeekEntryResult!12256)

(assert (=> b!1484107 (= res!1008917 (= (seekEntryOrOpen!0 (select (arr!48016 a!2862) j!93) a!2862 mask!2687) (Found!12256 j!93)))))

(declare-fun b!1484109 () Bool)

(declare-fun res!1008923 () Bool)

(declare-fun e!832122 () Bool)

(assert (=> b!1484109 (=> (not res!1008923) (not e!832122))))

(declare-fun e!832123 () Bool)

(assert (=> b!1484109 (= res!1008923 e!832123)))

(declare-fun c!137118 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1484109 (= c!137118 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!647654 () array!99480)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1484110 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lt!647653 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99480 (_ BitVec 32)) SeekEntryResult!12256)

(assert (=> b!1484110 (= e!832123 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647653 lt!647654 mask!2687) (seekEntryOrOpen!0 lt!647653 lt!647654 mask!2687)))))

(declare-fun b!1484111 () Bool)

(declare-fun res!1008926 () Bool)

(declare-fun e!832127 () Bool)

(assert (=> b!1484111 (=> (not res!1008926) (not e!832127))))

(declare-fun lt!647652 () SeekEntryResult!12256)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99480 (_ BitVec 32)) SeekEntryResult!12256)

(assert (=> b!1484111 (= res!1008926 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48016 a!2862) j!93) a!2862 mask!2687) lt!647652))))

(declare-fun b!1484112 () Bool)

(declare-fun e!832126 () Bool)

(assert (=> b!1484112 (= e!832122 (not e!832126))))

(declare-fun res!1008927 () Bool)

(assert (=> b!1484112 (=> res!1008927 e!832126)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1484112 (= res!1008927 (or (and (= (select (arr!48016 a!2862) index!646) (select (store (arr!48016 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48016 a!2862) index!646) (select (arr!48016 a!2862) j!93))) (= (select (arr!48016 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484112 e!832119))

(declare-fun res!1008920 () Bool)

(assert (=> b!1484112 (=> (not res!1008920) (not e!832119))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99480 (_ BitVec 32)) Bool)

(assert (=> b!1484112 (= res!1008920 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49852 0))(
  ( (Unit!49853) )
))
(declare-fun lt!647650 () Unit!49852)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99480 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49852)

(assert (=> b!1484112 (= lt!647650 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun lt!647649 () SeekEntryResult!12256)

(declare-fun b!1484113 () Bool)

(assert (=> b!1484113 (= e!832123 (= lt!647649 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!647653 lt!647654 mask!2687)))))

(declare-fun b!1484114 () Bool)

(declare-fun res!1008924 () Bool)

(declare-fun e!832120 () Bool)

(assert (=> b!1484114 (=> (not res!1008924) (not e!832120))))

(assert (=> b!1484114 (= res!1008924 (and (= (size!48566 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48566 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48566 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1484115 () Bool)

(declare-fun res!1008918 () Bool)

(assert (=> b!1484115 (=> (not res!1008918) (not e!832122))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1484115 (= res!1008918 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1484116 () Bool)

(declare-fun e!832121 () Bool)

(assert (=> b!1484116 (= e!832120 e!832121)))

(declare-fun res!1008934 () Bool)

(assert (=> b!1484116 (=> (not res!1008934) (not e!832121))))

(assert (=> b!1484116 (= res!1008934 (= (select (store (arr!48016 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1484116 (= lt!647654 (array!99481 (store (arr!48016 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48566 a!2862)))))

(declare-fun b!1484117 () Bool)

(declare-fun res!1008932 () Bool)

(assert (=> b!1484117 (=> (not res!1008932) (not e!832120))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1484117 (= res!1008932 (validKeyInArray!0 (select (arr!48016 a!2862) j!93)))))

(declare-fun b!1484118 () Bool)

(declare-fun e!832124 () Bool)

(assert (=> b!1484118 (= e!832119 e!832124)))

(declare-fun res!1008931 () Bool)

(assert (=> b!1484118 (=> res!1008931 e!832124)))

(declare-fun lt!647655 () (_ BitVec 64))

(assert (=> b!1484118 (= res!1008931 (or (and (= (select (arr!48016 a!2862) index!646) lt!647655) (= (select (arr!48016 a!2862) index!646) (select (arr!48016 a!2862) j!93))) (= (select (arr!48016 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1484118 (= lt!647655 (select (store (arr!48016 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1484119 () Bool)

(assert (=> b!1484119 (= e!832126 true)))

(declare-fun lt!647651 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484119 (= lt!647651 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1484108 () Bool)

(declare-fun res!1008933 () Bool)

(assert (=> b!1484108 (=> (not res!1008933) (not e!832119))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1484108 (= res!1008933 (or (= (select (arr!48016 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48016 a!2862) intermediateBeforeIndex!19) (select (arr!48016 a!2862) j!93))))))

(declare-fun res!1008930 () Bool)

(assert (=> start!126518 (=> (not res!1008930) (not e!832120))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126518 (= res!1008930 (validMask!0 mask!2687))))

(assert (=> start!126518 e!832120))

(assert (=> start!126518 true))

(declare-fun array_inv!37044 (array!99480) Bool)

(assert (=> start!126518 (array_inv!37044 a!2862)))

(declare-fun b!1484120 () Bool)

(assert (=> b!1484120 (= e!832121 e!832127)))

(declare-fun res!1008922 () Bool)

(assert (=> b!1484120 (=> (not res!1008922) (not e!832127))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1484120 (= res!1008922 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48016 a!2862) j!93) mask!2687) (select (arr!48016 a!2862) j!93) a!2862 mask!2687) lt!647652))))

(assert (=> b!1484120 (= lt!647652 (Intermediate!12256 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1484121 () Bool)

(declare-fun e!832125 () Bool)

(assert (=> b!1484121 (= e!832125 (= (seekEntryOrOpen!0 lt!647653 lt!647654 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!647653 lt!647654 mask!2687)))))

(declare-fun b!1484122 () Bool)

(declare-fun res!1008916 () Bool)

(assert (=> b!1484122 (=> (not res!1008916) (not e!832120))))

(assert (=> b!1484122 (= res!1008916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1484123 () Bool)

(assert (=> b!1484123 (= e!832127 e!832122)))

(declare-fun res!1008929 () Bool)

(assert (=> b!1484123 (=> (not res!1008929) (not e!832122))))

(assert (=> b!1484123 (= res!1008929 (= lt!647649 (Intermediate!12256 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1484123 (= lt!647649 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!647653 mask!2687) lt!647653 lt!647654 mask!2687))))

(assert (=> b!1484123 (= lt!647653 (select (store (arr!48016 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1484124 () Bool)

(assert (=> b!1484124 (= e!832124 e!832125)))

(declare-fun res!1008928 () Bool)

(assert (=> b!1484124 (=> (not res!1008928) (not e!832125))))

(assert (=> b!1484124 (= res!1008928 (and (= index!646 intermediateAfterIndex!19) (= lt!647655 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1484125 () Bool)

(declare-fun res!1008921 () Bool)

(assert (=> b!1484125 (=> (not res!1008921) (not e!832120))))

(assert (=> b!1484125 (= res!1008921 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48566 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48566 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48566 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1484126 () Bool)

(declare-fun res!1008919 () Bool)

(assert (=> b!1484126 (=> (not res!1008919) (not e!832120))))

(declare-datatypes ((List!34517 0))(
  ( (Nil!34514) (Cons!34513 (h!35887 (_ BitVec 64)) (t!49211 List!34517)) )
))
(declare-fun arrayNoDuplicates!0 (array!99480 (_ BitVec 32) List!34517) Bool)

(assert (=> b!1484126 (= res!1008919 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34514))))

(declare-fun b!1484127 () Bool)

(declare-fun res!1008925 () Bool)

(assert (=> b!1484127 (=> (not res!1008925) (not e!832120))))

(assert (=> b!1484127 (= res!1008925 (validKeyInArray!0 (select (arr!48016 a!2862) i!1006)))))

(assert (= (and start!126518 res!1008930) b!1484114))

(assert (= (and b!1484114 res!1008924) b!1484127))

(assert (= (and b!1484127 res!1008925) b!1484117))

(assert (= (and b!1484117 res!1008932) b!1484122))

(assert (= (and b!1484122 res!1008916) b!1484126))

(assert (= (and b!1484126 res!1008919) b!1484125))

(assert (= (and b!1484125 res!1008921) b!1484116))

(assert (= (and b!1484116 res!1008934) b!1484120))

(assert (= (and b!1484120 res!1008922) b!1484111))

(assert (= (and b!1484111 res!1008926) b!1484123))

(assert (= (and b!1484123 res!1008929) b!1484109))

(assert (= (and b!1484109 c!137118) b!1484113))

(assert (= (and b!1484109 (not c!137118)) b!1484110))

(assert (= (and b!1484109 res!1008923) b!1484115))

(assert (= (and b!1484115 res!1008918) b!1484112))

(assert (= (and b!1484112 res!1008920) b!1484107))

(assert (= (and b!1484107 res!1008917) b!1484108))

(assert (= (and b!1484108 res!1008933) b!1484118))

(assert (= (and b!1484118 (not res!1008931)) b!1484124))

(assert (= (and b!1484124 res!1008928) b!1484121))

(assert (= (and b!1484112 (not res!1008927)) b!1484119))

(declare-fun m!1369473 () Bool)

(assert (=> b!1484122 m!1369473))

(declare-fun m!1369475 () Bool)

(assert (=> b!1484121 m!1369475))

(declare-fun m!1369477 () Bool)

(assert (=> b!1484121 m!1369477))

(declare-fun m!1369479 () Bool)

(assert (=> b!1484113 m!1369479))

(declare-fun m!1369481 () Bool)

(assert (=> b!1484126 m!1369481))

(declare-fun m!1369483 () Bool)

(assert (=> b!1484108 m!1369483))

(declare-fun m!1369485 () Bool)

(assert (=> b!1484108 m!1369485))

(assert (=> b!1484120 m!1369485))

(assert (=> b!1484120 m!1369485))

(declare-fun m!1369487 () Bool)

(assert (=> b!1484120 m!1369487))

(assert (=> b!1484120 m!1369487))

(assert (=> b!1484120 m!1369485))

(declare-fun m!1369489 () Bool)

(assert (=> b!1484120 m!1369489))

(declare-fun m!1369491 () Bool)

(assert (=> b!1484116 m!1369491))

(declare-fun m!1369493 () Bool)

(assert (=> b!1484116 m!1369493))

(assert (=> b!1484117 m!1369485))

(assert (=> b!1484117 m!1369485))

(declare-fun m!1369495 () Bool)

(assert (=> b!1484117 m!1369495))

(assert (=> b!1484107 m!1369485))

(assert (=> b!1484107 m!1369485))

(declare-fun m!1369497 () Bool)

(assert (=> b!1484107 m!1369497))

(declare-fun m!1369499 () Bool)

(assert (=> b!1484118 m!1369499))

(assert (=> b!1484118 m!1369485))

(assert (=> b!1484118 m!1369491))

(declare-fun m!1369501 () Bool)

(assert (=> b!1484118 m!1369501))

(declare-fun m!1369503 () Bool)

(assert (=> b!1484119 m!1369503))

(declare-fun m!1369505 () Bool)

(assert (=> start!126518 m!1369505))

(declare-fun m!1369507 () Bool)

(assert (=> start!126518 m!1369507))

(declare-fun m!1369509 () Bool)

(assert (=> b!1484112 m!1369509))

(assert (=> b!1484112 m!1369491))

(assert (=> b!1484112 m!1369501))

(assert (=> b!1484112 m!1369499))

(declare-fun m!1369511 () Bool)

(assert (=> b!1484112 m!1369511))

(assert (=> b!1484112 m!1369485))

(declare-fun m!1369513 () Bool)

(assert (=> b!1484123 m!1369513))

(assert (=> b!1484123 m!1369513))

(declare-fun m!1369515 () Bool)

(assert (=> b!1484123 m!1369515))

(assert (=> b!1484123 m!1369491))

(declare-fun m!1369517 () Bool)

(assert (=> b!1484123 m!1369517))

(declare-fun m!1369519 () Bool)

(assert (=> b!1484127 m!1369519))

(assert (=> b!1484127 m!1369519))

(declare-fun m!1369521 () Bool)

(assert (=> b!1484127 m!1369521))

(assert (=> b!1484111 m!1369485))

(assert (=> b!1484111 m!1369485))

(declare-fun m!1369523 () Bool)

(assert (=> b!1484111 m!1369523))

(assert (=> b!1484110 m!1369477))

(assert (=> b!1484110 m!1369475))

(push 1)

