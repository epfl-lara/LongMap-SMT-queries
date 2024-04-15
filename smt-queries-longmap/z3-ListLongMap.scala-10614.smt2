; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124792 () Bool)

(assert start!124792)

(declare-fun b!1448460 () Bool)

(declare-fun e!815717 () Bool)

(declare-fun e!815714 () Bool)

(assert (=> b!1448460 (= e!815717 e!815714)))

(declare-fun res!980116 () Bool)

(assert (=> b!1448460 (=> (not res!980116) (not e!815714))))

(declare-datatypes ((SeekEntryResult!11675 0))(
  ( (MissingZero!11675 (index!49092 (_ BitVec 32))) (Found!11675 (index!49093 (_ BitVec 32))) (Intermediate!11675 (undefined!12487 Bool) (index!49094 (_ BitVec 32)) (x!130759 (_ BitVec 32))) (Undefined!11675) (MissingVacant!11675 (index!49095 (_ BitVec 32))) )
))
(declare-fun lt!635377 () SeekEntryResult!11675)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448460 (= res!980116 (= lt!635377 (Intermediate!11675 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun lt!635379 () (_ BitVec 64))

(declare-datatypes ((array!98218 0))(
  ( (array!98219 (arr!47398 (Array (_ BitVec 32) (_ BitVec 64))) (size!47950 (_ BitVec 32))) )
))
(declare-fun lt!635380 () array!98218)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98218 (_ BitVec 32)) SeekEntryResult!11675)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448460 (= lt!635377 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635379 mask!2687) lt!635379 lt!635380 mask!2687))))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun a!2862 () array!98218)

