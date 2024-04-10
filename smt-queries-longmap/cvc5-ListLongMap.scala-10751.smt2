; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!125764 () Bool)

(assert start!125764)

(declare-fun b!1471652 () Bool)

(declare-fun res!999409 () Bool)

(declare-fun e!826026 () Bool)

(assert (=> b!1471652 (=> (not res!999409) (not e!826026))))

(declare-datatypes ((array!99098 0))(
  ( (array!99099 (arr!47834 (Array (_ BitVec 32) (_ BitVec 64))) (size!48384 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99098)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12074 0))(
  ( (MissingZero!12074 (index!50688 (_ BitVec 32))) (Found!12074 (index!50689 (_ BitVec 32))) (Intermediate!12074 (undefined!12886 Bool) (index!50690 (_ BitVec 32)) (x!132277 (_ BitVec 32))) (Undefined!12074) (MissingVacant!12074 (index!50691 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99098 (_ BitVec 32)) SeekEntryResult!12074)

(assert (=> b!1471652 (= res!999409 (= (seekEntryOrOpen!0 (select (arr!47834 a!2862) j!93) a!2862 mask!2687) (Found!12074 j!93)))))

(declare-fun b!1471653 () Bool)

(declare-fun e!826028 () Bool)

(assert (=> b!1471653 (= e!826028 (not true))))

(assert (=> b!1471653 e!826026))

(declare-fun res!999420 () Bool)

(assert (=> b!1471653 (=> (not res!999420) (not e!826026))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99098 (_ BitVec 32)) Bool)

(assert (=> b!1471653 (= res!999420 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49488 0))(
  ( (Unit!49489) )
))
(declare-fun lt!643342 () Unit!49488)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99098 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49488)

(assert (=> b!1471653 (= lt!643342 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1471654 () Bool)

(declare-fun res!999410 () Bool)

(assert (=> b!1471654 (=> (not res!999410) (not e!826028))))

(declare-fun e!826027 () Bool)

(assert (=> b!1471654 (= res!999410 e!826027)))

(declare-fun c!135636 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1471654 (= c!135636 (bvsle x!665 intermediateAfterX!19))))

(declare-fun res!999421 () Bool)

(declare-fun e!826025 () Bool)

(assert (=> start!125764 (=> (not res!999421) (not e!826025))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125764 (= res!999421 (validMask!0 mask!2687))))

(assert (=> start!125764 e!826025))

(assert (=> start!125764 true))

(declare-fun array_inv!36862 (array!99098) Bool)

(assert (=> start!125764 (array_inv!36862 a!2862)))

(declare-fun b!1471655 () Bool)

(declare-fun res!999412 () Bool)

(assert (=> b!1471655 (=> (not res!999412) (not e!826025))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1471655 (= res!999412 (validKeyInArray!0 (select (arr!47834 a!2862) i!1006)))))

(declare-fun b!1471656 () Bool)

(declare-fun e!826030 () Bool)

(declare-fun e!826031 () Bool)

(assert (=> b!1471656 (= e!826030 e!826031)))

(declare-fun res!999407 () Bool)

(assert (=> b!1471656 (=> (not res!999407) (not e!826031))))

(declare-fun lt!643340 () SeekEntryResult!12074)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99098 (_ BitVec 32)) SeekEntryResult!12074)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1471656 (= res!999407 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47834 a!2862) j!93) mask!2687) (select (arr!47834 a!2862) j!93) a!2862 mask!2687) lt!643340))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1471656 (= lt!643340 (Intermediate!12074 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1471657 () Bool)

(assert (=> b!1471657 (= e!826026 (or (= (select (arr!47834 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47834 a!2862) intermediateBeforeIndex!19) (select (arr!47834 a!2862) j!93))))))

(declare-fun b!1471658 () Bool)

(declare-fun res!999415 () Bool)

(assert (=> b!1471658 (=> (not res!999415) (not e!826025))))

(assert (=> b!1471658 (= res!999415 (and (= (size!48384 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48384 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48384 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1471659 () Bool)

(declare-fun res!999411 () Bool)

(assert (=> b!1471659 (=> (not res!999411) (not e!826025))))

(assert (=> b!1471659 (= res!999411 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1471660 () Bool)

(declare-fun res!999416 () Bool)

(assert (=> b!1471660 (=> (not res!999416) (not e!826025))))

(declare-datatypes ((List!34335 0))(
  ( (Nil!34332) (Cons!34331 (h!35687 (_ BitVec 64)) (t!49029 List!34335)) )
))
(declare-fun arrayNoDuplicates!0 (array!99098 (_ BitVec 32) List!34335) Bool)

(assert (=> b!1471660 (= res!999416 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34332))))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!643343 () array!99098)

(declare-fun lt!643344 () (_ BitVec 64))

(declare-fun b!1471661 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99098 (_ BitVec 32)) SeekEntryResult!12074)

(assert (=> b!1471661 (= e!826027 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!643344 lt!643343 mask!2687) (seekEntryOrOpen!0 lt!643344 lt!643343 mask!2687)))))

(declare-fun b!1471662 () Bool)

(declare-fun res!999418 () Bool)

(assert (=> b!1471662 (=> (not res!999418) (not e!826031))))

(assert (=> b!1471662 (= res!999418 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47834 a!2862) j!93) a!2862 mask!2687) lt!643340))))

(declare-fun b!1471663 () Bool)

(declare-fun res!999413 () Bool)

(assert (=> b!1471663 (=> (not res!999413) (not e!826025))))

