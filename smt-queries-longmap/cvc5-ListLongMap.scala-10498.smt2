; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!123564 () Bool)

(assert start!123564)

(declare-fun b!1432697 () Bool)

(declare-fun e!808711 () Bool)

(assert (=> b!1432697 (= e!808711 true)))

(declare-fun lt!630707 () (_ BitVec 32))

(declare-fun x!605 () (_ BitVec 32))

(declare-fun index!585 () (_ BitVec 32))

(declare-fun mask!2608 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432697 (= lt!630707 (nextIndex!0 index!585 x!605 mask!2608))))

(declare-fun b!1432698 () Bool)

(declare-fun res!966566 () Bool)

(declare-fun e!808710 () Bool)

(assert (=> b!1432698 (=> (not res!966566) (not e!808710))))

(declare-datatypes ((array!97536 0))(
  ( (array!97537 (arr!47075 (Array (_ BitVec 32) (_ BitVec 64))) (size!47625 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!97536)

(declare-fun i!982 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1432698 (= res!966566 (validKeyInArray!0 (select (arr!47075 a!2831) i!982)))))

(declare-fun b!1432699 () Bool)

(declare-fun e!808712 () Bool)

(assert (=> b!1432699 (= e!808712 (not e!808711))))

(declare-fun res!966561 () Bool)

(assert (=> b!1432699 (=> res!966561 e!808711)))

(declare-fun j!81 () (_ BitVec 32))

(assert (=> b!1432699 (= res!966561 (or (= (select (arr!47075 a!2831) index!585) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47075 a!2831) index!585) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47075 a!2831) index!585) (select (arr!47075 a!2831) j!81)) (= (select (store (arr!47075 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) index!585) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!808714 () Bool)

(assert (=> b!1432699 e!808714))

(declare-fun res!966573 () Bool)

(assert (=> b!1432699 (=> (not res!966573) (not e!808714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!97536 (_ BitVec 32)) Bool)

(assert (=> b!1432699 (= res!966573 (arrayForallSeekEntryOrOpenFound!0 j!81 a!2831 mask!2608))))

(declare-datatypes ((Unit!48454 0))(
  ( (Unit!48455) )
))
(declare-fun lt!630704 () Unit!48454)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!97536 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!48454)

(assert (=> b!1432699 (= lt!630704 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2831 mask!2608 #b00000000000000000000000000000000 j!81))))

(declare-fun res!966572 () Bool)

(assert (=> start!123564 (=> (not res!966572) (not e!808710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!123564 (= res!966572 (validMask!0 mask!2608))))

(assert (=> start!123564 e!808710))

(assert (=> start!123564 true))

(declare-fun array_inv!36103 (array!97536) Bool)

(assert (=> start!123564 (array_inv!36103 a!2831)))

(declare-fun b!1432700 () Bool)

(declare-fun res!966565 () Bool)

(assert (=> b!1432700 (=> (not res!966565) (not e!808710))))

(declare-datatypes ((List!33585 0))(
  ( (Nil!33582) (Cons!33581 (h!34904 (_ BitVec 64)) (t!48279 List!33585)) )
))
(declare-fun arrayNoDuplicates!0 (array!97536 (_ BitVec 32) List!33585) Bool)

(assert (=> b!1432700 (= res!966565 (arrayNoDuplicates!0 a!2831 #b00000000000000000000000000000000 Nil!33582))))

(declare-fun b!1432701 () Bool)

(declare-fun res!966570 () Bool)

(assert (=> b!1432701 (=> (not res!966570) (not e!808712))))

(declare-fun intermediateBeforeX!13 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!13 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!13 () (_ BitVec 32))

(declare-fun intermediateAfterX!13 () (_ BitVec 32))

(declare-fun undefinedAfter!5 () Bool)

(assert (=> b!1432701 (= res!966570 (or undefinedAfter!5 (not (= intermediateBeforeIndex!13 intermediateAfterIndex!13)) (not (= intermediateBeforeX!13 intermediateAfterX!13))))))

(declare-fun b!1432702 () Bool)

(declare-datatypes ((SeekEntryResult!11354 0))(
  ( (MissingZero!11354 (index!47808 (_ BitVec 32))) (Found!11354 (index!47809 (_ BitVec 32))) (Intermediate!11354 (undefined!12166 Bool) (index!47810 (_ BitVec 32)) (x!129452 (_ BitVec 32))) (Undefined!11354) (MissingVacant!11354 (index!47811 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!97536 (_ BitVec 32)) SeekEntryResult!11354)

(assert (=> b!1432702 (= e!808714 (= (seekEntryOrOpen!0 (select (arr!47075 a!2831) j!81) a!2831 mask!2608) (Found!11354 j!81)))))

(declare-fun b!1432703 () Bool)

(declare-fun res!966562 () Bool)

(assert (=> b!1432703 (=> (not res!966562) (not e!808710))))

(assert (=> b!1432703 (= res!966562 (and (= (size!47625 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47625 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47625 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1432704 () Bool)

(declare-fun res!966567 () Bool)

(assert (=> b!1432704 (=> (not res!966567) (not e!808710))))

(assert (=> b!1432704 (= res!966567 (and (bvsge x!605 #b00000000000000000000000000000000) (bvsle x!605 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!13 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!13 #b01111111111111111111111111111110) (bvsge index!585 #b00000000000000000000000000000000) (bvslt index!585 (size!47625 a!2831)) (bvsge intermediateBeforeIndex!13 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!13 (size!47625 a!2831))))))

(declare-fun b!1432705 () Bool)

(declare-fun res!966574 () Bool)

(assert (=> b!1432705 (=> (not res!966574) (not e!808712))))

(declare-fun lt!630708 () SeekEntryResult!11354)

(declare-fun lt!630705 () (_ BitVec 64))

(declare-fun lt!630703 () array!97536)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!97536 (_ BitVec 32)) SeekEntryResult!11354)

(assert (=> b!1432705 (= res!966574 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 lt!630705 lt!630703 mask!2608) lt!630708))))

(declare-fun b!1432706 () Bool)

(declare-fun e!808715 () Bool)

(assert (=> b!1432706 (= e!808710 e!808715)))

(declare-fun res!966571 () Bool)

(assert (=> b!1432706 (=> (not res!966571) (not e!808715))))

(declare-fun lt!630706 () SeekEntryResult!11354)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1432706 (= res!966571 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47075 a!2831) j!81) mask!2608) (select (arr!47075 a!2831) j!81) a!2831 mask!2608) lt!630706))))

(assert (=> b!1432706 (= lt!630706 (Intermediate!11354 false intermediateBeforeIndex!13 intermediateBeforeX!13))))

(declare-fun b!1432707 () Bool)

(declare-fun res!966563 () Bool)

(assert (=> b!1432707 (=> (not res!966563) (not e!808710))))

(assert (=> b!1432707 (= res!966563 (validKeyInArray!0 (select (arr!47075 a!2831) j!81)))))

(declare-fun b!1432708 () Bool)

(declare-fun res!966564 () Bool)

(assert (=> b!1432708 (=> (not res!966564) (not e!808710))))

(assert (=> b!1432708 (= res!966564 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun b!1432709 () Bool)

(assert (=> b!1432709 (= e!808715 e!808712)))

(declare-fun res!966568 () Bool)

(assert (=> b!1432709 (=> (not res!966568) (not e!808712))))

(assert (=> b!1432709 (= res!966568 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!630705 mask!2608) lt!630705 lt!630703 mask!2608) lt!630708))))

(assert (=> b!1432709 (= lt!630708 (Intermediate!11354 undefinedAfter!5 intermediateAfterIndex!13 intermediateAfterX!13))))

(assert (=> b!1432709 (= lt!630705 (select (store (arr!47075 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) j!81))))

(assert (=> b!1432709 (= lt!630703 (array!97537 (store (arr!47075 a!2831) i!982 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47625 a!2831)))))

(declare-fun b!1432710 () Bool)

(declare-fun res!966569 () Bool)

(assert (=> b!1432710 (=> (not res!966569) (not e!808712))))

(assert (=> b!1432710 (= res!966569 (= (seekKeyOrZeroOrLongMinValue!0 x!605 index!585 (select (arr!47075 a!2831) j!81) a!2831 mask!2608) lt!630706))))

(assert (= (and start!123564 res!966572) b!1432703))

(assert (= (and b!1432703 res!966562) b!1432698))

(assert (= (and b!1432698 res!966566) b!1432707))

(assert (= (and b!1432707 res!966563) b!1432708))

(assert (= (and b!1432708 res!966564) b!1432700))

(assert (= (and b!1432700 res!966565) b!1432704))

(assert (= (and b!1432704 res!966567) b!1432706))

(assert (= (and b!1432706 res!966571) b!1432709))

(assert (= (and b!1432709 res!966568) b!1432710))

(assert (= (and b!1432710 res!966569) b!1432705))

(assert (= (and b!1432705 res!966574) b!1432701))

(assert (= (and b!1432701 res!966570) b!1432699))

(assert (= (and b!1432699 res!966573) b!1432702))

(assert (= (and b!1432699 (not res!966561)) b!1432697))

(declare-fun m!1322517 () Bool)

(assert (=> b!1432697 m!1322517))

(declare-fun m!1322519 () Bool)

(assert (=> b!1432710 m!1322519))

(assert (=> b!1432710 m!1322519))

(declare-fun m!1322521 () Bool)

(assert (=> b!1432710 m!1322521))

(declare-fun m!1322523 () Bool)

(assert (=> b!1432708 m!1322523))

(declare-fun m!1322525 () Bool)

(assert (=> start!123564 m!1322525))

(declare-fun m!1322527 () Bool)

(assert (=> start!123564 m!1322527))

(declare-fun m!1322529 () Bool)

(assert (=> b!1432705 m!1322529))

(declare-fun m!1322531 () Bool)

(assert (=> b!1432698 m!1322531))

(assert (=> b!1432698 m!1322531))

(declare-fun m!1322533 () Bool)

(assert (=> b!1432698 m!1322533))

(declare-fun m!1322535 () Bool)

(assert (=> b!1432699 m!1322535))

(declare-fun m!1322537 () Bool)

(assert (=> b!1432699 m!1322537))

(declare-fun m!1322539 () Bool)

(assert (=> b!1432699 m!1322539))

(declare-fun m!1322541 () Bool)

(assert (=> b!1432699 m!1322541))

(assert (=> b!1432699 m!1322519))

(declare-fun m!1322543 () Bool)

(assert (=> b!1432699 m!1322543))

(assert (=> b!1432706 m!1322519))

(assert (=> b!1432706 m!1322519))

(declare-fun m!1322545 () Bool)

(assert (=> b!1432706 m!1322545))

(assert (=> b!1432706 m!1322545))

(assert (=> b!1432706 m!1322519))

(declare-fun m!1322547 () Bool)

(assert (=> b!1432706 m!1322547))

(declare-fun m!1322549 () Bool)

(assert (=> b!1432709 m!1322549))

(assert (=> b!1432709 m!1322549))

(declare-fun m!1322551 () Bool)

(assert (=> b!1432709 m!1322551))

(assert (=> b!1432709 m!1322535))

(declare-fun m!1322553 () Bool)

(assert (=> b!1432709 m!1322553))

(assert (=> b!1432702 m!1322519))

(assert (=> b!1432702 m!1322519))

(declare-fun m!1322555 () Bool)

(assert (=> b!1432702 m!1322555))

(assert (=> b!1432707 m!1322519))

(assert (=> b!1432707 m!1322519))

(declare-fun m!1322557 () Bool)

(assert (=> b!1432707 m!1322557))

(declare-fun m!1322559 () Bool)

(assert (=> b!1432700 m!1322559))

(push 1)

