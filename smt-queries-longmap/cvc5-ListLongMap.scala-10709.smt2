; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125392 () Bool)

(assert start!125392)

(declare-fun b!1466409 () Bool)

(declare-fun e!823842 () Bool)

(declare-fun e!823847 () Bool)

(assert (=> b!1466409 (= e!823842 e!823847)))

(declare-fun res!995135 () Bool)

(assert (=> b!1466409 (=> (not res!995135) (not e!823847))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11960 0))(
  ( (MissingZero!11960 (index!50232 (_ BitVec 32))) (Found!11960 (index!50233 (_ BitVec 32))) (Intermediate!11960 (undefined!12772 Bool) (index!50234 (_ BitVec 32)) (x!131809 (_ BitVec 32))) (Undefined!11960) (MissingVacant!11960 (index!50235 (_ BitVec 32))) )
))
(declare-fun lt!641741 () SeekEntryResult!11960)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1466409 (= res!995135 (= lt!641741 (Intermediate!11960 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-datatypes ((array!98840 0))(
  ( (array!98841 (arr!47708 (Array (_ BitVec 32) (_ BitVec 64))) (size!48258 (_ BitVec 32))) )
))
(declare-fun lt!641745 () array!98840)

(declare-fun lt!641743 () (_ BitVec 64))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98840 (_ BitVec 32)) SeekEntryResult!11960)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466409 (= lt!641741 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!641743 mask!2687) lt!641743 lt!641745 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98840)