(assert (=> b!1471663 (= res!999413 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48384 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48384 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48384 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1471664 () Bool)

(assert (=> b!1471664 (= e!826031 e!826028)))

(declare-fun res!999408 () Bool)

(assert (=> b!1471664 (=> (not res!999408) (not e!826028))))

(declare-fun lt!643341 () SeekEntryResult!12074)

(assert (=> b!1471664 (= res!999408 (= lt!643341 (Intermediate!12074 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1471664 (= lt!643341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!643344 mask!2687) lt!643344 lt!643343 mask!2687))))

(assert (=> b!1471664 (= lt!643344 (select (store (arr!47834 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1471665 () Bool)

(assert (=> b!1471665 (= e!826025 e!826030)))

(declare-fun res!999414 () Bool)

(assert (=> b!1471665 (=> (not res!999414) (not e!826030))))

(assert (=> b!1471665 (= res!999414 (= (select (store (arr!47834 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1471665 (= lt!643343 (array!99099 (store (arr!47834 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48384 a!2862)))))

(declare-fun b!1471666 () Bool)

(assert (=> b!1471666 (= e!826027 (= lt!643341 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!643344 lt!643343 mask!2687)))))

(declare-fun b!1471667 () Bool)

(declare-fun res!999417 () Bool)

(assert (=> b!1471667 (=> (not res!999417) (not e!826025))))

(assert (=> b!1471667 (= res!999417 (validKeyInArray!0 (select (arr!47834 a!2862) j!93)))))

(declare-fun b!1471668 () Bool)

(declare-fun res!999419 () Bool)

(assert (=> b!1471668 (=> (not res!999419) (not e!826028))))

(assert (=> b!1471668 (= res!999419 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!125764 res!999421) b!1471658))

(assert (= (and b!1471658 res!999415) b!1471655))

(assert (= (and b!1471655 res!999412) b!1471667))

(assert (= (and b!1471667 res!999417) b!1471659))

(assert (= (and b!1471659 res!999411) b!1471660))

(assert (= (and b!1471660 res!999416) b!1471663))

(assert (= (and b!1471663 res!999413) b!1471665))

(assert (= (and b!1471665 res!999414) b!1471656))

(assert (= (and b!1471656 res!999407) b!1471662))

(assert (= (and b!1471662 res!999418) b!1471664))

(assert (= (and b!1471664 res!999408) b!1471654))

(assert (= (and b!1471654 c!135636) b!1471666))

(assert (= (and b!1471654 (not c!135636)) b!1471661))

(assert (= (and b!1471654 res!999410) b!1471668))

(assert (= (and b!1471668 res!999419) b!1471653))

(assert (= (and b!1471653 res!999420) b!1471652))

(assert (= (and b!1471652 res!999409) b!1471657))

(declare-fun m!1358443 () Bool)

(assert (=> b!1471662 m!1358443))

(assert (=> b!1471662 m!1358443))

(declare-fun m!1358445 () Bool)

(assert (=> b!1471662 m!1358445))

(declare-fun m!1358447 () Bool)

(assert (=> b!1471666 m!1358447))

(declare-fun m!1358449 () Bool)

(assert (=> b!1471655 m!1358449))

(assert (=> b!1471655 m!1358449))

(declare-fun m!1358451 () Bool)

(assert (=> b!1471655 m!1358451))

(declare-fun m!1358453 () Bool)

(assert (=> b!1471664 m!1358453))

(assert (=> b!1471664 m!1358453))

(declare-fun m!1358455 () Bool)

(assert (=> b!1471664 m!1358455))

(declare-fun m!1358457 () Bool)

(assert (=> b!1471664 m!1358457))

(declare-fun m!1358459 () Bool)

(assert (=> b!1471664 m!1358459))

(assert (=> b!1471667 m!1358443))

(assert (=> b!1471667 m!1358443))

(declare-fun m!1358461 () Bool)

(assert (=> b!1471667 m!1358461))

(assert (=> b!1471652 m!1358443))

(assert (=> b!1471652 m!1358443))

(declare-fun m!1358463 () Bool)

(assert (=> b!1471652 m!1358463))

(declare-fun m!1358465 () Bool)

(assert (=> b!1471659 m!1358465))

(declare-fun m!1358467 () Bool)

(assert (=> b!1471661 m!1358467))

(declare-fun m!1358469 () Bool)

(assert (=> b!1471661 m!1358469))

(assert (=> b!1471665 m!1358457))

(declare-fun m!1358471 () Bool)

(assert (=> b!1471665 m!1358471))

(declare-fun m!1358473 () Bool)

(assert (=> b!1471653 m!1358473))

(declare-fun m!1358475 () Bool)

(assert (=> b!1471653 m!1358475))

(assert (=> b!1471656 m!1358443))

(assert (=> b!1471656 m!1358443))

(declare-fun m!1358477 () Bool)

(assert (=> b!1471656 m!1358477))

(assert (=> b!1471656 m!1358477))

(assert (=> b!1471656 m!1358443))

(declare-fun m!1358479 () Bool)

(assert (=> b!1471656 m!1358479))

(declare-fun m!1358481 () Bool)

(assert (=> b!1471657 m!1358481))

(assert (=> b!1471657 m!1358443))

(declare-fun m!1358483 () Bool)

(assert (=> start!125764 m!1358483))

(declare-fun m!1358485 () Bool)

(assert (=> start!125764 m!1358485))

(declare-fun m!1358487 () Bool)

(assert (=> b!1471660 m!1358487))

(push 1)

