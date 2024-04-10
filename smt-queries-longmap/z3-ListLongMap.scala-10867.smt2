; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127376 () Bool)

(assert start!127376)

(declare-fun b!1497527 () Bool)

(declare-fun res!1018676 () Bool)

(declare-fun e!838601 () Bool)

(assert (=> b!1497527 (=> res!1018676 e!838601)))

(declare-fun e!838602 () Bool)

(assert (=> b!1497527 (= res!1018676 e!838602)))

(declare-fun c!138962 () Bool)

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(assert (=> b!1497527 (= c!138962 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun lt!652480 () (_ BitVec 64))

(declare-datatypes ((array!99838 0))(
  ( (array!99839 (arr!48183 (Array (_ BitVec 32) (_ BitVec 64))) (size!48733 (_ BitVec 32))) )
))
(declare-fun lt!652474 () array!99838)

(declare-fun e!838605 () Bool)

(declare-fun index!646 () (_ BitVec 32))

(declare-fun b!1497528 () Bool)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12423 0))(
  ( (MissingZero!12423 (index!52084 (_ BitVec 32))) (Found!12423 (index!52085 (_ BitVec 32))) (Intermediate!12423 (undefined!13235 Bool) (index!52086 (_ BitVec 32)) (x!133705 (_ BitVec 32))) (Undefined!12423) (MissingVacant!12423 (index!52087 (_ BitVec 32))) )
))
(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99838 (_ BitVec 32)) SeekEntryResult!12423)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99838 (_ BitVec 32)) SeekEntryResult!12423)

(assert (=> b!1497528 (= e!838605 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652480 lt!652474 mask!2687) (seekEntryOrOpen!0 lt!652480 lt!652474 mask!2687)))))

(declare-fun b!1497529 () Bool)

(declare-fun res!1018679 () Bool)

(declare-fun e!838600 () Bool)

(assert (=> b!1497529 (=> (not res!1018679) (not e!838600))))

(declare-fun a!2862 () array!99838)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99838 (_ BitVec 32)) Bool)

