; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!125028 () Bool)

(assert start!125028)

(declare-fun b!1449640 () Bool)

(declare-fun res!980389 () Bool)

(declare-fun e!816486 () Bool)

(assert (=> b!1449640 (=> (not res!980389) (not e!816486))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11619 0))(
  ( (MissingZero!11619 (index!48868 (_ BitVec 32))) (Found!11619 (index!48869 (_ BitVec 32))) (Intermediate!11619 (undefined!12431 Bool) (index!48870 (_ BitVec 32)) (x!130716 (_ BitVec 32))) (Undefined!11619) (MissingVacant!11619 (index!48871 (_ BitVec 32))) )
))
(declare-fun lt!635964 () SeekEntryResult!11619)

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!98371 0))(
  ( (array!98372 (arr!47470 (Array (_ BitVec 32) (_ BitVec 64))) (size!48021 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!98371)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98371 (_ BitVec 32)) SeekEntryResult!11619)

(assert (=> b!1449640 (= res!980389 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47470 a!2862) j!93) a!2862 mask!2687) lt!635964))))

(declare-fun b!1449641 () Bool)

(declare-fun res!980386 () Bool)

(declare-fun e!816492 () Bool)

(assert (=> b!1449641 (=> (not res!980386) (not e!816492))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1449641 (= res!980386 (and (= (size!48021 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48021 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48021 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1449642 () Bool)

(declare-fun res!980390 () Bool)

(declare-fun e!816483 () Bool)

(assert (=> b!1449642 (=> (not res!980390) (not e!816483))))

(declare-fun e!816490 () Bool)

(assert (=> b!1449642 (= res!980390 e!816490)))

(declare-fun c!134152 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1449642 (= c!134152 (bvsle x!665 intermediateAfterX!19))))

(declare-fun lt!635962 () (_ BitVec 64))

(declare-fun lt!635963 () array!98371)

(declare-fun b!1449643 () Bool)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!98371 (_ BitVec 32)) SeekEntryResult!11619)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!98371 (_ BitVec 32)) SeekEntryResult!11619)

(assert (=> b!1449643 (= e!816490 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!635962 lt!635963 mask!2687) (seekEntryOrOpen!0 lt!635962 lt!635963 mask!2687)))))

(declare-fun b!1449644 () Bool)

(declare-fun res!980377 () Bool)