(assert (=> b!1466409 (= lt!641743 (select (store (arr!47708 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1466410 () Bool)

(declare-fun res!995121 () Bool)

(declare-fun e!823849 () Bool)

(assert (=> b!1466410 (=> (not res!995121) (not e!823849))))

(assert (=> b!1466410 (= res!995121 (and (= (size!48258 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48258 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48258 a!2862)) (not (= i!1006 j!93))))))

(declare-fun lt!641744 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1466411 () Bool)

(declare-fun e!823844 () Bool)

(assert (=> b!1466411 (= e!823844 (not (= lt!641741 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641744 lt!641743 lt!641745 mask!2687))))))

(declare-fun b!1466412 () Bool)

(declare-fun res!995126 () Bool)

(declare-fun e!823843 () Bool)

(assert (=> b!1466412 (=> res!995126 e!823843)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1466412 (= res!995126 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1466413 () Bool)

(declare-fun res!995136 () Bool)

(assert (=> b!1466413 (=> (not res!995136) (not e!823849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1466413 (= res!995136 (validKeyInArray!0 (select (arr!47708 a!2862) i!1006)))))

(declare-fun b!1466414 () Bool)

(declare-fun res!995130 () Bool)

(assert (=> b!1466414 (=> (not res!995130) (not e!823847))))

(assert (=> b!1466414 (= res!995130 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1466415 () Bool)

(declare-fun e!823848 () Bool)

(assert (=> b!1466415 (= e!823847 (not e!823848))))

(declare-fun res!995134 () Bool)

(assert (=> b!1466415 (=> res!995134 e!823848)))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1466415 (= res!995134 (or (and (= (select (arr!47708 a!2862) index!646) (select (store (arr!47708 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47708 a!2862) index!646) (select (arr!47708 a!2862) j!93))) (= (select (arr!47708 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(declare-fun lt!641747 () SeekEntryResult!11960)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1466415 (and (= lt!641747 (Found!11960 j!93)) (or (= (select (arr!47708 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47708 a!2862) intermediateBeforeIndex!19) (select (arr!47708 a!2862) j!93))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98840 (_ BitVec 32)) SeekEntryResult!11960)

(assert (=> b!1466415 (= lt!641747 (seekEntryOrOpen!0 (select (arr!47708 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98840 (_ BitVec 32)) Bool)

(assert (=> b!1466415 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49416 0))(
  ( (Unit!49417) )
))
(declare-fun lt!641742 () Unit!49416)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49416)

(assert (=> b!1466415 (= lt!641742 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1466416 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98840 (_ BitVec 32)) SeekEntryResult!11960)

(assert (=> b!1466416 (= e!823844 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641744 intermediateAfterIndex!19 lt!641743 lt!641745 mask!2687) (seekEntryOrOpen!0 lt!641743 lt!641745 mask!2687))))))

(declare-fun b!1466417 () Bool)

(declare-fun res!995131 () Bool)

(assert (=> b!1466417 (=> (not res!995131) (not e!823842))))

(declare-fun lt!641748 () SeekEntryResult!11960)

(assert (=> b!1466417 (= res!995131 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47708 a!2862) j!93) a!2862 mask!2687) lt!641748))))

(declare-fun b!1466418 () Bool)

(assert (=> b!1466418 (= e!823843 true)))

(assert (=> b!1466418 (= lt!641747 (seekEntryOrOpen!0 lt!641743 lt!641745 mask!2687))))

(declare-fun lt!641746 () Unit!49416)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!98840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49416)

(assert (=> b!1466418 (= lt!641746 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!641744 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1466419 () Bool)

(declare-fun res!995137 () Bool)

(assert (=> b!1466419 (=> (not res!995137) (not e!823847))))

(declare-fun e!823845 () Bool)

(assert (=> b!1466419 (= res!995137 e!823845)))

(declare-fun c!135156 () Bool)

(assert (=> b!1466419 (= c!135156 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1466420 () Bool)

(declare-fun res!995133 () Bool)

(assert (=> b!1466420 (=> (not res!995133) (not e!823849))))

(assert (=> b!1466420 (= res!995133 (validKeyInArray!0 (select (arr!47708 a!2862) j!93)))))

(declare-fun b!1466421 () Bool)

(declare-fun res!995129 () Bool)

(assert (=> b!1466421 (=> (not res!995129) (not e!823849))))

(assert (=> b!1466421 (= res!995129 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48258 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48258 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48258 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1466422 () Bool)

(assert (=> b!1466422 (= e!823848 e!823843)))

(declare-fun res!995123 () Bool)

(assert (=> b!1466422 (=> res!995123 e!823843)))

(assert (=> b!1466422 (= res!995123 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!641744 #b00000000000000000000000000000000) (bvsge lt!641744 (size!48258 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1466422 (= lt!641744 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1466423 () Bool)

(declare-fun res!995124 () Bool)

(assert (=> b!1466423 (=> (not res!995124) (not e!823849))))

(assert (=> b!1466423 (= res!995124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1466424 () Bool)

(assert (=> b!1466424 (= e!823845 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!641743 lt!641745 mask!2687) (seekEntryOrOpen!0 lt!641743 lt!641745 mask!2687)))))

(declare-fun res!995120 () Bool)

(assert (=> start!125392 (=> (not res!995120) (not e!823849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125392 (= res!995120 (validMask!0 mask!2687))))

(assert (=> start!125392 e!823849))

(assert (=> start!125392 true))

(declare-fun array_inv!36736 (array!98840) Bool)

(assert (=> start!125392 (array_inv!36736 a!2862)))

(declare-fun b!1466425 () Bool)

(declare-fun res!995128 () Bool)

(assert (=> b!1466425 (=> res!995128 e!823843)))

(assert (=> b!1466425 (= res!995128 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!641744 (select (arr!47708 a!2862) j!93) a!2862 mask!2687) lt!641748)))))

(declare-fun b!1466426 () Bool)

(declare-fun e!823850 () Bool)

(assert (=> b!1466426 (= e!823849 e!823850)))

(declare-fun res!995127 () Bool)

(assert (=> b!1466426 (=> (not res!995127) (not e!823850))))

(assert (=> b!1466426 (= res!995127 (= (select (store (arr!47708 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1466426 (= lt!641745 (array!98841 (store (arr!47708 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48258 a!2862)))))

(declare-fun b!1466427 () Bool)

(assert (=> b!1466427 (= e!823845 (= lt!641741 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!641743 lt!641745 mask!2687)))))

(declare-fun b!1466428 () Bool)

(declare-fun res!995132 () Bool)

(assert (=> b!1466428 (=> res!995132 e!823843)))

(assert (=> b!1466428 (= res!995132 e!823844)))

(declare-fun c!135155 () Bool)

(assert (=> b!1466428 (= c!135155 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1466429 () Bool)

(declare-fun res!995125 () Bool)

(assert (=> b!1466429 (=> (not res!995125) (not e!823849))))

(declare-datatypes ((List!34209 0))(
  ( (Nil!34206) (Cons!34205 (h!35555 (_ BitVec 64)) (t!48903 List!34209)) )
))
(declare-fun arrayNoDuplicates!0 (array!98840 (_ BitVec 32) List!34209) Bool)

(assert (=> b!1466429 (= res!995125 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34206))))

(declare-fun b!1466430 () Bool)

(assert (=> b!1466430 (= e!823850 e!823842)))

(declare-fun res!995122 () Bool)

(assert (=> b!1466430 (=> (not res!995122) (not e!823842))))

(assert (=> b!1466430 (= res!995122 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47708 a!2862) j!93) mask!2687) (select (arr!47708 a!2862) j!93) a!2862 mask!2687) lt!641748))))

(assert (=> b!1466430 (= lt!641748 (Intermediate!11960 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!125392 res!995120) b!1466410))

(assert (= (and b!1466410 res!995121) b!1466413))

(assert (= (and b!1466413 res!995136) b!1466420))

(assert (= (and b!1466420 res!995133) b!1466423))

(assert (= (and b!1466423 res!995124) b!1466429))

(assert (= (and b!1466429 res!995125) b!1466421))

(assert (= (and b!1466421 res!995129) b!1466426))

(assert (= (and b!1466426 res!995127) b!1466430))

(assert (= (and b!1466430 res!995122) b!1466417))

(assert (= (and b!1466417 res!995131) b!1466409))

(assert (= (and b!1466409 res!995135) b!1466419))

(assert (= (and b!1466419 c!135156) b!1466427))

(assert (= (and b!1466419 (not c!135156)) b!1466424))

(assert (= (and b!1466419 res!995137) b!1466414))

(assert (= (and b!1466414 res!995130) b!1466415))

(assert (= (and b!1466415 (not res!995134)) b!1466422))

(assert (= (and b!1466422 (not res!995123)) b!1466425))

(assert (= (and b!1466425 (not res!995128)) b!1466428))

(assert (= (and b!1466428 c!135155) b!1466411))

(assert (= (and b!1466428 (not c!135155)) b!1466416))

(assert (= (and b!1466428 (not res!995132)) b!1466412))

(assert (= (and b!1466412 (not res!995126)) b!1466418))

(declare-fun m!1353403 () Bool)

(assert (=> b!1466417 m!1353403))

(assert (=> b!1466417 m!1353403))

(declare-fun m!1353405 () Bool)

(assert (=> b!1466417 m!1353405))

(declare-fun m!1353407 () Bool)

(assert (=> b!1466416 m!1353407))

(declare-fun m!1353409 () Bool)

(assert (=> b!1466416 m!1353409))

(declare-fun m!1353411 () Bool)

(assert (=> b!1466426 m!1353411))

(declare-fun m!1353413 () Bool)

(assert (=> b!1466426 m!1353413))

(declare-fun m!1353415 () Bool)

(assert (=> b!1466409 m!1353415))

(assert (=> b!1466409 m!1353415))

(declare-fun m!1353417 () Bool)

(assert (=> b!1466409 m!1353417))

(assert (=> b!1466409 m!1353411))

(declare-fun m!1353419 () Bool)

(assert (=> b!1466409 m!1353419))

(declare-fun m!1353421 () Bool)

(assert (=> b!1466415 m!1353421))

(assert (=> b!1466415 m!1353411))

(declare-fun m!1353423 () Bool)

(assert (=> b!1466415 m!1353423))

(declare-fun m!1353425 () Bool)

(assert (=> b!1466415 m!1353425))

(declare-fun m!1353427 () Bool)

(assert (=> b!1466415 m!1353427))

(assert (=> b!1466415 m!1353403))

(declare-fun m!1353429 () Bool)

(assert (=> b!1466415 m!1353429))

(declare-fun m!1353431 () Bool)

(assert (=> b!1466415 m!1353431))

(assert (=> b!1466415 m!1353403))

(declare-fun m!1353433 () Bool)

(assert (=> b!1466413 m!1353433))

(assert (=> b!1466413 m!1353433))

(declare-fun m!1353435 () Bool)

(assert (=> b!1466413 m!1353435))

(declare-fun m!1353437 () Bool)

(assert (=> b!1466411 m!1353437))

(declare-fun m!1353439 () Bool)

(assert (=> b!1466424 m!1353439))

(assert (=> b!1466424 m!1353409))

(assert (=> b!1466430 m!1353403))

(assert (=> b!1466430 m!1353403))

(declare-fun m!1353441 () Bool)

(assert (=> b!1466430 m!1353441))

(assert (=> b!1466430 m!1353441))

(assert (=> b!1466430 m!1353403))

(declare-fun m!1353443 () Bool)

(assert (=> b!1466430 m!1353443))

(assert (=> b!1466420 m!1353403))

(assert (=> b!1466420 m!1353403))

(declare-fun m!1353445 () Bool)

(assert (=> b!1466420 m!1353445))

(declare-fun m!1353447 () Bool)

(assert (=> b!1466422 m!1353447))

(declare-fun m!1353449 () Bool)

(assert (=> b!1466429 m!1353449))

(assert (=> b!1466418 m!1353409))

(declare-fun m!1353451 () Bool)

(assert (=> b!1466418 m!1353451))

(declare-fun m!1353453 () Bool)

(assert (=> start!125392 m!1353453))

(declare-fun m!1353455 () Bool)

(assert (=> start!125392 m!1353455))

(declare-fun m!1353457 () Bool)

(assert (=> b!1466427 m!1353457))

(assert (=> b!1466425 m!1353403))

(assert (=> b!1466425 m!1353403))

(declare-fun m!1353459 () Bool)

(assert (=> b!1466425 m!1353459))

(declare-fun m!1353461 () Bool)

(assert (=> b!1466423 m!1353461))

(push 1)

