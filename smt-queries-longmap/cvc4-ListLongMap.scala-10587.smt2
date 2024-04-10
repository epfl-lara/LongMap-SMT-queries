; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!124664 () Bool)

(assert start!124664)

(declare-fun b!1444378 () Bool)

(declare-fun res!976390 () Bool)

(declare-fun e!813810 () Bool)

(assert (=> b!1444378 (=> (not res!976390) (not e!813810))))

(declare-datatypes ((SeekEntryResult!11596 0))(
  ( (MissingZero!11596 (index!48776 (_ BitVec 32))) (Found!11596 (index!48777 (_ BitVec 32))) (Intermediate!11596 (undefined!12408 Bool) (index!48778 (_ BitVec 32)) (x!130469 (_ BitVec 32))) (Undefined!11596) (MissingVacant!11596 (index!48779 (_ BitVec 32))) )
))
(declare-fun lt!634182 () SeekEntryResult!11596)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98112 0))(
  ( (array!98113 (arr!47344 (Array (_ BitVec 32) (_ BitVec 64))) (size!47894 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98112)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98112 (_ BitVec 32)) SeekEntryResult!11596)

(assert (=> b!1444378 (= res!976390 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47344 a!2862) j!93) a!2862 mask!2687) lt!634182))))

(declare-fun b!1444379 () Bool)

(declare-fun e!813808 () Bool)

(declare-fun e!813813 () Bool)

(assert (=> b!1444379 (= e!813808 e!813813)))

(declare-fun res!976385 () Bool)