(assert (=> b!1449644 (=> (not res!980377) (not e!816492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!98371 (_ BitVec 32)) Bool)

(assert (=> b!1449644 (= res!980377 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1449645 () Bool)

(declare-fun e!816487 () Bool)

(assert (=> b!1449645 (= e!816487 true)))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun lt!635966 () SeekEntryResult!11619)

(assert (=> b!1449645 (= lt!635966 (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateBeforeIndex!19 (select (arr!47470 a!2862) j!93) a!2862 mask!2687))))

(declare-fun b!1449646 () Bool)

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun e!816485 () Bool)

(assert (=> b!1449646 (= e!816485 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(declare-fun b!1449648 () Bool)

(assert (=> b!1449648 (= e!816486 e!816483)))

(declare-fun res!980380 () Bool)

(assert (=> b!1449648 (=> (not res!980380) (not e!816483))))

(declare-fun lt!635965 () SeekEntryResult!11619)

(assert (=> b!1449648 (= res!980380 (= lt!635965 (Intermediate!11619 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1449648 (= lt!635965 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!635962 mask!2687) lt!635962 lt!635963 mask!2687))))

(assert (=> b!1449648 (= lt!635962 (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1449649 () Bool)

(declare-fun res!980382 () Bool)

(assert (=> b!1449649 (=> (not res!980382) (not e!816483))))

(assert (=> b!1449649 (= res!980382 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1449650 () Bool)

(declare-fun res!980375 () Bool)

(assert (=> b!1449650 (=> (not res!980375) (not e!816492))))

(declare-datatypes ((List!33958 0))(
  ( (Nil!33955) (Cons!33954 (h!35315 (_ BitVec 64)) (t!48644 List!33958)) )
))
(declare-fun arrayNoDuplicates!0 (array!98371 (_ BitVec 32) List!33958) Bool)

(assert (=> b!1449650 (= res!980375 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!33955))))

(declare-fun b!1449651 () Bool)

(declare-fun res!980381 () Bool)

(assert (=> b!1449651 (=> (not res!980381) (not e!816492))))

(assert (=> b!1449651 (= res!980381 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48021 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48021 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48021 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1449652 () Bool)

(declare-fun res!980376 () Bool)

(assert (=> b!1449652 (=> (not res!980376) (not e!816492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1449652 (= res!980376 (validKeyInArray!0 (select (arr!47470 a!2862) j!93)))))

(declare-fun b!1449653 () Bool)

(assert (=> b!1449653 (= e!816490 (= lt!635965 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!635962 lt!635963 mask!2687)))))

(declare-fun b!1449654 () Bool)

(declare-fun e!816489 () Bool)

(assert (=> b!1449654 (= e!816489 e!816485)))

(declare-fun res!980379 () Bool)

(assert (=> b!1449654 (=> (not res!980379) (not e!816485))))

(declare-fun lt!635967 () SeekEntryResult!11619)

(assert (=> b!1449654 (= res!980379 (= lt!635967 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47470 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1449655 () Bool)

(declare-fun e!816484 () Bool)

(assert (=> b!1449655 (= e!816484 e!816486)))

(declare-fun res!980383 () Bool)

(assert (=> b!1449655 (=> (not res!980383) (not e!816486))))

(assert (=> b!1449655 (= res!980383 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47470 a!2862) j!93) mask!2687) (select (arr!47470 a!2862) j!93) a!2862 mask!2687) lt!635964))))

(assert (=> b!1449655 (= lt!635964 (Intermediate!11619 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1449647 () Bool)

(declare-fun res!980388 () Bool)

(assert (=> b!1449647 (=> (not res!980388) (not e!816492))))

(assert (=> b!1449647 (= res!980388 (validKeyInArray!0 (select (arr!47470 a!2862) i!1006)))))

(declare-fun res!980384 () Bool)

(assert (=> start!125028 (=> (not res!980384) (not e!816492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!125028 (= res!980384 (validMask!0 mask!2687))))

(assert (=> start!125028 e!816492))

(assert (=> start!125028 true))

(declare-fun array_inv!36751 (array!98371) Bool)

(assert (=> start!125028 (array_inv!36751 a!2862)))

(declare-fun b!1449656 () Bool)

(assert (=> b!1449656 (= e!816483 (not e!816487))))

(declare-fun res!980385 () Bool)

(assert (=> b!1449656 (=> res!980385 e!816487)))

(assert (=> b!1449656 (= res!980385 (or (and (= (select (arr!47470 a!2862) index!646) (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47470 a!2862) index!646) (select (arr!47470 a!2862) j!93))) (not (= (select (arr!47470 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!47470 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!816488 () Bool)

(assert (=> b!1449656 e!816488))

(declare-fun res!980378 () Bool)

(assert (=> b!1449656 (=> (not res!980378) (not e!816488))))

(assert (=> b!1449656 (= res!980378 (and (= lt!635967 (Found!11619 j!93)) (or (= (select (arr!47470 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47470 a!2862) intermediateBeforeIndex!19) (select (arr!47470 a!2862) j!93)))))))

(assert (=> b!1449656 (= lt!635967 (seekEntryOrOpen!0 (select (arr!47470 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1449656 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!48767 0))(
  ( (Unit!48768) )
))
(declare-fun lt!635968 () Unit!48767)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!98371 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48767)

(assert (=> b!1449656 (= lt!635968 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1449657 () Bool)

(assert (=> b!1449657 (= e!816492 e!816484)))

(declare-fun res!980374 () Bool)

(assert (=> b!1449657 (=> (not res!980374) (not e!816484))))

(assert (=> b!1449657 (= res!980374 (= (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1449657 (= lt!635963 (array!98372 (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48021 a!2862)))))

(declare-fun b!1449658 () Bool)

(assert (=> b!1449658 (= e!816488 e!816489)))

(declare-fun res!980387 () Bool)

(assert (=> b!1449658 (=> res!980387 e!816489)))

(assert (=> b!1449658 (= res!980387 (or (and (= (select (arr!47470 a!2862) index!646) (select (store (arr!47470 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47470 a!2862) index!646) (select (arr!47470 a!2862) j!93))) (not (= (select (arr!47470 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!125028 res!980384) b!1449641))

(assert (= (and b!1449641 res!980386) b!1449647))

(assert (= (and b!1449647 res!980388) b!1449652))

(assert (= (and b!1449652 res!980376) b!1449644))

(assert (= (and b!1449644 res!980377) b!1449650))

(assert (= (and b!1449650 res!980375) b!1449651))

(assert (= (and b!1449651 res!980381) b!1449657))

(assert (= (and b!1449657 res!980374) b!1449655))

(assert (= (and b!1449655 res!980383) b!1449640))

(assert (= (and b!1449640 res!980389) b!1449648))

(assert (= (and b!1449648 res!980380) b!1449642))

(assert (= (and b!1449642 c!134152) b!1449653))

(assert (= (and b!1449642 (not c!134152)) b!1449643))

(assert (= (and b!1449642 res!980390) b!1449649))

(assert (= (and b!1449649 res!980382) b!1449656))

(assert (= (and b!1449656 res!980378) b!1449658))

(assert (= (and b!1449658 (not res!980387)) b!1449654))

(assert (= (and b!1449654 res!980379) b!1449646))

(assert (= (and b!1449656 (not res!980385)) b!1449645))

(declare-fun m!1338523 () Bool)

(assert (=> b!1449658 m!1338523))

(declare-fun m!1338525 () Bool)

(assert (=> b!1449658 m!1338525))

(declare-fun m!1338527 () Bool)

(assert (=> b!1449658 m!1338527))

(declare-fun m!1338529 () Bool)

(assert (=> b!1449658 m!1338529))

(declare-fun m!1338531 () Bool)

(assert (=> b!1449650 m!1338531))

(assert (=> b!1449640 m!1338529))

(assert (=> b!1449640 m!1338529))

(declare-fun m!1338533 () Bool)

(assert (=> b!1449640 m!1338533))

(assert (=> b!1449652 m!1338529))

(assert (=> b!1449652 m!1338529))

(declare-fun m!1338535 () Bool)

(assert (=> b!1449652 m!1338535))

(declare-fun m!1338537 () Bool)

(assert (=> b!1449644 m!1338537))

(assert (=> b!1449645 m!1338529))

(assert (=> b!1449645 m!1338529))

(declare-fun m!1338539 () Bool)

(assert (=> b!1449645 m!1338539))

(declare-fun m!1338541 () Bool)

(assert (=> start!125028 m!1338541))

(declare-fun m!1338543 () Bool)

(assert (=> start!125028 m!1338543))

(declare-fun m!1338545 () Bool)

(assert (=> b!1449656 m!1338545))

(assert (=> b!1449656 m!1338525))

(declare-fun m!1338547 () Bool)

(assert (=> b!1449656 m!1338547))

(assert (=> b!1449656 m!1338527))

(assert (=> b!1449656 m!1338523))

(assert (=> b!1449656 m!1338529))

(declare-fun m!1338549 () Bool)

(assert (=> b!1449656 m!1338549))

(declare-fun m!1338551 () Bool)

(assert (=> b!1449656 m!1338551))

(assert (=> b!1449656 m!1338529))

(declare-fun m!1338553 () Bool)

(assert (=> b!1449648 m!1338553))

(assert (=> b!1449648 m!1338553))

(declare-fun m!1338555 () Bool)

(assert (=> b!1449648 m!1338555))

(assert (=> b!1449648 m!1338525))

(declare-fun m!1338557 () Bool)

(assert (=> b!1449648 m!1338557))

(declare-fun m!1338559 () Bool)

(assert (=> b!1449653 m!1338559))

(declare-fun m!1338561 () Bool)

(assert (=> b!1449647 m!1338561))

(assert (=> b!1449647 m!1338561))

(declare-fun m!1338563 () Bool)

(assert (=> b!1449647 m!1338563))

(assert (=> b!1449657 m!1338525))

(declare-fun m!1338565 () Bool)

(assert (=> b!1449657 m!1338565))

(assert (=> b!1449655 m!1338529))

(assert (=> b!1449655 m!1338529))

(declare-fun m!1338567 () Bool)

(assert (=> b!1449655 m!1338567))

(assert (=> b!1449655 m!1338567))

(assert (=> b!1449655 m!1338529))

(declare-fun m!1338569 () Bool)

(assert (=> b!1449655 m!1338569))

(declare-fun m!1338571 () Bool)

(assert (=> b!1449643 m!1338571))

(declare-fun m!1338573 () Bool)

(assert (=> b!1449643 m!1338573))

(assert (=> b!1449654 m!1338529))

(assert (=> b!1449654 m!1338529))

(declare-fun m!1338575 () Bool)

(assert (=> b!1449654 m!1338575))

(check-sat (not b!1449644) (not b!1449652) (not start!125028) (not b!1449654) (not b!1449648) (not b!1449653) (not b!1449640) (not b!1449643) (not b!1449645) (not b!1449650) (not b!1449647) (not b!1449656) (not b!1449655))
(check-sat)
