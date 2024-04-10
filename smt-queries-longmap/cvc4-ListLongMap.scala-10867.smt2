; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127378 () Bool)

(assert start!127378)

(declare-fun b!1497593 () Bool)

(declare-fun e!838626 () Bool)

(declare-fun e!838628 () Bool)

(assert (=> b!1497593 (= e!838626 e!838628)))

(declare-fun res!1018728 () Bool)

(assert (=> b!1497593 (=> (not res!1018728) (not e!838628))))

(declare-datatypes ((SeekEntryResult!12424 0))(
  ( (MissingZero!12424 (index!52088 (_ BitVec 32))) (Found!12424 (index!52089 (_ BitVec 32))) (Intermediate!12424 (undefined!13236 Bool) (index!52090 (_ BitVec 32)) (x!133706 (_ BitVec 32))) (Undefined!12424) (MissingVacant!12424 (index!52091 (_ BitVec 32))) )
))
(declare-fun lt!652502 () SeekEntryResult!12424)

(declare-datatypes ((array!99840 0))(
  ( (array!99841 (arr!48184 (Array (_ BitVec 32) (_ BitVec 64))) (size!48734 (_ BitVec 32))) )
))
(declare-fun a!2862 () array!99840)

(declare-fun mask!2687 () (_ BitVec 32))

(declare-fun j!93 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99840 (_ BitVec 32)) SeekEntryResult!12424)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497593 (= res!1018728 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48184 a!2862) j!93) mask!2687) (select (arr!48184 a!2862) j!93) a!2862 mask!2687) lt!652502))))

(declare-fun intermediateBeforeIndex!19 () (_ BitVec 32))

(declare-fun intermediateBeforeX!19 () (_ BitVec 32))

(assert (=> b!1497593 (= lt!652502 (Intermediate!12424 false intermediateBeforeIndex!19 intermediateBeforeX!19))))

(declare-fun b!1497594 () Bool)

(declare-fun res!1018742 () Bool)

(declare-fun e!838629 () Bool)

(assert (=> b!1497594 (=> (not res!1018742) (not e!838629))))

(declare-datatypes ((List!34685 0))(
  ( (Nil!34682) (Cons!34681 (h!36078 (_ BitVec 64)) (t!49379 List!34685)) )
))
(declare-fun arrayNoDuplicates!0 (array!99840 (_ BitVec 32) List!34685) Bool)

