; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122724 () Bool)

(assert start!122724)

(declare-fun b!1422015 () Bool)

(declare-fun e!803959 () Bool)

(assert (=> b!1422015 (= e!803959 true)))

(declare-datatypes ((array!97089 0))(
  ( (array!97090 (arr!46862 (Array (_ BitVec 32) (_ BitVec 64))) (size!47412 (_ BitVec 32))) )
))
(declare-fun lt!626496 () array!97089)

(declare-fun lt!626494 () (_ BitVec 64))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!11147 0))(
  ( (MissingZero!11147 (index!46980 (_ BitVec 32))) (Found!11147 (index!46981 (_ BitVec 32))) (Intermediate!11147 (undefined!11959 Bool) (index!46982 (_ BitVec 32)) (x!128629 (_ BitVec 32))) (Undefined!11147) (MissingVacant!11147 (index!46983 (_ BitVec 32))) )
))
(declare-fun lt!626490 () SeekEntryResult!11147)

(declare-fun lt!626491 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97089 (_ BitVec 32)) SeekEntryResult!11147)

(assert (=> b!1422015 (= lt!626490 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626491 lt!626494 lt!626496 mask!2608))))

(declare-fun res!957453 () Bool)

(declare-fun e!803955 () Bool)

(assert (=> start!122724 (=> (not res!957453) (not e!803955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122724 (= res!957453 (validMask!0 mask!2608))))

(assert (=> start!122724 e!803955))

(assert (=> start!122724 true))

(declare-fun a!2831 () array!97089)

(declare-fun array_inv!35890 (array!97089) Bool)

(assert (=> start!122724 (array_inv!35890 a!2831)))

(declare-fun b!1422016 () Bool)

(declare-fun res!957461 () Bool)

(assert (=> b!1422016 (=> (not res!957461) (not e!803955))))

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1422016 (= res!957461 (validKeyInArray!0 (select (arr!46862 a!2831) i!982)))))

(declare-fun b!1422017 () Bool)

(declare-fun e!803957 () Bool)

(declare-fun e!803954 () Bool)

(assert (=> b!1422017 (= e!803957 (not e!803954))))

(declare-fun res!957456 () Bool)