(assert (=> b!1444379 (=> (not res!976385) (not e!813813))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1444379 (= res!976385 (= (select (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!634178 () array!98112)

(assert (=> b!1444379 (= lt!634178 (array!98113 (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47894 a!2862)))))

(declare-fun b!1444381 () Bool)

(declare-fun res!976382 () Bool)

(assert (=> b!1444381 (=> (not res!976382) (not e!813808))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98112 (_ BitVec 32)) Bool)

(assert (=> b!1444381 (= res!976382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1444382 () Bool)

(declare-fun res!976384 () Bool)

(assert (=> b!1444382 (=> (not res!976384) (not e!813808))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1444382 (= res!976384 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47894 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47894 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47894 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun e!813811 () Bool)

(declare-fun b!1444383 () Bool)

(assert (=> b!1444383 (= e!813811 (or (= (select (arr!47344 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47344 a!2862) intermediateBeforeIndex!19) (select (arr!47344 a!2862) j!93))))))

(declare-fun lt!634177 () SeekEntryResult!11596)

(declare-fun b!1444384 () Bool)

(declare-fun lt!634181 () (_ BitVec 64))

(declare-fun e!813812 () Bool)

(assert (=> b!1444384 (= e!813812 (= lt!634177 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!634181 lt!634178 mask!2687)))))

(declare-fun b!1444385 () Bool)

(declare-fun e!813814 () Bool)

(assert (=> b!1444385 (= e!813814 true)))

(declare-fun lt!634179 () SeekEntryResult!11596)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98112 (_ BitVec 32)) SeekEntryResult!11596)

(assert (=> b!1444385 (= lt!634179 (seekEntryOrOpen!0 lt!634181 lt!634178 mask!2687))))

(declare-fun b!1444386 () Bool)

(assert (=> b!1444386 (= e!813813 e!813810)))

(declare-fun res!976379 () Bool)

(assert (=> b!1444386 (=> (not res!976379) (not e!813810))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1444386 (= res!976379 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47344 a!2862) j!93) mask!2687) (select (arr!47344 a!2862) j!93) a!2862 mask!2687) lt!634182))))

(assert (=> b!1444386 (= lt!634182 (Intermediate!11596 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1444387 () Bool)

(declare-fun res!976378 () Bool)

(assert (=> b!1444387 (=> (not res!976378) (not e!813808))))

(declare-datatypes ((List!33845 0))(
  ( (Nil!33842) (Cons!33841 (h!35191 (_ BitVec 64)) (t!48539 List!33845)) )
))
(declare-fun arrayNoDuplicates!0 (array!98112 (_ BitVec 32) List!33845) Bool)

(assert (=> b!1444387 (= res!976378 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33842))))

(declare-fun res!976377 () Bool)

(assert (=> start!124664 (=> (not res!976377) (not e!813808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124664 (= res!976377 (validMask!0 mask!2687))))

(assert (=> start!124664 e!813808))

(assert (=> start!124664 true))

(declare-fun array_inv!36372 (array!98112) Bool)

(assert (=> start!124664 (array_inv!36372 a!2862)))

(declare-fun b!1444380 () Bool)

(declare-fun e!813815 () Bool)

(assert (=> b!1444380 (= e!813815 (not e!813814))))

(declare-fun res!976381 () Bool)

(assert (=> b!1444380 (=> res!976381 e!813814)))

(assert (=> b!1444380 (= res!976381 (or (not (= (select (arr!47344 a!2862) index!646) (select (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))) (not (= (select (arr!47344 a!2862) index!646) (select (arr!47344 a!2862) j!93)))))))

(assert (=> b!1444380 e!813811))

(declare-fun res!976376 () Bool)

(assert (=> b!1444380 (=> (not res!976376) (not e!813811))))

(assert (=> b!1444380 (= res!976376 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48688 0))(
  ( (Unit!48689) )
))
(declare-fun lt!634180 () Unit!48688)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98112 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48688)

(assert (=> b!1444380 (= lt!634180 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1444388 () Bool)

(declare-fun res!976388 () Bool)

(assert (=> b!1444388 (=> (not res!976388) (not e!813811))))

(assert (=> b!1444388 (= res!976388 (= (seekEntryOrOpen!0 (select (arr!47344 a!2862) j!93) a!2862 mask!2687) (Found!11596 j!93)))))

(declare-fun b!1444389 () Bool)

(assert (=> b!1444389 (= e!813810 e!813815)))

(declare-fun res!976383 () Bool)

(assert (=> b!1444389 (=> (not res!976383) (not e!813815))))

(assert (=> b!1444389 (= res!976383 (= lt!634177 (Intermediate!11596 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1444389 (= lt!634177 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!634181 mask!2687) lt!634181 lt!634178 mask!2687))))

(assert (=> b!1444389 (= lt!634181 (select (store (arr!47344 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1444390 () Bool)

(declare-fun res!976375 () Bool)

(assert (=> b!1444390 (=> (not res!976375) (not e!813808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1444390 (= res!976375 (validKeyInArray!0 (select (arr!47344 a!2862) i!1006)))))

(declare-fun b!1444391 () Bool)

(declare-fun res!976389 () Bool)

(assert (=> b!1444391 (=> (not res!976389) (not e!813815))))

(assert (=> b!1444391 (= res!976389 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1444392 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98112 (_ BitVec 32)) SeekEntryResult!11596)

(assert (=> b!1444392 (= e!813812 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!634181 lt!634178 mask!2687) (seekEntryOrOpen!0 lt!634181 lt!634178 mask!2687)))))

(declare-fun b!1444393 () Bool)

(declare-fun res!976387 () Bool)

(assert (=> b!1444393 (=> (not res!976387) (not e!813815))))

(assert (=> b!1444393 (= res!976387 e!813812)))

(declare-fun c!133512 () Bool)

(assert (=> b!1444393 (= c!133512 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1444394 () Bool)

(declare-fun res!976380 () Bool)

(assert (=> b!1444394 (=> (not res!976380) (not e!813808))))

(assert (=> b!1444394 (= res!976380 (validKeyInArray!0 (select (arr!47344 a!2862) j!93)))))

(declare-fun b!1444395 () Bool)

(declare-fun res!976386 () Bool)

(assert (=> b!1444395 (=> (not res!976386) (not e!813808))))

(assert (=> b!1444395 (= res!976386 (and (= (size!47894 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47894 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47894 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!124664 res!976377) b!1444395))

(assert (= (and b!1444395 res!976386) b!1444390))

(assert (= (and b!1444390 res!976375) b!1444394))

(assert (= (and b!1444394 res!976380) b!1444381))

(assert (= (and b!1444381 res!976382) b!1444387))

(assert (= (and b!1444387 res!976378) b!1444382))

(assert (= (and b!1444382 res!976384) b!1444379))

(assert (= (and b!1444379 res!976385) b!1444386))

(assert (= (and b!1444386 res!976379) b!1444378))

(assert (= (and b!1444378 res!976390) b!1444389))

(assert (= (and b!1444389 res!976383) b!1444393))

(assert (= (and b!1444393 c!133512) b!1444384))

(assert (= (and b!1444393 (not c!133512)) b!1444392))

(assert (= (and b!1444393 res!976387) b!1444391))

(assert (= (and b!1444391 res!976389) b!1444380))

(assert (= (and b!1444380 res!976376) b!1444388))

(assert (= (and b!1444388 res!976388) b!1444383))

(assert (= (and b!1444380 (not res!976381)) b!1444385))

(declare-fun m!1333403 () Bool)

(assert (=> b!1444385 m!1333403))

(declare-fun m!1333405 () Bool)

(assert (=> b!1444383 m!1333405))

(declare-fun m!1333407 () Bool)

(assert (=> b!1444383 m!1333407))

(assert (=> b!1444386 m!1333407))

(assert (=> b!1444386 m!1333407))

(declare-fun m!1333409 () Bool)

(assert (=> b!1444386 m!1333409))

(assert (=> b!1444386 m!1333409))

(assert (=> b!1444386 m!1333407))

(declare-fun m!1333411 () Bool)

(assert (=> b!1444386 m!1333411))

(declare-fun m!1333413 () Bool)

(assert (=> b!1444384 m!1333413))

(declare-fun m!1333415 () Bool)

(assert (=> b!1444387 m!1333415))

(declare-fun m!1333417 () Bool)

(assert (=> b!1444390 m!1333417))

(assert (=> b!1444390 m!1333417))

(declare-fun m!1333419 () Bool)

(assert (=> b!1444390 m!1333419))

(assert (=> b!1444388 m!1333407))

(assert (=> b!1444388 m!1333407))

(declare-fun m!1333421 () Bool)

(assert (=> b!1444388 m!1333421))

(declare-fun m!1333423 () Bool)

(assert (=> b!1444379 m!1333423))

(declare-fun m!1333425 () Bool)

(assert (=> b!1444379 m!1333425))

(assert (=> b!1444394 m!1333407))

(assert (=> b!1444394 m!1333407))

(declare-fun m!1333427 () Bool)

(assert (=> b!1444394 m!1333427))

(declare-fun m!1333429 () Bool)

(assert (=> b!1444389 m!1333429))

(assert (=> b!1444389 m!1333429))

(declare-fun m!1333431 () Bool)

(assert (=> b!1444389 m!1333431))

(assert (=> b!1444389 m!1333423))

(declare-fun m!1333433 () Bool)

(assert (=> b!1444389 m!1333433))

(declare-fun m!1333435 () Bool)

(assert (=> start!124664 m!1333435))

(declare-fun m!1333437 () Bool)

(assert (=> start!124664 m!1333437))

(declare-fun m!1333439 () Bool)

(assert (=> b!1444380 m!1333439))

(assert (=> b!1444380 m!1333423))

(declare-fun m!1333441 () Bool)

(assert (=> b!1444380 m!1333441))

(declare-fun m!1333443 () Bool)

(assert (=> b!1444380 m!1333443))

(declare-fun m!1333445 () Bool)

(assert (=> b!1444380 m!1333445))

(assert (=> b!1444380 m!1333407))

(declare-fun m!1333447 () Bool)

(assert (=> b!1444381 m!1333447))

(assert (=> b!1444378 m!1333407))

(assert (=> b!1444378 m!1333407))

(declare-fun m!1333449 () Bool)

(assert (=> b!1444378 m!1333449))

(declare-fun m!1333451 () Bool)

(assert (=> b!1444392 m!1333451))

(assert (=> b!1444392 m!1333403))

(push 1)