(assert (=> b!1497594 (= res!1018742 (arrayNoDuplicates!0 a!2862 #b00000000000000000000000000000000 Nil!34682))))

(declare-fun b!1497595 () Bool)

(declare-fun e!838627 () Bool)

(assert (=> b!1497595 (= e!838627 true)))

(declare-fun lt!652499 () SeekEntryResult!12424)

(declare-fun lt!652504 () (_ BitVec 64))

(declare-fun lt!652503 () array!99840)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!99840 (_ BitVec 32)) SeekEntryResult!12424)

(assert (=> b!1497595 (= lt!652499 (seekEntryOrOpen!0 lt!652504 lt!652503 mask!2687))))

(declare-fun x!665 () (_ BitVec 32))

(declare-datatypes ((Unit!50188 0))(
  ( (Unit!50189) )
))
(declare-fun lt!652501 () Unit!50188)

(declare-fun intermediateAfterX!19 () (_ BitVec 32))

(declare-fun i!1006 () (_ BitVec 32))

(declare-fun lt!652500 () (_ BitVec 32))

(declare-fun intermediateAfterIndex!19 () (_ BitVec 32))

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!99840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50188)

(assert (=> b!1497595 (= lt!652501 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2862 i!1006 j!93 (bvadd #b00000000000000000000000000000001 x!665) lt!652500 intermediateBeforeX!19 intermediateBeforeIndex!19 intermediateAfterX!19 intermediateAfterIndex!19 mask!2687))))

(declare-fun b!1497597 () Bool)

(declare-fun res!1018739 () Bool)

(assert (=> b!1497597 (=> (not res!1018739) (not e!838629))))

(declare-fun index!646 () (_ BitVec 32))

(assert (=> b!1497597 (= res!1018739 (and (bvsge x!665 #b00000000000000000000000000000000) (bvsle x!665 #b01111111111111111111111111111110) (bvsge intermediateBeforeX!19 #b00000000000000000000000000000000) (bvsle intermediateBeforeX!19 #b01111111111111111111111111111110) (bvsge intermediateAfterX!19 #b00000000000000000000000000000000) (bvsle intermediateAfterX!19 #b01111111111111111111111111111110) (bvsge index!646 #b00000000000000000000000000000000) (bvslt index!646 (size!48734 a!2862)) (bvsge intermediateBeforeIndex!19 #b00000000000000000000000000000000) (bvslt intermediateBeforeIndex!19 (size!48734 a!2862)) (bvsge intermediateAfterIndex!19 #b00000000000000000000000000000000) (bvslt intermediateAfterIndex!19 (size!48734 a!2862)) (bvslt intermediateAfterX!19 intermediateBeforeX!19)))))

(declare-fun b!1497598 () Bool)

(declare-fun res!1018727 () Bool)

(assert (=> b!1497598 (=> (not res!1018727) (not e!838629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1497598 (= res!1018727 (validKeyInArray!0 (select (arr!48184 a!2862) i!1006)))))

(declare-fun b!1497599 () Bool)

(declare-fun e!838625 () Bool)

(declare-fun lt!652498 () SeekEntryResult!12424)

(assert (=> b!1497599 (= e!838625 (= lt!652498 (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 lt!652504 lt!652503 mask!2687)))))

(declare-fun b!1497600 () Bool)

(declare-fun res!1018741 () Bool)

(assert (=> b!1497600 (=> (not res!1018741) (not e!838628))))

(assert (=> b!1497600 (= res!1018741 (= (seekKeyOrZeroOrLongMinValue!0 x!665 index!646 (select (arr!48184 a!2862) j!93) a!2862 mask!2687) lt!652502))))

(declare-fun b!1497601 () Bool)

(declare-fun res!1018736 () Bool)

(assert (=> b!1497601 (=> (not res!1018736) (not e!838629))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!99840 (_ BitVec 32)) Bool)

(assert (=> b!1497601 (= res!1018736 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2862 mask!2687))))

(declare-fun b!1497602 () Bool)

(declare-fun res!1018740 () Bool)

(assert (=> b!1497602 (=> res!1018740 e!838627)))

(assert (=> b!1497602 (= res!1018740 (bvsgt (bvadd #b00000000000000000000000000000001 x!665) intermediateBeforeX!19))))

(declare-fun b!1497603 () Bool)

(assert (=> b!1497603 (= e!838629 e!838626)))

(declare-fun res!1018734 () Bool)

(assert (=> b!1497603 (=> (not res!1018734) (not e!838626))))

(assert (=> b!1497603 (= res!1018734 (= (select (store (arr!48184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) intermediateAfterIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1497603 (= lt!652503 (array!99841 (store (arr!48184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48734 a!2862)))))

(declare-fun b!1497596 () Bool)

(declare-fun res!1018729 () Bool)

(declare-fun e!838630 () Bool)

(assert (=> b!1497596 (=> (not res!1018729) (not e!838630))))

(assert (=> b!1497596 (= res!1018729 (and (bvsle x!665 intermediateBeforeX!19) (= intermediateAfterIndex!19 i!1006)))))

(declare-fun res!1018735 () Bool)

(assert (=> start!127378 (=> (not res!1018735) (not e!838629))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127378 (= res!1018735 (validMask!0 mask!2687))))

(assert (=> start!127378 e!838629))

(assert (=> start!127378 true))

(declare-fun array_inv!37212 (array!99840) Bool)

(assert (=> start!127378 (array_inv!37212 a!2862)))

(declare-fun e!838633 () Bool)

(declare-fun b!1497604 () Bool)

(assert (=> b!1497604 (= e!838633 (not (= lt!652498 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652500 lt!652504 lt!652503 mask!2687))))))

(declare-fun b!1497605 () Bool)

(declare-fun res!1018731 () Bool)

(assert (=> b!1497605 (=> (not res!1018731) (not e!838629))))

(assert (=> b!1497605 (= res!1018731 (validKeyInArray!0 (select (arr!48184 a!2862) j!93)))))

(declare-fun b!1497606 () Bool)

(declare-fun e!838632 () Bool)

(assert (=> b!1497606 (= e!838632 e!838627)))

(declare-fun res!1018733 () Bool)

(assert (=> b!1497606 (=> res!1018733 e!838627)))

(assert (=> b!1497606 (= res!1018733 (or (bvslt (bvadd #b00000000000000000000000000000001 x!665) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 x!665) #b01111111111111111111111111111110) (bvslt lt!652500 #b00000000000000000000000000000000) (bvsge lt!652500 (size!48734 a!2862))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1497606 (= lt!652500 (nextIndex!0 index!646 x!665 mask!2687))))

(declare-fun b!1497607 () Bool)

(declare-fun res!1018744 () Bool)

(assert (=> b!1497607 (=> (not res!1018744) (not e!838630))))

(assert (=> b!1497607 (= res!1018744 e!838625)))

(declare-fun c!138967 () Bool)

(assert (=> b!1497607 (= c!138967 (bvsle x!665 intermediateAfterX!19))))

(declare-fun b!1497608 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!99840 (_ BitVec 32)) SeekEntryResult!12424)

(assert (=> b!1497608 (= e!838633 (not (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652500 intermediateAfterIndex!19 lt!652504 lt!652503 mask!2687) (seekEntryOrOpen!0 lt!652504 lt!652503 mask!2687))))))

(declare-fun b!1497609 () Bool)

(declare-fun res!1018737 () Bool)

(assert (=> b!1497609 (=> res!1018737 e!838627)))

(assert (=> b!1497609 (= res!1018737 e!838633)))

(declare-fun c!138968 () Bool)

(assert (=> b!1497609 (= c!138968 (bvsle (bvadd #b00000000000000000000000000000001 x!665) intermediateAfterX!19))))

(declare-fun b!1497610 () Bool)

(assert (=> b!1497610 (= e!838630 (not e!838632))))

(declare-fun res!1018743 () Bool)

(assert (=> b!1497610 (=> res!1018743 e!838632)))

(assert (=> b!1497610 (= res!1018743 (or (and (= (select (arr!48184 a!2862) index!646) (select (store (arr!48184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) index!646)) (= (select (arr!48184 a!2862) index!646) (select (arr!48184 a!2862) j!93))) (= (select (arr!48184 a!2862) index!646) #b1000000000000000000000000000000000000000000000000000000000000000) (= x!665 intermediateAfterX!19)))))

(assert (=> b!1497610 (and (= lt!652499 (Found!12424 j!93)) (or (= (select (arr!48184 a!2862) intermediateBeforeIndex!19) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!48184 a!2862) intermediateBeforeIndex!19) (select (arr!48184 a!2862) j!93))))))

(assert (=> b!1497610 (= lt!652499 (seekEntryOrOpen!0 (select (arr!48184 a!2862) j!93) a!2862 mask!2687))))

(assert (=> b!1497610 (arrayForallSeekEntryOrOpenFound!0 j!93 a!2862 mask!2687)))

(declare-fun lt!652497 () Unit!50188)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!99840 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50188)

(assert (=> b!1497610 (= lt!652497 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2862 mask!2687 #b00000000000000000000000000000000 j!93))))

(declare-fun b!1497611 () Bool)

(assert (=> b!1497611 (= e!838625 (= (seekKeyOrZeroReturnVacant!0 x!665 index!646 intermediateAfterIndex!19 lt!652504 lt!652503 mask!2687) (seekEntryOrOpen!0 lt!652504 lt!652503 mask!2687)))))

(declare-fun b!1497612 () Bool)

(assert (=> b!1497612 (= e!838628 e!838630)))

(declare-fun res!1018732 () Bool)

(assert (=> b!1497612 (=> (not res!1018732) (not e!838630))))

(assert (=> b!1497612 (= res!1018732 (= lt!652498 (Intermediate!12424 false intermediateAfterIndex!19 intermediateAfterX!19)))))

(assert (=> b!1497612 (= lt!652498 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!652504 mask!2687) lt!652504 lt!652503 mask!2687))))

(assert (=> b!1497612 (= lt!652504 (select (store (arr!48184 a!2862) i!1006 #b1000000000000000000000000000000000000000000000000000000000000000) j!93))))

(declare-fun b!1497613 () Bool)

(declare-fun res!1018738 () Bool)

(assert (=> b!1497613 (=> res!1018738 e!838627)))

(assert (=> b!1497613 (= res!1018738 (not (= (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!665) lt!652500 (select (arr!48184 a!2862) j!93) a!2862 mask!2687) lt!652502)))))

(declare-fun b!1497614 () Bool)

(declare-fun res!1018730 () Bool)

(assert (=> b!1497614 (=> (not res!1018730) (not e!838629))))

(assert (=> b!1497614 (= res!1018730 (and (= (size!48734 a!2862) (bvadd mask!2687 #b00000000000000000000000000000001)) (bvsge i!1006 #b00000000000000000000000000000000) (bvslt i!1006 (size!48734 a!2862)) (bvsge j!93 #b00000000000000000000000000000000) (bvslt j!93 (size!48734 a!2862)) (not (= i!1006 j!93))))))

(assert (= (and start!127378 res!1018735) b!1497614))

(assert (= (and b!1497614 res!1018730) b!1497598))

(assert (= (and b!1497598 res!1018727) b!1497605))

(assert (= (and b!1497605 res!1018731) b!1497601))

(assert (= (and b!1497601 res!1018736) b!1497594))

(assert (= (and b!1497594 res!1018742) b!1497597))

(assert (= (and b!1497597 res!1018739) b!1497603))

(assert (= (and b!1497603 res!1018734) b!1497593))

(assert (= (and b!1497593 res!1018728) b!1497600))

(assert (= (and b!1497600 res!1018741) b!1497612))

(assert (= (and b!1497612 res!1018732) b!1497607))

(assert (= (and b!1497607 c!138967) b!1497599))

(assert (= (and b!1497607 (not c!138967)) b!1497611))

(assert (= (and b!1497607 res!1018744) b!1497596))

(assert (= (and b!1497596 res!1018729) b!1497610))

(assert (= (and b!1497610 (not res!1018743)) b!1497606))

(assert (= (and b!1497606 (not res!1018733)) b!1497613))

(assert (= (and b!1497613 (not res!1018738)) b!1497609))

(assert (= (and b!1497609 c!138968) b!1497604))

(assert (= (and b!1497609 (not c!138968)) b!1497608))

(assert (= (and b!1497609 (not res!1018737)) b!1497602))

(assert (= (and b!1497602 (not res!1018740)) b!1497595))

(declare-fun m!1380655 () Bool)

(assert (=> b!1497605 m!1380655))

(assert (=> b!1497605 m!1380655))

(declare-fun m!1380657 () Bool)

(assert (=> b!1497605 m!1380657))

(declare-fun m!1380659 () Bool)

(assert (=> b!1497595 m!1380659))

(declare-fun m!1380661 () Bool)

(assert (=> b!1497595 m!1380661))

(declare-fun m!1380663 () Bool)

(assert (=> b!1497606 m!1380663))

(declare-fun m!1380665 () Bool)

(assert (=> b!1497608 m!1380665))

(assert (=> b!1497608 m!1380659))

(declare-fun m!1380667 () Bool)

(assert (=> b!1497604 m!1380667))

(declare-fun m!1380669 () Bool)

(assert (=> b!1497599 m!1380669))

(declare-fun m!1380671 () Bool)

(assert (=> b!1497601 m!1380671))

(declare-fun m!1380673 () Bool)

(assert (=> b!1497610 m!1380673))

(declare-fun m!1380675 () Bool)

(assert (=> b!1497610 m!1380675))

(declare-fun m!1380677 () Bool)

(assert (=> b!1497610 m!1380677))

(declare-fun m!1380679 () Bool)

(assert (=> b!1497610 m!1380679))

(declare-fun m!1380681 () Bool)

(assert (=> b!1497610 m!1380681))

(assert (=> b!1497610 m!1380655))

(declare-fun m!1380683 () Bool)

(assert (=> b!1497610 m!1380683))

(declare-fun m!1380685 () Bool)

(assert (=> b!1497610 m!1380685))

(assert (=> b!1497610 m!1380655))

(assert (=> b!1497600 m!1380655))

(assert (=> b!1497600 m!1380655))

(declare-fun m!1380687 () Bool)

(assert (=> b!1497600 m!1380687))

(assert (=> b!1497593 m!1380655))

(assert (=> b!1497593 m!1380655))

(declare-fun m!1380689 () Bool)

(assert (=> b!1497593 m!1380689))

(assert (=> b!1497593 m!1380689))

(assert (=> b!1497593 m!1380655))

(declare-fun m!1380691 () Bool)

(assert (=> b!1497593 m!1380691))

(declare-fun m!1380693 () Bool)

(assert (=> b!1497612 m!1380693))

(assert (=> b!1497612 m!1380693))

(declare-fun m!1380695 () Bool)

(assert (=> b!1497612 m!1380695))

(assert (=> b!1497612 m!1380675))

(declare-fun m!1380697 () Bool)

(assert (=> b!1497612 m!1380697))

(declare-fun m!1380699 () Bool)

(assert (=> b!1497598 m!1380699))

(assert (=> b!1497598 m!1380699))

(declare-fun m!1380701 () Bool)

(assert (=> b!1497598 m!1380701))

(assert (=> b!1497613 m!1380655))

(assert (=> b!1497613 m!1380655))

(declare-fun m!1380703 () Bool)

(assert (=> b!1497613 m!1380703))

(assert (=> b!1497603 m!1380675))

(declare-fun m!1380705 () Bool)

(assert (=> b!1497603 m!1380705))

(declare-fun m!1380707 () Bool)

(assert (=> start!127378 m!1380707))

(declare-fun m!1380709 () Bool)

(assert (=> start!127378 m!1380709))

(declare-fun m!1380711 () Bool)

(assert (=> b!1497594 m!1380711))

(declare-fun m!1380713 () Bool)

(assert (=> b!1497611 m!1380713))

(assert (=> b!1497611 m!1380659))

(push 1)

