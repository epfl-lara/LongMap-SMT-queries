; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126652 () Bool)

(assert start!126652)

(declare-fun b!1486630 () Bool)

(declare-fun res!1010962 () Bool)

(declare-fun e!833371 () Bool)

(assert (=> b!1486630 (=> (not res!1010962) (not e!833371))))

(declare-datatypes ((array!99551 0))(
  ( (array!99552 (arr!48050 (Array (_ BitVec 32) (_ BitVec 64))) (size!48600 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99551)

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1486630 (= res!1010962 (validKeyInArray!0 (select (arr!48050 a!2862) i!1006)))))

(declare-fun lt!648534 () array!99551)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun b!1486631 () Bool)

(declare-fun e!833370 () Bool)

(declare-fun lt!648533 () (_ BitVec 64))

(declare-fun index!646 () (_ BitVec 32))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12290 0))(
  ( (MissingZero!12290 (index!51552 (_ BitVec 32))) (Found!12290 (index!51553 (_ BitVec 32))) (Intermediate!12290 (undefined!13102 Bool) (index!51554 (_ BitVec 32)) (x!133138 (_ BitVec 32))) (Undefined!12290) (MissingVacant!12290 (index!51555 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99551 (_ BitVec 32)) SeekEntryResult!12290)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99551 (_ BitVec 32)) SeekEntryResult!12290)

(assert (=> b!1486631 (= e!833370 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648533 lt!648534 mask!2687) (seekEntryOrOpen!0 lt!648533 lt!648534 mask!2687)))))

(declare-fun res!1010975 () Bool)

(assert (=> start!126652 (=> (not res!1010975) (not e!833371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126652 (= res!1010975 (validMask!0 mask!2687))))

(assert (=> start!126652 e!833371))

(assert (=> start!126652 true))

(declare-fun array_inv!37078 (array!99551) Bool)

(assert (=> start!126652 (array_inv!37078 a!2862)))

(declare-fun lt!648535 () SeekEntryResult!12290)

(declare-fun b!1486632 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99551 (_ BitVec 32)) SeekEntryResult!12290)

(assert (=> b!1486632 (= e!833370 (= lt!648535 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!648533 lt!648534 mask!2687)))))

(declare-fun b!1486633 () Bool)

(declare-fun res!1010965 () Bool)

