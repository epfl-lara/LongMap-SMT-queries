; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124930 () Bool)

(assert start!124930)

(declare-fun b!1452317 () Bool)

(declare-fun res!983553 () Bool)

(declare-fun e!817554 () Bool)

(assert (=> b!1452317 (=> (not res!983553) (not e!817554))))

(declare-datatypes ((array!98356 0))(
  ( (array!98357 (arr!47467 (Array (_ BitVec 32) (_ BitVec 64))) (size!48019 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98356)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1452317 (= res!983553 (validKeyInArray!0 (select (arr!47467 a!2862) j!93)))))

(declare-fun b!1452318 () Bool)

(declare-fun res!983547 () Bool)

(declare-fun e!817550 () Bool)

(assert (=> b!1452318 (=> (not res!983547) (not e!817550))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11744 0))(
  ( (MissingZero!11744 (index!49368 (_ BitVec 32))) (Found!11744 (index!49369 (_ BitVec 32))) (Intermediate!11744 (undefined!12556 Bool) (index!49370 (_ BitVec 32)) (x!131012 (_ BitVec 32))) (Undefined!11744) (MissingVacant!11744 (index!49371 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98356 (_ BitVec 32)) SeekEntryResult!11744)

(assert (=> b!1452318 (= res!983547 (= (seekEntryOrOpen!0 (select (arr!47467 a!2862) j!93) a!2862 mask!2687) (Found!11744 j!93)))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun e!817553 () Bool)

(declare-fun b!1452319 () Bool)

(declare-fun lt!636732 () SeekEntryResult!11744)

(declare-fun lt!636735 () array!98356)

(declare-fun lt!636731 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98356 (_ BitVec 32)) SeekEntryResult!11744)

(assert (=> b!1452319 (= e!817553 (= lt!636732 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!636731 lt!636735 mask!2687)))))

(declare-fun b!1452320 () Bool)

(declare-fun res!983545 () Bool)

(assert (=> b!1452320 (=> (not res!983545) (not e!817554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98356 (_ BitVec 32)) Bool)

(assert (=> b!1452320 (= res!983545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1452321 () Bool)

(declare-fun res!983555 () Bool)

(assert (=> b!1452321 (=> (not res!983555) (not e!817554))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1452321 (= res!983555 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48019 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48019 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48019 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!983552 () Bool)

(assert (=> start!124930 (=> (not res!983552) (not e!817554))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124930 (= res!983552 (validMask!0 mask!2687))))

(assert (=> start!124930 e!817554))

(assert (=> start!124930 true))

(declare-fun array_inv!36700 (array!98356) Bool)

(assert (=> start!124930 (array_inv!36700 a!2862)))

(declare-fun b!1452322 () Bool)

(declare-fun res!983546 () Bool)

(assert (=> b!1452322 (=> (not res!983546) (not e!817554))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1452322 (= res!983546 (validKeyInArray!0 (select (arr!47467 a!2862) i!1006)))))

(declare-fun b!1452323 () Bool)

(declare-fun e!817552 () Bool)

(declare-fun e!817548 () Bool)

(assert (=> b!1452323 (= e!817552 e!817548)))

(declare-fun res!983557 () Bool)

(assert (=> b!1452323 (=> (not res!983557) (not e!817548))))

(declare-fun lt!636733 () SeekEntryResult!11744)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1452323 (= res!983557 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47467 a!2862) j!93) mask!2687) (select (arr!47467 a!2862) j!93) a!2862 mask!2687) lt!636733))))

(assert (=> b!1452323 (= lt!636733 (Intermediate!11744 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1452324 () Bool)

(declare-fun res!983548 () Bool)

(assert (=> b!1452324 (=> (not res!983548) (not e!817554))))

(assert (=> b!1452324 (= res!983548 (and (= (size!48019 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48019 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48019 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1452325 () Bool)

(declare-fun res!983550 () Bool)

(assert (=> b!1452325 (=> (not res!983550) (not e!817554))))

(declare-datatypes ((List!34046 0))(
  ( (Nil!34043) (Cons!34042 (h!35392 (_ BitVec 64)) (t!48732 List!34046)) )
))
(declare-fun arrayNoDuplicates!0 (array!98356 (_ BitVec 32) List!34046) Bool)

(assert (=> b!1452325 (= res!983550 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34043))))

(declare-fun b!1452326 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98356 (_ BitVec 32)) SeekEntryResult!11744)

(assert (=> b!1452326 (= e!817553 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!636731 lt!636735 mask!2687) (seekEntryOrOpen!0 lt!636731 lt!636735 mask!2687)))))

(declare-fun b!1452327 () Bool)

(declare-fun res!983554 () Bool)

(assert (=> b!1452327 (=> (not res!983554) (not e!817548))))

(assert (=> b!1452327 (= res!983554 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47467 a!2862) j!93) a!2862 mask!2687) lt!636733))))

(declare-fun b!1452328 () Bool)

(declare-fun e!817549 () Bool)

(assert (=> b!1452328 (= e!817548 e!817549)))

(declare-fun res!983544 () Bool)

(assert (=> b!1452328 (=> (not res!983544) (not e!817549))))

(assert (=> b!1452328 (= res!983544 (= lt!636732 (Intermediate!11744 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1452328 (= lt!636732 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!636731 mask!2687) lt!636731 lt!636735 mask!2687))))

(assert (=> b!1452328 (= lt!636731 (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1452329 () Bool)

(assert (=> b!1452329 (= e!817550 (and (or (= (select (arr!47467 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47467 a!2862) intermediateBeforeIndex!19) (select (arr!47467 a!2862) j!93))) (or (and (= (select (arr!47467 a!2862) index!646) (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47467 a!2862) index!646) (select (arr!47467 a!2862) j!93))) (= (select (arr!47467 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (and (= index!646 intermediateAfterIndex!19) (= (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1452330 () Bool)

(assert (=> b!1452330 (= e!817549 (not (or (and (= (select (arr!47467 a!2862) index!646) (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47467 a!2862) index!646) (select (arr!47467 a!2862) j!93))) (= (select (arr!47467 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19)) (bvslt mask!2687 #b00000000000000000000000000000000) (bvsge index!646 (bvadd #b00000000000000000000000000000001 mask!2687)) (bvslt intermediateAfterIndex!19 (bvadd #b00000000000000000000000000000001 mask!2687)))))))

(assert (=> b!1452330 e!817550))

(declare-fun res!983551 () Bool)

(assert (=> b!1452330 (=> (not res!983551) (not e!817550))))

(assert (=> b!1452330 (= res!983551 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!48825 0))(
  ( (Unit!48826) )
))
(declare-fun lt!636734 () Unit!48825)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98356 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48825)

(assert (=> b!1452330 (= lt!636734 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1452331 () Bool)

(assert (=> b!1452331 (= e!817554 e!817552)))

(declare-fun res!983556 () Bool)

(assert (=> b!1452331 (=> (not res!983556) (not e!817552))))

(assert (=> b!1452331 (= res!983556 (= (select (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1452331 (= lt!636735 (array!98357 (store (arr!47467 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48019 a!2862)))))

(declare-fun b!1452332 () Bool)

(declare-fun res!983543 () Bool)

(assert (=> b!1452332 (=> (not res!983543) (not e!817549))))

(assert (=> b!1452332 (= res!983543 e!817553)))

(declare-fun c!133900 () Bool)

(assert (=> b!1452332 (= c!133900 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1452333 () Bool)

(declare-fun res!983549 () Bool)

(assert (=> b!1452333 (=> (not res!983549) (not e!817549))))

(assert (=> b!1452333 (= res!983549 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!124930 res!983552) b!1452324))

(assert (= (and b!1452324 res!983548) b!1452322))

(assert (= (and b!1452322 res!983546) b!1452317))

(assert (= (and b!1452317 res!983553) b!1452320))

(assert (= (and b!1452320 res!983545) b!1452325))

(assert (= (and b!1452325 res!983550) b!1452321))

(assert (= (and b!1452321 res!983555) b!1452331))

(assert (= (and b!1452331 res!983556) b!1452323))

(assert (= (and b!1452323 res!983557) b!1452327))

(assert (= (and b!1452327 res!983554) b!1452328))

(assert (= (and b!1452328 res!983544) b!1452332))

(assert (= (and b!1452332 c!133900) b!1452319))

(assert (= (and b!1452332 (not c!133900)) b!1452326))

(assert (= (and b!1452332 res!983543) b!1452333))

(assert (= (and b!1452333 res!983549) b!1452330))

(assert (= (and b!1452330 res!983551) b!1452318))

(assert (= (and b!1452318 res!983547) b!1452329))

(declare-fun m!1340409 () Bool)

(assert (=> b!1452331 m!1340409))

(declare-fun m!1340411 () Bool)

(assert (=> b!1452331 m!1340411))

(declare-fun m!1340413 () Bool)

(assert (=> b!1452318 m!1340413))

(assert (=> b!1452318 m!1340413))

(declare-fun m!1340415 () Bool)

(assert (=> b!1452318 m!1340415))

(assert (=> b!1452317 m!1340413))

(assert (=> b!1452317 m!1340413))

(declare-fun m!1340417 () Bool)

(assert (=> b!1452317 m!1340417))

(declare-fun m!1340419 () Bool)

(assert (=> b!1452326 m!1340419))

(declare-fun m!1340421 () Bool)

(assert (=> b!1452326 m!1340421))

(declare-fun m!1340423 () Bool)

(assert (=> b!1452325 m!1340423))

(declare-fun m!1340425 () Bool)

(assert (=> start!124930 m!1340425))

(declare-fun m!1340427 () Bool)

(assert (=> start!124930 m!1340427))

(declare-fun m!1340429 () Bool)

(assert (=> b!1452328 m!1340429))

(assert (=> b!1452328 m!1340429))

(declare-fun m!1340431 () Bool)

(assert (=> b!1452328 m!1340431))

(assert (=> b!1452328 m!1340409))

(declare-fun m!1340433 () Bool)

(assert (=> b!1452328 m!1340433))

(assert (=> b!1452327 m!1340413))

(assert (=> b!1452327 m!1340413))

(declare-fun m!1340435 () Bool)

(assert (=> b!1452327 m!1340435))

(declare-fun m!1340437 () Bool)

(assert (=> b!1452320 m!1340437))

(assert (=> b!1452329 m!1340409))

(declare-fun m!1340439 () Bool)

(assert (=> b!1452329 m!1340439))

(declare-fun m!1340441 () Bool)

(assert (=> b!1452329 m!1340441))

(declare-fun m!1340443 () Bool)

(assert (=> b!1452329 m!1340443))

(assert (=> b!1452329 m!1340413))

(declare-fun m!1340445 () Bool)

(assert (=> b!1452322 m!1340445))

(assert (=> b!1452322 m!1340445))

(declare-fun m!1340447 () Bool)

(assert (=> b!1452322 m!1340447))

(assert (=> b!1452323 m!1340413))

(assert (=> b!1452323 m!1340413))

(declare-fun m!1340449 () Bool)

(assert (=> b!1452323 m!1340449))

(assert (=> b!1452323 m!1340449))

(assert (=> b!1452323 m!1340413))

(declare-fun m!1340451 () Bool)

(assert (=> b!1452323 m!1340451))

(declare-fun m!1340453 () Bool)

(assert (=> b!1452319 m!1340453))

(declare-fun m!1340455 () Bool)

(assert (=> b!1452330 m!1340455))

(assert (=> b!1452330 m!1340409))

(assert (=> b!1452330 m!1340441))

(assert (=> b!1452330 m!1340443))

(declare-fun m!1340457 () Bool)

(assert (=> b!1452330 m!1340457))

(assert (=> b!1452330 m!1340413))

(check-sat (not b!1452328) (not b!1452323) (not b!1452322) (not b!1452330) (not start!124930) (not b!1452317) (not b!1452318) (not b!1452327) (not b!1452325) (not b!1452326) (not b!1452320) (not b!1452319))
(check-sat)
