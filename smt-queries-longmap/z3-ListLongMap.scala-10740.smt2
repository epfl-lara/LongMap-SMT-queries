; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125580 () Bool)

(assert start!125580)

(declare-fun b!1469436 () Bool)

(declare-fun res!997934 () Bool)

(declare-fun e!824955 () Bool)

(assert (=> b!1469436 (=> (not res!997934) (not e!824955))))

(declare-datatypes ((array!99028 0))(
  ( (array!99029 (arr!47802 (Array (_ BitVec 32) (_ BitVec 64))) (size!48352 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99028)

(declare-datatypes ((List!34303 0))(
  ( (Nil!34300) (Cons!34299 (h!35649 (_ BitVec 64)) (t!48997 List!34303)) )
))
(declare-fun arrayNoDuplicates!0 (array!99028 (_ BitVec 32) List!34303) Bool)

(assert (=> b!1469436 (= res!997934 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34300))))

(declare-fun b!1469437 () Bool)

(declare-fun res!997935 () Bool)

(assert (=> b!1469437 (=> (not res!997935) (not e!824955))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1469437 (= res!997935 (validKeyInArray!0 (select (arr!47802 a!2862) i!1006)))))

(declare-fun b!1469438 () Bool)

(declare-fun e!824953 () Bool)

(assert (=> b!1469438 (= e!824953 false)))

(declare-fun lt!642561 () Bool)

(declare-fun e!824954 () Bool)

(assert (=> b!1469438 (= lt!642561 e!824954)))

(declare-fun c!135264 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1469438 (= c!135264 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1469439 () Bool)

(declare-fun res!997930 () Bool)

(assert (=> b!1469439 (=> (not res!997930) (not e!824955))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1469439 (= res!997930 (and (= (size!48352 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48352 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48352 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1469440 () Bool)

(declare-fun e!824956 () Bool)

(declare-fun e!824957 () Bool)

(assert (=> b!1469440 (= e!824956 e!824957)))

(declare-fun res!997933 () Bool)

(assert (=> b!1469440 (=> (not res!997933) (not e!824957))))

(declare-datatypes ((SeekEntryResult!12042 0))(
  ( (MissingZero!12042 (index!50560 (_ BitVec 32))) (Found!12042 (index!50561 (_ BitVec 32))) (Intermediate!12042 (undefined!12854 Bool) (index!50562 (_ BitVec 32)) (x!132139 (_ BitVec 32))) (Undefined!12042) (MissingVacant!12042 (index!50563 (_ BitVec 32))) )
))
(declare-fun lt!642563 () SeekEntryResult!12042)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99028 (_ BitVec 32)) SeekEntryResult!12042)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1469440 (= res!997933 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47802 a!2862) j!93) mask!2687) (select (arr!47802 a!2862) j!93) a!2862 mask!2687) lt!642563))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1469440 (= lt!642563 (Intermediate!12042 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun lt!642560 () array!99028)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun lt!642562 () (_ BitVec 64))

(declare-fun b!1469441 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99028 (_ BitVec 32)) SeekEntryResult!12042)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99028 (_ BitVec 32)) SeekEntryResult!12042)

(assert (=> b!1469441 (= e!824954 (not (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!642562 lt!642560 mask!2687) (seekEntryOrOpen!0 lt!642562 lt!642560 mask!2687))))))

(declare-fun b!1469442 () Bool)

(assert (=> b!1469442 (= e!824957 e!824953)))

(declare-fun res!997939 () Bool)

(assert (=> b!1469442 (=> (not res!997939) (not e!824953))))

(declare-fun lt!642564 () SeekEntryResult!12042)