(assert (=> b!1486633 (=> (not res!1010965) (not e!833371))))

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1486633 (= res!1010965 (and (= (size!48600 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48600 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48600 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1486634 () Bool)

(declare-fun res!1010970 () Bool)

(assert (=> b!1486634 (=> (not res!1010970) (not e!833371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99551 (_ BitVec 32)) Bool)

(assert (=> b!1486634 (= res!1010970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1486635 () Bool)

(declare-fun e!833372 () Bool)

(declare-fun e!833367 () Bool)

(assert (=> b!1486635 (= e!833372 e!833367)))

(declare-fun res!1010973 () Bool)

(assert (=> b!1486635 (=> (not res!1010973) (not e!833367))))

(declare-fun lt!648531 () (_ BitVec 64))

(assert (=> b!1486635 (= res!1010973 (and (= index!646 intermediateAfterIndex!19) (= lt!648531 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1486636 () Bool)

(declare-fun res!1010974 () Bool)

(declare-fun e!833366 () Bool)

(assert (=> b!1486636 (=> (not res!1010974) (not e!833366))))

(assert (=> b!1486636 (= res!1010974 e!833370)))

(declare-fun c!137358 () Bool)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1486636 (= c!137358 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1486637 () Bool)

(declare-fun res!1010971 () Bool)

(declare-fun e!833363 () Bool)

(assert (=> b!1486637 (=> (not res!1010971) (not e!833363))))

(declare-fun lt!648537 () SeekEntryResult!12290)

(assert (=> b!1486637 (= res!1010971 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48050 a!2862) j!93) a!2862 mask!2687) lt!648537))))

(declare-fun b!1486638 () Bool)

(declare-fun e!833368 () Bool)

(assert (=> b!1486638 (= e!833368 e!833372)))

(declare-fun res!1010969 () Bool)

(assert (=> b!1486638 (=> res!1010969 e!833372)))

(assert (=> b!1486638 (= res!1010969 (or (and (= (select (arr!48050 a!2862) index!646) lt!648531) (= (select (arr!48050 a!2862) index!646) (select (arr!48050 a!2862) j!93))) (= (select (arr!48050 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486638 (= lt!648531 (select (store (arr!48050 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646))))

(declare-fun b!1486639 () Bool)

(declare-fun res!1010963 () Bool)

(assert (=> b!1486639 (=> (not res!1010963) (not e!833371))))

(assert (=> b!1486639 (= res!1010963 (validKeyInArray!0 (select (arr!48050 a!2862) j!93)))))

(declare-fun b!1486640 () Bool)

(declare-fun e!833365 () Bool)

(assert (=> b!1486640 (= e!833365 e!833363)))

(declare-fun res!1010980 () Bool)

(assert (=> b!1486640 (=> (not res!1010980) (not e!833363))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486640 (= res!1010980 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48050 a!2862) j!93) mask!2687) (select (arr!48050 a!2862) j!93) a!2862 mask!2687) lt!648537))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1486640 (= lt!648537 (Intermediate!12290 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1486641 () Bool)

(declare-fun res!1010964 () Bool)

(assert (=> b!1486641 (=> (not res!1010964) (not e!833366))))

(assert (=> b!1486641 (= res!1010964 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1486642 () Bool)

(declare-fun res!1010976 () Bool)

(assert (=> b!1486642 (=> (not res!1010976) (not e!833371))))

(declare-datatypes ((List!34551 0))(
  ( (Nil!34548) (Cons!34547 (h!35924 (_ BitVec 64)) (t!49245 List!34551)) )
))
(declare-fun arrayNoDuplicates!0 (array!99551 (_ BitVec 32) List!34551) Bool)

(assert (=> b!1486642 (= res!1010976 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34548))))

(declare-fun b!1486643 () Bool)

(assert (=> b!1486643 (= e!833367 (= (seekEntryOrOpen!0 lt!648533 lt!648534 mask!2687) (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!648533 lt!648534 mask!2687)))))

(declare-fun b!1486644 () Bool)

(declare-fun res!1010967 () Bool)

(assert (=> b!1486644 (=> (not res!1010967) (not e!833371))))

(assert (=> b!1486644 (= res!1010967 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48600 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48600 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48600 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1486645 () Bool)

(assert (=> b!1486645 (= e!833363 e!833366)))

(declare-fun res!1010979 () Bool)

(assert (=> b!1486645 (=> (not res!1010979) (not e!833366))))

(assert (=> b!1486645 (= res!1010979 (= lt!648535 (Intermediate!12290 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1486645 (= lt!648535 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!648533 mask!2687) lt!648533 lt!648534 mask!2687))))

(assert (=> b!1486645 (= lt!648533 (select (store (arr!48050 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1486646 () Bool)

(declare-fun e!833369 () Bool)

(assert (=> b!1486646 (= e!833366 (not e!833369))))

(declare-fun res!1010968 () Bool)

(assert (=> b!1486646 (=> res!1010968 e!833369)))

(assert (=> b!1486646 (= res!1010968 (or (and (= (select (arr!48050 a!2862) index!646) (select (store (arr!48050 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48050 a!2862) index!646) (select (arr!48050 a!2862) j!93))) (= (select (arr!48050 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= x!665 intermediateAfterX!19))))))

(assert (=> b!1486646 e!833368))

(declare-fun res!1010972 () Bool)

(assert (=> b!1486646 (=> (not res!1010972) (not e!833368))))

(assert (=> b!1486646 (= res!1010972 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!49920 0))(
  ( (Unit!49921) )
))
(declare-fun lt!648536 () Unit!49920)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49920)

(assert (=> b!1486646 (= lt!648536 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1486647 () Bool)

(declare-fun res!1010966 () Bool)

(assert (=> b!1486647 (=> (not res!1010966) (not e!833368))))

(assert (=> b!1486647 (= res!1010966 (= (seekEntryOrOpen!0 (select (arr!48050 a!2862) j!93) a!2862 mask!2687) (Found!12290 j!93)))))

(declare-fun b!1486648 () Bool)

(assert (=> b!1486648 (= e!833369 true)))

(declare-fun lt!648532 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1486648 (= lt!648532 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1486649 () Bool)

(declare-fun res!1010977 () Bool)

(assert (=> b!1486649 (=> (not res!1010977) (not e!833368))))

(assert (=> b!1486649 (= res!1010977 (or (= (select (arr!48050 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48050 a!2862) intermediateBeforeIndex!19) (select (arr!48050 a!2862) j!93))))))

(declare-fun b!1486650 () Bool)

(assert (=> b!1486650 (= e!833371 e!833365)))

(declare-fun res!1010978 () Bool)

(assert (=> b!1486650 (=> (not res!1010978) (not e!833365))))

(assert (=> b!1486650 (= res!1010978 (= (select (store (arr!48050 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1486650 (= lt!648534 (array!99552 (store (arr!48050 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48600 a!2862)))))

(assert (= (and start!126652 res!1010975) b!1486633))

(assert (= (and b!1486633 res!1010965) b!1486630))

(assert (= (and b!1486630 res!1010962) b!1486639))

(assert (= (and b!1486639 res!1010963) b!1486634))

(assert (= (and b!1486634 res!1010970) b!1486642))

(assert (= (and b!1486642 res!1010976) b!1486644))

(assert (= (and b!1486644 res!1010967) b!1486650))

(assert (= (and b!1486650 res!1010978) b!1486640))

(assert (= (and b!1486640 res!1010980) b!1486637))

(assert (= (and b!1486637 res!1010971) b!1486645))

(assert (= (and b!1486645 res!1010979) b!1486636))

(assert (= (and b!1486636 c!137358) b!1486632))

(assert (= (and b!1486636 (not c!137358)) b!1486631))

(assert (= (and b!1486636 res!1010974) b!1486641))

(assert (= (and b!1486641 res!1010964) b!1486646))

(assert (= (and b!1486646 res!1010972) b!1486647))

(assert (= (and b!1486647 res!1010966) b!1486649))

(assert (= (and b!1486649 res!1010977) b!1486638))

(assert (= (and b!1486638 (not res!1010969)) b!1486635))

(assert (= (and b!1486635 res!1010973) b!1486643))

(assert (= (and b!1486646 (not res!1010968)) b!1486648))

(declare-fun m!1371475 () Bool)

(assert (=> b!1486648 m!1371475))

(declare-fun m!1371477 () Bool)

(assert (=> b!1486647 m!1371477))

(assert (=> b!1486647 m!1371477))

(declare-fun m!1371479 () Bool)

(assert (=> b!1486647 m!1371479))

(assert (=> b!1486640 m!1371477))

(assert (=> b!1486640 m!1371477))

(declare-fun m!1371481 () Bool)

(assert (=> b!1486640 m!1371481))

(assert (=> b!1486640 m!1371481))

(assert (=> b!1486640 m!1371477))

(declare-fun m!1371483 () Bool)

(assert (=> b!1486640 m!1371483))

(declare-fun m!1371485 () Bool)

(assert (=> b!1486631 m!1371485))

(declare-fun m!1371487 () Bool)

(assert (=> b!1486631 m!1371487))

(declare-fun m!1371489 () Bool)

(assert (=> b!1486649 m!1371489))

(assert (=> b!1486649 m!1371477))

(declare-fun m!1371491 () Bool)

(assert (=> b!1486650 m!1371491))

(declare-fun m!1371493 () Bool)

(assert (=> b!1486650 m!1371493))

(declare-fun m!1371495 () Bool)

(assert (=> b!1486632 m!1371495))

(declare-fun m!1371497 () Bool)

(assert (=> b!1486638 m!1371497))

(assert (=> b!1486638 m!1371477))

(assert (=> b!1486638 m!1371491))

(declare-fun m!1371499 () Bool)

(assert (=> b!1486638 m!1371499))

(declare-fun m!1371501 () Bool)

(assert (=> b!1486630 m!1371501))

(assert (=> b!1486630 m!1371501))

(declare-fun m!1371503 () Bool)

(assert (=> b!1486630 m!1371503))

(declare-fun m!1371505 () Bool)

(assert (=> b!1486634 m!1371505))

(declare-fun m!1371507 () Bool)

(assert (=> start!126652 m!1371507))

(declare-fun m!1371509 () Bool)

(assert (=> start!126652 m!1371509))

(declare-fun m!1371511 () Bool)

(assert (=> b!1486645 m!1371511))

(assert (=> b!1486645 m!1371511))

(declare-fun m!1371513 () Bool)

(assert (=> b!1486645 m!1371513))

(assert (=> b!1486645 m!1371491))

(declare-fun m!1371515 () Bool)

(assert (=> b!1486645 m!1371515))

(declare-fun m!1371517 () Bool)

(assert (=> b!1486642 m!1371517))

(declare-fun m!1371519 () Bool)

(assert (=> b!1486646 m!1371519))

(assert (=> b!1486646 m!1371491))

(assert (=> b!1486646 m!1371499))

(assert (=> b!1486646 m!1371497))

(declare-fun m!1371521 () Bool)

(assert (=> b!1486646 m!1371521))

(assert (=> b!1486646 m!1371477))

(assert (=> b!1486639 m!1371477))

(assert (=> b!1486639 m!1371477))

(declare-fun m!1371523 () Bool)

(assert (=> b!1486639 m!1371523))

(assert (=> b!1486643 m!1371487))

(assert (=> b!1486643 m!1371485))

(assert (=> b!1486637 m!1371477))

(assert (=> b!1486637 m!1371477))

(declare-fun m!1371525 () Bool)

(assert (=> b!1486637 m!1371525))

(push 1)

