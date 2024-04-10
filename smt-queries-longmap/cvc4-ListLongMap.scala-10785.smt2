; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126212 () Bool)

(assert start!126212)

(declare-fun b!1478704 () Bool)

(declare-fun res!1004697 () Bool)

(declare-fun e!829479 () Bool)

(assert (=> b!1478704 (=> (not res!1004697) (not e!829479))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99318 0))(
  ( (array!99319 (arr!47938 (Array (_ BitVec 32) (_ BitVec 64))) (size!48488 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99318)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1478704 (= res!1004697 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48488 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48488 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48488 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1478705 () Bool)

(declare-fun e!829476 () Bool)

(assert (=> b!1478705 (= e!829479 e!829476)))

(declare-fun res!1004703 () Bool)

(assert (=> b!1478705 (=> (not res!1004703) (not e!829476))))

(declare-fun i!1006 () (_ BitVec 32))

(assert (=> b!1478705 (= res!1004703 (= (select (store (arr!47938 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!645770 () array!99318)

(assert (=> b!1478705 (= lt!645770 (array!99319 (store (arr!47938 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48488 a!2862)))))

(declare-fun b!1478706 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun e!829481 () Bool)

(assert (=> b!1478706 (= e!829481 (not (or (and (= (select (arr!47938 a!2862) index!646) (select (store (arr!47938 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47938 a!2862) index!646) (select (arr!47938 a!2862) j!93))) (not (= (select (arr!47938 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!47938 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!829483 () Bool)

(assert (=> b!1478706 e!829483))

(declare-fun res!1004691 () Bool)

(assert (=> b!1478706 (=> (not res!1004691) (not e!829483))))

(declare-datatypes ((SeekEntryResult!12178 0))(
  ( (MissingZero!12178 (index!51104 (_ BitVec 32))) (Found!12178 (index!51105 (_ BitVec 32))) (Intermediate!12178 (undefined!12990 Bool) (index!51106 (_ BitVec 32)) (x!132689 (_ BitVec 32))) (Undefined!12178) (MissingVacant!12178 (index!51107 (_ BitVec 32))) )
))
(declare-fun lt!645774 () SeekEntryResult!12178)

(assert (=> b!1478706 (= res!1004691 (and (= lt!645774 (Found!12178 j!93)) (or (= (select (arr!47938 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!47938 a!2862) intermediateBeforeIndex!19) (select (arr!47938 a!2862) j!93)))))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99318 (_ BitVec 32)) SeekEntryResult!12178)

(assert (=> b!1478706 (= lt!645774 (seekEntryOrOpen!0 (select (arr!47938 a!2862) j!93) a!2862 mask!2687))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99318 (_ BitVec 32)) Bool)

(assert (=> b!1478706 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-datatypes ((Unit!49696 0))(
  ( (Unit!49697) )
))
(declare-fun lt!645771 () Unit!49696)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99318 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!49696)

(assert (=> b!1478706 (= lt!645771 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1478707 () Bool)

(declare-fun res!1004696 () Bool)

(assert (=> b!1478707 (=> (not res!1004696) (not e!829479))))

(declare-datatypes ((List!34439 0))(
  ( (Nil!34436) (Cons!34435 (h!35803 (_ BitVec 64)) (t!49133 List!34439)) )
))
(declare-fun arrayNoDuplicates!0 (array!99318 (_ BitVec 32) List!34439) Bool)

(assert (=> b!1478707 (= res!1004696 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34436))))

(declare-fun b!1478708 () Bool)

(declare-fun res!1004702 () Bool)

(assert (=> b!1478708 (=> (not res!1004702) (not e!829479))))

(assert (=> b!1478708 (= res!1004702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1478709 () Bool)

(declare-fun res!1004693 () Bool)

(assert (=> b!1478709 (=> (not res!1004693) (not e!829481))))

(assert (=> b!1478709 (= res!1004693 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1478710 () Bool)

(declare-fun res!1004701 () Bool)

(assert (=> b!1478710 (=> (not res!1004701) (not e!829481))))

(declare-fun e!829484 () Bool)

(assert (=> b!1478710 (= res!1004701 e!829484)))

(declare-fun c!136527 () Bool)

(assert (=> b!1478710 (= c!136527 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1478711 () Bool)

(declare-fun res!1004695 () Bool)

(assert (=> b!1478711 (=> (not res!1004695) (not e!829479))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1478711 (= res!1004695 (validKeyInArray!0 (select (arr!47938 a!2862) j!93)))))

(declare-fun b!1478712 () Bool)

(declare-fun lt!645773 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99318 (_ BitVec 32)) SeekEntryResult!12178)

(assert (=> b!1478712 (= e!829484 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!645773 lt!645770 mask!2687) (seekEntryOrOpen!0 lt!645773 lt!645770 mask!2687)))))

(declare-fun b!1478714 () Bool)

(declare-fun e!829478 () Bool)

(assert (=> b!1478714 (= e!829478 e!829481)))

(declare-fun res!1004699 () Bool)

(assert (=> b!1478714 (=> (not res!1004699) (not e!829481))))

(declare-fun lt!645769 () SeekEntryResult!12178)

(assert (=> b!1478714 (= res!1004699 (= lt!645769 (Intermediate!12178 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99318 (_ BitVec 32)) SeekEntryResult!12178)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1478714 (= lt!645769 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!645773 mask!2687) lt!645773 lt!645770 mask!2687))))

(assert (=> b!1478714 (= lt!645773 (select (store (arr!47938 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1478715 () Bool)

(declare-fun res!1004700 () Bool)

(assert (=> b!1478715 (=> (not res!1004700) (not e!829478))))

(declare-fun lt!645772 () SeekEntryResult!12178)

(assert (=> b!1478715 (= res!1004700 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!47938 a!2862) j!93) a!2862 mask!2687) lt!645772))))

(declare-fun b!1478716 () Bool)

(declare-fun res!1004704 () Bool)

(assert (=> b!1478716 (=> (not res!1004704) (not e!829479))))

(assert (=> b!1478716 (= res!1004704 (validKeyInArray!0 (select (arr!47938 a!2862) i!1006)))))

(declare-fun b!1478717 () Bool)

(assert (=> b!1478717 (= e!829476 e!829478)))

(declare-fun res!1004689 () Bool)

(assert (=> b!1478717 (=> (not res!1004689) (not e!829478))))

(assert (=> b!1478717 (= res!1004689 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!47938 a!2862) j!93) mask!2687) (select (arr!47938 a!2862) j!93) a!2862 mask!2687) lt!645772))))

(assert (=> b!1478717 (= lt!645772 (Intermediate!12178 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1478718 () Bool)

(assert (=> b!1478718 (= e!829484 (= lt!645769 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!645773 lt!645770 mask!2687)))))

(declare-fun b!1478719 () Bool)

(declare-fun e!829477 () Bool)

(assert (=> b!1478719 (= e!829483 e!829477)))

(declare-fun res!1004690 () Bool)

(assert (=> b!1478719 (=> res!1004690 e!829477)))

(assert (=> b!1478719 (= res!1004690 (or (and (= (select (arr!47938 a!2862) index!646) (select (store (arr!47938 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!47938 a!2862) index!646) (select (arr!47938 a!2862) j!93))) (not (= (select (arr!47938 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1478720 () Bool)

(declare-fun e!829482 () Bool)

(assert (=> b!1478720 (= e!829477 e!829482)))

(declare-fun res!1004694 () Bool)

(assert (=> b!1478720 (=> (not res!1004694) (not e!829482))))

(assert (=> b!1478720 (= res!1004694 (= lt!645774 (seekKeyOrZeroReturnVacant!0 x!665 index!646 index!646 (select (arr!47938 a!2862) j!93) a!2862 mask!2687)))))

(declare-fun b!1478721 () Bool)

(declare-fun res!1004692 () Bool)

(assert (=> b!1478721 (=> (not res!1004692) (not e!829479))))

(assert (=> b!1478721 (= res!1004692 (and (= (size!48488 a!2862) (bvadd #b00000000000000000000000000000001 mask!2687)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48488 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48488 a!2862)) (not (= i!1006 j!93))))))

(declare-fun res!1004698 () Bool)

(assert (=> start!126212 (=> (not res!1004698) (not e!829479))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126212 (= res!1004698 (validMask!0 mask!2687))))

(assert (=> start!126212 e!829479))

(assert (=> start!126212 true))

(declare-fun array_inv!36966 (array!99318) Bool)

(assert (=> start!126212 (array_inv!36966 a!2862)))

(declare-fun b!1478713 () Bool)

(assert (=> b!1478713 (= e!829482 (and (= index!646 intermediateBeforeIndex!19) (= x!665 intermediateBeforeX!19)))))

(assert (= (and start!126212 res!1004698) b!1478721))

(assert (= (and b!1478721 res!1004692) b!1478716))

(assert (= (and b!1478716 res!1004704) b!1478711))

(assert (= (and b!1478711 res!1004695) b!1478708))

(assert (= (and b!1478708 res!1004702) b!1478707))

(assert (= (and b!1478707 res!1004696) b!1478704))

(assert (= (and b!1478704 res!1004697) b!1478705))

(assert (= (and b!1478705 res!1004703) b!1478717))

(assert (= (and b!1478717 res!1004689) b!1478715))

(assert (= (and b!1478715 res!1004700) b!1478714))

(assert (= (and b!1478714 res!1004699) b!1478710))

(assert (= (and b!1478710 c!136527) b!1478718))

(assert (= (and b!1478710 (not c!136527)) b!1478712))

(assert (= (and b!1478710 res!1004701) b!1478709))

(assert (= (and b!1478709 res!1004693) b!1478706))

(assert (= (and b!1478706 res!1004691) b!1478719))

(assert (= (and b!1478719 (not res!1004690)) b!1478720))

(assert (= (and b!1478720 res!1004694) b!1478713))

(declare-fun m!1364607 () Bool)

(assert (=> b!1478720 m!1364607))

(assert (=> b!1478720 m!1364607))

(declare-fun m!1364609 () Bool)

(assert (=> b!1478720 m!1364609))

(declare-fun m!1364611 () Bool)

(assert (=> b!1478718 m!1364611))

(declare-fun m!1364613 () Bool)

(assert (=> b!1478712 m!1364613))

(declare-fun m!1364615 () Bool)

(assert (=> b!1478712 m!1364615))

(assert (=> b!1478715 m!1364607))

(assert (=> b!1478715 m!1364607))

(declare-fun m!1364617 () Bool)

(assert (=> b!1478715 m!1364617))

(assert (=> b!1478711 m!1364607))

(assert (=> b!1478711 m!1364607))

(declare-fun m!1364619 () Bool)

(assert (=> b!1478711 m!1364619))

(assert (=> b!1478717 m!1364607))

(assert (=> b!1478717 m!1364607))

(declare-fun m!1364621 () Bool)

(assert (=> b!1478717 m!1364621))

(assert (=> b!1478717 m!1364621))

(assert (=> b!1478717 m!1364607))

(declare-fun m!1364623 () Bool)

(assert (=> b!1478717 m!1364623))

(declare-fun m!1364625 () Bool)

(assert (=> b!1478706 m!1364625))

(declare-fun m!1364627 () Bool)

(assert (=> b!1478706 m!1364627))

(declare-fun m!1364629 () Bool)

(assert (=> b!1478706 m!1364629))

(declare-fun m!1364631 () Bool)

(assert (=> b!1478706 m!1364631))

(declare-fun m!1364633 () Bool)

(assert (=> b!1478706 m!1364633))

(assert (=> b!1478706 m!1364607))

(declare-fun m!1364635 () Bool)

(assert (=> b!1478706 m!1364635))

(declare-fun m!1364637 () Bool)

(assert (=> b!1478706 m!1364637))

(assert (=> b!1478706 m!1364607))

(declare-fun m!1364639 () Bool)

(assert (=> b!1478714 m!1364639))

(assert (=> b!1478714 m!1364639))

(declare-fun m!1364641 () Bool)

(assert (=> b!1478714 m!1364641))

(assert (=> b!1478714 m!1364627))

(declare-fun m!1364643 () Bool)

(assert (=> b!1478714 m!1364643))

(assert (=> b!1478705 m!1364627))

(declare-fun m!1364645 () Bool)

(assert (=> b!1478705 m!1364645))

(declare-fun m!1364647 () Bool)

(assert (=> b!1478707 m!1364647))

(declare-fun m!1364649 () Bool)

(assert (=> b!1478708 m!1364649))

(declare-fun m!1364651 () Bool)

(assert (=> start!126212 m!1364651))

(declare-fun m!1364653 () Bool)

(assert (=> start!126212 m!1364653))

(assert (=> b!1478719 m!1364633))

(assert (=> b!1478719 m!1364627))

(assert (=> b!1478719 m!1364631))

(assert (=> b!1478719 m!1364607))

(declare-fun m!1364655 () Bool)

(assert (=> b!1478716 m!1364655))

(assert (=> b!1478716 m!1364655))

(declare-fun m!1364657 () Bool)

(assert (=> b!1478716 m!1364657))

(push 1)

