; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!126456 () Bool)

(assert start!126456)

(declare-fun b!1479494 () Bool)

(declare-fun res!1004494 () Bool)

(declare-fun e!830085 () Bool)

(assert (=> b!1479494 (=> (not res!1004494) (not e!830085))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12111 0))(
  ( (MissingZero!12111 (index!50836 (_ BitVec 32))) (Found!12111 (index!50837 (_ BitVec 32))) (Intermediate!12111 (undefined!12923 Bool) (index!50838 (_ BitVec 32)) (x!132615 (_ BitVec 32))) (Undefined!12111) (MissingVacant!12111 (index!50839 (_ BitVec 32))) )
))
(declare-fun lt!646102 () SeekEntryResult!12111)

(declare-datatypes ((array!99400 0))(
  ( (array!99401 (arr!47974 (Array (_ BitVec 32) (_ BitVec 64))) (size!48525 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99400)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99400 (_ BitVec 32)) SeekEntryResult!12111)

(assert (=> b!1479494 (= res!1004494 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47974 a!2862) j!93) a!2862 mask!2687) lt!646102))))

(declare-fun b!1479495 () Bool)

(declare-fun e!830081 () Bool)

(declare-fun e!830086 () Bool)

(assert (=> b!1479495 (= e!830081 e!830086)))

(declare-fun res!1004498 () Bool)

(assert (=> b!1479495 (=> (not res!1004498) (not e!830086))))

(declare-fun lt!646104 () SeekEntryResult!12111)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99400 (_ BitVec 32)) SeekEntryResult!12111)