(assert (=> b!1448460 (= lt!635379 (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448461 () Bool)

(declare-fun res!980100 () Bool)

(declare-fun e!815712 () Bool)

(assert (=> b!1448461 (=> (not res!980100) (not e!815712))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448461 (= res!980100 (validKeyInArray!0 (select (arr!47398 a!2862) i!1006)))))

(declare-fun b!1448462 () Bool)

(declare-fun res!980103 () Bool)

(assert (=> b!1448462 (=> (not res!980103) (not e!815712))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98218 (_ BitVec 32)) Bool)

(assert (=> b!1448462 (= res!980103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1448463 () Bool)

(declare-fun e!815711 () Bool)

(assert (=> b!1448463 (= e!815711 (= lt!635377 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635379 lt!635380 mask!2687)))))

(declare-fun b!1448464 () Bool)

(declare-fun e!815715 () Bool)

(assert (=> b!1448464 (= e!815715 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!635381 () SeekEntryResult!11675)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98218 (_ BitVec 32)) SeekEntryResult!11675)

(assert (=> b!1448464 (= lt!635381 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47398 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448465 () Bool)

(declare-fun res!980109 () Bool)

(assert (=> b!1448465 (=> (not res!980109) (not e!815712))))

(declare-datatypes ((List!33977 0))(
  ( (Nil!33974) (Cons!33973 (h!35323 (_ BitVec 64)) (t!48663 List!33977)) )
))
(declare-fun arrayNoDuplicates!0 (array!98218 (_ BitVec 32) List!33977) Bool)

(assert (=> b!1448465 (= res!980109 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33974))))

(declare-fun e!815713 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1448466 () Bool)

(assert (=> b!1448466 (= e!815713 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448467 () Bool)

(declare-fun e!815716 () Bool)

(assert (=> b!1448467 (= e!815712 e!815716)))

(declare-fun res!980106 () Bool)

(assert (=> b!1448467 (=> (not res!980106) (not e!815716))))

(assert (=> b!1448467 (= res!980106 (= (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448467 (= lt!635380 (array!98219 (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47950 a!2862)))))

(declare-fun b!1448468 () Bool)

(declare-fun res!980101 () Bool)

(assert (=> b!1448468 (=> (not res!980101) (not e!815714))))

(assert (=> b!1448468 (= res!980101 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448469 () Bool)

(declare-fun res!980107 () Bool)

(assert (=> b!1448469 (=> (not res!980107) (not e!815714))))

(assert (=> b!1448469 (= res!980107 e!815711)))

(declare-fun c!133693 () Bool)

(assert (=> b!1448469 (= c!133693 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448471 () Bool)

(assert (=> b!1448471 (= e!815714 (not e!815715))))

(declare-fun res!980114 () Bool)

(assert (=> b!1448471 (=> res!980114 e!815715)))

(assert (=> b!1448471 (= res!980114 (or (and (= (select (arr!47398 a!2862) index!646) (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47398 a!2862) index!646) (select (arr!47398 a!2862) j!93))) (not (= (select (arr!47398 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47398 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815710 () Bool)

(assert (=> b!1448471 e!815710))

(declare-fun res!980113 () Bool)

(assert (=> b!1448471 (=> (not res!980113) (not e!815710))))

(declare-fun lt!635382 () SeekEntryResult!11675)

(assert (=> b!1448471 (= res!980113 (and (= lt!635382 (Found!11675 j!93)) (or (= (select (arr!47398 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47398 a!2862) intermediateBeforeIndex!19) (select (arr!47398 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98218 (_ BitVec 32)) SeekEntryResult!11675)

(assert (=> b!1448471 (= lt!635382 (seekEntryOrOpen!0 (select (arr!47398 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1448471 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48687 0))(
  ( (Unit!48688) )
))
(declare-fun lt!635376 () Unit!48687)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98218 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48687)

(assert (=> b!1448471 (= lt!635376 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1448472 () Bool)

(assert (=> b!1448472 (= e!815711 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635379 lt!635380 mask!2687) (seekEntryOrOpen!0 lt!635379 lt!635380 mask!2687)))))

(declare-fun b!1448473 () Bool)

(declare-fun res!980108 () Bool)

(assert (=> b!1448473 (=> (not res!980108) (not e!815712))))

(assert (=> b!1448473 (= res!980108 (validKeyInArray!0 (select (arr!47398 a!2862) j!93)))))

(declare-fun b!1448474 () Bool)

(declare-fun e!815709 () Bool)

(assert (=> b!1448474 (= e!815709 e!815713)))

(declare-fun res!980111 () Bool)

(assert (=> b!1448474 (=> (not res!980111) (not e!815713))))

(assert (=> b!1448474 (= res!980111 (= lt!635382 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47398 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448475 () Bool)

(assert (=> b!1448475 (= e!815710 e!815709)))

(declare-fun res!980112 () Bool)

(assert (=> b!1448475 (=> res!980112 e!815709)))

(assert (=> b!1448475 (= res!980112 (or (and (= (select (arr!47398 a!2862) index!646) (select (store (arr!47398 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47398 a!2862) index!646) (select (arr!47398 a!2862) j!93))) (not (= (select (arr!47398 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448476 () Bool)

(declare-fun res!980105 () Bool)

(assert (=> b!1448476 (=> (not res!980105) (not e!815712))))

(assert (=> b!1448476 (= res!980105 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!47950 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!47950 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!47950 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448477 () Bool)

(declare-fun res!980104 () Bool)

(assert (=> b!1448477 (=> (not res!980104) (not e!815717))))

(declare-fun lt!635378 () SeekEntryResult!11675)

(assert (=> b!1448477 (= res!980104 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47398 a!2862) j!93) a!2862 mask!2687) lt!635378))))

(declare-fun b!1448478 () Bool)

(declare-fun res!980110 () Bool)

(assert (=> b!1448478 (=> (not res!980110) (not e!815712))))

(assert (=> b!1448478 (= res!980110 (and (= (size!47950 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!47950 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!47950 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!980115 () Bool)

(assert (=> start!124792 (=> (not res!980115) (not e!815712))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124792 (= res!980115 (validMask!0 mask!2687))))

(assert (=> start!124792 e!815712))

(assert (=> start!124792 true))

(declare-fun array_inv!36631 (array!98218) Bool)

(assert (=> start!124792 (array_inv!36631 a!2862)))

(declare-fun b!1448470 () Bool)

(assert (=> b!1448470 (= e!815716 e!815717)))

(declare-fun res!980102 () Bool)

(assert (=> b!1448470 (=> (not res!980102) (not e!815717))))

(assert (=> b!1448470 (= res!980102 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47398 a!2862) j!93) mask!2687) (select (arr!47398 a!2862) j!93) a!2862 mask!2687) lt!635378))))

(assert (=> b!1448470 (= lt!635378 (Intermediate!11675 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(assert (= (and start!124792 res!980115) b!1448478))

(assert (= (and b!1448478 res!980110) b!1448461))

(assert (= (and b!1448461 res!980100) b!1448473))

(assert (= (and b!1448473 res!980108) b!1448462))

(assert (= (and b!1448462 res!980103) b!1448465))

(assert (= (and b!1448465 res!980109) b!1448476))

(assert (= (and b!1448476 res!980105) b!1448467))

(assert (= (and b!1448467 res!980106) b!1448470))

(assert (= (and b!1448470 res!980102) b!1448477))

(assert (= (and b!1448477 res!980104) b!1448460))

(assert (= (and b!1448460 res!980116) b!1448469))

(assert (= (and b!1448469 c!133693) b!1448463))

(assert (= (and b!1448469 (not c!133693)) b!1448472))

(assert (= (and b!1448469 res!980107) b!1448468))

(assert (= (and b!1448468 res!980101) b!1448471))

(assert (= (and b!1448471 res!980113) b!1448475))

(assert (= (and b!1448475 (not res!980112)) b!1448474))

(assert (= (and b!1448474 res!980111) b!1448466))

(assert (= (and b!1448471 (not res!980114)) b!1448464))

(declare-fun m!1336731 () Bool)

(assert (=> b!1448475 m!1336731))

(declare-fun m!1336733 () Bool)

(assert (=> b!1448475 m!1336733))

(declare-fun m!1336735 () Bool)

(assert (=> b!1448475 m!1336735))

(declare-fun m!1336737 () Bool)

(assert (=> b!1448475 m!1336737))

(declare-fun m!1336739 () Bool)

(assert (=> b!1448463 m!1336739))

(assert (=> b!1448474 m!1336737))

(assert (=> b!1448474 m!1336737))

(declare-fun m!1336741 () Bool)

(assert (=> b!1448474 m!1336741))

(assert (=> b!1448467 m!1336733))

(declare-fun m!1336743 () Bool)

(assert (=> b!1448467 m!1336743))

(assert (=> b!1448477 m!1336737))

(assert (=> b!1448477 m!1336737))

(declare-fun m!1336745 () Bool)

(assert (=> b!1448477 m!1336745))

(declare-fun m!1336747 () Bool)

(assert (=> b!1448465 m!1336747))

(assert (=> b!1448473 m!1336737))

(assert (=> b!1448473 m!1336737))

(declare-fun m!1336749 () Bool)

(assert (=> b!1448473 m!1336749))

(declare-fun m!1336751 () Bool)

(assert (=> b!1448461 m!1336751))

(assert (=> b!1448461 m!1336751))

(declare-fun m!1336753 () Bool)

(assert (=> b!1448461 m!1336753))

(assert (=> b!1448470 m!1336737))

(assert (=> b!1448470 m!1336737))

(declare-fun m!1336755 () Bool)

(assert (=> b!1448470 m!1336755))

(assert (=> b!1448470 m!1336755))

(assert (=> b!1448470 m!1336737))

(declare-fun m!1336757 () Bool)

(assert (=> b!1448470 m!1336757))

(declare-fun m!1336759 () Bool)

(assert (=> b!1448472 m!1336759))

(declare-fun m!1336761 () Bool)

(assert (=> b!1448472 m!1336761))

(declare-fun m!1336763 () Bool)

(assert (=> b!1448460 m!1336763))

(assert (=> b!1448460 m!1336763))

(declare-fun m!1336765 () Bool)

(assert (=> b!1448460 m!1336765))

(assert (=> b!1448460 m!1336733))

(declare-fun m!1336767 () Bool)

(assert (=> b!1448460 m!1336767))

(declare-fun m!1336769 () Bool)

(assert (=> start!124792 m!1336769))

(declare-fun m!1336771 () Bool)

(assert (=> start!124792 m!1336771))

(assert (=> b!1448464 m!1336737))

(assert (=> b!1448464 m!1336737))

(declare-fun m!1336773 () Bool)

(assert (=> b!1448464 m!1336773))

(declare-fun m!1336775 () Bool)

(assert (=> b!1448471 m!1336775))

(assert (=> b!1448471 m!1336733))

(declare-fun m!1336777 () Bool)

(assert (=> b!1448471 m!1336777))

(assert (=> b!1448471 m!1336735))

(assert (=> b!1448471 m!1336731))

(assert (=> b!1448471 m!1336737))

(declare-fun m!1336779 () Bool)

(assert (=> b!1448471 m!1336779))

(declare-fun m!1336781 () Bool)

(assert (=> b!1448471 m!1336781))

(assert (=> b!1448471 m!1336737))

(declare-fun m!1336783 () Bool)

(assert (=> b!1448462 m!1336783))

(check-sat (not b!1448462) (not b!1448470) (not b!1448464) (not b!1448463) (not b!1448474) (not b!1448460) (not b!1448465) (not b!1448477) (not b!1448473) (not b!1448471) (not b!1448461) (not b!1448472) (not start!124792))
(check-sat)