(assert (=> b!1497529 (= res!1018679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1497530 () Bool)

(declare-fun res!1018686 () Bool)

(assert (=> b!1497530 (=> res!1018686 e!838601)))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1497530 (= res!1018686 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497531 () Bool)

(declare-fun res!1018673 () Bool)

(assert (=> b!1497531 (=> (not res!1018673) (not e!838600))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(assert (=> b!1497531 (= res!1018673 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48733 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48733 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48733 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497532 () Bool)

(declare-fun lt!652478 () SeekEntryResult!12423)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99838 (_ BitVec 32)) SeekEntryResult!12423)

(assert (=> b!1497532 (= e!838605 (= lt!652478 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652480 lt!652474 mask!2687)))))

(declare-fun b!1497533 () Bool)

(declare-fun res!1018690 () Bool)

(assert (=> b!1497533 (=> (not res!1018690) (not e!838600))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497533 (= res!1018690 (validKeyInArray!0 (select (arr!48183 a!2862) i!1006)))))

(declare-fun b!1497534 () Bool)

(declare-fun e!838599 () Bool)

(assert (=> b!1497534 (= e!838600 e!838599)))

(declare-fun res!1018680 () Bool)

(assert (=> b!1497534 (=> (not res!1018680) (not e!838599))))

(assert (=> b!1497534 (= res!1018680 (= (select (store (arr!48183 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497534 (= lt!652474 (array!99839 (store (arr!48183 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48733 a!2862)))))

(declare-fun b!1497535 () Bool)

(declare-fun res!1018685 () Bool)

(declare-fun e!838598 () Bool)

(assert (=> b!1497535 (=> (not res!1018685) (not e!838598))))

(declare-fun lt!652475 () SeekEntryResult!12423)

(declare-fun j!93 () (_ BitVec 32))

(assert (=> b!1497535 (= res!1018685 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48183 a!2862) j!93) a!2862 mask!2687) lt!652475))))

(declare-fun b!1497536 () Bool)

(declare-fun res!1018674 () Bool)

(declare-fun e!838606 () Bool)

(assert (=> b!1497536 (=> (not res!1018674) (not e!838606))))

(assert (=> b!1497536 (= res!1018674 e!838605)))

(declare-fun c!138961 () Bool)

(assert (=> b!1497536 (= c!138961 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1497537 () Bool)

(assert (=> b!1497537 (= e!838601 true)))

(declare-fun lt!652477 () SeekEntryResult!12423)

(assert (=> b!1497537 (= lt!652477 (seekEntryOrOpen!0 lt!652480 lt!652474 mask!2687))))

(declare-fun lt!652476 () (_ BitVec 32))

(declare-datatypes ((Unit!50186 0))(
  ( (Unit!50187) )
))
(declare-fun lt!652473 () Unit!50186)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50186)

(assert (=> b!1497537 (= lt!652473 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652476 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun res!1018682 () Bool)

(assert (=> start!127376 (=> (not res!1018682) (not e!838600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127376 (= res!1018682 (validMask!0 mask!2687))))

(assert (=> start!127376 e!838600))

(assert (=> start!127376 true))

(declare-fun array_inv!37211 (array!99838) Bool)

(assert (=> start!127376 (array_inv!37211 a!2862)))

(declare-fun b!1497538 () Bool)

(assert (=> b!1497538 (= e!838602 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652476 intermediateAfterIndex!19 lt!652480 lt!652474 mask!2687) (seekEntryOrOpen!0 lt!652480 lt!652474 mask!2687))))))

(declare-fun b!1497539 () Bool)

(declare-fun e!838604 () Bool)

(assert (=> b!1497539 (= e!838604 e!838601)))

(declare-fun res!1018678 () Bool)

(assert (=> b!1497539 (=> res!1018678 e!838601)))

(assert (=> b!1497539 (= res!1018678 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652476 #b00000000000000000000000000000000) (bvsge lt!652476 (size!48733 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497539 (= lt!652476 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1497540 () Bool)

(declare-fun res!1018684 () Bool)

(assert (=> b!1497540 (=> res!1018684 e!838601)))

(assert (=> b!1497540 (= res!1018684 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652476 (select (arr!48183 a!2862) j!93) a!2862 mask!2687) lt!652475)))))

(declare-fun b!1497541 () Bool)

(assert (=> b!1497541 (= e!838598 e!838606)))

(declare-fun res!1018683 () Bool)

(assert (=> b!1497541 (=> (not res!1018683) (not e!838606))))

(assert (=> b!1497541 (= res!1018683 (= lt!652478 (Intermediate!12423 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497541 (= lt!652478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652480 mask!2687) lt!652480 lt!652474 mask!2687))))

(assert (=> b!1497541 (= lt!652480 (select (store (arr!48183 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497542 () Bool)

(declare-fun res!1018681 () Bool)

(assert (=> b!1497542 (=> (not res!1018681) (not e!838600))))

(declare-datatypes ((List!34684 0))(
  ( (Nil!34681) (Cons!34680 (h!36077 (_ BitVec 64)) (t!49378 List!34684)) )
))
(declare-fun arrayNoDuplicates!0 (array!99838 (_ BitVec 32) List!34684) Bool)

(assert (=> b!1497542 (= res!1018681 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34681))))

(declare-fun b!1497543 () Bool)

(declare-fun res!1018677 () Bool)

(assert (=> b!1497543 (=> (not res!1018677) (not e!838600))))

(assert (=> b!1497543 (= res!1018677 (and (= (size!48733 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48733 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48733 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1497544 () Bool)

(assert (=> b!1497544 (= e!838606 (not e!838604))))

(declare-fun res!1018675 () Bool)

(assert (=> b!1497544 (=> res!1018675 e!838604)))

(assert (=> b!1497544 (= res!1018675 (or (and (= (select (arr!48183 a!2862) index!646) (select (store (arr!48183 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48183 a!2862) index!646) (select (arr!48183 a!2862) j!93))) (= (select (arr!48183 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1497544 (and (= lt!652477 (Found!12423 j!93)) (or (= (select (arr!48183 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48183 a!2862) intermediateBeforeIndex!19) (select (arr!48183 a!2862) j!93))))))

(assert (=> b!1497544 (= lt!652477 (seekEntryOrOpen!0 (select (arr!48183 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1497544 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652479 () Unit!50186)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99838 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50186)

(assert (=> b!1497544 (= lt!652479 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1497545 () Bool)

(assert (=> b!1497545 (= e!838599 e!838598)))

(declare-fun res!1018689 () Bool)

(assert (=> b!1497545 (=> (not res!1018689) (not e!838598))))

(assert (=> b!1497545 (= res!1018689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48183 a!2862) j!93) mask!2687) (select (arr!48183 a!2862) j!93) a!2862 mask!2687) lt!652475))))

(assert (=> b!1497545 (= lt!652475 (Intermediate!12423 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497546 () Bool)

(declare-fun res!1018687 () Bool)

(assert (=> b!1497546 (=> (not res!1018687) (not e!838600))))

(assert (=> b!1497546 (= res!1018687 (validKeyInArray!0 (select (arr!48183 a!2862) j!93)))))

(declare-fun b!1497547 () Bool)

(assert (=> b!1497547 (= e!838602 (not (= lt!652478 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652476 lt!652480 lt!652474 mask!2687))))))

(declare-fun b!1497548 () Bool)

(declare-fun res!1018688 () Bool)

(assert (=> b!1497548 (=> (not res!1018688) (not e!838606))))

(assert (=> b!1497548 (= res!1018688 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(assert (= (and start!127376 res!1018682) b!1497543))

(assert (= (and b!1497543 res!1018677) b!1497533))

(assert (= (and b!1497533 res!1018690) b!1497546))

(assert (= (and b!1497546 res!1018687) b!1497529))

(assert (= (and b!1497529 res!1018679) b!1497542))

(assert (= (and b!1497542 res!1018681) b!1497531))

(assert (= (and b!1497531 res!1018673) b!1497534))

(assert (= (and b!1497534 res!1018680) b!1497545))

(assert (= (and b!1497545 res!1018689) b!1497535))

(assert (= (and b!1497535 res!1018685) b!1497541))

(assert (= (and b!1497541 res!1018683) b!1497536))

(assert (= (and b!1497536 c!138961) b!1497532))

(assert (= (and b!1497536 (not c!138961)) b!1497528))

(assert (= (and b!1497536 res!1018674) b!1497548))

(assert (= (and b!1497548 res!1018688) b!1497544))

(assert (= (and b!1497544 (not res!1018675)) b!1497539))

(assert (= (and b!1497539 (not res!1018678)) b!1497540))

(assert (= (and b!1497540 (not res!1018684)) b!1497527))

(assert (= (and b!1497527 c!138962) b!1497547))

(assert (= (and b!1497527 (not c!138962)) b!1497538))

(assert (= (and b!1497527 (not res!1018676)) b!1497530))

(assert (= (and b!1497530 (not res!1018686)) b!1497537))

(declare-fun m!1380595 () Bool)

(assert (=> b!1497528 m!1380595))

(declare-fun m!1380597 () Bool)

(assert (=> b!1497528 m!1380597))

(declare-fun m!1380599 () Bool)

(assert (=> b!1497544 m!1380599))

(declare-fun m!1380601 () Bool)

(assert (=> b!1497544 m!1380601))

(declare-fun m!1380603 () Bool)

(assert (=> b!1497544 m!1380603))

(declare-fun m!1380605 () Bool)

(assert (=> b!1497544 m!1380605))

(declare-fun m!1380607 () Bool)

(assert (=> b!1497544 m!1380607))

(declare-fun m!1380609 () Bool)

(assert (=> b!1497544 m!1380609))

(declare-fun m!1380611 () Bool)

(assert (=> b!1497544 m!1380611))

(declare-fun m!1380613 () Bool)

(assert (=> b!1497544 m!1380613))

(assert (=> b!1497544 m!1380609))

(assert (=> b!1497545 m!1380609))

(assert (=> b!1497545 m!1380609))

(declare-fun m!1380615 () Bool)

(assert (=> b!1497545 m!1380615))

(assert (=> b!1497545 m!1380615))

(assert (=> b!1497545 m!1380609))

(declare-fun m!1380617 () Bool)

(assert (=> b!1497545 m!1380617))

(assert (=> b!1497546 m!1380609))

(assert (=> b!1497546 m!1380609))

(declare-fun m!1380619 () Bool)

(assert (=> b!1497546 m!1380619))

(declare-fun m!1380621 () Bool)

(assert (=> b!1497542 m!1380621))

(assert (=> b!1497537 m!1380597))

(declare-fun m!1380623 () Bool)

(assert (=> b!1497537 m!1380623))

(declare-fun m!1380625 () Bool)

(assert (=> b!1497547 m!1380625))

(declare-fun m!1380627 () Bool)

(assert (=> b!1497538 m!1380627))

(assert (=> b!1497538 m!1380597))

(declare-fun m!1380629 () Bool)

(assert (=> b!1497541 m!1380629))

(assert (=> b!1497541 m!1380629))

(declare-fun m!1380631 () Bool)

(assert (=> b!1497541 m!1380631))

(assert (=> b!1497541 m!1380601))

(declare-fun m!1380633 () Bool)

(assert (=> b!1497541 m!1380633))

(declare-fun m!1380635 () Bool)

(assert (=> b!1497529 m!1380635))

(declare-fun m!1380637 () Bool)

(assert (=> b!1497532 m!1380637))

(declare-fun m!1380639 () Bool)

(assert (=> start!127376 m!1380639))

(declare-fun m!1380641 () Bool)

(assert (=> start!127376 m!1380641))

(declare-fun m!1380643 () Bool)

(assert (=> b!1497539 m!1380643))

(declare-fun m!1380645 () Bool)

(assert (=> b!1497533 m!1380645))

(assert (=> b!1497533 m!1380645))

(declare-fun m!1380647 () Bool)

(assert (=> b!1497533 m!1380647))

(assert (=> b!1497535 m!1380609))

(assert (=> b!1497535 m!1380609))

(declare-fun m!1380649 () Bool)

(assert (=> b!1497535 m!1380649))

(assert (=> b!1497540 m!1380609))

(assert (=> b!1497540 m!1380609))

(declare-fun m!1380651 () Bool)

(assert (=> b!1497540 m!1380651))

(assert (=> b!1497534 m!1380601))

(declare-fun m!1380653 () Bool)

(assert (=> b!1497534 m!1380653))

(check-sat (not b!1497538) (not b!1497537) (not b!1497535) (not b!1497532) (not b!1497544) (not start!127376) (not b!1497547) (not b!1497542) (not b!1497546) (not b!1497540) (not b!1497541) (not b!1497545) (not b!1497529) (not b!1497528) (not b!1497539) (not b!1497533))
(check-sat)
