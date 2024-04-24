; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!124992 () Bool)

(assert start!124992)

(declare-fun b!1448614 () Bool)

(declare-fun e!815952 () Bool)

(assert (=> b!1448614 (= e!815952 true)))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98335 0))(
  ( (array!98336 (arr!47452 (Array (_ BitVec 32) (_ BitVec 64))) (size!48003 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98335)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11601 0))(
  ( (MissingZero!11601 (index!48796 (_ BitVec 32))) (Found!11601 (index!48797 (_ BitVec 32))) (Intermediate!11601 (undefined!12413 Bool) (index!48798 (_ BitVec 32)) (x!130650 (_ BitVec 32))) (Undefined!11601) (MissingVacant!11601 (index!48799 (_ BitVec 32))) )
))
(declare-fun lt!635584 () SeekEntryResult!11601)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98335 (_ BitVec 32)) SeekEntryResult!11601)

(assert (=> b!1448614 (= lt!635584 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47452 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1448615 () Bool)

(declare-fun res!979461 () Bool)

(declare-fun e!815946 () Bool)

(assert (=> b!1448615 (=> (not res!979461) (not e!815946))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1448615 (= res!979461 (validKeyInArray!0 (select (arr!47452 a!2862) i!1006)))))

(declare-fun lt!635590 () array!98335)

(declare-fun lt!635585 () (_ BitVec 64))

(declare-fun e!815949 () Bool)

(declare-fun b!1448616 () Bool)

(declare-fun lt!635588 () SeekEntryResult!11601)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98335 (_ BitVec 32)) SeekEntryResult!11601)

(assert (=> b!1448616 (= e!815949 (= lt!635588 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635585 lt!635590 mask!2687)))))

(declare-fun b!1448617 () Bool)

(declare-fun e!815948 () Bool)

(declare-fun e!815943 () Bool)

(assert (=> b!1448617 (= e!815948 e!815943)))

(declare-fun res!979460 () Bool)

(assert (=> b!1448617 (=> (not res!979460) (not e!815943))))

(declare-fun lt!635587 () SeekEntryResult!11601)

