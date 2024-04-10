; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126128 () Bool)

(assert start!126128)

(declare-fun b!1476436 () Bool)

(declare-fun res!1002680 () Bool)

(declare-fun e!828350 () Bool)

(assert (=> b!1476436 (=> (not res!1002680) (not e!828350))))

(declare-datatypes ((array!99234 0))(
  ( (array!99235 (arr!47896 (Array (_ BitVec 32) (_ BitVec 64))) (size!48446 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99234)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99234 (_ BitVec 32)) Bool)

(assert (=> b!1476436 (= res!1002680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1476437 () Bool)

(declare-fun res!1002682 () Bool)

(declare-fun e!828349 () Bool)

(assert (=> b!1476437 (=> (not res!1002682) (not e!828349))))

(declare-fun e!828342 () Bool)

(assert (=> b!1476437 (= res!1002682 e!828342)))

(declare-fun c!136401 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1476437 (= c!136401 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1476438 () Bool)

(declare-fun e!828345 () Bool)

(assert (=> b!1476438 (= e!828350 e!828345)))

(declare-fun res!1002681 () Bool)

(assert (=> b!1476438 (=> (not res!1002681) (not e!828345))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1476438 (= res!1002681 (= (select (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645014 () array!99234)

(assert (=> b!1476438 (= lt!645014 (array!99235 (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48446 a!2862)))))

(declare-fun b!1476439 () Bool)

(declare-fun e!828343 () Bool)

(declare-fun e!828346 () Bool)

(assert (=> b!1476439 (= e!828343 e!828346)))

(declare-fun res!1002679 () Bool)

(assert (=> b!1476439 (=> (not res!1002679) (not e!828346))))

(declare-datatypes ((SeekEntryResult!12136 0))(
  ( (MissingZero!12136 (index!50936 (_ BitVec 32))) (Found!12136 (index!50937 (_ BitVec 32))) (Intermediate!12136 (undefined!12948 Bool) (index!50938 (_ BitVec 32)) (x!132535 (_ BitVec 32))) (Undefined!12136) (MissingVacant!12136 (index!50939 (_ BitVec 32))) )
))
(declare-fun lt!645016 () SeekEntryResult!12136)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99234 (_ BitVec 32)) SeekEntryResult!12136)

(assert (=> b!1476439 (= res!1002679 (= lt!645016 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47896 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun res!1002683 () Bool)

(assert (=> start!126128 (=> (not res!1002683) (not e!828350))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126128 (= res!1002683 (validMask!0 mask!2687))))

(assert (=> start!126128 e!828350))

(assert (=> start!126128 true))

(declare-fun array_inv!36924 (array!99234) Bool)

(assert (=> start!126128 (array_inv!36924 a!2862)))

(declare-fun b!1476440 () Bool)

(declare-fun res!1002674 () Bool)

(assert (=> b!1476440 (=> (not res!1002674) (not e!828350))))

(assert (=> b!1476440 (= res!1002674 (and (= (size!48446 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48446 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48446 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1476441 () Bool)

(declare-fun e!828348 () Bool)

(assert (=> b!1476441 (= e!828348 e!828343)))

(declare-fun res!1002688 () Bool)

(assert (=> b!1476441 (=> res!1002688 e!828343)))

(assert (=> b!1476441 (= res!1002688 (or (and (= (select (arr!47896 a!2862) index!646) (select (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47896 a!2862) index!646) (select (arr!47896 a!2862) j!93))) (not (= (select (arr!47896 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1476442 () Bool)

(declare-fun res!1002675 () Bool)

(assert (=> b!1476442 (=> (not res!1002675) (not e!828349))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1476442 (= res!1002675 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun lt!645015 () SeekEntryResult!12136)

(declare-fun b!1476443 () Bool)

(declare-fun lt!645017 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99234 (_ BitVec 32)) SeekEntryResult!12136)

(assert (=> b!1476443 (= e!828342 (= lt!645015 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645017 lt!645014 mask!2687)))))

(declare-fun b!1476444 () Bool)

(declare-fun res!1002687 () Bool)

(assert (=> b!1476444 (=> (not res!1002687) (not e!828350))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1476444 (= res!1002687 (validKeyInArray!0 (select (arr!47896 a!2862) i!1006)))))

(declare-fun b!1476445 () Bool)

(declare-fun res!1002676 () Bool)

(assert (=> b!1476445 (=> (not res!1002676) (not e!828350))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1476445 (= res!1002676 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48446 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48446 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48446 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1476446 () Bool)

(declare-fun e!828344 () Bool)

(assert (=> b!1476446 (= e!828344 e!828349)))

(declare-fun res!1002684 () Bool)

(assert (=> b!1476446 (=> (not res!1002684) (not e!828349))))

(assert (=> b!1476446 (= res!1002684 (= lt!645015 (Intermediate!12136 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1476446 (= lt!645015 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645017 mask!2687) lt!645017 lt!645014 mask!2687))))

(assert (=> b!1476446 (= lt!645017 (select (store (arr!47896 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1476447 () Bool)

(assert (=> b!1476447 (= e!828345 e!828344)))

(declare-fun res!1002678 () Bool)

(assert (=> b!1476447 (=> (not res!1002678) (not e!828344))))

(declare-fun lt!645018 () SeekEntryResult!12136)

(assert (=> b!1476447 (= res!1002678 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47896 a!2862) j!93) mask!2687) (select (arr!47896 a!2862) j!93) a!2862 mask!2687) lt!645018))))

(assert (=> b!1476447 (= lt!645018 (Intermediate!12136 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1476448 () Bool)

(declare-fun res!1002685 () Bool)

(assert (=> b!1476448 (=> (not res!1002685) (not e!828350))))

(assert (=> b!1476448 (= res!1002685 (validKeyInArray!0 (select (arr!47896 a!2862) j!93)))))

(declare-fun b!1476449 () Bool)

(declare-fun res!1002677 () Bool)

(assert (=> b!1476449 (=> (not res!1002677) (not e!828344))))

(assert (=> b!1476449 (= res!1002677 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47896 a!2862) j!93) a!2862 mask!2687) lt!645018))))

(declare-fun b!1476450 () Bool)

(assert (=> b!1476450 (= e!828346 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1476451 () Bool)

(declare-fun res!1002686 () Bool)

(assert (=> b!1476451 (=> (not res!1002686) (not e!828350))))

(declare-datatypes ((List!34397 0))(
  ( (Nil!34394) (Cons!34393 (h!35761 (_ BitVec 64)) (t!49091 List!34397)) )
))
(declare-fun arrayNoDuplicates!0 (array!99234 (_ BitVec 32) List!34397) Bool)

(assert (=> b!1476451 (= res!1002686 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34394))))

(declare-fun b!1476452 () Bool)

(assert (=> b!1476452 (= e!828349 (not true))))

(assert (=> b!1476452 e!828348))

(declare-fun res!1002673 () Bool)

(assert (=> b!1476452 (=> (not res!1002673) (not e!828348))))

(assert (=> b!1476452 (= res!1002673 (and (= lt!645016 (Found!12136 j!93)) (or (= (select (arr!47896 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47896 a!2862) intermediateBeforeIndex!19) (select (arr!47896 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99234 (_ BitVec 32)) SeekEntryResult!12136)

(assert (=> b!1476452 (= lt!645016 (seekEntryOrOpen!0 (select (arr!47896 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1476452 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49612 0))(
  ( (Unit!49613) )
))
(declare-fun lt!645013 () Unit!49612)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99234 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49612)

(assert (=> b!1476452 (= lt!645013 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1476453 () Bool)

(assert (=> b!1476453 (= e!828342 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645017 lt!645014 mask!2687) (seekEntryOrOpen!0 lt!645017 lt!645014 mask!2687)))))

(assert (= (and start!126128 res!1002683) b!1476440))

(assert (= (and b!1476440 res!1002674) b!1476444))

(assert (= (and b!1476444 res!1002687) b!1476448))

(assert (= (and b!1476448 res!1002685) b!1476436))

(assert (= (and b!1476436 res!1002680) b!1476451))

(assert (= (and b!1476451 res!1002686) b!1476445))

(assert (= (and b!1476445 res!1002676) b!1476438))

(assert (= (and b!1476438 res!1002681) b!1476447))

(assert (= (and b!1476447 res!1002678) b!1476449))

(assert (= (and b!1476449 res!1002677) b!1476446))

(assert (= (and b!1476446 res!1002684) b!1476437))

(assert (= (and b!1476437 c!136401) b!1476443))

(assert (= (and b!1476437 (not c!136401)) b!1476453))

(assert (= (and b!1476437 res!1002682) b!1476442))

(assert (= (and b!1476442 res!1002675) b!1476452))

(assert (= (and b!1476452 res!1002673) b!1476441))

(assert (= (and b!1476441 (not res!1002688)) b!1476439))

(assert (= (and b!1476439 res!1002679) b!1476450))

(declare-fun m!1362423 () Bool)

(assert (=> b!1476441 m!1362423))

(declare-fun m!1362425 () Bool)

(assert (=> b!1476441 m!1362425))

(declare-fun m!1362427 () Bool)

(assert (=> b!1476441 m!1362427))

(declare-fun m!1362429 () Bool)

(assert (=> b!1476441 m!1362429))

(declare-fun m!1362431 () Bool)

(assert (=> b!1476446 m!1362431))

(assert (=> b!1476446 m!1362431))

(declare-fun m!1362433 () Bool)

(assert (=> b!1476446 m!1362433))

(assert (=> b!1476446 m!1362425))

(declare-fun m!1362435 () Bool)

(assert (=> b!1476446 m!1362435))

(assert (=> b!1476439 m!1362429))

(assert (=> b!1476439 m!1362429))

(declare-fun m!1362437 () Bool)

(assert (=> b!1476439 m!1362437))

(declare-fun m!1362439 () Bool)

(assert (=> start!126128 m!1362439))

(declare-fun m!1362441 () Bool)

(assert (=> start!126128 m!1362441))

(declare-fun m!1362443 () Bool)

(assert (=> b!1476444 m!1362443))

(assert (=> b!1476444 m!1362443))

(declare-fun m!1362445 () Bool)

(assert (=> b!1476444 m!1362445))

(assert (=> b!1476438 m!1362425))

(declare-fun m!1362447 () Bool)

(assert (=> b!1476438 m!1362447))

(assert (=> b!1476447 m!1362429))

(assert (=> b!1476447 m!1362429))

(declare-fun m!1362449 () Bool)

(assert (=> b!1476447 m!1362449))

(assert (=> b!1476447 m!1362449))

(assert (=> b!1476447 m!1362429))

(declare-fun m!1362451 () Bool)

(assert (=> b!1476447 m!1362451))

(assert (=> b!1476449 m!1362429))

(assert (=> b!1476449 m!1362429))

(declare-fun m!1362453 () Bool)

(assert (=> b!1476449 m!1362453))

(declare-fun m!1362455 () Bool)

(assert (=> b!1476451 m!1362455))

(assert (=> b!1476448 m!1362429))

(assert (=> b!1476448 m!1362429))

(declare-fun m!1362457 () Bool)

(assert (=> b!1476448 m!1362457))

(declare-fun m!1362459 () Bool)

(assert (=> b!1476452 m!1362459))

(declare-fun m!1362461 () Bool)

(assert (=> b!1476452 m!1362461))

(assert (=> b!1476452 m!1362429))

(declare-fun m!1362463 () Bool)

(assert (=> b!1476452 m!1362463))

(declare-fun m!1362465 () Bool)

(assert (=> b!1476452 m!1362465))

(assert (=> b!1476452 m!1362429))

(declare-fun m!1362467 () Bool)

(assert (=> b!1476436 m!1362467))

(declare-fun m!1362469 () Bool)

(assert (=> b!1476443 m!1362469))

(declare-fun m!1362471 () Bool)

(assert (=> b!1476453 m!1362471))

(declare-fun m!1362473 () Bool)

(assert (=> b!1476453 m!1362473))

(push 1)

