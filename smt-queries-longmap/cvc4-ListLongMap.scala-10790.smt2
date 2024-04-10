; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126242 () Bool)

(assert start!126242)

(declare-fun e!829907 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1479539 () Bool)

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1479539 (= e!829907 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1479540 () Bool)

(declare-fun res!1005449 () Bool)

(declare-fun e!829899 () Bool)

(assert (=> b!1479540 (=> (not res!1005449) (not e!829899))))

(declare-datatypes ((array!99348 0))(
  ( (array!99349 (arr!47953 (Array (_ BitVec 32) (_ BitVec 64))) (size!48503 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99348)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1479540 (= res!1005449 (validKeyInArray!0 (select (arr!47953 a!2862) j!93)))))

(declare-fun b!1479542 () Bool)

(declare-fun e!829901 () Bool)

(declare-fun e!829898 () Bool)

(assert (=> b!1479542 (= e!829901 e!829898)))

(declare-fun res!1005445 () Bool)

(assert (=> b!1479542 (=> res!1005445 e!829898)))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1479542 (= res!1005445 (or (and (= (select (arr!47953 a!2862) index!646) (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47953 a!2862) index!646) (select (arr!47953 a!2862) j!93))) (not (= (select (arr!47953 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1479543 () Bool)

(declare-fun e!829905 () Bool)

(assert (=> b!1479543 (= e!829905 true)))

(declare-fun lt!646068 () array!99348)

(declare-fun lt!646064 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!12193 0))(
  ( (MissingZero!12193 (index!51164 (_ BitVec 32))) (Found!12193 (index!51165 (_ BitVec 32))) (Intermediate!12193 (undefined!13005 Bool) (index!51166 (_ BitVec 32)) (x!132744 (_ BitVec 32))) (Undefined!12193) (MissingVacant!12193 (index!51167 (_ BitVec 32))) )
))
(declare-fun lt!646071 () SeekEntryResult!12193)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99348 (_ BitVec 32)) SeekEntryResult!12193)

(assert (=> b!1479543 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646064 lt!646068 mask!2687) lt!646071)))

(declare-datatypes ((Unit!49726 0))(
  ( (Unit!49727) )
))
(declare-fun lt!646070 () Unit!49726)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!99348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49726)

(assert (=> b!1479543 (= lt!646070 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2862 i!1006 j!93 x!665 index!646 intermediateBeforeIndex!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1479544 () Bool)

(declare-fun e!829904 () Bool)

(declare-fun e!829902 () Bool)

(assert (=> b!1479544 (= e!829904 e!829902)))

(declare-fun res!1005444 () Bool)

(assert (=> b!1479544 (=> (not res!1005444) (not e!829902))))

(declare-fun lt!646067 () SeekEntryResult!12193)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99348 (_ BitVec 32)) SeekEntryResult!12193)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1479544 (= res!1005444 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47953 a!2862) j!93) mask!2687) (select (arr!47953 a!2862) j!93) a!2862 mask!2687) lt!646067))))