(assert (=> b!1469442 (= res!997939 (= lt!642564 (Intermediate!12042 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1469442 (= lt!642564 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!642562 mask!2687) lt!642562 lt!642560 mask!2687))))

(assert (=> b!1469442 (= lt!642562 (select (store (arr!47802 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1469443 () Bool)

(declare-fun res!997929 () Bool)

(assert (=> b!1469443 (=> (not res!997929) (not e!824955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99028 (_ BitVec 32)) Bool)

(assert (=> b!1469443 (= res!997929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1469444 () Bool)

(declare-fun res!997937 () Bool)

(assert (=> b!1469444 (=> (not res!997937) (not e!824957))))

(assert (=> b!1469444 (= res!997937 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47802 a!2862) j!93) a!2862 mask!2687) lt!642563))))

(declare-fun b!1469445 () Bool)

(declare-fun res!997931 () Bool)

(assert (=> b!1469445 (=> (not res!997931) (not e!824955))))

(assert (=> b!1469445 (= res!997931 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48352 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48352 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48352 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!997932 () Bool)

(assert (=> start!125580 (=> (not res!997932) (not e!824955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125580 (= res!997932 (validMask!0 mask!2687))))

(assert (=> start!125580 e!824955))

(assert (=> start!125580 true))

(declare-fun array_inv!36830 (array!99028) Bool)

(assert (=> start!125580 (array_inv!36830 a!2862)))

(declare-fun b!1469446 () Bool)

(declare-fun res!997936 () Bool)

(assert (=> b!1469446 (=> (not res!997936) (not e!824955))))

(assert (=> b!1469446 (= res!997936 (validKeyInArray!0 (select (arr!47802 a!2862) j!93)))))

(declare-fun b!1469447 () Bool)

(assert (=> b!1469447 (= e!824955 e!824956)))

(declare-fun res!997938 () Bool)

(assert (=> b!1469447 (=> (not res!997938) (not e!824956))))

(assert (=> b!1469447 (= res!997938 (= (select (store (arr!47802 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1469447 (= lt!642560 (array!99029 (store (arr!47802 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48352 a!2862)))))

(declare-fun b!1469448 () Bool)

(assert (=> b!1469448 (= e!824954 (not (= lt!642564 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!642562 lt!642560 mask!2687))))))

(assert (= (and start!125580 res!997932) b!1469439))

(assert (= (and b!1469439 res!997930) b!1469437))

(assert (= (and b!1469437 res!997935) b!1469446))

(assert (= (and b!1469446 res!997936) b!1469443))

(assert (= (and b!1469443 res!997929) b!1469436))

(assert (= (and b!1469436 res!997934) b!1469445))

(assert (= (and b!1469445 res!997931) b!1469447))

(assert (= (and b!1469447 res!997938) b!1469440))

(assert (= (and b!1469440 res!997933) b!1469444))

(assert (= (and b!1469444 res!997937) b!1469442))

(assert (= (and b!1469442 res!997939) b!1469438))

(assert (= (and b!1469438 c!135264) b!1469448))

(assert (= (and b!1469438 (not c!135264)) b!1469441))

(declare-fun m!1356615 () Bool)

(assert (=> b!1469447 m!1356615))

(declare-fun m!1356617 () Bool)

(assert (=> b!1469447 m!1356617))

(declare-fun m!1356619 () Bool)

(assert (=> b!1469441 m!1356619))

(declare-fun m!1356621 () Bool)

(assert (=> b!1469441 m!1356621))

(declare-fun m!1356623 () Bool)

(assert (=> b!1469448 m!1356623))

(declare-fun m!1356625 () Bool)

(assert (=> b!1469444 m!1356625))

(assert (=> b!1469444 m!1356625))

(declare-fun m!1356627 () Bool)

(assert (=> b!1469444 m!1356627))

(declare-fun m!1356629 () Bool)

(assert (=> start!125580 m!1356629))

(declare-fun m!1356631 () Bool)

(assert (=> start!125580 m!1356631))

(assert (=> b!1469446 m!1356625))

(assert (=> b!1469446 m!1356625))

(declare-fun m!1356633 () Bool)

(assert (=> b!1469446 m!1356633))

(declare-fun m!1356635 () Bool)

(assert (=> b!1469436 m!1356635))

(declare-fun m!1356637 () Bool)

(assert (=> b!1469443 m!1356637))

(assert (=> b!1469440 m!1356625))

(assert (=> b!1469440 m!1356625))

(declare-fun m!1356639 () Bool)

(assert (=> b!1469440 m!1356639))

(assert (=> b!1469440 m!1356639))

(assert (=> b!1469440 m!1356625))

(declare-fun m!1356641 () Bool)

(assert (=> b!1469440 m!1356641))

(declare-fun m!1356643 () Bool)

(assert (=> b!1469437 m!1356643))

(assert (=> b!1469437 m!1356643))

(declare-fun m!1356645 () Bool)

(assert (=> b!1469437 m!1356645))

(declare-fun m!1356647 () Bool)

(assert (=> b!1469442 m!1356647))

(assert (=> b!1469442 m!1356647))

(declare-fun m!1356649 () Bool)

(assert (=> b!1469442 m!1356649))

(assert (=> b!1469442 m!1356615))

(declare-fun m!1356651 () Bool)

(assert (=> b!1469442 m!1356651))

(check-sat (not b!1469436) (not b!1469446) (not b!1469441) (not start!125580) (not b!1469437) (not b!1469443) (not b!1469448) (not b!1469442) (not b!1469444) (not b!1469440))
(check-sat)