(assert (=> b!1422017 (=> res!957456 e!803954)))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(assert (=> b!1422017 (= res!957456 (or (= (select (arr!46862 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46862 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!46862 a!2831) index!585) (select (arr!46862 a!2831) j!81)) (= (select (store (arr!46862 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!803958 () Bool)

(assert (=> b!1422017 e!803958))

(declare-fun res!957454 () Bool)

(assert (=> b!1422017 (=> (not res!957454) (not e!803958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97089 (_ BitVec 32)) Bool)

(assert (=> b!1422017 (= res!957454 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48130 0))(
  ( (Unit!48131) )
))
(declare-fun lt!626495 () Unit!48130)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97089 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48130)

(assert (=> b!1422017 (= lt!626495 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun b!1422018 () Bool)

(declare-fun res!957452 () Bool)

(assert (=> b!1422018 (=> (not res!957452) (not e!803955))))

(assert (=> b!1422018 (= res!957452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1422019 () Bool)

(declare-fun res!957462 () Bool)

(assert (=> b!1422019 (=> (not res!957462) (not e!803955))))

(declare-datatypes ((List!33372 0))(
  ( (Nil!33369) (Cons!33368 (h!34670 (_ BitVec 64)) (t!48066 List!33372)) )
))
(declare-fun arrayNoDuplicates!0 (array!97089 (_ BitVec 32) List!33372) Bool)

(assert (=> b!1422019 (= res!957462 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33369))))

(declare-fun b!1422020 () Bool)

(declare-fun res!957463 () Bool)

(assert (=> b!1422020 (=> (not res!957463) (not e!803957))))

(declare-fun lt!626492 () SeekEntryResult!11147)

(assert (=> b!1422020 (= res!957463 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!626494 lt!626496 mask!2608) lt!626492))))

(declare-fun b!1422021 () Bool)

(declare-fun e!803956 () Bool)

(assert (=> b!1422021 (= e!803955 e!803956)))

(declare-fun res!957455 () Bool)

(assert (=> b!1422021 (=> (not res!957455) (not e!803956))))

(declare-fun lt!626493 () SeekEntryResult!11147)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422021 (= res!957455 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46862 a!2831) j!81) mask!2608) (select (arr!46862 a!2831) j!81) a!2831 mask!2608) lt!626493))))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(assert (=> b!1422021 (= lt!626493 (Intermediate!11147 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1422022 () Bool)

(declare-fun res!957451 () Bool)

(assert (=> b!1422022 (=> (not res!957451) (not e!803957))))

(assert (=> b!1422022 (= res!957451 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!46862 a!2831) j!81) a!2831 mask!2608) lt!626493))))

(declare-fun b!1422023 () Bool)

(declare-fun res!957458 () Bool)

(assert (=> b!1422023 (=> (not res!957458) (not e!803955))))

(assert (=> b!1422023 (= res!957458 (and (= (size!47412 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47412 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47412 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1422024 () Bool)

(assert (=> b!1422024 (= e!803956 e!803957)))

(declare-fun res!957457 () Bool)

(assert (=> b!1422024 (=> (not res!957457) (not e!803957))))

(assert (=> b!1422024 (= res!957457 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!626494 mask!2608) lt!626494 lt!626496 mask!2608) lt!626492))))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1422024 (= lt!626492 (Intermediate!11147 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1422024 (= lt!626494 (select (store (arr!46862 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1422024 (= lt!626496 (array!97090 (store (arr!46862 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47412 a!2831)))))

(declare-fun b!1422025 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97089 (_ BitVec 32)) SeekEntryResult!11147)

(assert (=> b!1422025 (= e!803958 (= (seekEntryOrOpen!0 (select (arr!46862 a!2831) j!81) a!2831 mask!2608) (Found!11147 j!81)))))

(declare-fun b!1422026 () Bool)

(declare-fun res!957449 () Bool)

(assert (=> b!1422026 (=> res!957449 e!803959)))

(assert (=> b!1422026 (= res!957449 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!605) lt!626491 (select (arr!46862 a!2831) j!81) a!2831 mask!2608) lt!626493)))))

(declare-fun b!1422027 () Bool)

(assert (=> b!1422027 (= e!803954 e!803959)))

(declare-fun res!957448 () Bool)

(assert (=> b!1422027 (=> res!957448 e!803959)))

(assert (=> b!1422027 (= res!957448 (or (bvslt (bvadd #b00000000000000000000000000000001 x!605) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!605) #b01111111111111111111111111111110) (bvslt lt!626491 #b00000000000000000000000000000000) (bvsge lt!626491 (size!47412 a!2831))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1422027 (= lt!626491 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1422028 () Bool)

(declare-fun res!957450 () Bool)

(assert (=> b!1422028 (=> (not res!957450) (not e!803957))))

(assert (=> b!1422028 (= res!957450 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1422029 () Bool)

(declare-fun res!957459 () Bool)

(assert (=> b!1422029 (=> (not res!957459) (not e!803955))))

(assert (=> b!1422029 (= res!957459 (validKeyInArray!0 (select (arr!46862 a!2831) j!81)))))

(declare-fun b!1422030 () Bool)

(declare-fun res!957460 () Bool)

(assert (=> b!1422030 (=> (not res!957460) (not e!803955))))

(assert (=> b!1422030 (= res!957460 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47412 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47412 a!2831))))))

(assert (= (and start!122724 res!957453) b!1422023))

(assert (= (and b!1422023 res!957458) b!1422016))

(assert (= (and b!1422016 res!957461) b!1422029))

(assert (= (and b!1422029 res!957459) b!1422018))

(assert (= (and b!1422018 res!957452) b!1422019))

(assert (= (and b!1422019 res!957462) b!1422030))

(assert (= (and b!1422030 res!957460) b!1422021))

(assert (= (and b!1422021 res!957455) b!1422024))

(assert (= (and b!1422024 res!957457) b!1422022))

(assert (= (and b!1422022 res!957451) b!1422020))

(assert (= (and b!1422020 res!957463) b!1422028))

(assert (= (and b!1422028 res!957450) b!1422017))

(assert (= (and b!1422017 res!957454) b!1422025))

(assert (= (and b!1422017 (not res!957456)) b!1422027))

(assert (= (and b!1422027 (not res!957448)) b!1422026))

(assert (= (and b!1422026 (not res!957449)) b!1422015))

(declare-fun m!1312563 () Bool)

(assert (=> b!1422025 m!1312563))

(assert (=> b!1422025 m!1312563))

(declare-fun m!1312565 () Bool)

(assert (=> b!1422025 m!1312565))

(assert (=> b!1422029 m!1312563))

(assert (=> b!1422029 m!1312563))

(declare-fun m!1312567 () Bool)

(assert (=> b!1422029 m!1312567))

(declare-fun m!1312569 () Bool)

(assert (=> b!1422017 m!1312569))

(declare-fun m!1312571 () Bool)

(assert (=> b!1422017 m!1312571))

(declare-fun m!1312573 () Bool)

(assert (=> b!1422017 m!1312573))

(declare-fun m!1312575 () Bool)

(assert (=> b!1422017 m!1312575))

(assert (=> b!1422017 m!1312563))

(declare-fun m!1312577 () Bool)

(assert (=> b!1422017 m!1312577))

(declare-fun m!1312579 () Bool)

(assert (=> b!1422020 m!1312579))

(declare-fun m!1312581 () Bool)

(assert (=> b!1422024 m!1312581))

(assert (=> b!1422024 m!1312581))

(declare-fun m!1312583 () Bool)

(assert (=> b!1422024 m!1312583))

(assert (=> b!1422024 m!1312569))

(declare-fun m!1312585 () Bool)

(assert (=> b!1422024 m!1312585))

(declare-fun m!1312587 () Bool)

(assert (=> b!1422027 m!1312587))

(declare-fun m!1312589 () Bool)

(assert (=> b!1422015 m!1312589))

(declare-fun m!1312591 () Bool)

(assert (=> b!1422019 m!1312591))

(assert (=> b!1422026 m!1312563))

(assert (=> b!1422026 m!1312563))

(declare-fun m!1312593 () Bool)

(assert (=> b!1422026 m!1312593))

(assert (=> b!1422021 m!1312563))

(assert (=> b!1422021 m!1312563))

(declare-fun m!1312595 () Bool)

(assert (=> b!1422021 m!1312595))

(assert (=> b!1422021 m!1312595))

(assert (=> b!1422021 m!1312563))

(declare-fun m!1312597 () Bool)

(assert (=> b!1422021 m!1312597))

(declare-fun m!1312599 () Bool)

(assert (=> b!1422016 m!1312599))

(assert (=> b!1422016 m!1312599))

(declare-fun m!1312601 () Bool)

(assert (=> b!1422016 m!1312601))

(declare-fun m!1312603 () Bool)

(assert (=> b!1422018 m!1312603))

(assert (=> b!1422022 m!1312563))

(assert (=> b!1422022 m!1312563))

(declare-fun m!1312605 () Bool)

(assert (=> b!1422022 m!1312605))

(declare-fun m!1312607 () Bool)

(assert (=> start!122724 m!1312607))

(declare-fun m!1312609 () Bool)

(assert (=> start!122724 m!1312609))

(push 1)

