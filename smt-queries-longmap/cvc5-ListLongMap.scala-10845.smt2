; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!126916 () Bool)

(assert start!126916)

(declare-fun b!1491544 () Bool)

(declare-fun res!1014700 () Bool)

(declare-fun e!835679 () Bool)

(assert (=> b!1491544 (=> (not res!1014700) (not e!835679))))

(declare-fun x!665 () (_ BitVec 32))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun index!646 () (_ BitVec 32))

(declare-datatypes ((array!99689 0))(
  ( (array!99690 (arr!48116 (Array (_ BitVec 32) (_ BitVec 64))) (size!48666 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99689)

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(assert (=> b!1491544 (= res!1014700 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48666 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48666 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48666 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun res!1014709 () Bool)

(assert (=> start!126916 (=> (not res!1014709) (not e!835679))))

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!126916 (= res!1014709 (validMask!0 mask!2687))))

(assert (=> start!126916 e!835679))

(assert (=> start!126916 true))

(declare-fun array_inv!37144 (array!99689) Bool)

(assert (=> start!126916 (array_inv!37144 a!2862)))

(declare-fun b!1491545 () Bool)

(declare-fun res!1014715 () Bool)

(declare-fun e!835678 () Bool)

(assert (=> b!1491545 (=> (not res!1014715) (not e!835678))))

(declare-fun e!835675 () Bool)

(assert (=> b!1491545 (= res!1014715 e!835675)))

(declare-fun c!137949 () Bool)

(assert (=> b!1491545 (= c!137949 (bvsle x!665 intermediateAfterX!19))))

(declare-fun e!835677 () Bool)

(declare-fun j!93 () (_ BitVec 32))

(declare-fun b!1491546 () Bool)

(assert (=> b!1491546 (= e!835677 (or (= (select (arr!48116 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48116 a!2862) intermediateBeforeIndex!19) (select (arr!48116 a!2862) j!93))))))

(declare-fun b!1491547 () Bool)

(declare-fun res!1014711 () Bool)

(assert (=> b!1491547 (=> (not res!1014711) (not e!835679))))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1491547 (= res!1014711 (validKeyInArray!0 (select (arr!48116 a!2862) i!1006)))))

(declare-fun b!1491548 () Bool)

(declare-fun res!1014708 () Bool)

(assert (=> b!1491548 (=> (not res!1014708) (not e!835679))))

(declare-datatypes ((List!34617 0))(
  ( (Nil!34614) (Cons!34613 (h!35996 (_ BitVec 64)) (t!49311 List!34617)) )
))
(declare-fun arrayNoDuplicates!0 (array!99689 (_ BitVec 32) List!34617) Bool)

(assert (=> b!1491548 (= res!1014708 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34614))))

(declare-fun b!1491549 () Bool)

(declare-fun e!835674 () Bool)

(assert (=> b!1491549 (= e!835674 e!835678)))

(declare-fun res!1014713 () Bool)

(assert (=> b!1491549 (=> (not res!1014713) (not e!835678))))

(declare-datatypes ((SeekEntryResult!12356 0))(
  ( (MissingZero!12356 (index!51816 (_ BitVec 32))) (Found!12356 (index!51817 (_ BitVec 32))) (Intermediate!12356 (undefined!13168 Bool) (index!51818 (_ BitVec 32)) (x!133404 (_ BitVec 32))) (Undefined!12356) (MissingVacant!12356 (index!51819 (_ BitVec 32))) )
))
(declare-fun lt!650312 () SeekEntryResult!12356)

(assert (=> b!1491549 (= res!1014713 (= lt!650312 (Intermediate!12356 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(declare-fun lt!650315 () array!99689)

(declare-fun lt!650313 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99689 (_ BitVec 32)) SeekEntryResult!12356)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491549 (= lt!650312 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!650313 mask!2687) lt!650313 lt!650315 mask!2687))))

(assert (=> b!1491549 (= lt!650313 (select (store (arr!48116 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1491550 () Bool)

(declare-fun res!1014703 () Bool)

(assert (=> b!1491550 (=> (not res!1014703) (not e!835679))))

(assert (=> b!1491550 (= res!1014703 (validKeyInArray!0 (select (arr!48116 a!2862) j!93)))))

(declare-fun b!1491551 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99689 (_ BitVec 32)) SeekEntryResult!12356)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99689 (_ BitVec 32)) SeekEntryResult!12356)

(assert (=> b!1491551 (= e!835675 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!650313 lt!650315 mask!2687) (seekEntryOrOpen!0 lt!650313 lt!650315 mask!2687)))))

(declare-fun b!1491552 () Bool)

(declare-fun res!1014706 () Bool)

(assert (=> b!1491552 (=> (not res!1014706) (not e!835678))))

(assert (=> b!1491552 (= res!1014706 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun b!1491553 () Bool)

(declare-fun res!1014710 () Bool)

(assert (=> b!1491553 (=> (not res!1014710) (not e!835679))))

(assert (=> b!1491553 (= res!1014710 (and (= (size!48666 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48666 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48666 a!2862)) (not (= i!1006 j!93))))))

(declare-fun b!1491554 () Bool)

(declare-fun e!835673 () Bool)

(assert (=> b!1491554 (= e!835678 (not e!835673))))

(declare-fun res!1014714 () Bool)

(assert (=> b!1491554 (=> res!1014714 e!835673)))

(assert (=> b!1491554 (= res!1014714 (or (and (= (select (arr!48116 a!2862) index!646) (select (store (arr!48116 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48116 a!2862) index!646) (select (arr!48116 a!2862) j!93))) (= (select (arr!48116 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1491554 e!835677))

(declare-fun res!1014701 () Bool)

(assert (=> b!1491554 (=> (not res!1014701) (not e!835677))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99689 (_ BitVec 32)) Bool)

(assert (=> b!1491554 (= res!1014701 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687))))

(declare-datatypes ((Unit!50052 0))(
  ( (Unit!50053) )
))
(declare-fun lt!650316 () Unit!50052)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99689 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50052)

(assert (=> b!1491554 (= lt!650316 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1491555 () Bool)

(assert (=> b!1491555 (= e!835675 (= lt!650312 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!650313 lt!650315 mask!2687)))))

(declare-fun b!1491556 () Bool)

(assert (=> b!1491556 (= e!835673 true)))

(declare-fun lt!650314 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1491556 (= lt!650314 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1491557 () Bool)

(declare-fun res!1014705 () Bool)

(assert (=> b!1491557 (=> (not res!1014705) (not e!835677))))

(assert (=> b!1491557 (= res!1014705 (= (seekEntryOrOpen!0 (select (arr!48116 a!2862) j!93) a!2862 mask!2687) (Found!12356 j!93)))))

(declare-fun b!1491558 () Bool)

(declare-fun res!1014712 () Bool)

(assert (=> b!1491558 (=> (not res!1014712) (not e!835679))))

(assert (=> b!1491558 (= res!1014712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1491559 () Bool)

(declare-fun res!1014704 () Bool)

(assert (=> b!1491559 (=> (not res!1014704) (not e!835674))))

(declare-fun lt!650311 () SeekEntryResult!12356)

(assert (=> b!1491559 (= res!1014704 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48116 a!2862) j!93) a!2862 mask!2687) lt!650311))))

(declare-fun b!1491560 () Bool)

(declare-fun e!835676 () Bool)

(assert (=> b!1491560 (= e!835676 e!835674)))

(declare-fun res!1014702 () Bool)

(assert (=> b!1491560 (=> (not res!1014702) (not e!835674))))

(assert (=> b!1491560 (= res!1014702 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48116 a!2862) j!93) mask!2687) (select (arr!48116 a!2862) j!93) a!2862 mask!2687) lt!650311))))

(assert (=> b!1491560 (= lt!650311 (Intermediate!12356 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1491561 () Bool)

(assert (=> b!1491561 (= e!835679 e!835676)))

(declare-fun res!1014707 () Bool)

(assert (=> b!1491561 (=> (not res!1014707) (not e!835676))))

(assert (=> b!1491561 (= res!1014707 (= (select (store (arr!48116 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1491561 (= lt!650315 (array!99690 (store (arr!48116 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48666 a!2862)))))

(assert (= (and start!126916 res!1014709) b!1491553))

(assert (= (and b!1491553 res!1014710) b!1491547))

(assert (= (and b!1491547 res!1014711) b!1491550))

(assert (= (and b!1491550 res!1014703) b!1491558))

(assert (= (and b!1491558 res!1014712) b!1491548))

(assert (= (and b!1491548 res!1014708) b!1491544))

(assert (= (and b!1491544 res!1014700) b!1491561))

(assert (= (and b!1491561 res!1014707) b!1491560))

(assert (= (and b!1491560 res!1014702) b!1491559))

(assert (= (and b!1491559 res!1014704) b!1491549))

(assert (= (and b!1491549 res!1014713) b!1491545))

(assert (= (and b!1491545 c!137949) b!1491555))

(assert (= (and b!1491545 (not c!137949)) b!1491551))

(assert (= (and b!1491545 res!1014715) b!1491552))

(assert (= (and b!1491552 res!1014706) b!1491554))

(assert (= (and b!1491554 res!1014701) b!1491557))

(assert (= (and b!1491557 res!1014705) b!1491546))

(assert (= (and b!1491554 (not res!1014714)) b!1491556))

(declare-fun m!1375663 () Bool)

(assert (=> b!1491555 m!1375663))

(declare-fun m!1375665 () Bool)

(assert (=> b!1491548 m!1375665))

(declare-fun m!1375667 () Bool)

(assert (=> b!1491561 m!1375667))

(declare-fun m!1375669 () Bool)

(assert (=> b!1491561 m!1375669))

(declare-fun m!1375671 () Bool)

(assert (=> b!1491547 m!1375671))

(assert (=> b!1491547 m!1375671))

(declare-fun m!1375673 () Bool)

(assert (=> b!1491547 m!1375673))

(declare-fun m!1375675 () Bool)

(assert (=> b!1491551 m!1375675))

(declare-fun m!1375677 () Bool)

(assert (=> b!1491551 m!1375677))

(declare-fun m!1375679 () Bool)

(assert (=> b!1491560 m!1375679))

(assert (=> b!1491560 m!1375679))

(declare-fun m!1375681 () Bool)

(assert (=> b!1491560 m!1375681))

(assert (=> b!1491560 m!1375681))

(assert (=> b!1491560 m!1375679))

(declare-fun m!1375683 () Bool)

(assert (=> b!1491560 m!1375683))

(assert (=> b!1491550 m!1375679))

(assert (=> b!1491550 m!1375679))

(declare-fun m!1375685 () Bool)

(assert (=> b!1491550 m!1375685))

(assert (=> b!1491557 m!1375679))

(assert (=> b!1491557 m!1375679))

(declare-fun m!1375687 () Bool)

(assert (=> b!1491557 m!1375687))

(declare-fun m!1375689 () Bool)

(assert (=> b!1491554 m!1375689))

(assert (=> b!1491554 m!1375667))

(declare-fun m!1375691 () Bool)

(assert (=> b!1491554 m!1375691))

(declare-fun m!1375693 () Bool)

(assert (=> b!1491554 m!1375693))

(declare-fun m!1375695 () Bool)

(assert (=> b!1491554 m!1375695))

(assert (=> b!1491554 m!1375679))

(declare-fun m!1375697 () Bool)

(assert (=> start!126916 m!1375697))

(declare-fun m!1375699 () Bool)

(assert (=> start!126916 m!1375699))

(declare-fun m!1375701 () Bool)

(assert (=> b!1491558 m!1375701))

(declare-fun m!1375703 () Bool)

(assert (=> b!1491546 m!1375703))

(assert (=> b!1491546 m!1375679))

(declare-fun m!1375705 () Bool)

(assert (=> b!1491556 m!1375705))

(assert (=> b!1491559 m!1375679))

(assert (=> b!1491559 m!1375679))

(declare-fun m!1375707 () Bool)

(assert (=> b!1491559 m!1375707))

(declare-fun m!1375709 () Bool)

(assert (=> b!1491549 m!1375709))

(assert (=> b!1491549 m!1375709))

(declare-fun m!1375711 () Bool)

(assert (=> b!1491549 m!1375711))

(assert (=> b!1491549 m!1375667))

(declare-fun m!1375713 () Bool)

(assert (=> b!1491549 m!1375713))

(push 1)