(assert (=> b!1479495 (= res!1004498 (= lt!646104 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47974 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479496 () Bool)

(declare-fun e!830087 () Bool)

(assert (=> b!1479496 (= e!830085 e!830087)))

(declare-fun res!1004497 () Bool)

(assert (=> b!1479496 (=> (not res!1004497) (not e!830087))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun lt!646103 () SeekEntryResult!12111)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1479496 (= res!1004497 (= lt!646103 (Intermediate!12111 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!646100 () (_ BitVec 64))

(declare-fun lt!646101 () array!99400)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479496 (= lt!646103 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646100 mask!2687) lt!646100 lt!646101 mask!2687))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479496 (= lt!646100 (select (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479497 () Bool)

(assert (=> b!1479497 (= e!830087 (not true))))

(declare-fun e!830080 () Bool)

(assert (=> b!1479497 e!830080))

(declare-fun res!1004485 () Bool)

(assert (=> b!1479497 (=> (not res!1004485) (not e!830080))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1479497 (= res!1004485 (and (= lt!646104 (Found!12111 j!93)) (or (= (select (arr!47974 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47974 a!2862) intermediateBeforeIndex!19) (select (arr!47974 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99400 (_ BitVec 32)) SeekEntryResult!12111)

(assert (=> b!1479497 (= lt!646104 (seekEntryOrOpen!0 (select (arr!47974 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99400 (_ BitVec 32)) Bool)

(assert (=> b!1479497 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49595 0))(
  ( (Unit!49596) )
))
(declare-fun lt!646105 () Unit!49595)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49595)

(assert (=> b!1479497 (= lt!646105 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479498 () Bool)

(declare-fun res!1004492 () Bool)

(declare-fun e!830082 () Bool)

(assert (=> b!1479498 (=> (not res!1004492) (not e!830082))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479498 (= res!1004492 (validKeyInArray!0 (select (arr!47974 a!2862) j!93)))))

(declare-fun res!1004493 () Bool)

(assert (=> start!126456 (=> (not res!1004493) (not e!830082))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126456 (= res!1004493 (validMask!0 mask!2687))))

(assert (=> start!126456 e!830082))

(assert (=> start!126456 true))

(declare-fun array_inv!37255 (array!99400) Bool)

(assert (=> start!126456 (array_inv!37255 a!2862)))

(declare-fun b!1479499 () Bool)

(assert (=> b!1479499 (= e!830080 e!830081)))

(declare-fun res!1004496 () Bool)

(assert (=> b!1479499 (=> res!1004496 e!830081)))

(assert (=> b!1479499 (= res!1004496 (or (and (= (select (arr!47974 a!2862) index!646) (select (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47974 a!2862) index!646) (select (arr!47974 a!2862) j!93))) (not (= (select (arr!47974 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479500 () Bool)

(declare-fun e!830083 () Bool)

(assert (=> b!1479500 (= e!830083 e!830085)))

(declare-fun res!1004490 () Bool)

(assert (=> b!1479500 (=> (not res!1004490) (not e!830085))))

(assert (=> b!1479500 (= res!1004490 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47974 a!2862) j!93) mask!2687) (select (arr!47974 a!2862) j!93) a!2862 mask!2687) lt!646102))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1479500 (= lt!646102 (Intermediate!12111 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479501 () Bool)

(assert (=> b!1479501 (= e!830086 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun e!830088 () Bool)

(declare-fun b!1479502 () Bool)

(assert (=> b!1479502 (= e!830088 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646100 lt!646101 mask!2687) (seekEntryOrOpen!0 lt!646100 lt!646101 mask!2687)))))

(declare-fun b!1479503 () Bool)

(declare-fun res!1004489 () Bool)

(assert (=> b!1479503 (=> (not res!1004489) (not e!830082))))

(assert (=> b!1479503 (= res!1004489 (validKeyInArray!0 (select (arr!47974 a!2862) i!1006)))))

(declare-fun b!1479504 () Bool)

(declare-fun res!1004486 () Bool)

(assert (=> b!1479504 (=> (not res!1004486) (not e!830087))))

(assert (=> b!1479504 (= res!1004486 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479505 () Bool)

(assert (=> b!1479505 (= e!830088 (= lt!646103 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646100 lt!646101 mask!2687)))))

(declare-fun b!1479506 () Bool)

(declare-fun res!1004495 () Bool)

(assert (=> b!1479506 (=> (not res!1004495) (not e!830082))))

(assert (=> b!1479506 (= res!1004495 (and (= (size!48525 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48525 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48525 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479507 () Bool)

(declare-fun res!1004487 () Bool)

(assert (=> b!1479507 (=> (not res!1004487) (not e!830087))))

(assert (=> b!1479507 (= res!1004487 e!830088)))

(declare-fun c!137035 () Bool)

(assert (=> b!1479507 (= c!137035 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479508 () Bool)

(declare-fun res!1004488 () Bool)

(assert (=> b!1479508 (=> (not res!1004488) (not e!830082))))

(declare-datatypes ((List!34462 0))(
  ( (Nil!34459) (Cons!34458 (h!35840 (_ BitVec 64)) (t!49148 List!34462)) )
))
(declare-fun arrayNoDuplicates!0 (array!99400 (_ BitVec 32) List!34462) Bool)

(assert (=> b!1479508 (= res!1004488 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34459))))

(declare-fun b!1479509 () Bool)

(assert (=> b!1479509 (= e!830082 e!830083)))

(declare-fun res!1004491 () Bool)

(assert (=> b!1479509 (=> (not res!1004491) (not e!830083))))

(assert (=> b!1479509 (= res!1004491 (= (select (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479509 (= lt!646101 (array!99401 (store (arr!47974 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48525 a!2862)))))

(declare-fun b!1479510 () Bool)

(declare-fun res!1004484 () Bool)

(assert (=> b!1479510 (=> (not res!1004484) (not e!830082))))

(assert (=> b!1479510 (= res!1004484 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479511 () Bool)

(declare-fun res!1004483 () Bool)

(assert (=> b!1479511 (=> (not res!1004483) (not e!830082))))

(assert (=> b!1479511 (= res!1004483 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48525 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48525 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48525 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(assert (= (and start!126456 res!1004493) b!1479506))

(assert (= (and b!1479506 res!1004495) b!1479503))

(assert (= (and b!1479503 res!1004489) b!1479498))

(assert (= (and b!1479498 res!1004492) b!1479510))

(assert (= (and b!1479510 res!1004484) b!1479508))

(assert (= (and b!1479508 res!1004488) b!1479511))

(assert (= (and b!1479511 res!1004483) b!1479509))

(assert (= (and b!1479509 res!1004491) b!1479500))

(assert (= (and b!1479500 res!1004490) b!1479494))

(assert (= (and b!1479494 res!1004494) b!1479496))

(assert (= (and b!1479496 res!1004497) b!1479507))

(assert (= (and b!1479507 c!137035) b!1479505))

(assert (= (and b!1479507 (not c!137035)) b!1479502))

(assert (= (and b!1479507 res!1004487) b!1479504))

(assert (= (and b!1479504 res!1004486) b!1479497))

(assert (= (and b!1479497 res!1004485) b!1479499))

(assert (= (and b!1479499 (not res!1004496)) b!1479495))

(assert (= (and b!1479495 res!1004498) b!1479501))

(declare-fun m!1365409 () Bool)

(assert (=> b!1479494 m!1365409))

(assert (=> b!1479494 m!1365409))

(declare-fun m!1365411 () Bool)

(assert (=> b!1479494 m!1365411))

(declare-fun m!1365413 () Bool)

(assert (=> b!1479509 m!1365413))

(declare-fun m!1365415 () Bool)

(assert (=> b!1479509 m!1365415))

(declare-fun m!1365417 () Bool)

(assert (=> b!1479496 m!1365417))

(assert (=> b!1479496 m!1365417))

(declare-fun m!1365419 () Bool)

(assert (=> b!1479496 m!1365419))

(assert (=> b!1479496 m!1365413))

(declare-fun m!1365421 () Bool)

(assert (=> b!1479496 m!1365421))

(declare-fun m!1365423 () Bool)

(assert (=> b!1479497 m!1365423))

(declare-fun m!1365425 () Bool)

(assert (=> b!1479497 m!1365425))

(assert (=> b!1479497 m!1365409))

(declare-fun m!1365427 () Bool)

(assert (=> b!1479497 m!1365427))

(declare-fun m!1365429 () Bool)

(assert (=> b!1479497 m!1365429))

(assert (=> b!1479497 m!1365409))

(declare-fun m!1365431 () Bool)

(assert (=> b!1479508 m!1365431))

(declare-fun m!1365433 () Bool)

(assert (=> b!1479505 m!1365433))

(assert (=> b!1479495 m!1365409))

(assert (=> b!1479495 m!1365409))

(declare-fun m!1365435 () Bool)

(assert (=> b!1479495 m!1365435))

(declare-fun m!1365437 () Bool)

(assert (=> b!1479510 m!1365437))

(declare-fun m!1365439 () Bool)

(assert (=> b!1479503 m!1365439))

(assert (=> b!1479503 m!1365439))

(declare-fun m!1365441 () Bool)

(assert (=> b!1479503 m!1365441))

(declare-fun m!1365443 () Bool)

(assert (=> b!1479502 m!1365443))

(declare-fun m!1365445 () Bool)

(assert (=> b!1479502 m!1365445))

(declare-fun m!1365447 () Bool)

(assert (=> start!126456 m!1365447))

(declare-fun m!1365449 () Bool)

(assert (=> start!126456 m!1365449))

(declare-fun m!1365451 () Bool)

(assert (=> b!1479499 m!1365451))

(assert (=> b!1479499 m!1365413))

(declare-fun m!1365453 () Bool)

(assert (=> b!1479499 m!1365453))

(assert (=> b!1479499 m!1365409))

(assert (=> b!1479498 m!1365409))

(assert (=> b!1479498 m!1365409))

(declare-fun m!1365455 () Bool)

(assert (=> b!1479498 m!1365455))

(assert (=> b!1479500 m!1365409))

(assert (=> b!1479500 m!1365409))

(declare-fun m!1365457 () Bool)

(assert (=> b!1479500 m!1365457))

(assert (=> b!1479500 m!1365457))

(assert (=> b!1479500 m!1365409))

(declare-fun m!1365459 () Bool)

(assert (=> b!1479500 m!1365459))

(check-sat (not b!1479497) (not b!1479498) (not b!1479495) (not b!1479510) (not start!126456) (not b!1479505) (not b!1479496) (not b!1479503) (not b!1479494) (not b!1479508) (not b!1479502) (not b!1479500))
(check-sat)
