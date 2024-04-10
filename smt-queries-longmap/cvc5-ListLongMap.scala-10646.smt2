; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125014 () Bool)

(assert start!125014)

(declare-fun b!1454107 () Bool)

(declare-fun e!818379 () Bool)

(declare-fun e!818375 () Bool)

(assert (=> b!1454107 (= e!818379 e!818375)))

(declare-fun res!985026 () Bool)

(assert (=> b!1454107 (=> (not res!985026) (not e!818375))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-datatypes ((array!98462 0))(
  ( (array!98463 (arr!47519 (Array (_ BitVec 32) (_ BitVec 64))) (size!48069 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98462)

(assert (=> b!1454107 (= res!985026 (= (select (store (arr!47519 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!637473 () array!98462)

(assert (=> b!1454107 (= lt!637473 (array!98463 (store (arr!47519 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48069 a!2862)))))

(declare-fun b!1454108 () Bool)

(declare-fun res!985027 () Bool)

(assert (=> b!1454108 (=> (not res!985027) (not e!818379))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1454108 (= res!985027 (validKeyInArray!0 (select (arr!47519 a!2862) j!93)))))

(declare-fun b!1454109 () Bool)

(declare-datatypes ((SeekEntryResult!11771 0))(
  ( (MissingZero!11771 (index!49476 (_ BitVec 32))) (Found!11771 (index!49477 (_ BitVec 32))) (Intermediate!11771 (undefined!12583 Bool) (index!49478 (_ BitVec 32)) (x!131116 (_ BitVec 32))) (Undefined!11771) (MissingVacant!11771 (index!49479 (_ BitVec 32))) )
))
(declare-fun lt!637466 () SeekEntryResult!11771)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun e!818378 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!637468 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98462 (_ BitVec 32)) SeekEntryResult!11771)

(assert (=> b!1454109 (= e!818378 (= lt!637466 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!637468 lt!637473 mask!2687)))))

(declare-fun e!818372 () Bool)

(declare-fun b!1454110 () Bool)

(declare-fun lt!637472 () SeekEntryResult!11771)

(declare-fun lt!637469 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98462 (_ BitVec 32)) SeekEntryResult!11771)

(assert (=> b!1454110 (= e!818372 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637469 intermediateAfterIndex!19 lt!637468 lt!637473 mask!2687) lt!637472)))))

(declare-fun b!1454111 () Bool)

(declare-fun res!985019 () Bool)

(declare-fun e!818380 () Bool)

(assert (=> b!1454111 (=> (not res!985019) (not e!818380))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1454111 (= res!985019 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1454112 () Bool)

(declare-fun e!818373 () Bool)

(assert (=> b!1454112 (= e!818373 e!818380)))

(declare-fun res!985030 () Bool)

(assert (=> b!1454112 (=> (not res!985030) (not e!818380))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1454112 (= res!985030 (= lt!637466 (Intermediate!11771 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454112 (= lt!637466 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!637468 mask!2687) lt!637468 lt!637473 mask!2687))))

(assert (=> b!1454112 (= lt!637468 (select (store (arr!47519 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun e!818376 () Bool)

(declare-fun b!1454113 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1454113 (= e!818376 (and (or (= (select (arr!47519 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47519 a!2862) intermediateBeforeIndex!19) (select (arr!47519 a!2862) j!93))) (let ((bdg!53035 (select (store (arr!47519 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (or (and (= (select (arr!47519 a!2862) index!646) bdg!53035) (= (select (arr!47519 a!2862) index!646) (select (arr!47519 a!2862) j!93))) (= (select (arr!47519 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= bdg!53035 #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun res!985028 () Bool)

(assert (=> start!125014 (=> (not res!985028) (not e!818379))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125014 (= res!985028 (validMask!0 mask!2687))))

(assert (=> start!125014 e!818379))

(assert (=> start!125014 true))

(declare-fun array_inv!36547 (array!98462) Bool)

(assert (=> start!125014 (array_inv!36547 a!2862)))

(declare-fun b!1454106 () Bool)

(declare-fun res!985013 () Bool)

(assert (=> b!1454106 (=> (not res!985013) (not e!818379))))

(declare-datatypes ((List!34020 0))(
  ( (Nil!34017) (Cons!34016 (h!35366 (_ BitVec 64)) (t!48714 List!34020)) )
))
(declare-fun arrayNoDuplicates!0 (array!98462 (_ BitVec 32) List!34020) Bool)

(assert (=> b!1454106 (= res!985013 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34017))))

(declare-fun b!1454114 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98462 (_ BitVec 32)) SeekEntryResult!11771)

(assert (=> b!1454114 (= e!818378 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637468 lt!637473 mask!2687) (seekEntryOrOpen!0 lt!637468 lt!637473 mask!2687)))))

(declare-fun b!1454115 () Bool)

(declare-fun res!985015 () Bool)

(assert (=> b!1454115 (=> (not res!985015) (not e!818376))))

(assert (=> b!1454115 (= res!985015 (= (seekEntryOrOpen!0 (select (arr!47519 a!2862) j!93) a!2862 mask!2687) (Found!11771 j!93)))))

(declare-fun b!1454116 () Bool)

(declare-fun res!985016 () Bool)

(assert (=> b!1454116 (=> (not res!985016) (not e!818373))))

(declare-fun lt!637471 () SeekEntryResult!11771)

(assert (=> b!1454116 (= res!985016 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47519 a!2862) j!93) a!2862 mask!2687) lt!637471))))

(declare-fun b!1454117 () Bool)

(declare-fun res!985029 () Bool)

(assert (=> b!1454117 (=> (not res!985029) (not e!818380))))

(assert (=> b!1454117 (= res!985029 e!818378)))

(declare-fun c!134057 () Bool)

(assert (=> b!1454117 (= c!134057 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1454118 () Bool)

(assert (=> b!1454118 (= e!818375 e!818373)))

(declare-fun res!985023 () Bool)

(assert (=> b!1454118 (=> (not res!985023) (not e!818373))))

(assert (=> b!1454118 (= res!985023 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47519 a!2862) j!93) mask!2687) (select (arr!47519 a!2862) j!93) a!2862 mask!2687) lt!637471))))

(assert (=> b!1454118 (= lt!637471 (Intermediate!11771 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1454119 () Bool)

(declare-fun res!985024 () Bool)

(assert (=> b!1454119 (=> (not res!985024) (not e!818379))))

(assert (=> b!1454119 (= res!985024 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48069 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48069 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48069 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1454120 () Bool)

(declare-fun res!985017 () Bool)

(assert (=> b!1454120 (=> (not res!985017) (not e!818379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98462 (_ BitVec 32)) Bool)

(assert (=> b!1454120 (= res!985017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1454121 () Bool)

(declare-fun res!985018 () Bool)

(declare-fun e!818374 () Bool)

(assert (=> b!1454121 (=> res!985018 e!818374)))

(assert (=> b!1454121 (= res!985018 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637469 (select (arr!47519 a!2862) j!93) a!2862 mask!2687) lt!637471)))))

(declare-fun b!1454122 () Bool)

(assert (=> b!1454122 (= e!818374 true)))

(declare-fun lt!637470 () Bool)

(assert (=> b!1454122 (= lt!637470 e!818372)))

(declare-fun c!134058 () Bool)

(assert (=> b!1454122 (= c!134058 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1454123 () Bool)

(declare-fun e!818377 () Bool)

(assert (=> b!1454123 (= e!818377 e!818374)))

(declare-fun res!985014 () Bool)

(assert (=> b!1454123 (=> res!985014 e!818374)))

(assert (=> b!1454123 (= res!985014 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!637469 #b00000000000000000000000000000000) (bvsge lt!637469 (size!48069 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1454123 (= lt!637469 (nextIndex!0 index!646 x!665 mask!2687))))

(assert (=> b!1454123 (= lt!637472 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!637468 lt!637473 mask!2687))))

(assert (=> b!1454123 (= lt!637472 (seekEntryOrOpen!0 lt!637468 lt!637473 mask!2687))))

(declare-fun b!1454124 () Bool)

(assert (=> b!1454124 (= e!818380 (not e!818377))))

(declare-fun res!985025 () Bool)

(assert (=> b!1454124 (=> res!985025 e!818377)))

(assert (=> b!1454124 (= res!985025 (or (and (= (select (arr!47519 a!2862) index!646) (select (store (arr!47519 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47519 a!2862) index!646) (select (arr!47519 a!2862) j!93))) (= (select (arr!47519 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1454124 e!818376))

(declare-fun res!985021 () Bool)

(assert (=> b!1454124 (=> (not res!985021) (not e!818376))))

(assert (=> b!1454124 (= res!985021 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49038 0))(
  ( (Unit!49039) )
))
(declare-fun lt!637467 () Unit!49038)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98462 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49038)

(assert (=> b!1454124 (= lt!637467 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1454125 () Bool)

(declare-fun res!985022 () Bool)

(assert (=> b!1454125 (=> (not res!985022) (not e!818379))))

(assert (=> b!1454125 (= res!985022 (validKeyInArray!0 (select (arr!47519 a!2862) i!1006)))))

(declare-fun b!1454126 () Bool)

(declare-fun res!985020 () Bool)

(assert (=> b!1454126 (=> (not res!985020) (not e!818379))))

(assert (=> b!1454126 (= res!985020 (and (= (size!48069 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48069 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48069 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1454127 () Bool)

(assert (=> b!1454127 (= e!818372 (not (= lt!637466 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!637469 lt!637468 lt!637473 mask!2687))))))

(assert (= (and start!125014 res!985028) b!1454126))

(assert (= (and b!1454126 res!985020) b!1454125))

(assert (= (and b!1454125 res!985022) b!1454108))

(assert (= (and b!1454108 res!985027) b!1454120))

(assert (= (and b!1454120 res!985017) b!1454106))

(assert (= (and b!1454106 res!985013) b!1454119))

(assert (= (and b!1454119 res!985024) b!1454107))

(assert (= (and b!1454107 res!985026) b!1454118))

(assert (= (and b!1454118 res!985023) b!1454116))

(assert (= (and b!1454116 res!985016) b!1454112))

(assert (= (and b!1454112 res!985030) b!1454117))

(assert (= (and b!1454117 c!134057) b!1454109))

(assert (= (and b!1454117 (not c!134057)) b!1454114))

(assert (= (and b!1454117 res!985029) b!1454111))

(assert (= (and b!1454111 res!985019) b!1454124))

(assert (= (and b!1454124 res!985021) b!1454115))

(assert (= (and b!1454115 res!985015) b!1454113))

(assert (= (and b!1454124 (not res!985025)) b!1454123))

(assert (= (and b!1454123 (not res!985014)) b!1454121))

(assert (= (and b!1454121 (not res!985018)) b!1454122))

(assert (= (and b!1454122 c!134058) b!1454127))

(assert (= (and b!1454122 (not c!134058)) b!1454110))

(declare-fun m!1342489 () Bool)

(assert (=> start!125014 m!1342489))

(declare-fun m!1342491 () Bool)

(assert (=> start!125014 m!1342491))

(declare-fun m!1342493 () Bool)

(assert (=> b!1454112 m!1342493))

(assert (=> b!1454112 m!1342493))

(declare-fun m!1342495 () Bool)

(assert (=> b!1454112 m!1342495))

(declare-fun m!1342497 () Bool)

(assert (=> b!1454112 m!1342497))

(declare-fun m!1342499 () Bool)

(assert (=> b!1454112 m!1342499))

(declare-fun m!1342501 () Bool)

(assert (=> b!1454108 m!1342501))

(assert (=> b!1454108 m!1342501))

(declare-fun m!1342503 () Bool)

(assert (=> b!1454108 m!1342503))

(assert (=> b!1454113 m!1342497))

(declare-fun m!1342505 () Bool)

(assert (=> b!1454113 m!1342505))

(declare-fun m!1342507 () Bool)

(assert (=> b!1454113 m!1342507))

(declare-fun m!1342509 () Bool)

(assert (=> b!1454113 m!1342509))

(assert (=> b!1454113 m!1342501))

(assert (=> b!1454116 m!1342501))

(assert (=> b!1454116 m!1342501))

(declare-fun m!1342511 () Bool)

(assert (=> b!1454116 m!1342511))

(assert (=> b!1454121 m!1342501))

(assert (=> b!1454121 m!1342501))

(declare-fun m!1342513 () Bool)

(assert (=> b!1454121 m!1342513))

(declare-fun m!1342515 () Bool)

(assert (=> b!1454124 m!1342515))

(assert (=> b!1454124 m!1342497))

(assert (=> b!1454124 m!1342507))

(assert (=> b!1454124 m!1342509))

(declare-fun m!1342517 () Bool)

(assert (=> b!1454124 m!1342517))

(assert (=> b!1454124 m!1342501))

(declare-fun m!1342519 () Bool)

(assert (=> b!1454114 m!1342519))

(declare-fun m!1342521 () Bool)

(assert (=> b!1454114 m!1342521))

(assert (=> b!1454118 m!1342501))

(assert (=> b!1454118 m!1342501))

(declare-fun m!1342523 () Bool)

(assert (=> b!1454118 m!1342523))

(assert (=> b!1454118 m!1342523))

(assert (=> b!1454118 m!1342501))

(declare-fun m!1342525 () Bool)

(assert (=> b!1454118 m!1342525))

(declare-fun m!1342527 () Bool)

(assert (=> b!1454110 m!1342527))

(declare-fun m!1342529 () Bool)

(assert (=> b!1454127 m!1342529))

(declare-fun m!1342531 () Bool)

(assert (=> b!1454125 m!1342531))

(assert (=> b!1454125 m!1342531))

(declare-fun m!1342533 () Bool)

(assert (=> b!1454125 m!1342533))

(declare-fun m!1342535 () Bool)

(assert (=> b!1454106 m!1342535))

(declare-fun m!1342537 () Bool)

(assert (=> b!1454123 m!1342537))

(assert (=> b!1454123 m!1342519))

(assert (=> b!1454123 m!1342521))

(declare-fun m!1342539 () Bool)

(assert (=> b!1454109 m!1342539))

(declare-fun m!1342541 () Bool)

(assert (=> b!1454120 m!1342541))

(assert (=> b!1454107 m!1342497))

(declare-fun m!1342543 () Bool)

(assert (=> b!1454107 m!1342543))

(assert (=> b!1454115 m!1342501))

(assert (=> b!1454115 m!1342501))

(declare-fun m!1342545 () Bool)

(assert (=> b!1454115 m!1342545))

(push 1)