(assert (=> b!1448617 (= res!979460 (= lt!635587 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47452 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1448618 () Bool)

(declare-fun e!815944 () Bool)

(assert (=> b!1448618 (= e!815944 (not e!815952))))

(declare-fun res!979457 () Bool)

(assert (=> b!1448618 (=> res!979457 e!815952)))

(assert (=> b!1448618 (= res!979457 (or (and (= (select (arr!47452 a!2862) index!646) (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47452 a!2862) index!646) (select (arr!47452 a!2862) j!93))) (not (= (select (arr!47452 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47452 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!815951 () Bool)

(assert (=> b!1448618 e!815951))

(declare-fun res!979464 () Bool)

(assert (=> b!1448618 (=> (not res!979464) (not e!815951))))

(assert (=> b!1448618 (= res!979464 (and (= lt!635587 (Found!11601 j!93)) (or (= (select (arr!47452 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47452 a!2862) intermediateBeforeIndex!19) (select (arr!47452 a!2862) j!93)))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98335 (_ BitVec 32)) SeekEntryResult!11601)

(assert (=> b!1448618 (= lt!635587 (seekEntryOrOpen!0 (select (arr!47452 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98335 (_ BitVec 32)) Bool)

(assert (=> b!1448618 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48731 0))(
  ( (Unit!48732) )
))
(declare-fun lt!635586 () Unit!48731)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98335 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48731)

(assert (=> b!1448618 (= lt!635586 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun b!1448619 () Bool)

(assert (=> b!1448619 (= e!815943 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1448620 () Bool)

(declare-fun res!979456 () Bool)

(assert (=> b!1448620 (=> (not res!979456) (not e!815944))))

(assert (=> b!1448620 (= res!979456 e!815949)))

(declare-fun c!134098 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1448620 (= c!134098 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1448621 () Bool)

(declare-fun res!979465 () Bool)

(assert (=> b!1448621 (=> (not res!979465) (not e!815946))))

(declare-datatypes ((List!33940 0))(
  ( (Nil!33937) (Cons!33936 (h!35297 (_ BitVec 64)) (t!48626 List!33940)) )
))
(declare-fun arrayNoDuplicates!0 (array!98335 (_ BitVec 32) List!33940) Bool)

(assert (=> b!1448621 (= res!979465 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33937))))

(declare-fun res!979469 () Bool)

(assert (=> start!124992 (=> (not res!979469) (not e!815946))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!124992 (= res!979469 (validMask!0 mask!2687))))

(assert (=> start!124992 e!815946))

(assert (=> start!124992 true))

(declare-fun array_inv!36733 (array!98335) Bool)

(assert (=> start!124992 (array_inv!36733 a!2862)))

(declare-fun b!1448622 () Bool)

(declare-fun res!979458 () Bool)

(assert (=> b!1448622 (=> (not res!979458) (not e!815946))))

(assert (=> b!1448622 (= res!979458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1448623 () Bool)

(declare-fun res!979467 () Bool)

(assert (=> b!1448623 (=> (not res!979467) (not e!815946))))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1448623 (= res!979467 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48003 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48003 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48003 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1448624 () Bool)

(assert (=> b!1448624 (= e!815951 e!815948)))

(declare-fun res!979472 () Bool)

(assert (=> b!1448624 (=> res!979472 e!815948)))

(assert (=> b!1448624 (= res!979472 (or (and (= (select (arr!47452 a!2862) index!646) (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47452 a!2862) index!646) (select (arr!47452 a!2862) j!93))) (not (= (select (arr!47452 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1448625 () Bool)

(declare-fun res!979468 () Bool)

(assert (=> b!1448625 (=> (not res!979468) (not e!815944))))

(assert (=> b!1448625 (= res!979468 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1448626 () Bool)

(declare-fun res!979470 () Bool)

(assert (=> b!1448626 (=> (not res!979470) (not e!815946))))

(assert (=> b!1448626 (= res!979470 (and (= (size!48003 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48003 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48003 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1448627 () Bool)

(declare-fun e!815950 () Bool)

(assert (=> b!1448627 (= e!815950 e!815944)))

(declare-fun res!979471 () Bool)

(assert (=> b!1448627 (=> (not res!979471) (not e!815944))))

(assert (=> b!1448627 (= res!979471 (= lt!635588 (Intermediate!11601 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1448627 (= lt!635588 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635585 mask!2687) lt!635585 lt!635590 mask!2687))))

(assert (=> b!1448627 (= lt!635585 (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1448628 () Bool)

(assert (=> b!1448628 (= e!815949 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635585 lt!635590 mask!2687) (seekEntryOrOpen!0 lt!635585 lt!635590 mask!2687)))))

(declare-fun b!1448629 () Bool)

(declare-fun res!979462 () Bool)

(assert (=> b!1448629 (=> (not res!979462) (not e!815946))))

(assert (=> b!1448629 (= res!979462 (validKeyInArray!0 (select (arr!47452 a!2862) j!93)))))

(declare-fun b!1448630 () Bool)

(declare-fun res!979466 () Bool)

(assert (=> b!1448630 (=> (not res!979466) (not e!815950))))

(declare-fun lt!635589 () SeekEntryResult!11601)

(assert (=> b!1448630 (= res!979466 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47452 a!2862) j!93) a!2862 mask!2687) lt!635589))))

(declare-fun b!1448631 () Bool)

(declare-fun e!815945 () Bool)

(assert (=> b!1448631 (= e!815945 e!815950)))

(declare-fun res!979463 () Bool)

(assert (=> b!1448631 (=> (not res!979463) (not e!815950))))

(assert (=> b!1448631 (= res!979463 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47452 a!2862) j!93) mask!2687) (select (arr!47452 a!2862) j!93) a!2862 mask!2687) lt!635589))))

(assert (=> b!1448631 (= lt!635589 (Intermediate!11601 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1448632 () Bool)

(assert (=> b!1448632 (= e!815946 e!815945)))

(declare-fun res!979459 () Bool)

(assert (=> b!1448632 (=> (not res!979459) (not e!815945))))

(assert (=> b!1448632 (= res!979459 (= (select (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1448632 (= lt!635590 (array!98336 (store (arr!47452 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48003 a!2862)))))

(assert (= (and start!124992 res!979469) b!1448626))

(assert (= (and b!1448626 res!979470) b!1448615))

(assert (= (and b!1448615 res!979461) b!1448629))

(assert (= (and b!1448629 res!979462) b!1448622))

(assert (= (and b!1448622 res!979458) b!1448621))

(assert (= (and b!1448621 res!979465) b!1448623))

(assert (= (and b!1448623 res!979467) b!1448632))

(assert (= (and b!1448632 res!979459) b!1448631))

(assert (= (and b!1448631 res!979463) b!1448630))

(assert (= (and b!1448630 res!979466) b!1448627))

(assert (= (and b!1448627 res!979471) b!1448620))

(assert (= (and b!1448620 c!134098) b!1448616))

(assert (= (and b!1448620 (not c!134098)) b!1448628))

(assert (= (and b!1448620 res!979456) b!1448625))

(assert (= (and b!1448625 res!979468) b!1448618))

(assert (= (and b!1448618 res!979464) b!1448624))

(assert (= (and b!1448624 (not res!979472)) b!1448617))

(assert (= (and b!1448617 res!979460) b!1448619))

(assert (= (and b!1448618 (not res!979457)) b!1448614))

(declare-fun m!1337551 () Bool)

(assert (=> b!1448618 m!1337551))

(declare-fun m!1337553 () Bool)

(assert (=> b!1448618 m!1337553))

(declare-fun m!1337555 () Bool)

(assert (=> b!1448618 m!1337555))

(declare-fun m!1337557 () Bool)

(assert (=> b!1448618 m!1337557))

(declare-fun m!1337559 () Bool)

(assert (=> b!1448618 m!1337559))

(declare-fun m!1337561 () Bool)

(assert (=> b!1448618 m!1337561))

(declare-fun m!1337563 () Bool)

(assert (=> b!1448618 m!1337563))

(declare-fun m!1337565 () Bool)

(assert (=> b!1448618 m!1337565))

(assert (=> b!1448618 m!1337561))

(assert (=> b!1448624 m!1337559))

(assert (=> b!1448624 m!1337553))

(assert (=> b!1448624 m!1337557))

(assert (=> b!1448624 m!1337561))

(declare-fun m!1337567 () Bool)

(assert (=> b!1448615 m!1337567))

(assert (=> b!1448615 m!1337567))

(declare-fun m!1337569 () Bool)

(assert (=> b!1448615 m!1337569))

(declare-fun m!1337571 () Bool)

(assert (=> b!1448621 m!1337571))

(assert (=> b!1448630 m!1337561))

(assert (=> b!1448630 m!1337561))

(declare-fun m!1337573 () Bool)

(assert (=> b!1448630 m!1337573))

(declare-fun m!1337575 () Bool)

(assert (=> b!1448622 m!1337575))

(declare-fun m!1337577 () Bool)

(assert (=> b!1448627 m!1337577))

(assert (=> b!1448627 m!1337577))

(declare-fun m!1337579 () Bool)

(assert (=> b!1448627 m!1337579))

(assert (=> b!1448627 m!1337553))

(declare-fun m!1337581 () Bool)

(assert (=> b!1448627 m!1337581))

(assert (=> b!1448617 m!1337561))

(assert (=> b!1448617 m!1337561))

(declare-fun m!1337583 () Bool)

(assert (=> b!1448617 m!1337583))

(assert (=> b!1448629 m!1337561))

(assert (=> b!1448629 m!1337561))

(declare-fun m!1337585 () Bool)

(assert (=> b!1448629 m!1337585))

(declare-fun m!1337587 () Bool)

(assert (=> b!1448616 m!1337587))

(declare-fun m!1337589 () Bool)

(assert (=> b!1448628 m!1337589))

(declare-fun m!1337591 () Bool)

(assert (=> b!1448628 m!1337591))

(declare-fun m!1337593 () Bool)

(assert (=> start!124992 m!1337593))

(declare-fun m!1337595 () Bool)

(assert (=> start!124992 m!1337595))

(assert (=> b!1448632 m!1337553))

(declare-fun m!1337597 () Bool)

(assert (=> b!1448632 m!1337597))

(assert (=> b!1448631 m!1337561))

(assert (=> b!1448631 m!1337561))

(declare-fun m!1337599 () Bool)

(assert (=> b!1448631 m!1337599))

(assert (=> b!1448631 m!1337599))

(assert (=> b!1448631 m!1337561))

(declare-fun m!1337601 () Bool)

(assert (=> b!1448631 m!1337601))

(assert (=> b!1448614 m!1337561))

(assert (=> b!1448614 m!1337561))

(declare-fun m!1337603 () Bool)

(assert (=> b!1448614 m!1337603))

(check-sat (not b!1448618) (not b!1448621) (not b!1448629) (not b!1448615) (not b!1448627) (not b!1448617) (not b!1448631) (not b!1448630) (not b!1448616) (not b!1448628) (not start!124992) (not b!1448622) (not b!1448614))
(check-sat)