(assert (=> b!1479544 (= lt!646067 (Intermediate!12193 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1479545 () Bool)

(declare-fun res!1005436 () Bool)

(assert (=> b!1479545 (=> (not res!1005436) (not e!829899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99348 (_ BitVec 32)) Bool)

(assert (=> b!1479545 (= res!1005436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1479546 () Bool)

(assert (=> b!1479546 (= e!829898 e!829907)))

(declare-fun res!1005443 () Bool)

(assert (=> b!1479546 (=> (not res!1005443) (not e!829907))))

(declare-fun lt!646069 () SeekEntryResult!12193)

(assert (=> b!1479546 (= res!1005443 (= lt!646069 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47953 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1479547 () Bool)

(assert (=> b!1479547 (= e!829899 e!829904)))

(declare-fun res!1005446 () Bool)

(assert (=> b!1479547 (=> (not res!1005446) (not e!829904))))

(assert (=> b!1479547 (= res!1005446 (= (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1479547 (= lt!646068 (array!99349 (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48503 a!2862)))))

(declare-fun b!1479548 () Bool)

(declare-fun res!1005447 () Bool)

(assert (=> b!1479548 (=> (not res!1005447) (not e!829899))))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1479548 (= res!1005447 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48503 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48503 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48503 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1479549 () Bool)

(declare-fun res!1005435 () Bool)

(assert (=> b!1479549 (=> (not res!1005435) (not e!829899))))

(assert (=> b!1479549 (= res!1005435 (and (= (size!48503 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48503 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48503 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1479550 () Bool)

(declare-fun res!1005451 () Bool)

(declare-fun e!829903 () Bool)

(assert (=> b!1479550 (=> (not res!1005451) (not e!829903))))

(assert (=> b!1479550 (= res!1005451 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1479551 () Bool)

(declare-fun res!1005437 () Bool)

(assert (=> b!1479551 (=> (not res!1005437) (not e!829902))))

(assert (=> b!1479551 (= res!1005437 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47953 a!2862) j!93) a!2862 mask!2687) lt!646067))))

(declare-fun b!1479552 () Bool)

(assert (=> b!1479552 (= e!829903 (not e!829905))))

(declare-fun res!1005438 () Bool)

(assert (=> b!1479552 (=> res!1005438 e!829905)))

(assert (=> b!1479552 (= res!1005438 (or (and (= (select (arr!47953 a!2862) index!646) (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47953 a!2862) index!646) (select (arr!47953 a!2862) j!93))) (not (= (select (arr!47953 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47953 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1479552 e!829901))

(declare-fun res!1005450 () Bool)

(assert (=> b!1479552 (=> (not res!1005450) (not e!829901))))

(assert (=> b!1479552 (= res!1005450 (and (= lt!646069 lt!646071) (or (= (select (arr!47953 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47953 a!2862) intermediateBeforeIndex!19) (select (arr!47953 a!2862) j!93)))))))

(assert (=> b!1479552 (= lt!646071 (Found!12193 j!93))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99348 (_ BitVec 32)) SeekEntryResult!12193)

(assert (=> b!1479552 (= lt!646069 (seekEntryOrOpen!0 (select (arr!47953 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1479552 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!646066 () Unit!49726)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99348 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49726)

(assert (=> b!1479552 (= lt!646066 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1479553 () Bool)

(declare-fun res!1005442 () Bool)

(assert (=> b!1479553 (=> (not res!1005442) (not e!829899))))

(assert (=> b!1479553 (= res!1005442 (validKeyInArray!0 (select (arr!47953 a!2862) i!1006)))))

(declare-fun b!1479541 () Bool)

(declare-fun res!1005441 () Bool)

(assert (=> b!1479541 (=> res!1005441 e!829905)))

(assert (=> b!1479541 (= res!1005441 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47953 a!2862) j!93) a!2862 mask!2687) lt!646071)))))

(declare-fun res!1005440 () Bool)

(assert (=> start!126242 (=> (not res!1005440) (not e!829899))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126242 (= res!1005440 (validMask!0 mask!2687))))

(assert (=> start!126242 e!829899))

(assert (=> start!126242 true))

(declare-fun array_inv!36981 (array!99348) Bool)

(assert (=> start!126242 (array_inv!36981 a!2862)))

(declare-fun b!1479554 () Bool)

(declare-fun res!1005439 () Bool)

(assert (=> b!1479554 (=> (not res!1005439) (not e!829903))))

(declare-fun e!829906 () Bool)

(assert (=> b!1479554 (= res!1005439 e!829906)))

(declare-fun c!136572 () Bool)

(assert (=> b!1479554 (= c!136572 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1479555 () Bool)

(assert (=> b!1479555 (= e!829902 e!829903)))

(declare-fun res!1005434 () Bool)

(assert (=> b!1479555 (=> (not res!1005434) (not e!829903))))

(declare-fun lt!646065 () SeekEntryResult!12193)

(assert (=> b!1479555 (= res!1005434 (= lt!646065 (Intermediate!12193 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1479555 (= lt!646065 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!646064 mask!2687) lt!646064 lt!646068 mask!2687))))

(assert (=> b!1479555 (= lt!646064 (select (store (arr!47953 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1479556 () Bool)

(assert (=> b!1479556 (= e!829906 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!646064 lt!646068 mask!2687) (seekEntryOrOpen!0 lt!646064 lt!646068 mask!2687)))))

(declare-fun b!1479557 () Bool)

(assert (=> b!1479557 (= e!829906 (= lt!646065 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!646064 lt!646068 mask!2687)))))

(declare-fun b!1479558 () Bool)

(declare-fun res!1005448 () Bool)

(assert (=> b!1479558 (=> (not res!1005448) (not e!829899))))

(declare-datatypes ((List!34454 0))(
  ( (Nil!34451) (Cons!34450 (h!35818 (_ BitVec 64)) (t!49148 List!34454)) )
))
(declare-fun arrayNoDuplicates!0 (array!99348 (_ BitVec 32) List!34454) Bool)

(assert (=> b!1479558 (= res!1005448 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34451))))

(assert (= (and start!126242 res!1005440) b!1479549))

(assert (= (and b!1479549 res!1005435) b!1479553))

(assert (= (and b!1479553 res!1005442) b!1479540))

(assert (= (and b!1479540 res!1005449) b!1479545))

(assert (= (and b!1479545 res!1005436) b!1479558))

(assert (= (and b!1479558 res!1005448) b!1479548))

(assert (= (and b!1479548 res!1005447) b!1479547))

(assert (= (and b!1479547 res!1005446) b!1479544))

(assert (= (and b!1479544 res!1005444) b!1479551))

(assert (= (and b!1479551 res!1005437) b!1479555))

(assert (= (and b!1479555 res!1005434) b!1479554))

(assert (= (and b!1479554 c!136572) b!1479557))

(assert (= (and b!1479554 (not c!136572)) b!1479556))

(assert (= (and b!1479554 res!1005439) b!1479550))

(assert (= (and b!1479550 res!1005451) b!1479552))

(assert (= (and b!1479552 res!1005450) b!1479542))

(assert (= (and b!1479542 (not res!1005445)) b!1479546))

(assert (= (and b!1479546 res!1005443) b!1479539))

(assert (= (and b!1479552 (not res!1005438)) b!1479541))

(assert (= (and b!1479541 (not res!1005441)) b!1479543))

(declare-fun m!1365401 () Bool)

(assert (=> b!1479543 m!1365401))

(declare-fun m!1365403 () Bool)

(assert (=> b!1479543 m!1365403))

(declare-fun m!1365405 () Bool)

(assert (=> b!1479544 m!1365405))

(assert (=> b!1479544 m!1365405))

(declare-fun m!1365407 () Bool)

(assert (=> b!1479544 m!1365407))

(assert (=> b!1479544 m!1365407))

(assert (=> b!1479544 m!1365405))

(declare-fun m!1365409 () Bool)

(assert (=> b!1479544 m!1365409))

(declare-fun m!1365411 () Bool)

(assert (=> b!1479552 m!1365411))

(declare-fun m!1365413 () Bool)

(assert (=> b!1479552 m!1365413))

(declare-fun m!1365415 () Bool)

(assert (=> b!1479552 m!1365415))

(declare-fun m!1365417 () Bool)

(assert (=> b!1479552 m!1365417))

(declare-fun m!1365419 () Bool)

(assert (=> b!1479552 m!1365419))

(assert (=> b!1479552 m!1365405))

(declare-fun m!1365421 () Bool)

(assert (=> b!1479552 m!1365421))

(declare-fun m!1365423 () Bool)

(assert (=> b!1479552 m!1365423))

(assert (=> b!1479552 m!1365405))

(assert (=> b!1479547 m!1365413))

(declare-fun m!1365425 () Bool)

(assert (=> b!1479547 m!1365425))

(assert (=> b!1479546 m!1365405))

(assert (=> b!1479546 m!1365405))

(declare-fun m!1365427 () Bool)

(assert (=> b!1479546 m!1365427))

(declare-fun m!1365429 () Bool)

(assert (=> b!1479557 m!1365429))

(declare-fun m!1365431 () Bool)

(assert (=> b!1479555 m!1365431))

(assert (=> b!1479555 m!1365431))

(declare-fun m!1365433 () Bool)

(assert (=> b!1479555 m!1365433))

(assert (=> b!1479555 m!1365413))

(declare-fun m!1365435 () Bool)

(assert (=> b!1479555 m!1365435))

(assert (=> b!1479551 m!1365405))

(assert (=> b!1479551 m!1365405))

(declare-fun m!1365437 () Bool)

(assert (=> b!1479551 m!1365437))

(assert (=> b!1479540 m!1365405))

(assert (=> b!1479540 m!1365405))

(declare-fun m!1365439 () Bool)

(assert (=> b!1479540 m!1365439))

(declare-fun m!1365441 () Bool)

(assert (=> b!1479553 m!1365441))

(assert (=> b!1479553 m!1365441))

(declare-fun m!1365443 () Bool)

(assert (=> b!1479553 m!1365443))

(assert (=> b!1479556 m!1365401))

(declare-fun m!1365445 () Bool)

(assert (=> b!1479556 m!1365445))

(declare-fun m!1365447 () Bool)

(assert (=> b!1479545 m!1365447))

(assert (=> b!1479542 m!1365419))

(assert (=> b!1479542 m!1365413))

(assert (=> b!1479542 m!1365417))

(assert (=> b!1479542 m!1365405))

(assert (=> b!1479541 m!1365405))

(assert (=> b!1479541 m!1365405))

(declare-fun m!1365449 () Bool)

(assert (=> b!1479541 m!1365449))

(declare-fun m!1365451 () Bool)

(assert (=> b!1479558 m!1365451))

(declare-fun m!1365453 () Bool)

(assert (=> start!126242 m!1365453))

(declare-fun m!1365455 () Bool)

(assert (=> start!126242 m!1365455))

(push 1)

